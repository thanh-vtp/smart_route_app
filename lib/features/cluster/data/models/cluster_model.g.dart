// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'cluster_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ClusterResponseModelImpl _$$ClusterResponseModelImplFromJson(
        Map<String, dynamic> json) =>
    _$ClusterResponseModelImpl(
      status: json['status'] as String,
      message: json['message'] as String,
      totalRecords: (json['total_records'] as num).toInt(),
      clusteringInfo: ClusteringInfoModel.fromJson(
          json['clustering_info'] as Map<String, dynamic>),
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
      'clustering_info': instance.clusteringInfo,
      'data': instance.data,
    };

_$ClusteringInfoModelImpl _$$ClusteringInfoModelImplFromJson(
        Map<String, dynamic> json) =>
    _$ClusteringInfoModelImpl(
      nClusters: (json['n_clusters'] as num).toInt(),
      nNoise: (json['n_noise'] as num).toInt(),
      nCorePoints: (json['n_core_points'] as num).toInt(),
    );

Map<String, dynamic> _$$ClusteringInfoModelImplToJson(
        _$ClusteringInfoModelImpl instance) =>
    <String, dynamic>{
      'n_clusters': instance.nClusters,
      'n_noise': instance.nNoise,
      'n_core_points': instance.nCorePoints,
    };

_$ClusterItemModelImpl _$$ClusterItemModelImplFromJson(
        Map<String, dynamic> json) =>
    _$ClusterItemModelImpl(
      objectId: (json['OBJECTID'] as num).toInt(),
      longitude: (json['longitude'] as num).toDouble(),
      latitude: (json['latitude'] as num).toDouble(),
      clusterId: (json['Cluster_ID'] as num).toInt(),
      isCorePoint: (json['Is_Core_Point'] as num).toInt(),
    );

Map<String, dynamic> _$$ClusterItemModelImplToJson(
        _$ClusterItemModelImpl instance) =>
    <String, dynamic>{
      'OBJECTID': instance.objectId,
      'longitude': instance.longitude,
      'latitude': instance.latitude,
      'Cluster_ID': instance.clusterId,
      'Is_Core_Point': instance.isCorePoint,
    };
