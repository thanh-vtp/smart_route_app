// data/models/cluster_model.dart
import 'package:freezed_annotation/freezed_annotation.dart';
import '../../domain/entities/cluster_entities.dart';

part 'cluster_model.freezed.dart';
part 'cluster_model.g.dart';

@freezed
class ClusterResponseModel with _$ClusterResponseModel {
  const ClusterResponseModel._();

  const factory ClusterResponseModel({
    required String status,
    required String message,
    @JsonKey(name: 'total_records') required int totalRecords,
    @JsonKey(name: 'clustering_info')
    required ClusteringInfoModel clusteringInfo,
    @JsonKey(name: 'clusters') required List<ClusterHotspotModel> clusters,
    @JsonKey(name: 'data') required List<ClusterItemModel> data,
  }) = _ClusterResponseModel;

  factory ClusterResponseModel.fromJson(Map<String, dynamic> json) =>
      _$ClusterResponseModelFromJson(json);

  /// Chuyển đổi sang Domain Entity gọn gàng
  ClusterResult toEntity() {
    return ClusterResult(
      totalRecords: totalRecords,
      nClusters: clusteringInfo.nClusters,
      nNoise: clusteringInfo.nNoise,
      nCorePoints: clusteringInfo.nCorePoints,
      items: data.map((e) => e.toEntity()).toList(),
      clusters: clusters.map((e) => e.toEntity()).toList(),
    );
  }
}

@freezed
class ClusteringInfoModel with _$ClusteringInfoModel {
  const factory ClusteringInfoModel({
    @JsonKey(name: 'n_clusters') required int nClusters,
    @JsonKey(name: 'n_noise') required int nNoise,
    @JsonKey(name: 'n_core_points') required int nCorePoints,
  }) = _ClusteringInfoModel;

  factory ClusteringInfoModel.fromJson(Map<String, dynamic> json) =>
      _$ClusteringInfoModelFromJson(json);
}

@freezed
class ClusterItemModel with _$ClusterItemModel {
  const ClusterItemModel._();

  const factory ClusterItemModel({
    @JsonKey(name: 'OBJECTID') required int objectId,
    required double longitude,
    required double latitude,
    @JsonKey(name: 'Cluster_ID') required int clusterId,
    @JsonKey(name: 'Is_Core_Point')
    required int isCorePoint, // Nhận giá trị 1 hoặc 0 từ API
  }) = _ClusterItemModel;

  factory ClusterItemModel.fromJson(Map<String, dynamic> json) =>
      _$ClusterItemModelFromJson(json);

  /// Map dữ liệu thô sang Entity chuẩn
  ClusterItem toEntity() {
    return ClusterItem(
      id: objectId.toString(), // Ép kiểu ID thành String để đồng bộ với App
      lat: latitude,
      lng: longitude,
      clusterId: clusterId,
      isCorePoint: isCorePoint == 1, // Đổi số 1 thành true, 0 thành false
    );
  }
}

@freezed
class ClusterBBoxModel with _$ClusterBBoxModel {
  const ClusterBBoxModel._();

  const factory ClusterBBoxModel({
    required double xmin,
    required double ymin,
    required double xmax,
    required double ymax,
  }) = _ClusterBBoxModel;

  factory ClusterBBoxModel.fromJson(Map<String, dynamic> json) =>
      _$ClusterBBoxModelFromJson(json);

  ClusterBBox toEntity() {
    return ClusterBBox(xmin: xmin, ymin: ymin, xmax: xmax, ymax: ymax);
  }
}

@freezed
class ClusterCentroidModel with _$ClusterCentroidModel {
  const factory ClusterCentroidModel({
    required double lat,
    required double lng,
  }) = _ClusterCentroidModel;

  factory ClusterCentroidModel.fromJson(Map<String, dynamic> json) =>
      _$ClusterCentroidModelFromJson(json);
}

@freezed
class ClusterHotspotModel with _$ClusterHotspotModel {
  const ClusterHotspotModel._();

  const factory ClusterHotspotModel({
    @JsonKey(name: 'cluster_id') required int clusterId,
    @JsonKey(name: 'incident_count') required int incidentCount,
    @JsonKey(name: 'incident_object_ids') required List<int> incidentObjectIds,
    required ClusterCentroidModel centroid,
    @JsonKey(name: 'radius_m') required double radiusM,
    required double density,
    required String severity,
    @JsonKey(name: 'cluster_type') required String clusterType,
    required ClusterBBoxModel bbox,
    required List<List<double>> polygon,
  }) = _ClusterHotspotModel;

  factory ClusterHotspotModel.fromJson(Map<String, dynamic> json) =>
      _$ClusterHotspotModelFromJson(json);

  ClusterHotspot toEntity() {
    return ClusterHotspot(
      clusterId: clusterId,
      incidentCount: incidentCount,
      incidentObjectIds: incidentObjectIds,
      centerLat: centroid.lat,
      centerLng: centroid.lng,
      radiusM: radiusM,
      density: density,
      severity: severity,
      clusterType: clusterType,
      bbox: bbox.toEntity(),
      polygon: polygon,
    );
  }
}
