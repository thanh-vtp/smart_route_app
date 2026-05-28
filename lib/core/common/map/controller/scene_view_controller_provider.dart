import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:smart_route_app/core/common/map/providers/map_controller_bundle_provider.dart';

/// Provider expose riêng ArcGISSceneViewController.
///
/// Dùng khi:
/// - Widget 3D chỉ cần scene controller
/// - Không muốn watch toàn bundle
/// - Giảm rebuild không cần thiết
///
/// Lifecycle:
/// - KHÔNG dispose trực tiếp controller ở đây
/// - Bundle provider sẽ là owner lifecycle
final sceneViewControllerProvider = Provider((ref) {
  final bundle = ref.watch(mapControllerBundleProvider);

  return bundle.scene3D;
});
