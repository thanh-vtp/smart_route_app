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
      clusters: (json['clusters'] as List<dynamic>)
          .map((e) => ClusterHotspotModel.fromJson(e as Map<String, dynamic>))
          .toList(),
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
      'clusters': instance.clusters,
      'data': instance.data,
    };

_$ClusteringInfoModelImpl _$$ClusteringInfoModelImplFromJson(
        Map<String, dynamic> json) =>
    _$ClusteringInfoModelImpl(
      algorithm: json['algorithm'] as String,
      eps: (json['eps'] as num).toDouble(),
      nClusters: (json['n_clusters'] as num).toInt(),
      nNoise: (json['n_noise'] as num).toInt(),
      nCorePoints: (json['n_core_points'] as num).toInt(),
    );

Map<String, dynamic> _$$ClusteringInfoModelImplToJson(
        _$ClusteringInfoModelImpl instance) =>
    <String, dynamic>{
      'algorithm': instance.algorithm,
      'eps': instance.eps,
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

_$ClusterBBoxModelImpl _$$ClusterBBoxModelImplFromJson(
        Map<String, dynamic> json) =>
    _$ClusterBBoxModelImpl(
      xmin: (json['xmin'] as num).toDouble(),
      ymin: (json['ymin'] as num).toDouble(),
      xmax: (json['xmax'] as num).toDouble(),
      ymax: (json['ymax'] as num).toDouble(),
    );

Map<String, dynamic> _$$ClusterBBoxModelImplToJson(
        _$ClusterBBoxModelImpl instance) =>
    <String, dynamic>{
      'xmin': instance.xmin,
      'ymin': instance.ymin,
      'xmax': instance.xmax,
      'ymax': instance.ymax,
    };

_$ClusterCentroidModelImpl _$$ClusterCentroidModelImplFromJson(
        Map<String, dynamic> json) =>
    _$ClusterCentroidModelImpl(
      lat: (json['lat'] as num).toDouble(),
      lng: (json['lng'] as num).toDouble(),
    );

Map<String, dynamic> _$$ClusterCentroidModelImplToJson(
        _$ClusterCentroidModelImpl instance) =>
    <String, dynamic>{
      'lat': instance.lat,
      'lng': instance.lng,
    };

_$ClusterHotspotModelImpl _$$ClusterHotspotModelImplFromJson(
        Map<String, dynamic> json) =>
    _$ClusterHotspotModelImpl(
      clusterId: (json['cluster_id'] as num).toInt(),
      incidentCount: (json['incident_count'] as num).toInt(),
      incidentObjectIds: (json['incident_object_ids'] as List<dynamic>)
          .map((e) => (e as num).toInt())
          .toList(),
      centroid: ClusterCentroidModel.fromJson(
          json['centroid'] as Map<String, dynamic>),
      displayRadiusM: (json['display_radius_m'] as num).toDouble(),
      impactRadiusM: (json['impact_radius_m'] as num).toDouble(),
      avgRadiusM: (json['avg_radius_m'] as num).toDouble(),
      geometry: ClusterGeometryModel.fromJson(
          json['geometry'] as Map<String, dynamic>),
      density: (json['density'] as num).toDouble(),
      severity: json['severity'] as String,
      clusterType: json['cluster_type'] as String,
      bbox: ClusterBBoxModel.fromJson(json['bbox'] as Map<String, dynamic>),
      polygon: (json['polygon'] as List<dynamic>)
          .map((e) =>
              (e as List<dynamic>).map((e) => (e as num).toDouble()).toList())
          .toList(),
    );

Map<String, dynamic> _$$ClusterHotspotModelImplToJson(
        _$ClusterHotspotModelImpl instance) =>
    <String, dynamic>{
      'cluster_id': instance.clusterId,
      'incident_count': instance.incidentCount,
      'incident_object_ids': instance.incidentObjectIds,
      'centroid': instance.centroid,
      'display_radius_m': instance.displayRadiusM,
      'impact_radius_m': instance.impactRadiusM,
      'avg_radius_m': instance.avgRadiusM,
      'geometry': instance.geometry,
      'density': instance.density,
      'severity': instance.severity,
      'cluster_type': instance.clusterType,
      'bbox': instance.bbox,
      'polygon': instance.polygon,
    };

_$ClusterGeometryModelImpl _$$ClusterGeometryModelImplFromJson(
        Map<String, dynamic> json) =>
    _$ClusterGeometryModelImpl(
      rings: (json['rings'] as List<dynamic>)
          .map((e) => (e as List<dynamic>)
              .map((e) => (e as List<dynamic>)
                  .map((e) => (e as num).toDouble())
                  .toList())
              .toList())
          .toList(),
      spatialReference: SpatialReferenceModel.fromJson(
          json['spatialReference'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$ClusterGeometryModelImplToJson(
        _$ClusterGeometryModelImpl instance) =>
    <String, dynamic>{
      'rings': instance.rings,
      'spatialReference': instance.spatialReference,
    };

_$SpatialReferenceModelImpl _$$SpatialReferenceModelImplFromJson(
        Map<String, dynamic> json) =>
    _$SpatialReferenceModelImpl(
      wkid: (json['wkid'] as num).toInt(),
    );

Map<String, dynamic> _$$SpatialReferenceModelImplToJson(
        _$SpatialReferenceModelImpl instance) =>
    <String, dynamic>{
      'wkid': instance.wkid,
    };
