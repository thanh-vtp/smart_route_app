// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'imagery_models.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ImageryMetadataResponseImpl _$$ImageryMetadataResponseImplFromJson(
        Map<String, dynamic> json) =>
    _$ImageryMetadataResponseImpl(
      name: json['name'] as String?,
      description: json['description'] as String?,
      extent: json['extent'] == null
          ? null
          : ImageryExtent.fromJson(json['extent'] as Map<String, dynamic>),
      pixelSizeX: (json['pixelSizeX'] as num?)?.toDouble(),
      pixelSizeY: (json['pixelSizeY'] as num?)?.toDouble(),
      bandCount: (json['bandCount'] as num?)?.toInt(),
      pixelType: json['pixelType'] as String?,
      minPixelSize: (json['minPixelSize'] as num?)?.toDouble(),
      maxPixelSize: (json['maxPixelSize'] as num?)?.toDouble(),
      copyrightText: json['copyrightText'] as String?,
      serviceDataType: json['serviceDataType'] as String?,
      minValues: (json['minValues'] as List<dynamic>?)
          ?.map((e) => (e as num).toDouble())
          .toList(),
      maxValues: (json['maxValues'] as List<dynamic>?)
          ?.map((e) => (e as num).toDouble())
          .toList(),
      meanValues: (json['meanValues'] as List<dynamic>?)
          ?.map((e) => (e as num).toDouble())
          .toList(),
      stdvValues: (json['stdvValues'] as List<dynamic>?)
          ?.map((e) => (e as num).toDouble())
          .toList(),
    );

Map<String, dynamic> _$$ImageryMetadataResponseImplToJson(
        _$ImageryMetadataResponseImpl instance) =>
    <String, dynamic>{
      'name': instance.name,
      'description': instance.description,
      'extent': instance.extent,
      'pixelSizeX': instance.pixelSizeX,
      'pixelSizeY': instance.pixelSizeY,
      'bandCount': instance.bandCount,
      'pixelType': instance.pixelType,
      'minPixelSize': instance.minPixelSize,
      'maxPixelSize': instance.maxPixelSize,
      'copyrightText': instance.copyrightText,
      'serviceDataType': instance.serviceDataType,
      'minValues': instance.minValues,
      'maxValues': instance.maxValues,
      'meanValues': instance.meanValues,
      'stdvValues': instance.stdvValues,
    };

_$ImageryExtentImpl _$$ImageryExtentImplFromJson(Map<String, dynamic> json) =>
    _$ImageryExtentImpl(
      xmin: (json['xmin'] as num).toDouble(),
      ymin: (json['ymin'] as num).toDouble(),
      xmax: (json['xmax'] as num).toDouble(),
      ymax: (json['ymax'] as num).toDouble(),
      spatialReference: json['spatialReference'] as Map<String, dynamic>?,
    );

Map<String, dynamic> _$$ImageryExtentImplToJson(_$ImageryExtentImpl instance) =>
    <String, dynamic>{
      'xmin': instance.xmin,
      'ymin': instance.ymin,
      'xmax': instance.xmax,
      'ymax': instance.ymax,
      'spatialReference': instance.spatialReference,
    };
