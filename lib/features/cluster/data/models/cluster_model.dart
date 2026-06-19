import 'package:freezed_annotation/freezed_annotation.dart';
import '../../domain/entities/cluster_entities.dart';

part 'cluster_model.freezed.dart';
part 'cluster_model.g.dart';

/// Model cho response từ API phân cụm
/// Chứa toàn bộ thông tin kết quả phân cụm từ backend FastAPI
@freezed
class ClusterResponseModel with _$ClusterResponseModel {
  const ClusterResponseModel._();

  const factory ClusterResponseModel({
    /// Trạng thái response: "success" hoặc "error"
    required String status,

    /// Thông báo mô tả kết quả
    required String message,

    /// Tổng số bản ghi sự cố được phân tích
    @JsonKey(name: 'total_records') required int totalRecords,

    /// Thông tin tổng quan về quá trình phân cụm
    @JsonKey(name: 'clustering_info')
    required ClusteringInfoModel clusteringInfo,

    /// Danh sách các cluster/hotspot đã được phân cụm
    @JsonKey(name: 'clusters') required List<ClusterHotspotModel> clusters,

    /// Danh sách các điểm sự cố gốc với thông tin cluster được gán
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

/// Model chứa thông tin tổng quan về quá trình phân cụm
@freezed
class ClusteringInfoModel with _$ClusteringInfoModel {
  const factory ClusteringInfoModel({
    /// Thuật toán được sử dụng (ví dụ: "DBSCAN")
    required String algorithm,

    /// Bán kính epsilon của thuật toán DBSCAN (đơn vị: mét)
    /// Quyết định khoảng cách tối đa giữa 2 điểm để được coi là cùng cluster
    required double eps,

    /// Số lượng cluster tìm được (không tính noise)
    @JsonKey(name: 'n_clusters') required int nClusters,

    /// Số lượng điểm nhiễu (outliers không thuộc cluster nào)
    @JsonKey(name: 'n_noise') required int nNoise,

    /// Số lượng điểm lõi (core points) - điểm có đủ láng giềng trong bán kính eps
    @JsonKey(name: 'n_core_points') required int nCorePoints,
  }) = _ClusteringInfoModel;

  factory ClusteringInfoModel.fromJson(Map<String, dynamic> json) =>
      _$ClusteringInfoModelFromJson(json);
}

/// Model cho từng điểm sự cố đã được gán cluster
@freezed
class ClusterItemModel with _$ClusterItemModel {
  const ClusterItemModel._();

  const factory ClusterItemModel({
    /// ID duy nhất của điểm sự cố từ ArcGIS
    @JsonKey(name: 'OBJECTID') required int objectId,

    /// Kinh độ của điểm sự cố
    required double longitude,

    /// Vĩ độ của điểm sự cố
    required double latitude,

    /// ID của cluster mà điểm này thuộc về
    /// Giá trị -1 nghĩa là điểm nhiễu (noise/outlier)
    @JsonKey(name: 'Cluster_ID') required int clusterId,

    /// Đánh dấu điểm có phải là core point hay không
    /// 1 = core point (có đủ láng giềng), 0 = border point hoặc noise
    @JsonKey(name: 'Is_Core_Point') required int isCorePoint,
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

/// Model cho bounding box (hình chữ nhật bao quanh) của cluster
@freezed
class ClusterBBoxModel with _$ClusterBBoxModel {
  const ClusterBBoxModel._();

  const factory ClusterBBoxModel({
    /// Kinh độ nhỏ nhất (cạnh trái)
    required double xmin,

    /// Vĩ độ nhỏ nhất (cạnh dưới)
    required double ymin,

    /// Kinh độ lớn nhất (cạnh phải)
    required double xmax,

    /// Vĩ độ lớn nhất (cạnh trên)
    required double ymax,
  }) = _ClusterBBoxModel;

  factory ClusterBBoxModel.fromJson(Map<String, dynamic> json) =>
      _$ClusterBBoxModelFromJson(json);

  ClusterBBox toEntity() {
    return ClusterBBox(xmin: xmin, ymin: ymin, xmax: xmax, ymax: ymax);
  }
}

/// Model cho tâm (centroid) của cluster
@freezed
class ClusterCentroidModel with _$ClusterCentroidModel {
  const factory ClusterCentroidModel({
    /// Vĩ độ của tâm cluster
    required double lat,

    /// Kinh độ của tâm cluster
    required double lng,
  }) = _ClusterCentroidModel;

  factory ClusterCentroidModel.fromJson(Map<String, dynamic> json) =>
      _$ClusterCentroidModelFromJson(json);
}

/// Model cho cluster hotspot - khu vực nguy hiểm có nhiều sự cố
@freezed
class ClusterHotspotModel with _$ClusterHotspotModel {
  const ClusterHotspotModel._();

  const factory ClusterHotspotModel({
    /// ID của cluster hotspot
    @JsonKey(name: 'cluster_id') required int clusterId,

    /// Tổng số sự cố trong cluster này
    @JsonKey(name: 'incident_count') required int incidentCount,

    /// Danh sách OBJECTID của các sự cố thuộc cluster
    @JsonKey(name: 'incident_object_ids') required List<int> incidentObjectIds,

    /// Tọa độ tâm của cluster
    required ClusterCentroidModel centroid,

    /// Bán kính hiển thị trên bản đồ (đơn vị: mét)
    /// Được tính từ khoảng cách xa nhất từ tâm đến các điểm trong cluster
    @JsonKey(name: 'display_radius_m') required double displayRadiusM,

    /// Bán kính ảnh hưởng khuyến nghị (đơn vị: mét)
    /// Dùng cho phân tích, không dùng cho routing
    @JsonKey(name: 'impact_radius_m') required double impactRadiusM,

    /// Bán kính trung bình từ tâm đến các điểm (đơn vị: mét)
    /// Thể hiện độ phân tán của các sự cố trong cluster
    @JsonKey(name: 'avg_radius_m') required double avgRadiusM,

    /// Thông tin hình học polygon của cluster (chuẩn ArcGIS)
    required ClusterGeometryModel geometry,

    /// Mật độ sự cố (số sự cố / km²)
    required double density,

    /// Mức độ nguy hiểm: "high", "medium", "low"
    required String severity,

    /// Loại cluster: "dense", "spread", "isolated"
    @JsonKey(name: 'cluster_type') required String clusterType,

    /// Hình chữ nhật bao quanh cluster
    required ClusterBBoxModel bbox,

    /// Tọa độ polygon đơn giản hóa để hiển thị trên map
    /// Mỗi phần tử là [lng, lat]
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

      displayRadiusM: displayRadiusM,
      impactRadiusM: impactRadiusM,
      avgRadiusM: avgRadiusM,

      density: density,
      severity: severity,
      clusterType: clusterType,

      bbox: bbox.toEntity(),

      polygon: polygon,
      geometry: geometry.toEntity(),
    );
  }
}

/// Model cho hình học polygon theo chuẩn ArcGIS
@freezed
class ClusterGeometryModel with _$ClusterGeometryModel {
  const ClusterGeometryModel._();

  const factory ClusterGeometryModel({
    /// Danh sách các rings tạo thành polygon
    /// Mỗi ring là một mảng các tọa độ [lng, lat]
    /// Ring đầu tiên là outer ring, các ring sau (nếu có) là holes
    required List<List<List<double>>> rings,

    /// Hệ tọa độ không gian sử dụng
    required SpatialReferenceModel spatialReference,
  }) = _ClusterGeometryModel;

  factory ClusterGeometryModel.fromJson(Map<String, dynamic> json) =>
      _$ClusterGeometryModelFromJson(json);

  ClusterGeometry toEntity() {
    return ClusterGeometry(rings: rings, wkid: spatialReference.wkid);
  }
}

/// Model cho hệ tọa độ không gian (Spatial Reference)
@freezed
class SpatialReferenceModel with _$SpatialReferenceModel {
  const factory SpatialReferenceModel({
    /// Well-Known ID của hệ tọa độ
    /// Ví dụ: 4326 = WGS84 (latitude/longitude), 3857 = Web Mercator
    required int wkid,
  }) = _SpatialReferenceModel;

  factory SpatialReferenceModel.fromJson(Map<String, dynamic> json) =>
      _$SpatialReferenceModelFromJson(json);
}
