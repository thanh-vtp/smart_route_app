class MapCameraState {
  final double scale;

  final double rotation;

  final double tilt;

  final bool is3DMode;

  const MapCameraState({
    required this.scale,
    required this.rotation,
    required this.tilt,
    required this.is3DMode,
  });

  factory MapCameraState.initial() {
    return const MapCameraState(
      scale: 0,
      rotation: 0,
      tilt: 0,
      is3DMode: false,
    );
  }

  MapCameraState copyWith({
    double? scale,
    double? rotation,
    double? tilt,
    bool? is3DMode,
  }) {
    return MapCameraState(
      scale: scale ?? this.scale,
      rotation: rotation ?? this.rotation,
      tilt: tilt ?? this.tilt,
      is3DMode: is3DMode ?? this.is3DMode,
    );
  }
}
