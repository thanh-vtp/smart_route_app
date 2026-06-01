import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:smart_route_app/core/common/map/interactions/map_selection_controller.dart';

final mapSelectionControllerProvider = Provider<MapSelectionController>((ref) {
  return MapSelectionController();
});
