import 'package:arcgis_maps/arcgis_maps.dart';
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

/// Request model để yêu cầu map di chuyển đến vị trí cụ thể
class NavigateToPointRequest {
  final ArcGISPoint point;
  final double scale;
  final DateTime timestamp; // Để phân biệt các request khác nhau

  NavigateToPointRequest({required this.point, this.scale = 5000})
    : timestamp = DateTime.now();
}

/// Provider để yêu cầu map di chuyển đến vị trí cụ thể
/// MapPage sẽ listen provider này và thực hiện setViewpointCenter
@Riverpod(keepAlive: true)
class NavigateToPoint extends _$NavigateToPoint {
  @override
  NavigateToPointRequest? build() => null;

  /// Yêu cầu map di chuyển đến điểm cụ thể
  void navigateTo(ArcGISPoint point, {double scale = 5000}) {
    state = NavigateToPointRequest(point: point, scale: scale);
  }

  /// Clear request sau khi đã xử lý
  void clear() {
    state = null;
  }
}
