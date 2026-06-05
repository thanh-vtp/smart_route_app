import 'package:arcgis_maps/arcgis_maps.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:smart_route_app/core/utils/app_logger.dart';

import '../overlays/overlay_ids.dart';
import 'graphics_overlay_registry_provider.dart';

final navigationOverlayProvider = Provider<GraphicsOverlay>((ref) {
  AppLogger.debug('Navigation overlay requested');

  final registry = ref.watch(graphicsOverlayRegistryProvider);

  return registry.getOrCreate(OverlayIds.navigation);
});
