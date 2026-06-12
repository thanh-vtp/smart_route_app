import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:smart_route_app/core/errors/failures.dart';
import 'package:smart_route_app/core/utils/app_logger.dart';
import 'package:smart_route_app/core/utils/constants.dart';
import 'package:smart_route_app/features/navigation/data/datasources/routing_remote_data_source.dart';
import 'package:smart_route_app/features/navigation/data/models/routing_model.dart';
import 'package:http/http.dart' as http;

class RoutingRemoteDataSourceImpl implements RoutingRemoteDataSource {
  final http.Client _client;
  final String _apiKey;

  // Timeout configurations
  static const Duration _receiveTimeout = Duration(seconds: 30);
  static const int _maxRetries = 3;

  RoutingRemoteDataSourceImpl({http.Client? client, String? apiKey})
    : _client = client ?? http.Client(),
      _apiKey = apiKey ?? Constants.arcgisApiKey {
    if (_apiKey.isEmpty) {
      throw const ServerFailure('API KEY của ArcGIS bị thiếu');
    }
  }

  @override
  Future<RouteResponseModel> solveRoute({
    required List<Map<String, double>> stops,
    List<Map<String, double>>? barriers,
    String? impedanceAttribute,
  }) async {
    if (stops.length < 2) {
      throw const ServerFailure('Cần ít nhất 2 điểm để chỉ đường');
    }

    // 1. Chuẩn bị định dạng chuỗi các điểm dừng: "lng,lat;lng,lat"
    final stopsString = stops
        .map((stop) => '${stop['lng']},${stop['lat']}')
        .join(';');

    // 2. Tham số cơ bản
    final queryParameters = <String, dynamic>{
      'stops': stopsString,
      'f': 'json',
      'token': _apiKey,
      'returnDirections': 'true',
      'returnRoutes': 'true',
      'directionsLanguage': 'vi', // Chỉ dẫn rẽ bằng Tiếng Việt
      'directionsLengthUnits': 'esriNAUMeters', // Trả về khoảng cách bằng Mét
      'outSR': '4326', // Tọa độ WGS84
    };

    // 2.5. IMPEDANCE ATTRIBUTE - Tối ưu theo thời gian hoặc quãng đường
    if (impedanceAttribute != null) {
      queryParameters['impedanceAttributeName'] = impedanceAttribute;

      AppLogger.data(
        'Routing strategy: impedanceAttribute = $impedanceAttribute',
        source: 'RoutingRemoteDataSource',
      );
    }

    // 3. BARRIERS - Né sự cố bằng cách truyền tọa độ trực tiếp
    if (barriers != null && barriers.isNotEmpty) {
      final barriersString = barriers
          .map((b) => '${b['lng']},${b['lat']}')
          .join(';');

      queryParameters['barriers'] = barriersString;

      AppLogger.data(
        '🚧 Avoid incidents enabled: ${barriers.length} barriers',
        source: 'RoutingRemoteDataSource',
      );

      AppLogger.debugRaw(
        'Barriers coordinates: $barriersString',
        source: 'RoutingRemoteDataSource',
      );
    } else {
      AppLogger.data(
        'Avoid incidents DISABLED',
        source: 'RoutingRemoteDataSource',
      );
    }

    final uri = Uri.parse(
      '${Constants.arcgisRouteBaseUrl}${Constants.routeAndDirections}',
    ).replace(queryParameters: queryParameters);

    // DEBUG: Log URL đầy đủ (ẩn token)
    final debugUri = uri.toString().replaceAll(
      RegExp(r'token=[^&]+'),
      'token=***HIDDEN***',
    );
    AppLogger.debugRaw(
      '🌐 API URL: $debugUri',
      source: 'RoutingRemoteDataSource',
    );

    // 4. Gọi API với Retry
    int retryCount = 0;

    while (retryCount <= _maxRetries) {
      try {
        final response = await _client.get(uri).timeout(_receiveTimeout);

        if (response.statusCode != 200) {
          throw ServerFailure('HTTP Error: ${response.statusCode}');
        }

        final data = json.decode(response.body) as Map<String, dynamic>;

        // Log raw response để debug
        AppLogger.debugRaw(
          'Route API Response: routes=${data['routes']?['features']?.length ?? 0}, '
          'directions=${data['directions']?.length ?? 0}',
          source: 'RoutingRemoteDataSource',
        );

        // Bắt lỗi logic từ ArcGIS (VD: Không tìm thấy đường, đường bị chặn kín 2 đầu)
        if (data['error'] != null) {
          throw ServerFailure(
            data['error']['message'] ?? 'Không tìm thấy đường đi',
          );
        }

        // Map vào Model
        return RouteResponseModel.fromJson(data);
      } on SocketException catch (_) {
        if (retryCount >= _maxRetries) {
          throw const NetworkFailure('Lỗi kết nối mạng');
        }
      } on TimeoutException catch (_) {
        if (retryCount >= _maxRetries) {
          throw const ServerFailure('Quá thời gian chờ (Timeout)');
        }
      } catch (e, st) {
        if (e is Failure) rethrow;

        AppLogger.error(
          'Lỗi khi gọi API Route: $e',
          name: 'RoutingRemoteDataSourceImpl',
          error: e,
          stackTrace: st,
        );

        throw ServerFailure(
          'Lỗi không xác định khi tìm đường: ${e.toString()}',
        );
      }
      retryCount++;
      await Future.delayed(Duration(seconds: retryCount * 2));
    }
    throw const ServerFailure('Lỗi không thể kết nối');
  }
}
