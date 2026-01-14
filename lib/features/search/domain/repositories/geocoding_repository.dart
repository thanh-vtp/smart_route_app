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

  // ============ Cache Management ============

  /// Lấy danh sách lịch sử tìm kiếm gần đây
  Future<Either<Failure, List<AddressResult>>> getRecentSearchHistory();

  /// Xóa toàn bộ lịch sử tìm kiếm
  Future<Either<Failure, void>> clearHistory();
}
