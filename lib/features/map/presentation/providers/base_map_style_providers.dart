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
