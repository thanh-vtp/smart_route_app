import 'package:arcgis_maps/arcgis_maps.dart';

import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:smart_route_app/core/common/map/providers/map_facade_provider.dart';
import 'package:smart_route_app/features/incident/domain/entities/incident.dart'
    as incident_entity;
import 'package:smart_route_app/features/navigation/domain/entities/route_entity.dart'
    as route_entity;
import 'package:smart_route_app/features/navigation/presentation/state/route_notifier.dart';
import 'package:smart_route_app/features/navigation/presentation/state/route_state.dart';

import 'map_ui_state.dart';

final mapUiProvider = NotifierProvider<MapUiNotifier, MapUiState>(
  MapUiNotifier.new,
);

class MapUiNotifier extends Notifier<MapUiState> {
  @override
  MapUiState build() {
    ref.listen<RouteState>(routeNotifierProvider, (previous, next) async {
      final route = next.routeResult;

      if (route == null) {
        clearRoute();
        return;
      }

      await showRoute(route);
    });

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

  Future<void> renderIncidents(List<incident_entity.Incident> incidents) async {
    final facade = ref.read(mapFacadeProvider);

    await facade.renderIncidents(incidents);
  }

  Future<void> showRoute(route_entity.RouteResult route) async {
    final facade = ref.read(mapFacadeProvider);

    await facade.renderRoute(route);

    state = state.copyWith(hasActiveRoute: true);
  }

  void clearRoute() {
    ref.read(mapFacadeProvider).clearRoute();

    state = state.copyWith(hasActiveRoute: false);
  }
}
