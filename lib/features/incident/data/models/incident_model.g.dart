// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'incident_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$IncidentModelImpl _$$IncidentModelImplFromJson(Map<String, dynamic> json) =>
    _$IncidentModelImpl(
      id: json['id'] as String,
      latitude: json['latitude'] as String,
      longitude: json['longitude'] as String,
      type: json['type'] as String,
      severity: json['severity'] as String,
      description: json['description'] as String,
      reportedTime: const DateTimeConverter()
          .fromJson((json['reportedTime'] as num).toInt()),
      reportedBy: json['reportedBy'] as String?,
      reportedByUid: json['reportedByUid'] as String?,
      arcgisObjectId: json['arcgisObjectId'] as String?,
      creationDate: _$JsonConverterFromJson<int, DateTime>(
          json['creationDate'], const DateTimeConverter().fromJson),
      editDate: _$JsonConverterFromJson<int, DateTime>(
          json['editDate'], const DateTimeConverter().fromJson),
    );

Map<String, dynamic> _$$IncidentModelImplToJson(_$IncidentModelImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'latitude': instance.latitude,
      'longitude': instance.longitude,
      'type': instance.type,
      'severity': instance.severity,
      'description': instance.description,
      'reportedTime': const DateTimeConverter().toJson(instance.reportedTime),
      'reportedBy': instance.reportedBy,
      'reportedByUid': instance.reportedByUid,
      'arcgisObjectId': instance.arcgisObjectId,
      'creationDate': _$JsonConverterToJson<int, DateTime>(
          instance.creationDate, const DateTimeConverter().toJson),
      'editDate': _$JsonConverterToJson<int, DateTime>(
          instance.editDate, const DateTimeConverter().toJson),
    };

Value? _$JsonConverterFromJson<Json, Value>(
  Object? json,
  Value? Function(Json json) fromJson,
) =>
    json == null ? null : fromJson(json as Json);

Json? _$JsonConverterToJson<Json, Value>(
  Value? value,
  Json? Function(Value value) toJson,
) =>
    value == null ? null : toJson(value);
