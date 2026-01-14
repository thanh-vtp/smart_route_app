import 'package:fpdart/fpdart.dart';
import 'package:smart_route_app/features/navigation/domain/entities/nearby_place.dart';
import 'package:smart_route_app/features/navigation/domain/entities/route_result.dart';
import '../../../../core/errors/failures.dart';
// import '../entities/geocoding_entities.dart';

abstract class RoutingRepository {
  /// Tính toán đường đi giữa các điểm
  Future<Either<Failure, RouteResult>> calculateRoute(
    List<Map<String, double>> stops,
  );

  /// Tìm kiếm địa điểm gần đó
  Future<Either<Failure, List<NearbyPlace>>> findNearbyPlaces(
    double latitude,
    double longitude, {
    String category = '',
    String maxLocations = '10',
    double searchRadius = 1000,
  });

  /// Xóa tất cả cache (geocoding, route, nearby, imagery)
  Future<void> clearAllCache();

  /// Lấy thống kê cache (route, nearby)
  Future<Map<String, int>> getCacheStats();
}
