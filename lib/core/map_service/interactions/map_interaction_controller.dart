import 'dart:ui';

import 'package:arcgis_maps/arcgis_maps.dart';

import 'identify_result_mapper.dart';
import 'interaction_constants.dart';
import 'interaction_result.dart';

// perform identify
// return interaction result
class MapInteractionController {
  // variable để lưu trữ overlay incident, dùng để thêm/remove graphic khi user tương tác
  final GraphicsOverlay overlay;

  final IdentifyResultMapper mapper;

  MapInteractionController({required this.overlay, required this.mapper});

  Future<InteractionResult> handleTap({
    required Offset screenPoint,
    ArcGISMapViewController? mapController,
    ArcGISSceneViewController? sceneController,
  }) async {
    try {
      IdentifyGraphicsOverlayResult identifyResult;

      if (mapController != null) {
        identifyResult = await mapController.identifyGraphicsOverlay(
          overlay,
          screenPoint: screenPoint,
          tolerance: InteractionConstants.identifyTolerance,
        );
      } else if (sceneController != null) {
        identifyResult = await sceneController.identifyGraphicsOverlay(
          overlay,
          screenPoint: screenPoint,
          tolerance: InteractionConstants.identifyTolerance,
        );
      } else {
        return InteractionResult.none();
      }

      return mapper.map(identifyResult);
    } catch (_) {
      return InteractionResult.none();
    }
  }
}
