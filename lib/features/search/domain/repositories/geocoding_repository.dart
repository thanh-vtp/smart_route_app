import 'package:fpdart/fpdart.dart';
import 'package:smart_route_app/features/search/domain/entities/address_result.dart';
import '../../../../core/errors/failures.dart';

abstract class GeocodingRepository {
  /// Chuyển đổi địa chỉ thành tọa độ
  Future<Either<Failure, List<AddressResult>>> findAddressCandidates(
    String address,
  );

  /// Chuyển đổi tọa độ thành địa chỉ (lấy tên đường, khu vực)
  Future<Either<Failure, AddressResult>> reverseGeocode(
    double latitude,
    double longitude,
  );

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
