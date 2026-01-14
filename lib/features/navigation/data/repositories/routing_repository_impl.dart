import 'dart:math' as math;
import 'package:fpdart/fpdart.dart';
import 'package:smart_route_app/core/network/network_info.dart';
import 'package:smart_route_app/core/utils/app_logger.dart';
import 'package:smart_route_app/core/errors/failures.dart';
import 'package:smart_route_app/features/navigation/data/datasources/routing_remote_data_source_impl.dart';
import 'package:smart_route_app/features/navigation/data/local_datasource/place_local_data_source_impl.dart';
import 'package:smart_route_app/features/navigation/data/local_datasource/route_local_data_source_impl.dart';
import 'package:smart_route_app/features/navigation/data/models/routing_models.dart';
import 'package:smart_route_app/features/navigation/domain/entities/nearby_place.dart';
import 'package:smart_route_app/features/navigation/domain/entities/route_direction.dart';
import 'package:smart_route_app/features/navigation/domain/entities/route_point.dart';
import 'package:smart_route_app/features/search/data/models/geocoding_models.dart';
import '../../domain/repositories/routing_repository.dart';
import '../../../navigation/data/datasources/arcgis_exception_handler.dart';
import 'package:smart_route_app/features/navigation/domain/entities/route_result.dart';

class RoutingRepositoryImpl implements RoutingRepository {
  final RoutingRemoteDataSource _routingRemoteDataSource;

  final PlaceLocalDataSource _placeCache;
  final RouteLocalDataSource _routeCache;

  final NetworkInfo _networkInfo;

  RoutingRepositoryImpl(
    this._routingRemoteDataSource,
    this._placeCache,
    this._routeCache,
    this._networkInfo,
  );

  // Helper để tạo Key đồng nhất
  String _makeKey(String prefix, dynamic input) =>
      '${prefix}_${input.toString().hashCode}';

  @override
  Future<Either<Failure, RouteResult>> calculateRoute(
    List<Map<String, double>> stops,
  ) async {
    final key = _makeKey('route', stops);

    final bool isConnected = await _networkInfo.isConnected;

    // Lấy cache 7 ngày
    final cached = await _routeCache.get(key, expiry: const Duration(days: 7));
    if (cached != null) {
      return right(_mapRouteResponseToEntity(RouteResponse.fromJson(cached)));
    }

    if (!isConnected) return left(NetworkFailure.noInternet());

    try {
      final response = await _routingRemoteDataSource.calculateRoute(stops);

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

  @override
  Future<Either<Failure, List<NearbyPlace>>> findNearbyPlaces(
    double latitude,
    double longitude, {
    String category = '',
    String maxLocations = '10',
    double searchRadius = 1000,
  }) async {
    final key =
        'nearby_${latitude.toStringAsFixed(4)}_${longitude.toStringAsFixed(4)}_${category}_$searchRadius';

    final bool isConnected = await _networkInfo.isConnected;

    // 1. Check Cache
    final cached = await _placeCache.get(
      key,
      expiry: const Duration(hours: 1),
    ); // Nearby nên cache ngắn
    if (cached != null) {
      final response = GeocodeResponse.fromJson(cached);
      return right(_mapNearbyToEntities(response, latitude, longitude));
    }

    if (!isConnected) return left(NetworkFailure.noInternet());

    try {
      final response = await _routingRemoteDataSource.findNearbyPlaces(
        latitude,
        longitude,
        category: category,
        maxLocations: maxLocations,
        searchRadius: searchRadius,
      );

      // 2. Lưu vào ROM
      await _placeCache.save(key, response.toJson());

      final places = _mapNearbyToEntities(response, latitude, longitude);

      AppLogger.repository(
        'Find Nearby Places fetched: '
        'total=${places.length}',
      );
      for (var i = 0; i < places.length; i++) {
        AppLogger.repository(
          '  [$i] ${places[i].address.split('\n').first} '
          '(${places[i].latitude.toStringAsFixed(4)}, ${places[i].longitude.toStringAsFixed(4)})',
        );
      }

      return right(places);
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

  /// Tính khoảng cách giữa 2 điểm (Haversine formula)
  double _calculateDistance(
    double lat1,
    double lon1,
    double lat2,
    double lon2,
  ) {
    const double earthRadius = 6371000; // meters
    final double dLat = _toRadians(lat2 - lat1);
    final double dLon = _toRadians(lon2 - lon1);

    final double a =
        math.sin(dLat / 2) * math.sin(dLat / 2) +
        math.cos(_toRadians(lat1)) *
            math.cos(_toRadians(lat2)) *
            math.sin(dLon / 2) *
            math.sin(dLon / 2);

    final double c = 2 * math.atan2(math.sqrt(a), math.sqrt(1 - a));

    return earthRadius * c;
  }

  double _toRadians(double degrees) {
    return degrees * (math.pi / 180);
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

    final result = RouteResult(
      routePoints: routePoints,
      totalDistance:
          (feature.attributes.totalKilometers ?? 0.0) *
          1000, // Convert km to meters
      totalTime: feature.attributes.totalTime ?? 0.0, // Already in minutes
      routeName: feature.attributes.name ?? 'Tuyến đường',
      directions: directions,
    );

    return result;
  }

  //
  List<NearbyPlace> _mapNearbyToEntities(
    GeocodeResponse response,
    double latitude,
    double longitude,
  ) {
    final places = response.candidates.map((candidate) {
      // Tính khoảng cách xấp xỉ
      final distance = _calculateDistance(
        latitude,
        longitude,
        candidate.location.latitude,
        candidate.location.longitude,
      );

      return NearbyPlace(
        name:
            candidate.attributes?['PlaceName'] as String? ?? candidate.address,
        address: candidate.address,
        latitude: candidate.location.latitude,
        longitude: candidate.location.longitude,
        distance: distance,
        category: candidate.attributes?['Type'] as String?,
        score: candidate.score,
      );
    }).toList();

    return places;
  }

  @override
  Future<void> clearAllCache() async {
    await _placeCache.clearAll();
    await _routeCache.clearAll();
  }

  @override
  Future<Map<String, int>> getCacheStats() async {
    final routeCount = await _routeCache.getCacheCount();
    final nearbyCount = await _placeCache.getCacheCount();

    return {'route': routeCount, 'nearby': nearbyCount};
  }
}
