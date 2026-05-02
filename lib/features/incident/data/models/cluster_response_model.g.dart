// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'cluster_response_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ClusterItemModelImpl _$$ClusterItemModelImplFromJson(
        Map<String, dynamic> json) =>
    _$ClusterItemModelImpl(
      objectId: (json['OBJECTID'] as num).toInt(),
      latitude: (json['latitude'] as num).toDouble(),
      longitude: (json['longitude'] as num).toDouble(),
      clusterId: (json['Cluster_ID'] as num).toInt(),
    );

Map<String, dynamic> _$$ClusterItemModelImplToJson(
        _$ClusterItemModelImpl instance) =>
    <String, dynamic>{
      'OBJECTID': instance.objectId,
      'latitude': instance.latitude,
      'longitude': instance.longitude,
      'Cluster_ID': instance.clusterId,
    };

_$ClusterResponseModelImpl _$$ClusterResponseModelImplFromJson(
        Map<String, dynamic> json) =>
    _$ClusterResponseModelImpl(
      status: json['status'] as String,
      message: json['message'] as String,
      totalRecords: (json['total_records'] as num).toInt(),
      data: (json['data'] as List<dynamic>)
          .map((e) => ClusterItemModel.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$ClusterResponseModelImplToJson(
        _$ClusterResponseModelImpl instance) =>
    <String, dynamic>{
      'status': instance.status,
      'message': instance.message,
      'total_records': instance.totalRecords,
      'data': instance.data,
    };
