import 'package:arcgis_maps/arcgis_maps.dart';

import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:smart_route_app/core/common/screens/provider/map_facade_provider.dart';
import 'package:smart_route_app/features/incident/domain/entities/incident.dart'
    as entities;

import 'map_ui_state.dart';

final mapUiProvider = NotifierProvider<MapUiNotifier, MapUiState>(
  MapUiNotifier.new,
);

class MapUiNotifier extends Notifier<MapUiState> {
  @override
  MapUiState build() {
    return MapUiState.initial();
  }

  Future<void> initialize() async {
    try {
      state = state.copyWith(isLoading: true);

      final facade = ref.read(mapFacadeProvider);

      await facade.initialize(basemapStyle: BasemapStyle.arcGISNavigation);

      state = state.copyWith(isLoading: false);
    } catch (e) {
      state = state.copyWith(isLoading: false, error: e.toString());
    }
  }

  Future<void> switchTo2D() async {
    final facade = ref.read(mapFacadeProvider);

    await facade.switchTo2D();

    state = state.copyWith(mode: MapViewMode.map2D);
  }

  Future<void> switchTo3D() async {
    final facade = ref.read(mapFacadeProvider);

    await facade.switchTo3D();

    state = state.copyWith(mode: MapViewMode.scene3D);
  }

  Future<void> renderIncidents(List<entities.Incident> incidents) async {
    final facade = ref.read(mapFacadeProvider);

    await facade.renderIncidents(incidents);
  }
}
