import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:smart_route_app/core/map_service/interactions/map_selection_controller.dart';

final mapSelectionControllerProvider = Provider<MapSelectionController>((ref) {
  return MapSelectionController();
});
