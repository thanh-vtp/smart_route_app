import 'dart:ui';

import 'package:arcgis_maps/arcgis_maps.dart' hide Incident;
import 'package:smart_route_app/core/map_service/location/location_state.dart';
import 'package:smart_route_app/features/cluster/domain/entities/cluster_entities.dart';

import '../../../features/incident/domain/entities/incident.dart';
import '../../../features/navigation/domain/entities/route_entity.dart'
    as domain_route;

import '../interactions/interaction_result.dart';

abstract interface class MapFacade {
  Future<void> initialize({required BasemapStyle basemapStyle});

  Future<void> switchTo2D();

  Future<void> switchTo3D();

  Future<void> changeBasemap(BasemapStyle style);

  Future<void> renderIncidents(List<Incident> incidents);

  Future<void> renderClusters(List<ClusterHotspot> clusters);

  Future<void> selectIncident(String incidentId);

  void clearSelection();

  Future<InteractionResult> onTap(Offset screenPoint);

  LocationDisplay get locationDisplay;

  Future<LocationState> startLocation({
    required void Function(ArcGISLocation location) onLocationChanged,
  });

  /// Dừng location display.
  /// [stopDataSource] = false: chỉ tắt autopan, GPS stream vẫn chạy
  ///   (dùng khi thoát navigation về explore).
  /// [stopDataSource] = true (mặc định): dừng hẳn GPS stream.
  Future<LocationState> stopLocation({bool stopDataSource = true});

  void recenterLocation();

  bool isFollowingLocation();

  Future<void> renderRoute(domain_route.RouteResult route);

  /// Render multiple alternative routes with different styles
  Future<void> renderAlternativeRoutes({
    required domain_route.RouteResult recommendedRoute,
    required List<domain_route.RouteAlternative> alternatives,
    required domain_route.RouteStrategy selectedStrategy,
  });

  void clearRoute();

  /// Recenter map smoothly to a specific point
  Future<void> recenterToPoint(ArcGISPoint point, {double? scale});

  /// Recenter map smoothly to an incident
  Future<void> recenterToIncident(String incidentId);

  /// Bật chế độ Navigation: 2D map với tilt 45° + follow compass heading
  Future<void> startNavigationMode();

  /// Tắt chế độ Navigation: về autopan bình thường
  Future<void> stopNavigationMode();

  void dispose();
}
