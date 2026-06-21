import 'package:arcgis_maps/arcgis_maps.dart';
import 'package:smart_route_app/core/map_service/controller/map_controller_bundle.dart';

/// orchestration layer của overlays
class OverlayManager {
  final MapControllerBundle controllers;

  OverlayManager(this.controllers);

  void attachTo2D(GraphicsOverlay overlay) {
    final overlays = controllers.map2D.graphicsOverlays;

    if (!overlays.contains(overlay)) {
      overlays.add(overlay);
    }
  }

  void attachTo3D(GraphicsOverlay overlay) {
    final overlays = controllers.scene3D.graphicsOverlays;

    if (!overlays.contains(overlay)) {
      overlays.add(overlay);
    }
  }

  void detachFrom2D(GraphicsOverlay overlay) {
    controllers.map2D.graphicsOverlays.remove(overlay);
  }

  void detachFrom3D(GraphicsOverlay overlay) {
    controllers.scene3D.graphicsOverlays.remove(overlay);
  }

  void moveTo2D(GraphicsOverlay overlay) {
    detachFromAll(overlay);

    attachTo2D(overlay);
  }

  void moveTo3D(GraphicsOverlay overlay) {
    detachFromAll(overlay);

    attachTo3D(overlay);
  }

  void detachFromAll(GraphicsOverlay overlay) {
    detachFrom2D(overlay);

    detachFrom3D(overlay);
  }

  void moveAllTo2D(Iterable<GraphicsOverlay> overlays) {
    for (final overlay in overlays) {
      moveTo2D(overlay);
    }
  }

  void moveAllTo3D(Iterable<GraphicsOverlay> overlays) {
    for (final overlay in overlays) {
      moveTo3D(overlay);
    }
  }
}
