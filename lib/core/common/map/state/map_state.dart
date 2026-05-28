import 'package:smart_route_app/core/common/map/engine/map_runtime_state.dart';
import 'package:smart_route_app/core/common/map/state/map_camera_state.dart';
import 'package:smart_route_app/core/common/map/state/map_interaction_state.dart';
import 'package:smart_route_app/core/common/map/state/map_location_state.dart';
import 'package:smart_route_app/core/common/map/state/map_view_state.dart';

/// root aggregate state
class MapState {
  final MapViewState view;

  final MapRuntimeState runtime;

  final MapInteractionState interaction;

  final MapLocationState location;

  final MapCameraState camera;

  const MapState({
    required this.view,
    required this.runtime,
    required this.interaction,
    required this.location,
    required this.camera,
  });

  factory MapState.initial() {
    return MapState(
      view: MapViewState.loading(),
      runtime: MapRuntimeState.initial(),
      interaction: MapInteractionState.initial(),
      location: MapLocationState.initial(),
      camera: MapCameraState.initial(),
    );
  }

  MapState copyWith({
    MapViewState? view,
    MapRuntimeState? runtime,
    MapInteractionState? interaction,
    MapLocationState? location,
    MapCameraState? camera,
  }) {
    return MapState(
      view: view ?? this.view,
      runtime: runtime ?? this.runtime,
      interaction: interaction ?? this.interaction,
      location: location ?? this.location,
      camera: camera ?? this.camera,
    );
  }
}
