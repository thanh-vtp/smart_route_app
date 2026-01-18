import 'package:freezed_annotation/freezed_annotation.dart';

part 'route_barriers_result.freezed.dart';
part 'route_barriers_result.g.dart';

// Class chứa danh sách Barriers
@freezed
class RouteBarriersResult with _$RouteBarriersResult {
  const factory RouteBarriersResult({
    @JsonKey(name: 'features') required List<RouteBarrierFeature> features,
  }) = _RouteBarriersResult;

  factory RouteBarriersResult.fromJson(Map<String, dynamic> json) =>
      _$RouteBarriersResultFromJson(json);
}

// Chi tiết từng Barrier
@freezed
class RouteBarrierFeature with _$RouteBarrierFeature {
  const factory RouteBarrierFeature({
    @JsonKey(name: 'geometry') required RoutePointGeometry geometry,
    @JsonKey(name: 'attributes') Map<String, dynamic>? attributes,
  }) = _RouteBarrierFeature;

  factory RouteBarrierFeature.fromJson(Map<String, dynamic> json) =>
      _$RouteBarrierFeatureFromJson(json);
}

// Geometry cho Point (x, y)
@freezed
class RoutePointGeometry with _$RoutePointGeometry {
  const factory RoutePointGeometry({double? x, double? y}) =
      _RoutePointGeometry;

  factory RoutePointGeometry.fromJson(Map<String, dynamic> json) =>
      _$RoutePointGeometryFromJson(json);
}
