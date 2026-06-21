/// map app quản lý show/hide overlays
class OverlayVisibilityState {
  final bool incidentsVisible;

  final bool routesVisible;

  final bool userLocationVisible;

  const OverlayVisibilityState({
    required this.incidentsVisible,
    required this.routesVisible,
    required this.userLocationVisible,
  });

  factory OverlayVisibilityState.initial() {
    return const OverlayVisibilityState(
      incidentsVisible: true,
      routesVisible: true,
      userLocationVisible: true,
    );
  }

  OverlayVisibilityState copyWith({
    bool? incidentsVisible,
    bool? routesVisible,
    bool? userLocationVisible,
  }) {
    return OverlayVisibilityState(
      incidentsVisible: incidentsVisible ?? this.incidentsVisible,
      routesVisible: routesVisible ?? this.routesVisible,
      userLocationVisible: userLocationVisible ?? this.userLocationVisible,
    );
  }
}
