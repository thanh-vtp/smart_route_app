import 'package:smart_route_app/core/map_service/controller/map_controller_bundle.dart';
import 'package:smart_route_app/core/map_service/engine/map_engine.dart';
import 'package:smart_route_app/core/map_service/interactions/map_interaction_controller.dart';
import 'package:smart_route_app/core/map_service/interactions/map_selection_controller.dart';
import 'package:smart_route_app/core/map_service/location/device_location_controller.dart';
import 'package:smart_route_app/core/map_service/overlays/cluster_overlay_controller.dart';
import 'package:smart_route_app/core/map_service/overlays/incident_overlay_controller.dart';
import 'package:smart_route_app/core/map_service/overlays/overlay_manager.dart';
import 'package:smart_route_app/core/map_service/overlays/route_overlay_controller.dart';
import 'package:smart_route_app/core/map_service/symbols/incident_symbol_factory.dart';
import 'package:smart_route_app/core/map_service/symbols/symbol_preloader.dart';
import 'package:smart_route_app/core/map_service/overlays/selection_overlay_controller.dart';

class MapFacadeDependencies {
  final MapControllerBundle controllers;

  final MapEngine engine;

  final OverlayManager overlayManager;

  final IncidentOverlayController incidentOverlayController;

  final ClusterOverlayController clusterOverlayController;

  final MapSelectionController selectionController;

  final SelectionOverlayController selectionOverlayController;

  final MapInteractionController interactionController;

  final DeviceLocationController locationController;

  final SymbolPreloader symbolPreloader;

  final IncidentSymbolFactory symbolFactory;

  final RouteOverlayController routeOverlayController;

  MapFacadeDependencies({
    required this.controllers,
    required this.engine,
    required this.overlayManager,
    required this.incidentOverlayController,
    required this.clusterOverlayController,
    required this.selectionController,
    required this.selectionOverlayController,
    required this.interactionController,
    required this.locationController,
    required this.symbolPreloader,
    required this.symbolFactory,
    required this.routeOverlayController,
  });
}
