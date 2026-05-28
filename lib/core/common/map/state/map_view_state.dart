enum MapViewStatus { loading, ready, error, offline }

class MapViewState {
  final MapViewStatus status;

  final String? errorMessage;

  const MapViewState({required this.status, this.errorMessage});

  factory MapViewState.loading() {
    return const MapViewState(status: MapViewStatus.loading);
  }

  factory MapViewState.ready() {
    return const MapViewState(status: MapViewStatus.ready);
  }

  factory MapViewState.error(String message) {
    return MapViewState(status: MapViewStatus.error, errorMessage: message);
  }

  factory MapViewState.offline() {
    return const MapViewState(status: MapViewStatus.offline);
  }

  bool get isLoading => status == MapViewStatus.loading;

  bool get isReady => status == MapViewStatus.ready;

  bool get hasError => status == MapViewStatus.error;

  bool get isOffline => status == MapViewStatus.offline;

  MapViewState copyWith({MapViewStatus? status, String? errorMessage}) {
    return MapViewState(
      status: status ?? this.status,
      errorMessage: errorMessage ?? this.errorMessage,
    );
  }
}
