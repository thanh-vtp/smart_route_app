import 'package:arcgis_maps/arcgis_maps.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'map_center_providers.g.dart';

/// Provider lưu trữ tâm của bản đồ khi người dùng di chuyển bản đồ
@Riverpod(keepAlive: true)
class MapCenter extends _$MapCenter {
  @override
  ArcGISPoint? build() => null;

  ArcGISPoint? current() => state;

  void update(ArcGISPoint point) {
    state = point;
  }

  void clear() {
    state = null;
  }
}
