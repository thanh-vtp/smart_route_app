import 'dart:ui';

import 'package:arcgis_maps/arcgis_maps.dart';
import 'package:smart_route_app/core/common/map/facade/map_facade.dart';
import 'package:smart_route_app/core/common/map/facade/map_facade_dependencies.dart';
import 'package:smart_route_app/core/common/map/interactions/interaction_result.dart';
import 'package:smart_route_app/core/common/map/location/location_state.dart';
import 'package:smart_route_app/core/utils/app_logger.dart';
import '../../../../../../features/incident/domain/entities/incident.dart'
    as domain_incident;

class MapFacadeImpl implements MapFacade {
  final MapFacadeDependencies deps;

  MapFacadeImpl(this.deps);

  @override
  Future<void> initialize({required BasemapStyle basemapStyle}) async {
    await deps.engine.initialize2D(basemapStyle: basemapStyle);

    await deps.symbolPreloader.preload();

    deps.overlayManager.moveAllTo2D([
      deps.incidentOverlayController.overlay,
      deps.selectionOverlayController.overlay,
    ]);
  }

  @override
  Future<void> switchTo2D() async {
    await deps.engine.switchTo2D();

    deps.overlayManager.moveAllTo2D([
      deps.incidentOverlayController.overlay,
      deps.selectionOverlayController.overlay,
    ]);
  }

  @override
  Future<void> switchTo3D() async {
    await deps.engine.switchTo3D();

    deps.overlayManager.moveAllTo3D([
      deps.incidentOverlayController.overlay,
      deps.selectionOverlayController.overlay,
    ]);
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
  Future<void> selectIncident(String incidentId) async {
    if (deps.selectionController.state.selectedIncidentId == incidentId) {
      return;
    }

    final graphic = deps.incidentOverlayController.getGraphicByIncidentId(
      incidentId,
    );

    if (graphic == null) {
      AppLogger.warning(
        'Không thể chọn sự cố, Graphic không tìm thấy: $incidentId',
      );
      return;
    }

    final symbol = await deps.incidentOverlayController.symbolFactory
        .getHighlightSymbol();

    deps.selectionOverlayController.selectGraphic(
      sourceGraphic: graphic,
      symbol: symbol,
    );

    deps.selectionController.selectIncident(incidentId);
  }

  @override
  void clearSelection() {
    deps.selectionController.clearSelection();

    deps.selectionOverlayController.clear();
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
  LocationDisplay get locationDisplay => deps.controllers.map2D.locationDisplay;

  @override
  Future<LocationState> startLocation({
    required void Function(ArcGISLocation location) onLocationChanged,
  }) {
    return deps.locationController.start(
      display: deps.controllers.map2D.locationDisplay,
      onLocationChanged: onLocationChanged,
    );
  }

  @override
  Future<LocationState> stopLocation() async {
    return await deps.locationController.stop(
      display: deps.controllers.map2D.locationDisplay,
    );
  }

  @override
  void recenterLocation() {
    deps.locationController.recenter(deps.controllers.map2D.locationDisplay);
  }

  @override
  bool isFollowingLocation() {
    return deps.locationController.isFollowing(
      deps.controllers.map2D.locationDisplay,
    );
  }

  @override
  void dispose() {
    deps.locationController.dispose();
  }
}
