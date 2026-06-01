import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:smart_route_app/core/common/map/overlays/overlay_manager.dart';
import 'package:smart_route_app/core/common/map/providers/map_controller_bundle_provider.dart';

final overlayManagerProvider = Provider<OverlayManager>((ref) {
  return OverlayManager(ref.watch(mapControllerBundleProvider));
});
