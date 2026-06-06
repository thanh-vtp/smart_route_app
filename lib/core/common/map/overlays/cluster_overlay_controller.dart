import 'package:arcgis_maps/arcgis_maps.dart';
import 'package:flutter/material.dart';
import 'package:smart_route_app/core/utils/app_logger.dart';
import 'package:smart_route_app/features/cluster/domain/entities/cluster_entities.dart';

class ClusterOverlayController {
  final GraphicsOverlay overlay;

  ClusterOverlayController({required this.overlay});

  Future<void> renderClusters(List<ClusterHotspot> clusters) async {
    overlay.graphics.clear();

    for (final cluster in clusters) {
      try {
        _drawHotspotCircle(cluster);
        _drawBadge(cluster);
      } catch (e, st) {
        AppLogger.error(
          'Lỗi render hotspot ${cluster.clusterId}',
          error: e,
          stackTrace: st,
          name: 'ClusterOverlayController',
        );
      }
    }

    AppLogger.debug(
      'Rendered ${clusters.length} hotspot clusters',
      name: 'ClusterOverlayController',
    );
  }

  void _drawHotspotCircle(ClusterHotspot cluster) {
    final center = ArcGISPoint(
      x: cluster.centerLng,
      y: cluster.centerLat,
      spatialReference: SpatialReference.wgs84,
    );

    final circle = GeometryEngine.bufferGeodetic(
      geometry: center,
      distance: cluster.displayRadiusM,
      distanceUnit: LinearUnit(unitId: LinearUnitId.meters),
      maxDeviation: 64.0,
      curveType: GeodeticCurveType.geodesic,
    );

    final graphic = Graphic(
      geometry: circle,
      symbol: _createCircleSymbol(cluster),
      attributes: {
        'cluster_id': cluster.clusterId,
        'incident_count': cluster.incidentCount,
        'severity': cluster.severity,
        'cluster_type': cluster.clusterType,
        'display_radius_m': cluster.displayRadiusM,
        'impact_radius_m': cluster.impactRadiusM,
        'avg_radius_m': cluster.avgRadiusM,
        'density': cluster.density,
        'incident_object_ids': cluster.incidentObjectIds.join(','),
      },
    );

    graphic.zIndex = 10;
    // badge.zIndex = 20;
    // route.zIndex = 30;

    overlay.graphics.add(graphic);
  }

  void _drawBadge(ClusterHotspot cluster) {
    final center = ArcGISPoint(
      x: cluster.centerLng,
      y: cluster.centerLat,
      spatialReference: SpatialReference.wgs84,
    );

    final markerGraphic = Graphic(
      geometry: center,
      symbol: SimpleMarkerSymbol(
        style: SimpleMarkerSymbolStyle.circle,
        color: _getSeverityColor(cluster.severity),
        size: 24,
      ),
    );

    markerGraphic.zIndex = 100;

    overlay.graphics.add(markerGraphic);

    final textGraphic = Graphic(
      geometry: center,
      symbol: TextSymbol(
        text: cluster.incidentCount.toString(),
        color: Colors.white,
        size: 12,
      ),
      attributes: {'cluster_id': cluster.clusterId, 'type': 'cluster_badge'},
    );

    textGraphic.zIndex = 101;

    overlay.graphics.add(textGraphic);
  }

  SimpleFillSymbol _createCircleSymbol(ClusterHotspot cluster) {
    final color = _getSeverityColor(cluster.severity);

    return SimpleFillSymbol(
      style: SimpleFillSymbolStyle.solid,
      color: color.withValues(alpha: 0.25),
      outline: SimpleLineSymbol(
        style: SimpleLineSymbolStyle.solid,
        color: color,
        width: 2,
      ),
    );
  }

  Color _getSeverityColor(String severity) {
    switch (severity.toLowerCase()) {
      case 'high':
        return Colors.red;

      case 'medium':
        return Colors.orange;

      case 'low':
        return Colors.amber;

      default:
        return Colors.grey;
    }
  }

  void clear() {
    overlay.graphics.clear();
  }
}
