import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'map_mode_provider.g.dart';

/// Enum để định nghĩa chế độ hiển thị bản đồ
enum MapMode {
  map2D, // Bản đồ 2D
  scene3D, // Scene 3D
}

/// Provider để quản lý chế độ hiển thị bản đồ (2D/3D)
@Riverpod(keepAlive: true)
class MapModeProvider extends _$MapModeProvider {
  @override
  MapMode build() {
    return MapMode.map2D; // Mặc định là 2D
  }

  /// Thay đổi chế độ hiển thị bản đồ
  void setMapMode(MapMode mode) {
    state = mode;
  }

  /// Chuyển đổi giữa 2D và 3D
  void toggle() {
    state = state == MapMode.map2D ? MapMode.scene3D : MapMode.map2D;
  }
}
