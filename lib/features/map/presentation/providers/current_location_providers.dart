import 'package:arcgis_maps/arcgis_maps.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'current_location_providers.g.dart';

/// Provider này CHỈ dùng để lưu trữ Object vị trí hiện tại (Tọa độ)
/// Nó được cập nhật bởi LocationDisplayManager khi GPS thay đổi
@Riverpod(keepAlive: true)
class CurrentLocationProvider extends _$CurrentLocationProvider {
  @override
  ArcGISLocation? build() {
    return null; // Mặc định chưa có vị trí
  }

  /// Hàm này sẽ được gọi từ LocationDisplayManager
  void updateLocation(ArcGISLocation location) {
    state = location;
  }

  void clearLocation() {
    state = null;
  }
}
