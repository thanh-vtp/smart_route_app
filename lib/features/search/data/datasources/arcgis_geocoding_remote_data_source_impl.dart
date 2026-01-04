import 'dart:async';
import 'dart:convert';
import 'dart:io';
import 'package:http/http.dart' as http;
import 'package:smart_route_app/core/utils/app_logger.dart';
import 'package:smart_route_app/core/errors/failures.dart';
import 'package:smart_route_app/core/utils/constants.dart';
import 'package:smart_route_app/features/search/data/datasources/arcgis_geocoding_remote_data_source.dart';
import 'package:smart_route_app/features/search/data/models/geocoding_models.dart';

class ArcGISGeocodingRemoteDataSourceImpl
    implements ArcGISGeocodingRemoteDataSource {
  final http.Client _client;
  final String _apiKey;

  // Timeout configurations
  static const Duration _receiveTimeout = Duration(seconds: 30);
  static const int _maxRetries = 3;

  ArcGISGeocodingRemoteDataSourceImpl({http.Client? client, String? apiKey})
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

  /// Chuyển đổi văn bản địa chỉ hoặc tên địa điểm thành địa chỉ đầy đủ kèm theo vị trí.
  @override
  Future<GeocodeResponse> findAddressCandidates(
    String address, {
    String format = 'json',
    String attributes = '*',
    String maxLocations = '10',
    String forStorage = 'false',
    String countries = 'VNM',
  }) async {
    final queryParameters = {
      'SingleLine': address, // Tìm kiếm địa chỉ đầy đủ
      'f': format,
      'token': _apiKey,
      'outFields': attributes, // Lấy tất cả các trường thông tin
      'maxLocations': maxLocations, // Số lượng kết quả tối đa (default 50)
      'forStorage': forStorage,
      'sourceCountry': countries, // Giới hạn tìm kiếm trong Việt Nam
    };

    final uri = Uri.parse(
      '${Constants.arcgisGeocodeBaseUrl}${Constants.findAddressCandidates}',
    ).replace(queryParameters: queryParameters);

    final response = await _makeRequest(uri);
    final data = _parseAndValidateResponse(response);

    try {
      final result = GeocodeResponse.fromJson(data);
      return result;
    } catch (e) {
      if (e is ArcGISFailure) rethrow;
      throw ArcGISFailure.geocodingFailed(address);
    }
  }

  /// Chuyển đổi một điểm thành địa chỉ hoặc vị trí đầy đủ
  @override
  Future<ReverseGeocodeResponse> reverseGeocode(
    double latitude,
    double longitude, {
    String format = 'json',
    String attributes = '*',
    String forStorage = 'false',
    String outSR = '4326',
    String langCode = 'vi',
    String returnIntersection = 'false',
  }) async {
    final queryParameters = {
      'location': '$longitude,$latitude',
      'f': format,
      'token': _apiKey,
      'outFields': attributes,
      'forStorage': forStorage,
      'outSR': outSR,
      'langCode': langCode,
      'returnIntersection': returnIntersection,
    };

    final uri = Uri.parse(
      '${Constants.arcgisGeocodeBaseUrl}${Constants.reverseGeocode}',
    ).replace(queryParameters: queryParameters);

    final response = await _makeRequest(uri);
    final data = _parseAndValidateResponse(response);

    try {
      final result = ReverseGeocodeResponse.fromJson(data);
      return result;
    } catch (e) {
      if (e is ArcGISFailure) rethrow;
      throw ArcGISFailure.reverseGeocodingFailed();
    }
  }
}
