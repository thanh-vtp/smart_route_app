enum MapViewMode { map2D, scene3D }

class MapUiState {
  final bool isLoading;

  final bool hasActiveRoute;

  final MapViewMode mode;

  final String? error;

  const MapUiState({
    required this.isLoading,
    required this.hasActiveRoute,
    required this.mode,
    this.error,
  });

  factory MapUiState.initial() {
    return const MapUiState(
      isLoading: true,
      hasActiveRoute: false,
      mode: MapViewMode.map2D,
    );
  }

  bool get hasError => error != null;

  bool get is2D => mode == MapViewMode.map2D;

  bool get is3D => mode == MapViewMode.scene3D;

  MapUiState copyWith({
    bool? isLoading,
    MapViewMode? mode,
    bool? hasActiveRoute,
    String? error,
  }) {
    return MapUiState(
      isLoading: isLoading ?? this.isLoading,
      hasActiveRoute: hasActiveRoute ?? this.hasActiveRoute,
      mode: mode ?? this.mode,
      error: error,
    );
  }
}
