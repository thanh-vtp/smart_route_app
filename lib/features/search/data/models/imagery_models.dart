import 'package:freezed_annotation/freezed_annotation.dart';

part 'imagery_models.freezed.dart';
part 'imagery_models.g.dart';

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
