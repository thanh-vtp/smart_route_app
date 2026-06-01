import 'package:arcgis_maps/arcgis_maps.dart';

enum InteractionType { none, incident, route, userLocation }

/// convert sang domain interaction result
class InteractionResult {
  final InteractionType type;

  final String? objectId;
  final Graphic? graphic;

  const InteractionResult({required this.type, this.objectId, this.graphic});

  factory InteractionResult.none() {
    return const InteractionResult(type: InteractionType.none);
  }

  // tiện ích tạo InteractionResult cho incident
  factory InteractionResult.incident({
    required String incidentId,
    required Graphic graphic,
  }) {
    return InteractionResult(
      type: InteractionType.incident,
      objectId: incidentId,
      graphic: graphic,
    );
  }
}
