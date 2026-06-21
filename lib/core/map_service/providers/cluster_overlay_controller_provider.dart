import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:smart_route_app/core/map_service/overlays/cluster_overlay_controller.dart';
import 'package:smart_route_app/core/map_service/providers/cluster_overlay_provider.dart';

final clusterOverlayControllerProvider = Provider<ClusterOverlayController>((
  ref,
) {
  return ClusterOverlayController(overlay: ref.watch(clusterOverlayProvider));
});
