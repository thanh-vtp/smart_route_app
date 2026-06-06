import 'package:freezed_annotation/freezed_annotation.dart';

part 'cluster_entities.freezed.dart';

@freezed
class ClusterResult with _$ClusterResult {
  const factory ClusterResult({
    required int totalRecords,
    required int nClusters,
    required int nNoise,
    required int nCorePoints,

    /// Các điểm sự cố gốc
    required List<ClusterItem> items,

    /// Các hotspot sau khi clustering
    required List<ClusterHotspot> clusters,
  }) = _ClusterResult;
}

@freezed
class ClusterItem with _$ClusterItem {
  const factory ClusterItem({
    required String id,
    required double lat,
    required double lng,
    required int clusterId,
    required bool isCorePoint,
  }) = _ClusterItem;
}

@freezed
class ClusterHotspot with _$ClusterHotspot {
  const factory ClusterHotspot({
    required int clusterId,
    required int incidentCount,
    required List<int> incidentObjectIds,
    required double centerLat,
    required double centerLng,
    required double radiusM,
    required double density,
    required String severity,
    required String clusterType,
    required ClusterBBox bbox,

    /// Polygon đơn giản
    required List<List<double>> polygon,
  }) = _ClusterHotspot;
}

@freezed
class ClusterBBox with _$ClusterBBox {
  const factory ClusterBBox({
    required double xmin,
    required double ymin,
    required double xmax,
    required double ymax,
  }) = _ClusterBBox;
}
