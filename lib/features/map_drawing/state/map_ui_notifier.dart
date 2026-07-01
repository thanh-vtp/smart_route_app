import 'package:arcgis_maps/arcgis_maps.dart';

import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:smart_route_app/core/map_service/providers/map_facade_provider.dart';
import 'package:smart_route_app/features/map_drawing/state/location_ui_notifier.dart';
import 'package:smart_route_app/features/cluster/domain/entities/cluster_entities.dart';
import 'package:smart_route_app/features/incident/domain/entities/incident.dart'
    as incident_entity;
import 'package:smart_route_app/features/navigation/domain/entities/route_entity.dart'
    as route_entity;
import 'package:smart_route_app/features/navigation/presentation/state/navigation_notifier.dart';
import 'package:smart_route_app/features/navigation/presentation/state/route_notifier.dart';
import 'package:smart_route_app/features/navigation/presentation/state/route_state.dart';

import 'map_ui_state.dart';

final mapUiProvider = NotifierProvider<MapUiNotifier, MapUiState>(
  MapUiNotifier.new,
);

class MapUiNotifier extends Notifier<MapUiState> {
  @override
  MapUiState build() {
    ref.listen<RouteState>(routeProvider, (previous, next) async {
      final route = next.routeResult;
      final alternatives = next.alternativeRoutesResult;

      if (route == null) {
        _clearRouteOnMap();
        return;
      }

      // Nếu có alternatives, vẽ TẤT CẢ routes
      if (alternatives != null && alternatives.alternatives.isNotEmpty) {
        await _showAlternativeRoutesOnMap(alternatives, next.selectedStrategy);
      } else {
        // Không có alternatives, chỉ vẽ 1 route
        await _showRouteOnMap(route);
      }
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

  Future<void> renderClusters(List<ClusterHotspot> clusters) async {
    final facade = ref.read(mapFacadeProvider);

    await facade.renderClusters(clusters);
  }

  Future<void> _showRouteOnMap(route_entity.RouteResult route) async {
    final facade = ref.read(mapFacadeProvider);

    await facade.renderRoute(route);

    state = state.copyWith(hasActiveRoute: true);
  }

  Future<void> _showAlternativeRoutesOnMap(
    route_entity.AlternativeRoutesResult alternatives,
    route_entity.RouteStrategy? selectedStrategy,
  ) async {
    final facade = ref.read(mapFacadeProvider);

    // Sử dụng selectedStrategy hoặc mặc định là balanced
    final strategy = selectedStrategy ?? route_entity.RouteStrategy.balanced;

    await facade.renderAlternativeRoutes(
      recommendedRoute: alternatives.recommendedRoute,
      alternatives: alternatives.alternatives,
      selectedStrategy: strategy,
    );

    state = state.copyWith(hasActiveRoute: true);
  }

  void _clearRouteOnMap() {
    ref.read(mapFacadeProvider).clearRoute();

    state = state.copyWith(hasActiveRoute: false);
  }

  Future<void> startNavigation() async {
    state = state.copyWith(isNavigating: true);

    // GIỮ 2D — không switch sang Scene3D
    // Navigation dùng 2D map với LocationDisplayAutoPanMode.navigation
    // (map tự xoay theo heading, tilt nhìn phía trước — giống Google Maps)
    final facade = ref.read(mapFacadeProvider);

    // Bật GPS trước để có location data
    await ref.read(locationUiProvider.notifier).startLocation();

    // Bật navigation autopan mode (tilt + compass heading)
    await facade.startNavigationMode();

    // Sync trackingMode state
    ref.read(locationUiProvider.notifier).setNavigationMode();

    // Đảm bảo route vẫn hiển thị trên map
    final route = ref.read(routeProvider).routeResult;
    if (route != null) {
      await _showRouteOnMap(route);

      // Lấy điểm đến từ polyline cuối
      final lastPoint = route.polylinePoints.last;
      final destination = route_entity.RoutePoint(
        lat: lastPoint.lat,
        lng: lastPoint.lng,
      );

      // Khởi động NavigationNotifier — turn-by-turn tracking
      ref
          .read(navigationNotifierProvider.notifier)
          .startNavigation(route: route, destination: destination);
    }
  }

  Future<void> stopNavigation() async {
    // Dừng navigation notifier
    ref.read(navigationNotifierProvider.notifier).stopNavigation();

    state = state.copyWith(isNavigating: false);

    // Tắt navigation autopan mode
    await ref.read(mapFacadeProvider).stopNavigationMode();

    // Không stop GPS — về FOLLOW mode bình thường (dot vẫn hiện trên map)
    await ref
        .read(locationUiProvider.notifier)
        .stopLocation(stopDataSource: false);

    // Sync trackingMode về follow
    ref.read(locationUiProvider.notifier).setFollowMode();

    // Xóa route
    ref.read(routeProvider.notifier).clearRoute();
  }
}
