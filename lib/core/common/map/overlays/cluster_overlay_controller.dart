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
        _drawCluster(cluster);
      } catch (e, st) {
        AppLogger.error(
          'Lỗi render hotspot ${cluster.clusterId}',
          error: e,
          stackTrace: st,
          name: 'ClusterOverlayController',
        );
      }
    }

    AppLogger.ui('Rendered ${clusters.length} hotspot clusters');
  }

  void _drawCluster(ClusterHotspot cluster) {
    AppLogger.debug(
      'Cluster ${cluster.clusterId} polygon points: ${cluster.polygon.length}',
      name: 'ClusterOverlayController',
    );

    if (cluster.polygon.length < 3) {
      AppLogger.warning(
        'Cluster ${cluster.clusterId} polygon không hợp lệ',
        name: 'ClusterOverlayController',
      );
      return;
    }

    final polygonBuilder = PolygonBuilder(
      spatialReference: SpatialReference.wgs84,
    );

    for (final point in cluster.polygon) {
      polygonBuilder.addPoint(
        ArcGISPoint(
          x: point[0],
          y: point[1],
          spatialReference: SpatialReference.wgs84,
        ),
      );
    }

    final polygon = polygonBuilder.toGeometry();

    final symbol = _createSymbol(cluster);

    final graphic = Graphic(
      geometry: polygon,
      symbol: symbol,
      attributes: {
        'cluster_id': cluster.clusterId,
        'incident_count': cluster.incidentCount,
        'severity': cluster.severity,
        'cluster_type': cluster.clusterType,
        'incident_object_ids': cluster.incidentObjectIds.join(','),
        'radius_m': cluster.radiusM,
        'density': cluster.density,
      },
    );

    graphic.zIndex = -100;

    overlay.graphics.add(graphic);

    AppLogger.debug(
      'Graphics count = ${overlay.graphics.length}',
      name: 'ClusterOverlayController',
    );

    _drawCenterPoint(cluster);

    AppLogger.debug(
      'Overlay graphics count: ${overlay.graphics.length}',
      name: 'ClusterOverlayController',
    );
  }

  void _drawCenterPoint(ClusterHotspot cluster) {
    final point = ArcGISPoint(
      x: cluster.centerLng,
      y: cluster.centerLat,
      spatialReference: SpatialReference.wgs84,
    );

    final marker = SimpleMarkerSymbol(
      style: SimpleMarkerSymbolStyle.circle,
      color: _getSeverityColor(cluster.severity),
      size: 10,
    );

    final graphic = Graphic(
      geometry: point,
      symbol: marker,
      attributes: {'cluster_id': cluster.clusterId, 'type': 'cluster_center'},
    );

    graphic.zIndex = -50;

    overlay.graphics.add(graphic);
  }

  SimpleFillSymbol _createSymbol(ClusterHotspot cluster) {
    final color = _getSeverityColor(cluster.severity);

    final opacity = switch (cluster.clusterType) {
      'compact' => 0.30,
      'linear' => 0.25,
      'dispersed' => 0.15,
      _ => 0.20,
    };

    return SimpleFillSymbol(
      style: SimpleFillSymbolStyle.solid,
      color: color.withValues(alpha: opacity),
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
        return Colors.yellow;

      default:
        return Colors.grey;
    }
  }

  void clear() {
    overlay.graphics.clear();
  }
}
