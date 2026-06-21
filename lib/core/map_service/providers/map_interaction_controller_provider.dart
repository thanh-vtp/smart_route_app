import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:smart_route_app/core/map_service/interactions/identify_result_mapper.dart';
import 'package:smart_route_app/core/map_service/interactions/map_interaction_controller.dart';
import 'package:smart_route_app/core/map_service/providers/incident_overlay_provider.dart';

final mapInteractionControllerProvider = Provider<MapInteractionController>((
  ref,
) {
  return MapInteractionController(
    overlay: ref.watch(incidentOverlayProvider),
    mapper: IdentifyResultMapper(),
  );
});
