class MapInteractionState {
  final bool isUserInteracting;

  final bool isMapMoving;

  final bool isMapZooming;

  final bool isLongPressing;

  final String? selectedIncidentId;

  const MapInteractionState({
    required this.isUserInteracting,
    required this.isMapMoving,
    required this.isMapZooming,
    required this.isLongPressing,
    required this.selectedIncidentId,
  });

  factory MapInteractionState.initial() {
    return const MapInteractionState(
      isUserInteracting: false,
      isMapMoving: false,
      isMapZooming: false,
      isLongPressing: false,
      selectedIncidentId: null,
    );
  }

  MapInteractionState copyWith({
    bool? isUserInteracting,
    bool? isMapMoving,
    bool? isMapZooming,
    bool? isLongPressing,
    String? selectedIncidentId,
  }) {
    return MapInteractionState(
      isUserInteracting: isUserInteracting ?? this.isUserInteracting,
      isMapMoving: isMapMoving ?? this.isMapMoving,
      isMapZooming: isMapZooming ?? this.isMapZooming,
      isLongPressing: isLongPressing ?? this.isLongPressing,
      selectedIncidentId: selectedIncidentId ?? this.selectedIncidentId,
    );
  }
}
