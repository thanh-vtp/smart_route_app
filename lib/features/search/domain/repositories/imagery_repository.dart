import 'package:fpdart/fpdart.dart';
import 'package:smart_route_app/core/errors/failures.dart';
import 'package:smart_route_app/features/search/domain/entities/location_imagery.dart';

abstract class ImageryRepository {
  /// Lấy hình ảnh vệ tinh tại vị trí
  Future<Either<Failure, LocationImagery>> getLocationImagery(
    double latitude,
    double longitude, {
    int width = 400,
    int height = 400,
    int zoomLevel = 15,
  });

  /// Lấy số lượng ảnh đã cache
  Future<int> getCacheCount();

  /// Xóa tất cả ảnh cache
  Future<void> clearAllCache();
}
