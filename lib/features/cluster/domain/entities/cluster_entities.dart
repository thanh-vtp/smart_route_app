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

    /// Circle visualization
    required double displayRadiusM,

    /// Reference only (không dùng routing)
    required double impactRadiusM,

    /// Analytics
    required double avgRadiusM,

    required double density,
    required String severity,
    required String clusterType,

    required ClusterBBox bbox,

    /// Hiển thị polygon khi user tap hotspot
    required List<List<double>> polygon,

    /// ArcGIS geometry
    required ClusterGeometry geometry,
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

@freezed
class ClusterGeometry with _$ClusterGeometry {
  const factory ClusterGeometry({
    required List<List<List<double>>> rings,
    required int wkid,
  }) = _ClusterGeometry;
}
