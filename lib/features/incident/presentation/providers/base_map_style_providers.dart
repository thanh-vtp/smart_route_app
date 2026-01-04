import 'package:arcgis_maps/arcgis_maps.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'base_map_style_providers.g.dart';

/// Provider để lưu trữ kiểu basemap
@Riverpod(keepAlive: true)
class BaseMapStyleProvider extends _$BaseMapStyleProvider {
  @override
  BasemapStyle build() {
    return BasemapStyle.arcGISNavigation;
  }

  /// Cập nhật kiểu basemap
  void setBaseMapStyle(BasemapStyle style) {
    state = style;
  }
}

/// Provider để track trạng thái loading khi đổi basemap
@Riverpod(keepAlive: true)
class BasemapLoading extends _$BasemapLoading {
  @override
  bool build() => false;

  void setLoading(bool loading) {
    state = loading;
  }
}
