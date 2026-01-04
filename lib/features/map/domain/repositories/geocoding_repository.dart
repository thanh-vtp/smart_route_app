import 'package:fpdart/fpdart.dart';
import 'package:smart_route_app/features/search/domain/entities/address_result.dart';
import 'package:smart_route_app/features/map/domain/entities/location_imagery.dart';
import 'package:smart_route_app/features/map/domain/entities/nearby_place.dart';
import 'package:smart_route_app/features/map/domain/entities/route_result.dart';
import '../../../../core/errors/failures.dart';
// import '../entities/geocoding_entities.dart';

abstract class GeocodingRepository {
  // /// Chuyển đổi địa chỉ thành tọa độ
  // Future<Either<Failure, List<AddressResult>>> findAddressCandidates(
  //   String address,
  // );

  // /// Chuyển đổi tọa độ thành địa chỉ (lấy tên đường, khu vực)
  // Future<Either<Failure, AddressResult>> reverseGeocode(
  //   double latitude,
  //   double longitude,
  // );

  /// Tính toán đường đi giữa các điểm
  Future<Either<Failure, RouteResult>> calculateRoute(
    List<Map<String, double>> stops,
  );

  /// Lấy hình ảnh vệ tinh tại vị trí
  Future<Either<Failure, LocationImagery>> getLocationImagery(
    double latitude,
    double longitude, {
    int width = 400,
    int height = 400,
    int zoomLevel = 15,
  });

  /// Tìm kiếm địa điểm gần đó
  Future<Either<Failure, List<NearbyPlace>>> findNearbyPlaces(
    double latitude,
    double longitude, {
    String category = '',
    int maxLocations = 10,
    double searchRadius = 1000,
  });

  /// Lấy danh sách lịch sử tìm kiếm gần đây
  Future<Either<Failure, List<AddressResult>>> getRecentSearchHistory();

  /// Xóa toàn bộ lịch sử tìm kiếm
  Future<Either<Failure, void>> clearHistory();
  // ============ Cache Management ============

  /// Xóa tất cả cache (geocoding, route, nearby, imagery)
  Future<void> clearAllCache();

  /// Xóa cache đã hết hạn
  Future<void> clearExpiredCache();

  /// Lấy thống kê cache theo loại
  Future<Map<String, int>> getCacheStats();
}
