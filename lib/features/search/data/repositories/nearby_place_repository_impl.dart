import 'package:fpdart/fpdart.dart';
import 'package:smart_route_app/core/errors/failures.dart';
import 'package:smart_route_app/core/network/network_info.dart';
import 'package:smart_route_app/core/utils/app_logger.dart';
import 'package:smart_route_app/features/search/domain/entities/emergency_category.dart';
import 'package:smart_route_app/features/search/domain/entities/nearby_place.dart';
import 'package:smart_route_app/features/search/data/datasources/arcgis_exception_handler.dart';
import 'package:smart_route_app/features/search/data/datasources/arcgis_geocoding_remote_data_source.dart';
import 'package:smart_route_app/features/search/data/local_datasource/place_local_data_source_impl.dart';
import 'package:smart_route_app/features/search/data/models/geocoding_models.dart';
import 'package:smart_route_app/features/search/domain/repositories/nearby_place_repository.dart';
import 'dart:math' as math;

class NearbyPlaceRepositoryImpl implements NearbyPlaceRepository {
  final ArcGISGeocodingRemoteDataSource _arcGISGeocodingRemoteDataSource;
  final PlaceLocalDataSource _placeCache;

  final NetworkInfo _networkInfo;

  NearbyPlaceRepositoryImpl(
    this._arcGISGeocodingRemoteDataSource,
    this._placeCache,
    this._networkInfo,
  );

  @override
  Future<Either<Failure, List<NearbyPlace>>> findNearbyPlaces(
    double latitude,
    double longitude, {
    int maxLocations = 10,
    double searchRadius = 1000,
  }) async {
    final allCategories = EmergencyCategory.allCategoryValues;

    final key =
        'nearby_${latitude.toStringAsFixed(4)}_${longitude.toStringAsFixed(4)}_${allCategories}_${searchRadius.toInt()}';

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
      final response = await _arcGISGeocodingRemoteDataSource.findNearbyPlaces(
        latitude,
        longitude,
        category: allCategories,
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
        name: candidate.attributes['PlaceName'] as String? ?? candidate.address,
        address: candidate.address,
        latitude: candidate.location.latitude,
        longitude: candidate.location.longitude,
        distance: distance,
        category: candidate.attributes['Type'] as String?,
        score: candidate.score,
        type: candidate.type,
      );
    }).toList();

    return places;
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

  @override
  Future<void> clearAllCache() async {
    await _placeCache.clearAll();
  }

  @override
  Future<Map<String, int>> getCacheStats() async {
    final nearbyCount = await _placeCache.getCacheCount();

    return {'nearby': nearbyCount};
  }
}
