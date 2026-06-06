import 'dart:ui';

import 'package:arcgis_maps/arcgis_maps.dart' hide Incident;
import 'package:smart_route_app/core/common/map/location/location_state.dart';
import 'package:smart_route_app/features/cluster/domain/entities/cluster_entities.dart';

import '../../../../features/incident/domain/entities/incident.dart';
import '../../../../features/navigation/domain/entities/route_entity.dart'
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

  Future<LocationState> stopLocation();

  void recenterLocation();

  bool isFollowingLocation();

  Future<void> renderRoute(domain_route.RouteResult route);

  void clearRoute();

  void dispose();
}
