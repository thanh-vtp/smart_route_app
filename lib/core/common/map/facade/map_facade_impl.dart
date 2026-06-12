import 'dart:ui';

import 'package:arcgis_maps/arcgis_maps.dart';
import 'package:smart_route_app/core/common/map/facade/map_facade.dart';
import 'package:smart_route_app/core/common/map/facade/map_facade_dependencies.dart';
import 'package:smart_route_app/core/common/map/interactions/interaction_result.dart';
import 'package:smart_route_app/core/common/map/location/location_state.dart';
import 'package:smart_route_app/core/utils/app_logger.dart';
import 'package:smart_route_app/features/cluster/domain/entities/cluster_entities.dart';
import '../../../../../../features/incident/domain/entities/incident.dart'
    as domain_incident;

import '../../../../../../features/navigation/domain/entities/route_entity.dart'
    as domain_route;

class MapFacadeImpl implements MapFacade {
  final MapFacadeDependencies deps;

  MapFacadeImpl(this.deps);

  @override
  Future<void> initialize({required BasemapStyle basemapStyle}) async {
    await deps.engine.initialize2D(basemapStyle: basemapStyle);

    await deps.symbolPreloader.preload();

    deps.overlayManager.moveAllTo2D([
      deps.clusterOverlayController.overlay,
      deps.incidentOverlayController.overlay,
      deps.selectionOverlayController.overlay,
      deps.routeOverlayController.routeOverlay,
      deps.routeOverlayController.navigationOverlay,
    ]);
  }

  @override
  Future<void> switchTo2D() async {
    await deps.engine.switchTo2D();

    deps.overlayManager.moveAllTo2D([
      deps.clusterOverlayController.overlay,
      deps.incidentOverlayController.overlay,
      deps.selectionOverlayController.overlay,
      deps.routeOverlayController.routeOverlay,
      deps.routeOverlayController.navigationOverlay,
    ]);
  }

  @override
  Future<void> switchTo3D() async {
    await deps.engine.switchTo3D();

    deps.overlayManager.moveAllTo3D([
      deps.clusterOverlayController.overlay,
      deps.incidentOverlayController.overlay,
      deps.selectionOverlayController.overlay,
      deps.routeOverlayController.routeOverlay,
      deps.routeOverlayController.navigationOverlay,
    ]);
  }

  @override
  Future<void> changeBasemap(BasemapStyle style) async {
    await deps.engine.changeBasemap(style);
  }

  @override
  Future<void> renderClusters(List<ClusterHotspot> clusters) async {
    await deps.clusterOverlayController.renderClusters(clusters);
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

  @override
  void clearRoute() {
    deps.routeOverlayController.clear();
  }

  @override
  Future<void> renderRoute(domain_route.RouteResult route) async {
    await deps.routeOverlayController.renderRoute(route);
  }

  @override
  Future<void> renderAlternativeRoutes({
    required domain_route.RouteResult recommendedRoute,
    required List<domain_route.RouteAlternative> alternatives,
    required domain_route.RouteStrategy selectedStrategy,
  }) async {
    await deps.routeOverlayController.renderAlternativeRoutes(
      recommendedRoute: recommendedRoute,
      alternatives: alternatives,
      selectedStrategy: selectedStrategy,
    );
  }

  @override
  Future<void> recenterToPoint(ArcGISPoint point, {double? scale}) async {
    if (deps.engine.is3DMode) {
      // For 3D Scene - use simple viewpoint
      final viewpoint = Viewpoint.fromCenter(point, scale: scale ?? 5000);

      await deps.controllers.scene3D.setViewpointAnimated(
        viewpoint,
        duration: 1.5,
      );
    } else {
      // For 2D Map - use animated transition with curve
      final viewpoint = Viewpoint.fromCenter(
        point,
        scale: scale ?? 5000, // Default scale ~5km zoom level
      );

      await deps.controllers.map2D.setViewpointWithDurationAndCurve(
        viewpoint: viewpoint,
        durationSeconds: 1.5,
        curve: AnimationCurve.easeInOutCubic,
      );
    }
  }

  @override
  Future<void> recenterToIncident(String incidentId) async {
    final graphic = deps.incidentOverlayController.getGraphicByIncidentId(
      incidentId,
    );

    if (graphic?.geometry == null) {
      AppLogger.warning(
        'Không thể recenter đến sự cố, Graphic không tìm thấy: $incidentId',
      );
      return;
    }

    final point = graphic!.geometry as ArcGISPoint;

    // Zoom closer for incident details (scale ~2km)
    await recenterToPoint(point, scale: 2000);
  }
}
