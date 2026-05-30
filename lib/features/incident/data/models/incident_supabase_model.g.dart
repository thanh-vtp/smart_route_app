// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'incident_supabase_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$IncidentSupabaseModelImpl _$$IncidentSupabaseModelImplFromJson(
        Map<String, dynamic> json) =>
    _$IncidentSupabaseModelImpl(
      id: json['id'] as String,
      arcgisObjectId: json['arcgis_object_id'] as String?,
      type: json['type'] as String,
      severity: json['severity'] as String,
      lat: (json['lat'] as num).toDouble(),
      lng: (json['lng'] as num).toDouble(),
      description: json['description'] as String?,
      reportedBy: json['reported_by'] as String?,
      upvotes: (json['upvotes'] as num?)?.toInt() ?? 0,
      downvotes: (json['downvotes'] as num?)?.toInt() ?? 0,
      status: json['status'] as String? ?? 'active',
      expiresAt: json['expires_at'] == null
          ? null
          : DateTime.parse(json['expires_at'] as String),
      createdAt: json['created_at'] == null
          ? null
          : DateTime.parse(json['created_at'] as String),
      updatedAt: json['updated_at'] == null
          ? null
          : DateTime.parse(json['updated_at'] as String),
    );

Map<String, dynamic> _$$IncidentSupabaseModelImplToJson(
        _$IncidentSupabaseModelImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'arcgis_object_id': instance.arcgisObjectId,
      'type': instance.type,
      'severity': instance.severity,
      'lat': instance.lat,
      'lng': instance.lng,
      'description': instance.description,
      'reported_by': instance.reportedBy,
      'upvotes': instance.upvotes,
      'downvotes': instance.downvotes,
      'status': instance.status,
      'expires_at': instance.expiresAt?.toIso8601String(),
      'created_at': instance.createdAt?.toIso8601String(),
      'updated_at': instance.updatedAt?.toIso8601String(),
    };
