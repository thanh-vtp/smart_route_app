import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:smart_route_app/core/common/map/facade/map_facade.dart';
import 'package:smart_route_app/core/common/map/facade/map_facade_dependencies.dart';
import 'package:smart_route_app/core/common/map/facade/map_facade_impl.dart';
import 'package:smart_route_app/core/common/map/providers/incident_overlay_controller_provider.dart';
import 'package:smart_route_app/core/common/map/providers/location_controller_provider.dart';
import 'package:smart_route_app/core/common/map/providers/map_controller_bundle_provider.dart';
import 'package:smart_route_app/core/common/map/providers/map_engine_provider.dart';
import 'package:smart_route_app/core/common/map/providers/map_interaction_controller_provider.dart';
import 'package:smart_route_app/core/common/map/providers/map_selection_controller_provider.dart';
import 'package:smart_route_app/core/common/map/providers/overlay_manager_provider.dart';
import 'package:smart_route_app/core/common/map/providers/route_overlay_controller_provider.dart';
import 'package:smart_route_app/core/common/map/providers/symbol_preloader_provider.dart';
import 'package:smart_route_app/core/common/map/providers/selection_overlay_controller_provider.dart';
import 'package:smart_route_app/core/common/map/providers/symbol_factory_provider.dart';

final mapFacadeProvider = Provider<MapFacade>((ref) {
  final dependencies = MapFacadeDependencies(
    controllers: ref.watch(mapControllerBundleProvider),

    engine: ref.watch(mapEngineProvider),

    overlayManager: ref.watch(overlayManagerProvider),

    incidentOverlayController: ref.watch(incidentOverlayControllerProvider),

    selectionController: ref.watch(mapSelectionControllerProvider),

    selectionOverlayController: ref.watch(selectionOverlayControllerProvider),

    interactionController: ref.watch(mapInteractionControllerProvider),

    locationController: ref.watch(locationControllerProvider),

    symbolPreloader: ref.watch(symbolPreloaderProvider),

    symbolFactory: ref.watch(symbolFactoryProvider),

    routeOverlayController: ref.watch(routeOverlayControllerProvider),
  );

  final facade = MapFacadeImpl(dependencies);

  ref.onDispose(facade.dispose);

  return facade;
});
