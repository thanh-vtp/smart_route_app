import 'package:arcgis_maps/arcgis_maps.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../overlays/overlay_ids.dart';
import 'graphics_overlay_registry_provider.dart';

final navigationOverlayProvider = Provider<GraphicsOverlay>((ref) {
  final registry = ref.watch(graphicsOverlayRegistryProvider);

  return registry.getOrCreate(OverlayIds.navigation);
});
