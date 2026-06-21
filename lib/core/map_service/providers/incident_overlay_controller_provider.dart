import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:smart_route_app/core/map_service/overlays/incident_overlay_controller.dart';
import 'package:smart_route_app/core/map_service/providers/incident_overlay_provider.dart';
import 'package:smart_route_app/core/map_service/providers/symbol_factory_provider.dart';

final incidentOverlayControllerProvider = Provider<IncidentOverlayController>((
  ref,
) {
  return IncidentOverlayController(
    overlay: ref.watch(incidentOverlayProvider),
    symbolFactory: ref.watch(symbolFactoryProvider),
  );
});
