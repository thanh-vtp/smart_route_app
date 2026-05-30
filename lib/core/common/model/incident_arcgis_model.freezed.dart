// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'incident_arcgis_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$IncidentArcgisModel {
  String get arcgisObjectId => throw _privateConstructorUsedError;
  String get incidentUuid => throw _privateConstructorUsedError;
  double get lat => throw _privateConstructorUsedError; // vĩ độ
  double get lng => throw _privateConstructorUsedError; // kinh độ
  String get type =>
      throw _privateConstructorUsedError; // loại sự cố traffic, accident, construction, etc.
  String get severity => throw _privateConstructorUsedError; // mức độ sự cố
  String get status => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $IncidentArcgisModelCopyWith<IncidentArcgisModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $IncidentArcgisModelCopyWith<$Res> {
  factory $IncidentArcgisModelCopyWith(
          IncidentArcgisModel value, $Res Function(IncidentArcgisModel) then) =
      _$IncidentArcgisModelCopyWithImpl<$Res, IncidentArcgisModel>;
  @useResult
  $Res call(
      {String arcgisObjectId,
      String incidentUuid,
      double lat,
      double lng,
      String type,
      String severity,
      String status});
}

/// @nodoc
class _$IncidentArcgisModelCopyWithImpl<$Res, $Val extends IncidentArcgisModel>
    implements $IncidentArcgisModelCopyWith<$Res> {
  _$IncidentArcgisModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? arcgisObjectId = null,
    Object? incidentUuid = null,
    Object? lat = null,
    Object? lng = null,
    Object? type = null,
    Object? severity = null,
    Object? status = null,
  }) {
    return _then(_value.copyWith(
      arcgisObjectId: null == arcgisObjectId
          ? _value.arcgisObjectId
          : arcgisObjectId // ignore: cast_nullable_to_non_nullable
              as String,
      incidentUuid: null == incidentUuid
          ? _value.incidentUuid
          : incidentUuid // ignore: cast_nullable_to_non_nullable
              as String,
      lat: null == lat
          ? _value.lat
          : lat // ignore: cast_nullable_to_non_nullable
              as double,
      lng: null == lng
          ? _value.lng
          : lng // ignore: cast_nullable_to_non_nullable
              as double,
      type: null == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as String,
      severity: null == severity
          ? _value.severity
          : severity // ignore: cast_nullable_to_non_nullable
              as String,
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$IncidentArcgisModelImplCopyWith<$Res>
    implements $IncidentArcgisModelCopyWith<$Res> {
  factory _$$IncidentArcgisModelImplCopyWith(_$IncidentArcgisModelImpl value,
          $Res Function(_$IncidentArcgisModelImpl) then) =
      __$$IncidentArcgisModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String arcgisObjectId,
      String incidentUuid,
      double lat,
      double lng,
      String type,
      String severity,
      String status});
}

/// @nodoc
class __$$IncidentArcgisModelImplCopyWithImpl<$Res>
    extends _$IncidentArcgisModelCopyWithImpl<$Res, _$IncidentArcgisModelImpl>
    implements _$$IncidentArcgisModelImplCopyWith<$Res> {
  __$$IncidentArcgisModelImplCopyWithImpl(_$IncidentArcgisModelImpl _value,
      $Res Function(_$IncidentArcgisModelImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? arcgisObjectId = null,
    Object? incidentUuid = null,
    Object? lat = null,
    Object? lng = null,
    Object? type = null,
    Object? severity = null,
    Object? status = null,
  }) {
    return _then(_$IncidentArcgisModelImpl(
      arcgisObjectId: null == arcgisObjectId
          ? _value.arcgisObjectId
          : arcgisObjectId // ignore: cast_nullable_to_non_nullable
              as String,
      incidentUuid: null == incidentUuid
          ? _value.incidentUuid
          : incidentUuid // ignore: cast_nullable_to_non_nullable
              as String,
      lat: null == lat
          ? _value.lat
          : lat // ignore: cast_nullable_to_non_nullable
              as double,
      lng: null == lng
          ? _value.lng
          : lng // ignore: cast_nullable_to_non_nullable
              as double,
      type: null == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as String,
      severity: null == severity
          ? _value.severity
          : severity // ignore: cast_nullable_to_non_nullable
              as String,
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$IncidentArcgisModelImpl extends _IncidentArcgisModel {
  const _$IncidentArcgisModelImpl(
      {required this.arcgisObjectId,
      required this.incidentUuid,
      required this.lat,
      required this.lng,
      required this.type,
      required this.severity,
      required this.status})
      : super._();

  @override
  final String arcgisObjectId;
  @override
  final String incidentUuid;
  @override
  final double lat;
// vĩ độ
  @override
  final double lng;
// kinh độ
  @override
  final String type;
// loại sự cố traffic, accident, construction, etc.
  @override
  final String severity;
// mức độ sự cố
  @override
  final String status;

  @override
  String toString() {
    return 'IncidentArcgisModel(arcgisObjectId: $arcgisObjectId, incidentUuid: $incidentUuid, lat: $lat, lng: $lng, type: $type, severity: $severity, status: $status)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$IncidentArcgisModelImpl &&
            (identical(other.arcgisObjectId, arcgisObjectId) ||
                other.arcgisObjectId == arcgisObjectId) &&
            (identical(other.incidentUuid, incidentUuid) ||
                other.incidentUuid == incidentUuid) &&
            (identical(other.lat, lat) || other.lat == lat) &&
            (identical(other.lng, lng) || other.lng == lng) &&
            (identical(other.type, type) || other.type == type) &&
            (identical(other.severity, severity) ||
                other.severity == severity) &&
            (identical(other.status, status) || other.status == status));
  }

  @override
  int get hashCode => Object.hash(runtimeType, arcgisObjectId, incidentUuid,
      lat, lng, type, severity, status);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$IncidentArcgisModelImplCopyWith<_$IncidentArcgisModelImpl> get copyWith =>
      __$$IncidentArcgisModelImplCopyWithImpl<_$IncidentArcgisModelImpl>(
          this, _$identity);
}

abstract class _IncidentArcgisModel extends IncidentArcgisModel {
  const factory _IncidentArcgisModel(
      {required final String arcgisObjectId,
      required final String incidentUuid,
      required final double lat,
      required final double lng,
      required final String type,
      required final String severity,
      required final String status}) = _$IncidentArcgisModelImpl;
  const _IncidentArcgisModel._() : super._();

  @override
  String get arcgisObjectId;
  @override
  String get incidentUuid;
  @override
  double get lat;
  @override // vĩ độ
  double get lng;
  @override // kinh độ
  String get type;
  @override // loại sự cố traffic, accident, construction, etc.
  String get severity;
  @override // mức độ sự cố
  String get status;
  @override
  @JsonKey(ignore: true)
  _$$IncidentArcgisModelImplCopyWith<_$IncidentArcgisModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
