import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../overlays/selection_overlay_controller.dart';
import 'selection_overlay_provider.dart';

final selectionOverlayControllerProvider = Provider<SelectionOverlayController>(
  (ref) {
    return SelectionOverlayController(
      overlay: ref.watch(selectionOverlayProvider),
    );
  },
);
