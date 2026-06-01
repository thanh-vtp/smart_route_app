import 'package:smart_route_app/core/common/map/controller/map_controller_bundle.dart';
import 'package:smart_route_app/core/common/map/engine/map_engine.dart';
import 'package:smart_route_app/core/common/map/interactions/map_interaction_controller.dart';
import 'package:smart_route_app/core/common/map/interactions/map_selection_controller.dart';
import 'package:smart_route_app/core/common/map/location/device_location_controller.dart';
import 'package:smart_route_app/core/common/map/overlays/incident_overlay_controller.dart';
import 'package:smart_route_app/core/common/map/overlays/overlay_manager.dart';
import 'package:smart_route_app/core/common/map/symbols/incident_symbol_factory.dart';
import 'package:smart_route_app/core/common/map/symbols/symbol_preloader.dart';
import 'package:smart_route_app/core/common/map/overlays/selection_overlay_controller.dart';

class MapFacadeDependencies {
  final MapControllerBundle controllers;

  final MapEngine engine;

  final OverlayManager overlayManager;

  final IncidentOverlayController incidentOverlayController;

  final MapSelectionController selectionController;

  final SelectionOverlayController selectionOverlayController;

  final MapInteractionController interactionController;

  final DeviceLocationController locationController;

  final SymbolPreloader symbolPreloader;

  final IncidentSymbolFactory symbolFactory;

  MapFacadeDependencies({
    required this.controllers,
    required this.engine,
    required this.overlayManager,
    required this.incidentOverlayController,
    required this.selectionController,
    required this.selectionOverlayController,
    required this.interactionController,
    required this.locationController,
    required this.symbolPreloader,
    required this.symbolFactory,
  });
}
