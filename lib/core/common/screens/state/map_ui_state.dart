enum MapViewMode { map2D, scene3D }

class MapUiState {
  final bool isLoading;
  final bool hasActiveRoute;
  final bool isNavigating; // đang trong chế độ turn-by-turn
  final MapViewMode mode;
  final String? error;

  const MapUiState({
    required this.isLoading,
    required this.hasActiveRoute,
    required this.isNavigating,
    required this.mode,
    this.error,
  });

  factory MapUiState.initial() {
    return const MapUiState(
      isLoading: true,
      hasActiveRoute: false,
      isNavigating: false,
      mode: MapViewMode.map2D, // Luôn dùng 2D map cho navigation
    );
  }

  bool get hasError => error != null;

  bool get is2D => mode == MapViewMode.map2D;

  bool get is3D => mode == MapViewMode.scene3D;

  MapUiState copyWith({
    bool? isLoading,
    MapViewMode? mode,
    bool? hasActiveRoute,
    bool? isNavigating,
    String? error,
  }) {
    return MapUiState(
      isLoading: isLoading ?? this.isLoading,
      hasActiveRoute: hasActiveRoute ?? this.hasActiveRoute,
      isNavigating: isNavigating ?? this.isNavigating,
      mode: mode ?? this.mode,
      error: error,
    );
  }
}
