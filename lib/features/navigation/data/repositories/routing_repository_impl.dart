import 'package:fpdart/fpdart.dart';
import 'package:smart_route_app/core/network/network_info.dart';
import 'package:smart_route_app/core/utils/app_logger.dart';
import 'package:smart_route_app/core/errors/failures.dart';
import 'package:smart_route_app/features/incident/domain/entities/incident.dart';
import 'package:smart_route_app/features/navigation/data/datasources/routing_remote_data_source_impl.dart';
import 'package:smart_route_app/features/navigation/data/local_datasource/route_local_data_source_impl.dart';
import 'package:smart_route_app/features/navigation/data/models/routing_models.dart';
import 'package:smart_route_app/features/navigation/domain/entities/route_direction.dart';
import 'package:smart_route_app/features/navigation/domain/entities/route_point.dart';
import '../../domain/repositories/routing_repository.dart';
import '../../../navigation/data/datasources/arcgis_exception_handler.dart';
import 'package:smart_route_app/features/navigation/domain/entities/route_result.dart';

class RoutingRepositoryImpl implements RoutingRepository {
  final RoutingRemoteDataSource _routingRemoteDataSource;
  final RouteLocalDataSource _routeCache;

  final NetworkInfo _networkInfo;

  RoutingRepositoryImpl(
    this._routingRemoteDataSource,
    this._routeCache,
    this._networkInfo,
  );

  // Helper để tạo Key đồng nhất
  String _makeKey(String prefix, dynamic input) =>
      '${prefix}_${input.toString().hashCode}';

  @override
  Future<Either<Failure, RouteResult>> calculateRoute({
    required List<Map<String, double>> stops,
    List<Incident>? incidentsToAvoid,
  }) async {
    final key = _makeKey('route', stops);

    final bool isConnected = await _networkInfo.isConnected;

    // Lấy cache 7 ngày
    final cached = await _routeCache.get(key, expiry: const Duration(days: 7));
    if (cached != null) {
      return right(_mapRouteResponseToEntity(RouteResponse.fromJson(cached)));
    }

    if (!isConnected) return left(NetworkFailure.noInternet());

    List<Map<String, double>>? barriers;

    if (incidentsToAvoid != null && incidentsToAvoid.isNotEmpty) {
      barriers = incidentsToAvoid
          .map((incident) {
            return {
              'longitude': incident.longitude,
              'latitude': incident.latitude,
            };
          })
          .where((b) => b['longitude'] != 0 && b['latitude'] != 0)
          .toList();
    }

    try {
      final response = await _routingRemoteDataSource.solve(
        stops: stops,
        barriers: barriers,
      );

      // Cache
      await _routeCache.save(key, response.toJson());

      // Kiểm tra kết quả
      if (response.routes.features.isEmpty) {
        return left(ArcGISFailure.noResults());
      }

      final result = _mapRouteResponseToEntity(response);

      return right(result);
    } catch (e, st) {
      AppLogger.error(
        'Repository error: $e',
        name: 'RoutingRepositoryImpl',
        error: e,
        stackTrace: st,
      );
      final failure = ArcGISExceptionHandler.handleException(e, st);
      return left(failure);
    }
  }

  // Helper chuyển đổi RouteResponse thành RouteResult
  RouteResult _mapRouteResponseToEntity(RouteResponse response) {
    final feature = response.routes.features.first;

    // Debug logging
    AppLogger.repository('Route feature attributes: ${feature.attributes}');
    AppLogger.repository(
      'totalKilometers: ${feature.attributes.totalKilometers}',
    );
    AppLogger.repository('totalTime: ${feature.attributes.totalTime}');

    final routePoints = <RoutePoint>[];

    // Chuyển đổi geometry paths thành list RoutePoint
    // Map Geometry (Paths) -> RoutePoints (Để vẽ đường màu xanh)
    for (final path in feature.geometry.paths) {
      for (final point in path) {
        if (point.length >= 2) {
          routePoints.add(RoutePoint(latitude: point[1], longitude: point[0]));
        }
      }
    }

    // Parse directions
    final directions = <RouteDirection>[];
    if (response.directions.isNotEmpty) {
      final directionSet = response.directions.first;
      for (final dirFeature in directionSet.features) {
        final attrs = dirFeature.attributes;

        // Lấy street name từ strings
        String? streetName;
        String? altStreetName;
        for (final str in dirFeature.strings) {
          if (str.stringType == 'esriDSTStreetName') {
            streetName = str.string;
          } else if (str.stringType == 'esriDSTAltName') {
            altStreetName = str.string;
          }
        }

        directions.add(
          RouteDirection(
            instruction: attrs.text ?? '',
            distanceMeters: (attrs.length) * 1609.34, // miles to meters
            timeMinutes: attrs.time,
            maneuverType: ManeuverType.fromArcGIS(attrs.maneuverType ?? ''),
            streetName: streetName,
            altStreetName: altStreetName,
          ),
        );
      }
      AppLogger.repository('Parsed ${directions.length} direction steps');
    }

    // ConfirmedBarriers (Để biết điểm nào đã né)
    final confirmedBarriers = <RoutePoint>[];
    if (response.barriers?.features != null) {
      for (final feature in response.barriers!.features) {
        if (feature.geometry.x != null && feature.geometry.y != null) {
          confirmedBarriers.add(
            RoutePoint(
              latitude: feature.geometry.y!,
              longitude: feature.geometry.x!,
            ),
          );
        }
      }
    }

    final result = RouteResult(
      routePoints: routePoints, // Đường đi (Polyline)
      totalDistance:
          (feature.attributes.totalKilometers ?? 0.0) *
          1000, // Convert km to meters
      totalTime: feature.attributes.totalTime ?? 0.0, // Already in minutes
      routeName: feature.attributes.name ?? 'Tuyến đường',
      directions: directions,
      confirmedBarriers: confirmedBarriers, // Sự cố đã xác nhận
    );

    return result;
  }

  @override
  Future<void> clearAllCache() async {
    await _routeCache.clearAll();
  }

  @override
  Future<Map<String, int>> getCacheStats() async {
    final routeCount = await _routeCache.getCacheCount();

    return {'route': routeCount};
  }
}
