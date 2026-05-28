import 'package:smart_route_app/core/common/map/controller/map_controller_bundle.dart';
import 'package:smart_route_app/core/common/map/engine/map_engine.dart';
import 'package:smart_route_app/core/common/map/interactions/map_interaction_controller.dart';
import 'package:smart_route_app/core/common/map/location/device_location_controller.dart';
import 'package:smart_route_app/core/common/map/overlays/incident_overlay_controller.dart';
import 'package:smart_route_app/core/common/map/overlays/overlay_manager.dart';
import 'package:smart_route_app/core/common/map/symbols/symbol_preloader.dart';

class MapFacadeDependencies {
  final MapControllerBundle controllers;

  final MapEngine engine;

  final OverlayManager overlayManager;

  final IncidentOverlayController incidentOverlayController;

  final MapInteractionController interactionController;

  final DeviceLocationController locationController;

  final SymbolPreloader symbolPreloader;

  MapFacadeDependencies({
    required this.controllers,
    required this.engine,
    required this.overlayManager,
    required this.incidentOverlayController,
    required this.interactionController,
    required this.locationController,
    required this.symbolPreloader,
  });
}
