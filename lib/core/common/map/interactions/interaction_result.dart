enum InteractionType { none, incident, route, userLocation }

/// convert sang domain interaction result
class InteractionResult {
  final InteractionType type;

  final String? objectId;

  const InteractionResult({required this.type, this.objectId});

  factory InteractionResult.none() {
    return const InteractionResult(type: InteractionType.none);
  }

  // tiện ích tạo InteractionResult cho incident
  factory InteractionResult.incident(String incidentId) {
    return InteractionResult(
      type: InteractionType.incident,
      objectId: incidentId,
    );
  }
}
