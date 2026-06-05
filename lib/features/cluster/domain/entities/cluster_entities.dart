import 'package:freezed_annotation/freezed_annotation.dart';

part 'cluster_entities.freezed.dart';

@freezed
class ClusterResult with _$ClusterResult {
  const factory ClusterResult({
    required int totalRecords,
    required int nClusters, // Số lượng cụm (Vùng nguy hiểm)
    required int nNoise, // Số lượng điểm nhiễu (Sự cố đơn lẻ)
    required int nCorePoints, // Số lượng điểm lõi
    required List<ClusterItem> items, // Danh sách chi tiết từng điểm
  }) = _ClusterResult;
}

@freezed
class ClusterItem with _$ClusterItem {
  const factory ClusterItem({
    required String id, // Ánh xạ từ OBJECTID
    required double lat, // Vĩ độ
    required double lng, // Kinh độ
    required int clusterId, // ID cụm (-1 nếu là điểm đơn lẻ, >=0 nếu thuộc cụm)
    required bool isCorePoint, // Có phải điểm lõi của cụm hay không
  }) = _ClusterItem;
}
