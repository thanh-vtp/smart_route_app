import 'dart:ui';

import 'package:arcgis_maps/arcgis_maps.dart';
import 'package:smart_route_app/core/common/map/facade/map_facade.dart';
import 'package:smart_route_app/core/common/map/facade/map_facade_dependencies.dart';
import 'package:smart_route_app/core/common/map/interactions/interaction_result.dart';
import '../../../../../../features/incident/domain/entities/incident.dart'
    as domain_incident;

class MapFacadeImpl implements MapFacade {
  final MapFacadeDependencies deps;

  MapFacadeImpl(this.deps);

  @override
  Future<void> initialize({required BasemapStyle basemapStyle}) async {
    await deps.engine.initialize2D(basemapStyle: basemapStyle);

    await deps.symbolPreloader.preload();

    deps.overlayManager.moveTo2D(deps.incidentOverlayController.overlay);
  }

  @override
  Future<void> switchTo2D() async {
    await deps.engine.switchTo2D();

    deps.overlayManager.moveTo2D(deps.incidentOverlayController.overlay);
  }

  @override
  Future<void> switchTo3D() async {
    await deps.engine.switchTo3D();

    deps.overlayManager.moveTo3D(deps.incidentOverlayController.overlay);
  }

  @override
  Future<void> changeBasemap(BasemapStyle style) async {
    await deps.engine.changeBasemap(style);
  }

  @override
  Future<void> renderIncidents(List<domain_incident.Incident> incidents) async {
    await deps.incidentOverlayController.renderIncidents(incidents);
  }

  @override
  Future<InteractionResult> onTap(Offset screenPoint) {
    if (deps.engine.is3DMode) {
      return deps.interactionController.handleTap(
        screenPoint: screenPoint,
        sceneController: deps.controllers.scene3D,
      );
    }

    return deps.interactionController.handleTap(
      screenPoint: screenPoint,
      mapController: deps.controllers.map2D,
    );
  }

  @override
  Future<void> startLocation() async {
    await deps.locationController.start(
      display: deps.controllers.map2D.locationDisplay,
      onLocationChanged: (_) {},
    );
  }

  @override
  Future<void> stopLocation() async {
    await deps.locationController.stop(
      display: deps.controllers.map2D.locationDisplay,
    );
  }

  @override
  void recenterLocation() {
    deps.locationController.recenter(deps.controllers.map2D.locationDisplay);
  }

  @override
  void dispose() {
    deps.locationController.dispose();

    deps.controllers.dispose();
  }
}
