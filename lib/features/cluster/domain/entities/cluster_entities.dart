import 'package:freezed_annotation/freezed_annotation.dart';

part 'cluster_entities.freezed.dart';

/// Entity cho kết quả phân cụm - đã được chuẩn hóa cho domain layer
/// Chứa thông tin tổng quan và dữ liệu chi tiết của quá trình phân cụm
@freezed
abstract class ClusterResult with _$ClusterResult {
  const factory ClusterResult({
    /// Tổng số bản ghi sự cố được phân tích
    required int totalRecords,

    /// Số lượng cluster được tìm thấy (không tính noise)
    required int nClusters,

    /// Số lượng điểm nhiễu (outliers không thuộc cluster nào)
    required int nNoise,

    /// Số lượng điểm lõi (core points)
    required int nCorePoints,

    /// Danh sách các điểm sự cố gốc đã được gán cluster
    required List<ClusterItem> items,

    /// Danh sách các hotspot (vùng nguy hiểm) sau khi phân cụm
    required List<ClusterHotspot> clusters,
  }) = _ClusterResult;
}

/// Entity cho từng điểm sự cố đã được gán cluster
@freezed
abstract class ClusterItem with _$ClusterItem {
  const factory ClusterItem({
    /// ID duy nhất của điểm sự cố (dạng String)
    required String id,

    /// Vĩ độ của điểm sự cố
    required double lat,

    /// Kinh độ của điểm sự cố
    required double lng,

    /// ID của cluster mà điểm này thuộc về
    /// Giá trị -1 nghĩa là điểm nhiễu (noise/outlier)
    required int clusterId,

    /// Đánh dấu điểm có phải là core point hay không
    /// true = core point (có đủ láng giềng), false = border point hoặc noise
    required bool isCorePoint,
  }) = _ClusterItem;
}

/// Entity cho cluster hotspot - khu vực nguy hiểm có nhiều sự cố
@freezed
abstract class ClusterHotspot with _$ClusterHotspot {
  const factory ClusterHotspot({
    /// ID của cluster hotspot
    required int clusterId,

    /// Tổng số sự cố trong cluster này
    required int incidentCount,

    /// Danh sách ID của các sự cố thuộc cluster
    required List<int> incidentObjectIds,

    /// Vĩ độ tâm của cluster
    required double centerLat,

    /// Kinh độ tâm của cluster
    required double centerLng,

    /// Bán kính hiển thị hình tròn trên bản đồ (đơn vị: mét)
    /// Được tính từ khoảng cách xa nhất từ tâm đến các điểm
    required double displayRadiusM,

    /// Bán kính ảnh hưởng khuyến nghị (đơn vị: mét)
    /// Chỉ dùng tham khảo, không dùng cho routing
    required double impactRadiusM,

    /// Bán kính trung bình từ tâm đến các điểm (đơn vị: mét)
    /// Thể hiện độ phân tán của các sự cố trong cluster
    required double avgRadiusM,

    /// Mật độ sự cố (số sự cố / km²)
    required double density,

    /// Mức độ nguy hiểm: "high", "medium", "low"
    required String severity,

    /// Loại cluster: "dense", "spread", "isolated"
    required String clusterType,

    /// Hình chữ nhật bao quanh cluster
    required ClusterBBox bbox,

    /// Tọa độ polygon để hiển thị khi user tap vào hotspot
    /// Mỗi phần tử là [lng, lat]
    required List<List<double>> polygon,

    /// Thông tin hình học polygon theo chuẩn ArcGIS
    required ClusterGeometry geometry,
  }) = _ClusterHotspot;
}

/// Entity cho bounding box (hình chữ nhật bao quanh) của cluster
@freezed
abstract class ClusterBBox with _$ClusterBBox {
  const factory ClusterBBox({
    /// Kinh độ nhỏ nhất (cạnh trái)
    required double xmin,

    /// Vĩ độ nhỏ nhất (cạnh dưới)
    required double ymin,

    /// Kinh độ lớn nhất (cạnh phải)
    required double xmax,

    /// Vĩ độ lớn nhất (cạnh trên)
    required double ymax,
  }) = _ClusterBBox;
}

/// Entity cho hình học polygon theo chuẩn ArcGIS (đã đơn giản hóa)
@freezed
abstract class ClusterGeometry with _$ClusterGeometry {
  const factory ClusterGeometry({
    /// Danh sách các rings tạo thành polygon
    /// Mỗi ring là một mảng các tọa độ [lng, lat]
    /// Ring đầu tiên là outer ring, các ring sau (nếu có) là holes
    required List<List<List<double>>> rings,

    /// Well-Known ID của hệ tọa độ không gian
    /// Ví dụ: 4326 = WGS84, 3857 = Web Mercator
    required int wkid,
  }) = _ClusterGeometry;
}
