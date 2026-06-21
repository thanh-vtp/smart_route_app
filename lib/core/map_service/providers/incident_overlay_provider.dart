import 'package:arcgis_maps/arcgis_maps.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:smart_route_app/core/map_service/overlays/overlay_ids.dart';
import 'package:smart_route_app/core/map_service/providers/graphics_overlay_registry_provider.dart';

final incidentOverlayProvider = Provider<GraphicsOverlay>((ref) {
  final registry = ref.watch(graphicsOverlayRegistryProvider);

  return registry.getOrCreate(OverlayIds.incidents);
});
