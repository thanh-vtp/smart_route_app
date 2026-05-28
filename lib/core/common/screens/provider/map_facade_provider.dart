import 'package:arcgis_maps/arcgis_maps.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:smart_route_app/core/common/map/engine/map_engine_impl.dart';
import 'package:smart_route_app/core/common/map/facade/map_facade.dart';
import 'package:smart_route_app/core/common/map/facade/map_facade_dependencies.dart';
import 'package:smart_route_app/core/common/map/facade/map_facade_impl.dart';
import 'package:smart_route_app/core/common/map/interactions/identify_result_mapper.dart';
import 'package:smart_route_app/core/common/map/interactions/map_interaction_controller.dart';
import 'package:smart_route_app/core/common/map/location/device_location_controller.dart';
import 'package:smart_route_app/core/common/map/overlays/incident_overlay_controller.dart';
import 'package:smart_route_app/core/common/map/overlays/overlay_manager.dart';
import 'package:smart_route_app/core/common/map/providers/map_controller_bundle_provider.dart';
import 'package:smart_route_app/core/common/map/symbols/incident_symbol_factory.dart';
import 'package:smart_route_app/core/common/map/symbols/symbol_preloader.dart';

final mapFacadeProvider = Provider<MapFacade>((ref) {
  final controllers = ref.watch(mapControllerBundleProvider);

  final symbolFactory = IncidentSymbolFactory();

  final incidentOverlay = GraphicsOverlay();

  final incidentOverlayController = IncidentOverlayController(
    overlay: incidentOverlay,
    symbolFactory: symbolFactory,
  );

  final interactionController = MapInteractionController(
    overlay: incidentOverlay,
    mapper: IdentifyResultMapper(),
  );

  final dependencies = MapFacadeDependencies(
    controllers: controllers,

    engine: MapEngineImpl(controllers),

    overlayManager: OverlayManager(controllers),

    incidentOverlayController: incidentOverlayController,

    interactionController: interactionController,

    locationController: DeviceLocationController(),

    symbolPreloader: SymbolPreloader(symbolFactory),
  );

  return MapFacadeImpl(dependencies);
});
