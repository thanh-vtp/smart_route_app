enum MapViewMode { map2D, scene3D }

class MapUiState {
  final bool isLoading;

  final MapViewMode mode;

  final String? error;

  const MapUiState({required this.isLoading, required this.mode, this.error});

  factory MapUiState.initial() {
    return const MapUiState(isLoading: true, mode: MapViewMode.map2D);
  }

  bool get hasError => error != null;

  bool get is2D => mode == MapViewMode.map2D;

  bool get is3D => mode == MapViewMode.scene3D;

  MapUiState copyWith({bool? isLoading, MapViewMode? mode, String? error}) {
    return MapUiState(
      isLoading: isLoading ?? this.isLoading,
      mode: mode ?? this.mode,
      error: error,
    );
  }
}
