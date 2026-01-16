import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:smart_route_app/core/errors/failures.dart';
import 'package:smart_route_app/core/utils/app_logger.dart';
import 'package:smart_route_app/core/utils/constants.dart';
import 'package:smart_route_app/features/navigation/data/models/routing_models.dart';
import 'package:http/http.dart' as http;

abstract class RoutingRemoteDataSource {
  /// Test connection to ArcGIS services
  Future<bool> testConnection();

  /// Calculate route between multiple stops
  Future<RouteResponse> calculateRoute(
    List<Map<String, double>> stops, {
    bool returnDirections = true,
    bool returnRoutes = true,
  });
}

class RoutingRemoteDataSourceImpl implements RoutingRemoteDataSource {
  final http.Client _client;
  final String _apiKey;

  // Timeout configurations
  static const Duration _receiveTimeout = Duration(seconds: 30);
  static const int _maxRetries = 3;

  RoutingRemoteDataSourceImpl({http.Client? client, String? apiKey})
    : _client = client ?? http.Client(),
      _apiKey = apiKey ?? Constants.arcgisApiKey {
    // Validate key ngay khi khởi tạo
    if (_apiKey.isEmpty) {
      throw ArcGISFailure.missingApiKey();
    }
  }

  /// Helper method to parse and validate JSON response
  Map<String, dynamic> _parseAndValidateResponse(http.Response response) {
    if (response.statusCode != 200) {
      throw ArcGISFailure.httpError(response.statusCode, response.reasonPhrase);
    }

    try {
      final data = json.decode(response.body) as Map<String, dynamic>;

      // Check for API errors in response
      if (data['error'] != null) {
        final errorData = data['error'] as Map<String, dynamic>;
        final errorCode = errorData['code'];
        final errorMessage = errorData['message'] ?? 'Unknown error';
        final errorDetails = errorData['details'];

        AppLogger.error(
          'ArcGIS API Error - Code: $errorCode, Message: $errorMessage, Details: $errorDetails',
          name: 'ArcGISGeocodingDataSource',
        );

        throw ArcGISFailure.apiError('$errorMessage (Code: $errorCode)');
      }

      return data;
    } catch (e) {
      if (e is ArcGISFailure) rethrow;
      throw ArcGISFailure.parseError(e.toString());
    }
  }

  /// Helper method to make HTTP requests with retry logic
  Future<http.Response> _makeRequest(Uri uri) async {
    int retryCount = 0;
    while (retryCount <= _maxRetries) {
      try {
        final response = await _client.get(uri).timeout(_receiveTimeout);

        // Nếu status code 5xx (Server Error), có thể retry
        if (response.statusCode >= 500 && response.statusCode < 600) {
          throw HttpException('Server Error: ${response.statusCode}');
        }
        return response;
      } on SocketException catch (_) {
        if (retryCount > _maxRetries) {
          throw ArcGISFailure.connectionFailed(); // Mất mạng hoặc không kết nối được server
        }
      } on TimeoutException catch (_) {
        if (retryCount > _maxRetries) {
          throw ArcGISFailure.timeout(); // Quá thời gian chờ
        }
      } on http.ClientException catch (_) {
        if (retryCount > _maxRetries) {
          throw ArcGISFailure.connectionFailed(); // Lỗi client bị đóng hoặc lỗi giao thức
        }
      } catch (e) {
        throw ArcGISFailure.apiError(e.toString());
      }

      // Logic Backoff: Chờ 2s, 4s, 6s... trước khi thử lại
      await Future.delayed(Duration(seconds: retryCount * 2));
    }

    throw ArcGISFailure.unknown();
  }

  /// Test connection to ArcGIS services
  @override
  Future<bool> testConnection() async {
    try {
      final uri = Uri.parse(
        Constants.arcgisGeocodeBaseUrl,
      ).replace(queryParameters: {'f': 'json', 'token': _apiKey});

      final response = await _makeRequest(uri);
      return response.statusCode == 200;
    } catch (e) {
      return false;
    }
  }

  /// Tính toán đường đi giữa các điểm
  @override
  Future<RouteResponse> calculateRoute(
    List<Map<String, double>> stops, {
    String format = 'json',
    bool returnDirections = true,
    bool returnRoutes = true,
    String directionsLanguage = 'vi',
    String directionsLengthUnits = 'esriNAUMeters',
    String outputLines =
        'esriNAOutputLineTrueShapeWithMeasure', // default: esriNAOutputLineTrueShape
    String outSR = '4326',
  }) async {
    try {
      if (stops.length < 2) {
        throw ArcGISFailure.insufficientStops();
      }

      // Check cache first
      // final cachedResult = await _cacheService.getCachedRouteResult(stops);
      // if (cachedResult != null) {
      //   AppLogger.data(
      //     'Using cached route result',
      //     source: 'ArcGISGeocodingDataSource',
      //   );
      //   return cachedResult;
      // }

      // Tạo stops string
      final stopsString = stops
          .map((stop) => '${stop['longitude']},${stop['latitude']}')
          .join(';');

      AppLogger.data(
        'Calculating route with stops: $stopsString',
        source: 'ArcGISGeocodingDataSource',
      );

      final queryParameters = {
        'stops': stopsString,
        'f': 'json',
        'token': _apiKey,
        'returnDirections': returnDirections.toString(),
        'returnRoutes': returnRoutes.toString(), // routes geometry
        'directionsLanguage': directionsLanguage, // ngôn ngữ hướng dẫn
        'directionsLengthUnits': directionsLengthUnits, // meters
        'outputLines': outputLines, // Loại đặc điểm tuyến đường được trả về.
        'outSR': outSR, // Hệ tọa độ đầu ra
      };

      final uri = Uri.parse(
        '${Constants.arcgisRouteBaseUrl}${Constants.routeAndDirections}',
      ).replace(queryParameters: queryParameters);

      AppLogger.data(
        'Route request URI: $uri',
        source: 'ArcGISGeocodingDataSource',
      );

      final response = await _makeRequest(uri);

      AppLogger.data(
        'Route response status: ${response.statusCode}',
        source: 'ArcGISGeocodingDataSource',
      );

      final data = _parseAndValidateResponse(response);

      // Log JSON directions chi tiết
      AppLogger.data(
        'Route directions JSON: ${json.encode(data['directions'])}',
        source: 'ArcGISGeocodingDataSource',
      );

      final result = RouteResponse.fromJson(data);

      try {
        // Cache the result
        // await _cacheService.cacheRouteResult(stops, result);
      } catch (cacheError) {
        AppLogger.error(
          'Failed to cache route result: $cacheError',
          name: 'ArcGISGeocodingDataSource',
        );
        // Continue without caching
      }
      return result;
    } catch (e, st) {
      AppLogger.error(
        'Error in calculateRoute: $e',
        name: 'ArcGISGeocodingDataSource',
        error: e,
        stackTrace: st,
      );
      // Re-throw ArcGIS failures as-is, convert others
      if (e is ArcGISFailure) {
        rethrow;
      }
      throw ArcGISFailure.routingFailed();
    }
  }
}
