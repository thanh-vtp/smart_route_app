import 'dart:convert';
import 'dart:math' as math;
import 'package:fpdart/fpdart.dart';
import 'package:smart_route_app/core/network/network_info.dart';
import 'package:smart_route_app/core/utils/app_logger.dart';
import 'package:smart_route_app/core/errors/failures.dart';
import 'package:smart_route_app/features/map/data/datasources/arcgis_geocoding_remote_data_source.dart';
import 'package:smart_route_app/features/map/data/local_datasource/geocoding_local_data_source.dart';
import 'package:smart_route_app/features/map/data/local_datasource/imagery_local_data_source.dart';
import 'package:smart_route_app/features/map/data/models/geocoding_models.dart';
import 'package:smart_route_app/features/search/domain/entities/address_result.dart';
import 'package:smart_route_app/features/map/domain/entities/location_imagery.dart';
import 'package:smart_route_app/features/map/domain/entities/nearby_place.dart';
import 'package:smart_route_app/features/map/domain/entities/route_direction.dart';
import 'package:smart_route_app/features/map/domain/entities/route_point.dart';
import '../../domain/repositories/geocoding_repository.dart';
import '../datasources/arcgis_exception_handler.dart';
import 'package:smart_route_app/features/map/domain/entities/route_result.dart';

class GeocodingRepositoryImpl implements GeocodingRepository {
  final ArcGISGeocodingRemoteDataSource _arcGISGeocodingRemoteDataSource;
  final GeocodingLocalDataSource _localDataSource; // SQLite
  final ImageryLocalDataSource _imageryLocalSource; // File System
  final NetworkInfo _networkInfo;

  GeocodingRepositoryImpl(
    this._arcGISGeocodingRemoteDataSource,
    this._localDataSource,
    this._imageryLocalSource,
    this._networkInfo,
  );

  // Helper để tạo Key đồng nhất
  String _makeKey(String prefix, dynamic input) =>
      '${prefix}_${input.toString().hashCode}';

  @override
  Future<Either<Failure, List<AddressResult>>> findAddressCandidates(
    String address,
  ) async {
    final key = _makeKey('geocode', address.trim().toLowerCase());

    final bool isConnected = await _networkInfo.isConnected;

    // 1. Check Cache trước (ROM)
    final cached = await _localDataSource.getCache(
      key,
      const Duration(days: 7),
    );
    if (cached != null) {
      final response = GeocodeResponse.fromJson(cached);
      return right(_mapGeocodeToEntities(response));
    }

    // 2. Nếu không có cache, check mạng và gọi Remote
    if (!isConnected) return left(NetworkFailure.noInternet());

    try {
      final response = await _arcGISGeocodingRemoteDataSource
          .findAddressCandidates(address);

      // Lưu vào ROM cho lần sau
      await _localDataSource.saveCache(key, 'geocode', response.toJson());

      final results = _mapGeocodeToEntities(response);

      return right(results);
    } catch (e, st) {
      final failure = ArcGISExceptionHandler.handleException(e, st);
      return left(failure);
    }
  }

  @override
  Future<Either<Failure, AddressResult>> reverseGeocode(
    double latitude,
    double longitude,
  ) async {
    final key =
        'rev_${latitude.toStringAsFixed(5)}_${longitude.toStringAsFixed(5)}';

    // 1. Check Cache (Nếu người dùng nhấn lại đúng điểm đó, không gọi API)
    final cached = await _localDataSource.getCache(
      key,
      const Duration(days: 3),
    );
    if (cached != null) {
      return right(
        _mapReverseGeocodeToEntity(ReverseGeocodeResponse.fromJson(cached)),
      );
    }
    try {
      final response = await _arcGISGeocodingRemoteDataSource.reverseGeocode(
        latitude,
        longitude,
      );

      // 2. Lưu vào Lịch sử (SQLite)
      await _localDataSource.saveCache(
        key,
        'reverse_geocode',
        response.toJson(),
      );

      final result = _mapReverseGeocodeToEntity(response);

      return right(result);
    } catch (e, st) {
      final failure = ArcGISExceptionHandler.handleException(e, st);
      return left(failure);
    }
  }

  @override
  Future<Either<Failure, RouteResult>> calculateRoute(
    List<Map<String, double>> stops,
  ) async {
    final key = _makeKey('route', stops);

    // Lấy cache 1 ngày
    final cached = await _localDataSource.getCache(
      key,
      const Duration(days: 1),
    );
    if (cached != null) {
      return right(_mapRouteResponseToEntity(RouteResponse.fromJson(cached)));
    }
    try {
      final response = await _arcGISGeocodingRemoteDataSource.calculateRoute(
        stops,
      );

      // Cache
      await _localDataSource.saveCache(key, 'route', response.toJson());

      // Kiểm tra kết quả
      if (response.routes.features.isEmpty) {
        return left(ArcGISFailure.noResults());
      }

      final result = _mapRouteResponseToEntity(response);

      return right(result);
    } catch (e, st) {
      AppLogger.error(
        'Repository error: $e',
        name: 'GeocodingRepositoryImpl',
        error: e,
        stackTrace: st,
      );
      final failure = ArcGISExceptionHandler.handleException(e, st);
      return left(failure);
    }
  }

  @override
  Future<Either<Failure, LocationImagery>> getLocationImagery(
    double latitude,
    double longitude, {
    int width = 400,
    int height = 400,
    int zoomLevel = 15,
  }) async {
    AppLogger.repository(
      'Repository.getLocationImagery called with lat: $latitude, lon: $longitude',
    );
    final key =
        'img_${latitude.toStringAsFixed(4)}_${longitude.toStringAsFixed(4)}_$zoomLevel';

    final bool isConnected = await _networkInfo.isConnected;

    // 1. Ưu tiên đọc từ ROM (File System) - Không cần check mạng
    final cachedBytes = await _imageryLocalSource.getImage(
      key,
      const Duration(days: 30),
    );
    if (cachedBytes != null) {
      AppLogger.repository('CACHE HIT: Satellite Image from ROM');
      return right(
        LocationImagery(
          imageData: cachedBytes,
          latitude: latitude,
          longitude: longitude,
          description: "Cached Imagery",
        ),
      );
    }

    if (!isConnected) {
      return left(NetworkFailure.noInternet());
    }

    try {
      AppLogger.repository('Calling dataSource.getSatelliteImage...');
      final imageData = await _arcGISGeocodingRemoteDataSource
          .getSatelliteImage(
            latitude,
            longitude,
            width: width,
            height: height,
            level: zoomLevel,
          );
      AppLogger.repository('Got image data: ${imageData.length} bytes');

      // Lấy thêm metadata nếu cần (optional - không block nếu fail)
      AppLogger.repository('Getting imagery metadata...');

      ImageryMetadataResponse metadata;
      try {
        metadata = await _arcGISGeocodingRemoteDataSource.getImageryMetadata(
          latitude,
          longitude,
        );
        AppLogger.repository('Got metadata: ${metadata.description}');
      } catch (metadataError) {
        AppLogger.error(
          'Failed to get metadata (continuing without): $metadataError',
          name: 'GeocodingRepositoryImpl',
        );
        metadata = const ImageryMetadataResponse();
      }

      // Cache ảnh vào ROM
      await _imageryLocalSource.saveImage(key, imageData);

      final result = LocationImagery(
        imageData: imageData,
        description: metadata.description,
        copyrightText: metadata.copyrightText,
        latitude: latitude,
        longitude: longitude,
      );

      AppLogger.repository('Repository returning success');
      return right(result);
    } catch (e, st) {
      AppLogger.error(
        'Repository error: $e',
        name: 'GeocodingRepositoryImpl',
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
    int maxLocations = 10,
    double searchRadius = 1000,
  }) async {
    final key =
        'nearby_${latitude.toStringAsFixed(4)}_${longitude.toStringAsFixed(4)}_${category}_$searchRadius';

    // 1. Check Cache
    final cached = await _localDataSource.getCache(
      key,
      const Duration(hours: 2),
    ); // Nearby nên cache ngắn
    if (cached != null) {
      final response = GeocodeResponse.fromJson(cached);
      return right(_mapNearbyToEntities(response, latitude, longitude));
    }

    try {
      final response = await _arcGISGeocodingRemoteDataSource.findNearbyPlaces(
        latitude,
        longitude,
        category: category,
        maxLocations: maxLocations,
        searchRadius: searchRadius,
      );

      // 2. Lưu vào ROM
      await _localDataSource.saveCache(key, 'nearby', response.toJson());

      final places = _mapNearbyToEntities(response, latitude, longitude);

      return right(places);
    } catch (e, st) {
      AppLogger.error(
        'Repository error: $e',
        name: 'GeocodingRepositoryImpl',
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

  // Helper chuyển đổi GeocodeResponse thành List<AddressResult>
  List<AddressResult> _mapGeocodeToEntities(GeocodeResponse response) {
    return response.candidates.map((candidate) {
      return AddressResult(
        fullAddress: candidate.address,
        streetName: candidate.attributes?['Address'] as String?,
        neighborhood: candidate.attributes?['Neighborhood'] as String?,
        district: candidate.attributes?['District'] as String?,
        city: candidate.attributes?['City'] as String?,
        region: candidate.attributes?['Region'] as String?,
        countryName: candidate.attributes?['CntryName'] as String?,
        postalCode: candidate.attributes?['Postal'] as String?,
        latitude: candidate.location.latitude,
        longitude: candidate.location.longitude,
        score: candidate.score,
      );
    }).toList();
  }

  // Helper chuyển đổi ReverseGeocodeResponse thành AddressResult
  AddressResult _mapReverseGeocodeToEntity(ReverseGeocodeResponse response) {
    final result = AddressResult(
      fullAddress: response.address.fullAddress ?? 'Không xác định',
      streetName: response.address.streetName,
      neighborhood: response.address.neighborhood,
      district: response.address.district,
      city: response.address.city,
      region: response.address.region,
      countryName: response.address.countryName,
      postalCode: response.address.postalCode,
      latitude: response.location.latitude,
      longitude: response.location.longitude,
      score: 100.0, // Reverse geocoding thường có độ chính xác cao
    );

    return result;
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
  Future<Either<Failure, List<AddressResult>>> getRecentSearchHistory() async {
    try {
      // Lấy cả geocode (tìm bằng text) và reverse_geocode (nhấn trên map)
      final geoHistory = await _localDataSource.getRecentHistory(
        type: 'geocode',
        limit: 5,
      );
      final revHistory = await _localDataSource.getRecentHistory(
        type: 'reverse_geocode',
        limit: 5,
      );

      final combined = [...geoHistory, ...revHistory];
      // Sắp xếp lại theo thời gian giảm dần
      combined.sort(
        (a, b) => (b['timestamp'] as int).compareTo(a['timestamp'] as int),
      );
      final results = combined.map((item) {
        final data = jsonDecode(item['data']);
        // Tùy loại data mà map tương ứng (GeocodeResponse hoặc ReverseGeocodeResponse)
        return item['type'] == 'geocode'
            ? _mapGeocodeToEntities(GeocodeResponse.fromJson(data)).first
            : _mapReverseGeocodeToEntity(ReverseGeocodeResponse.fromJson(data));
      }).toList();
      return right(results);
    } catch (e, st) {
      AppLogger.error(
        'Error getting recent search history: $e',
        name: 'GeocodingRepositoryImpl',
        error: e,
        stackTrace: st,
      );

      final failure = CacheFailure.noData();
      return left(failure);
    }
  }

  @override
  Future<Either<Failure, void>> clearHistory() async {
    try {
      AppLogger.repository('Clearing geocoding history from ROM...');
      await _localDataSource.clearHistory();
      return right(null);
    } catch (e, st) {
      AppLogger.error(
        'Failed to clear history',
        name: 'GeocodingRepositoryImpl',
        error: e,
        stackTrace: st,
      );
      return left(UnexpectedFailure(e, st));
    }
  }

  // ============ Cache Management ============

  @override
  Future<void> clearAllCache() async {
    await _localDataSource.clearAll();
    await _imageryLocalSource.clearAll();
  }

  @override
  Future<void> clearExpiredCache() async {
    await _localDataSource.clearExpired();
    // Imagery cache tự động xóa khi hết hạn trong getImage()
  }

  @override
  Future<Map<String, int>> getCacheStats() async {
    // Lấy thống kê từ SQLite theo type
    final geocodeHistory = await _localDataSource.getRecentHistory(
      type: 'geocode',
      limit: 1000,
    );
    final reverseHistory = await _localDataSource.getRecentHistory(
      type: 'reverse_geocode',
      limit: 1000,
    );
    final routeHistory = await _localDataSource.getRecentHistory(
      type: 'route',
      limit: 1000,
    );
    final nearbyHistory = await _localDataSource.getRecentHistory(
      type: 'nearby',
      limit: 1000,
    );

    // Đếm số ảnh trong file system cache
    final imageCount = await _imageryLocalSource.getCacheCount();

    return {
      'geocode': geocodeHistory.length,
      'reverse_geocode': reverseHistory.length,
      'route': routeHistory.length,
      'nearby': nearbyHistory.length,
      'image': imageCount,
    };
  }
}
