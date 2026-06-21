import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:smart_route_app/core/map_service/overlays/graphics_overlay_registry.dart';

final graphicsOverlayRegistryProvider = Provider<GraphicsOverlayRegistry>((
  ref,
) {
  return GraphicsOverlayRegistry();
});
