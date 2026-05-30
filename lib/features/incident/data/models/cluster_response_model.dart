import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:smart_route_app/features/incident/domain/entities/cluster_item.dart';

part 'cluster_response_model.freezed.dart';
part 'cluster_response_model.g.dart';

@freezed
class ClusterItemModel with _$ClusterItemModel {
  const ClusterItemModel._(); // private constructor for freezed

  const factory ClusterItemModel({
    @JsonKey(name: 'OBJECTID') required int objectId,
    required double lat, // vĩ độ
    required double lng, // kinh độ
    @JsonKey(name: 'Cluster_ID')
    required int clusterId, // ID của cluster mà incident này thuộc về
    @JsonKey(name: 'Is_Core_Point')
    required int
    isCorePoint, // true nếu đây là core point của cluster, false nếu là border point
  }) = _ClusterItemModel;

  factory ClusterItemModel.fromJson(Map<String, dynamic> json) =>
      _$ClusterItemModelFromJson(json);

  // Chuyển đổi Data Model -> Domain Entity
  ClusterItem toEntity() {
    return ClusterItem(
      objectId: objectId,
      lat: lat,
      lng: lng,
      clusterId: clusterId,
      isCorePoint: isCorePoint,
    );
  }
}

@freezed
class ClusterResponseModel with _$ClusterResponseModel {
  const ClusterResponseModel._(); // private constructor for freezed
  factory ClusterResponseModel({
    required String status,
    required String message,
    @JsonKey(name: 'total_records') required int totalRecords,
    required List<ClusterItemModel> data,
  }) = _ClusterResponseModel;

  factory ClusterResponseModel.fromJson(Map<String, dynamic> json) =>
      _$ClusterResponseModelFromJson(json);
}
