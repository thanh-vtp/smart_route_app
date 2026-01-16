import 'package:fpdart/fpdart.dart';
import 'package:smart_route_app/core/errors/failures.dart';
import 'package:smart_route_app/features/search/domain/entities/nearby_place.dart';

abstract class NearbyPlaceRepository {
  /// Tìm kiếm địa điểm gần đó
  Future<Either<Failure, List<NearbyPlace>>> findNearbyPlaces(
    double latitude,
    double longitude, {
    int maxLocations = 10,
    double searchRadius = 1000,
  });

  // Xóa tất cả cache nearby place
  Future<void> clearAllCache();

  /// Lấy thống kê cache nearby place
  Future<Map<String, int>> getCacheStats();
}
