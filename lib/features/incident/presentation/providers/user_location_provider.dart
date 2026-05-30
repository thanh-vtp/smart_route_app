import 'package:arcgis_maps/arcgis_maps.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'user_location_provider.g.dart';

/// Provider lưu trữ vị trí GPS hiện tại của user
/// Được cập nhật từ LocationDisplay khi GPS bật
@Riverpod(keepAlive: true)
class UserLocation extends _$UserLocation {
  @override
  ArcGISPoint? build() => null;

  /// Lấy vị trí hiện tại
  ArcGISPoint? get current => state;

  /// Cập nhật vị trí mới
  void update(ArcGISPoint point) {
    state = point;
  }

  /// Cập nhật từ ArcGISLocation
  void updateFromLocation(ArcGISLocation location) {
    state = location.position;
  }

  /// Xóa vị trí (khi GPS tắt)
  void clear() {
    state = null;
  }

  /// Kiểm tra có vị trí không
  bool get hasLocation => state != null;

  /// Lấy lat
  double? get lat => state?.y;

  /// Lấy lng
  double? get lng => state?.x;
}
