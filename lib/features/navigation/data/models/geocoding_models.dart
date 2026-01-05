import 'package:freezed_annotation/freezed_annotation.dart';

part 'geocoding_models.freezed.dart';
part 'geocoding_models.g.dart';

@freezed
class GeocodeResponse with _$GeocodeResponse {
  const factory GeocodeResponse({
    @JsonKey(name: 'candidates') required List<GeocodeCandidate> candidates,
  }) = _GeocodeResponse;

  factory GeocodeResponse.fromJson(Map<String, dynamic> json) =>
      _$GeocodeResponseFromJson(json);
}

@freezed
class GeocodeCandidate with _$GeocodeCandidate {
  const factory GeocodeCandidate({
    @JsonKey(name: 'address') required String address,
    @JsonKey(name: 'location') required LocationPoint location,
    @JsonKey(name: 'score') required double score,
    @JsonKey(name: 'attributes') Map<String, dynamic>? attributes,
  }) = _GeocodeCandidate;

  factory GeocodeCandidate.fromJson(Map<String, dynamic> json) =>
      _$GeocodeCandidateFromJson(json);
}

@freezed
class LocationPoint with _$LocationPoint {
  const factory LocationPoint({
    @JsonKey(name: 'x') required double longitude,
    @JsonKey(name: 'y') required double latitude,
  }) = _LocationPoint;

  factory LocationPoint.fromJson(Map<String, dynamic> json) =>
      _$LocationPointFromJson(json);
}

@freezed
class ReverseGeocodeResponse with _$ReverseGeocodeResponse {
  const factory ReverseGeocodeResponse({
    @JsonKey(name: 'address') required AddressInfo address,
    @JsonKey(name: 'location') required LocationPoint location,
  }) = _ReverseGeocodeResponse;

  factory ReverseGeocodeResponse.fromJson(Map<String, dynamic> json) =>
      _$ReverseGeocodeResponseFromJson(json);
}

@freezed
class AddressInfo with _$AddressInfo {
  const factory AddressInfo({
    @JsonKey(name: 'Match_addr') String? fullAddress,
    @JsonKey(name: 'LongLabel') String? longLabel,
    @JsonKey(name: 'ShortLabel') String? shortLabel,
    @JsonKey(name: 'Addr_type') String? addressType,
    @JsonKey(name: 'Type') String? type,
    @JsonKey(name: 'PlaceName') String? placeName,
    @JsonKey(name: 'AddNum') String? addressNumber,
    @JsonKey(name: 'Address') String? streetName,
    @JsonKey(name: 'Block') String? block,
    @JsonKey(name: 'Sector') String? sector,
    @JsonKey(name: 'Neighborhood') String? neighborhood,
    @JsonKey(name: 'District') String? district,
    @JsonKey(name: 'City') String? city,
    @JsonKey(name: 'MetroArea') String? metroArea,
    @JsonKey(name: 'Subregion') String? subregion,
    @JsonKey(name: 'Region') String? region,
    @JsonKey(name: 'Territory') String? territory,
    @JsonKey(name: 'Postal') String? postalCode,
    @JsonKey(name: 'PostalExt') String? postalExtension,
    @JsonKey(name: 'CntryName') String? countryName,
    @JsonKey(name: 'CountryCode') String? countryCode,
  }) = _AddressInfo;

  factory AddressInfo.fromJson(Map<String, dynamic> json) =>
      _$AddressInfoFromJson(json);
}

@freezed
class RouteResponse with _$RouteResponse {
  const factory RouteResponse({
    @JsonKey(name: 'routes') required RouteFeaturesResult routes,
    @JsonKey(name: 'directions')
    @Default([])
    List<RouteDirectionSet> directions,
  }) = _RouteResponse;

  factory RouteResponse.fromJson(Map<String, dynamic> json) =>
      _$RouteResponseFromJson(json);
}

@freezed
class RouteDirectionSet with _$RouteDirectionSet {
  const factory RouteDirectionSet({
    @JsonKey(name: 'routeId') int? routeId,
    @JsonKey(name: 'routeName') String? routeName,
    @JsonKey(name: 'summary') RouteDirectionSummary? summary,
    @JsonKey(name: 'features')
    @Default([])
    List<RouteDirectionFeature> features,
  }) = _RouteDirectionSet;

  factory RouteDirectionSet.fromJson(Map<String, dynamic> json) =>
      _$RouteDirectionSetFromJson(json);
}

@freezed
class RouteDirectionSummary with _$RouteDirectionSummary {
  const factory RouteDirectionSummary({
    @JsonKey(name: 'totalLength') double? totalLength,
    @JsonKey(name: 'totalTime') double? totalTime,
    @JsonKey(name: 'totalDriveTime') double? totalDriveTime,
  }) = _RouteDirectionSummary;

  factory RouteDirectionSummary.fromJson(Map<String, dynamic> json) =>
      _$RouteDirectionSummaryFromJson(json);
}

@freezed
class RouteDirectionFeature with _$RouteDirectionFeature {
  const factory RouteDirectionFeature({
    @JsonKey(name: 'attributes') required RouteDirectionAttributes attributes,
    @JsonKey(name: 'strings') @Default([]) List<RouteDirectionString> strings,
  }) = _RouteDirectionFeature;

  factory RouteDirectionFeature.fromJson(Map<String, dynamic> json) =>
      _$RouteDirectionFeatureFromJson(json);
}

@freezed
class RouteDirectionAttributes with _$RouteDirectionAttributes {
  const factory RouteDirectionAttributes({
    @JsonKey(name: 'length') @Default(0) double length,
    @JsonKey(name: 'time') @Default(0) double time,
    @JsonKey(name: 'text') String? text,
    @JsonKey(name: 'maneuverType') String? maneuverType,
  }) = _RouteDirectionAttributes;

  factory RouteDirectionAttributes.fromJson(Map<String, dynamic> json) =>
      _$RouteDirectionAttributesFromJson(json);
}

@freezed
class RouteDirectionString with _$RouteDirectionString {
  const factory RouteDirectionString({
    @JsonKey(name: 'string') String? string,
    @JsonKey(name: 'stringType') String? stringType,
  }) = _RouteDirectionString;

  factory RouteDirectionString.fromJson(Map<String, dynamic> json) =>
      _$RouteDirectionStringFromJson(json);
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

@freezed
class ImageryMetadataResponse with _$ImageryMetadataResponse {
  const factory ImageryMetadataResponse({
    @JsonKey(name: 'name') String? name,
    @JsonKey(name: 'description') String? description,
    @JsonKey(name: 'extent') ImageryExtent? extent,
    @JsonKey(name: 'pixelSizeX') double? pixelSizeX,
    @JsonKey(name: 'pixelSizeY') double? pixelSizeY,
    @JsonKey(name: 'bandCount') int? bandCount,
    @JsonKey(name: 'pixelType') String? pixelType,
    @JsonKey(name: 'minPixelSize') double? minPixelSize,
    @JsonKey(name: 'maxPixelSize') double? maxPixelSize,
    @JsonKey(name: 'copyrightText') String? copyrightText,
    @JsonKey(name: 'serviceDataType') String? serviceDataType,
    @JsonKey(name: 'minValues') List<double>? minValues,
    @JsonKey(name: 'maxValues') List<double>? maxValues,
    @JsonKey(name: 'meanValues') List<double>? meanValues,
    @JsonKey(name: 'stdvValues') List<double>? stdvValues,
  }) = _ImageryMetadataResponse;

  factory ImageryMetadataResponse.fromJson(Map<String, dynamic> json) =>
      _$ImageryMetadataResponseFromJson(json);
}

@freezed
class ImageryExtent with _$ImageryExtent {
  const factory ImageryExtent({
    @JsonKey(name: 'xmin') required double xmin,
    @JsonKey(name: 'ymin') required double ymin,
    @JsonKey(name: 'xmax') required double xmax,
    @JsonKey(name: 'ymax') required double ymax,
    @JsonKey(name: 'spatialReference') Map<String, dynamic>? spatialReference,
  }) = _ImageryExtent;

  factory ImageryExtent.fromJson(Map<String, dynamic> json) =>
      _$ImageryExtentFromJson(json);
}
