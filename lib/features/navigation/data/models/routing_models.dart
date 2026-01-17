import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:smart_route_app/features/navigation/data/models/route_direction_model.dart';

part 'routing_models.freezed.dart';
part 'routing_models.g.dart';

// Thông tin Tuyến đường
@freezed
class RouteResponse with _$RouteResponse {
  const factory RouteResponse({
    @JsonKey(name: 'routes') required RouteFeaturesResult routes,
    @Default([])
    @JsonKey(name: 'directions')
    List<RouteDirectionSet> directions,
    @JsonKey(name: 'messages')
    @Default([])
    List<dynamic> messages, // Check cảnh báo
  }) = _RouteResponse;

  factory RouteResponse.fromJson(Map<String, dynamic> json) =>
      _$RouteResponseFromJson(json);
}

@freezed
class RouteFeaturesResult with _$RouteFeaturesResult {
  const factory RouteFeaturesResult({
    @JsonKey(name: 'features') required List<RouteFeature> features,
  }) = _RouteFeaturesResult;

  factory RouteFeaturesResult.fromJson(Map<String, dynamic> json) =>
      _$RouteFeaturesResultFromJson(json);
}

@freezed
class RouteFeature with _$RouteFeature {
  const factory RouteFeature({
    @JsonKey(name: 'attributes') required RouteAttributes attributes,
    @JsonKey(name: 'geometry') required RouteGeometry geometry,
  }) = _RouteFeature;

  factory RouteFeature.fromJson(Map<String, dynamic> json) =>
      _$RouteFeatureFromJson(json);
}

@freezed
class RouteAttributes with _$RouteAttributes {
  const factory RouteAttributes({
    @JsonKey(name: 'ObjectID') int? objectId,
    @JsonKey(name: 'Name') String? name,
    @JsonKey(name: 'FirstStopID') int? firstStopId,
    @JsonKey(name: 'LastStopID') int? lastStopId,
    @JsonKey(name: 'StopCount') int? stopCount,
    @JsonKey(name: 'Total_TravelTime') double? totalTime,
    @JsonKey(name: 'Total_Kilometers') double? totalKilometers,
    @JsonKey(name: 'Total_Miles') double? totalMiles,
    @JsonKey(name: 'Shape_Length') double? shapeLength,
  }) = _RouteAttributes;

  factory RouteAttributes.fromJson(Map<String, dynamic> json) =>
      _$RouteAttributesFromJson(json);
}

@freezed
class RouteGeometry with _$RouteGeometry {
  const factory RouteGeometry({
    @JsonKey(name: 'paths') required List<List<List<double>>> paths,
  }) = _RouteGeometry;

  factory RouteGeometry.fromJson(Map<String, dynamic> json) =>
      _$RouteGeometryFromJson(json);
}
