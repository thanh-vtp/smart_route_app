import 'package:arcgis_maps/arcgis_maps.dart';

import 'interaction_constants.dart';
import 'interaction_result.dart';

class IdentifyResultMapper {
  InteractionResult map(IdentifyGraphicsOverlayResult result) {
    if (result.graphics.isEmpty) {
      return InteractionResult.none();
    }

    final graphic = result.graphics.first;

    final incidentId =
        graphic.attributes[InteractionConstants.incidentIdAttribute] as String?;

    if (incidentId != null) {
      return InteractionResult.incident(incidentId);
    }

    return InteractionResult.none();
  }
}
