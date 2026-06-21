import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:smart_route_app/core/map_service/overlays/overlay_manager.dart';
import 'package:smart_route_app/core/map_service/providers/map_controller_bundle_provider.dart';

final overlayManagerProvider = Provider<OverlayManager>((ref) {
  return OverlayManager(ref.watch(mapControllerBundleProvider));
});
