import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:smart_route_app/core/errors/failures.dart';
import 'package:smart_route_app/core/utils/app_logger.dart';
import 'package:smart_route_app/core/utils/constants.dart';
import 'package:smart_route_app/features/navigation/data/datasources/routing_remote_data_source.dart';
import 'package:smart_route_app/features/navigation/data/models/routing_model.dart';
import 'package:smart_route_app/features/navigation/data/models/routing_models.dart';
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
    bool avoidIncidents = true,
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

    // 3. VŨ KHÍ BÍ MẬT: NÉ SỰ CỐ TỰ ĐỘNG
    if (avoidIncidents) {
      // Truyền URL của Layer sự cố vào.
      // Câu lệnh where: Chỉ né những sự cố đang 'active' và có mức độ 'medium' hoặc 'high'.
      // (Những sự cố 'low' như ngập nhẹ thì vẫn cho phép xe chạy qua, hoặc bạn có thể bỏ phần severity đi để né toàn bộ).
      final barriersJson = {
        "url": Constants.serviceTFeatureTableUrl,
        "where": "status = 'active' AND severity IN ('high', 'medium')",
      };

      queryParameters['pointBarriers'] = json.encode(barriersJson);
    }

    final uri = Uri.parse(
      '${Constants.arcgisRouteBaseUrl}${Constants.routeAndDirections}',
    ).replace(queryParameters: queryParameters);

    // 4. Gọi API với Retry
    int retryCount = 0;

    while (retryCount <= _maxRetries) {
      try {
        final response = await _client.get(uri).timeout(_receiveTimeout);

        if (response.statusCode != 200) {
          throw ServerFailure('HTTP Error: ${response.statusCode}');
        }

        final data = json.decode(response.body) as Map<String, dynamic>;

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
