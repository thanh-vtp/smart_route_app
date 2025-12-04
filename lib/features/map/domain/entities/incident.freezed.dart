// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'incident.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$Incident {
  String get id => throw _privateConstructorUsedError;
  String get latitude => throw _privateConstructorUsedError; // vĩ độ
  String get longitude => throw _privateConstructorUsedError; // kinh độ
  String get type =>
      throw _privateConstructorUsedError; // loại sự cố traffic, accident, construction, etc.
  String get severity => throw _privateConstructorUsedError; // mức độ sự cố
  String get description => throw _privateConstructorUsedError; // mô tả sự cố
  DateTime get reportedTime =>
      throw _privateConstructorUsedError; // thời gian báo cáo
  String? get reportedBy =>
      throw _privateConstructorUsedError; // tên người báo cáo (từ Google account)
  String? get reportedByUid =>
      throw _privateConstructorUsedError; // user ID người báo cáo
  DateTime? get creationDate =>
      throw _privateConstructorUsedError; // Thời gian ghi vào server
  DateTime? get editDate => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $IncidentCopyWith<Incident> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $IncidentCopyWith<$Res> {
  factory $IncidentCopyWith(Incident value, $Res Function(Incident) then) =
      _$IncidentCopyWithImpl<$Res, Incident>;
  @useResult
  $Res call(
      {String id,
      String latitude,
      String longitude,
      String type,
      String severity,
      String description,
      DateTime reportedTime,
      String? reportedBy,
      String? reportedByUid,
      DateTime? creationDate,
      DateTime? editDate});
}

/// @nodoc
class _$IncidentCopyWithImpl<$Res, $Val extends Incident>
    implements $IncidentCopyWith<$Res> {
  _$IncidentCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? latitude = null,
    Object? longitude = null,
    Object? type = null,
    Object? severity = null,
    Object? description = null,
    Object? reportedTime = null,
    Object? reportedBy = freezed,
    Object? reportedByUid = freezed,
    Object? creationDate = freezed,
    Object? editDate = freezed,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      latitude: null == latitude
          ? _value.latitude
          : latitude // ignore: cast_nullable_to_non_nullable
              as String,
      longitude: null == longitude
          ? _value.longitude
          : longitude // ignore: cast_nullable_to_non_nullable
              as String,
      type: null == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as String,
      severity: null == severity
          ? _value.severity
          : severity // ignore: cast_nullable_to_non_nullable
              as String,
      description: null == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
      reportedTime: null == reportedTime
          ? _value.reportedTime
          : reportedTime // ignore: cast_nullable_to_non_nullable
              as DateTime,
      reportedBy: freezed == reportedBy
          ? _value.reportedBy
          : reportedBy // ignore: cast_nullable_to_non_nullable
              as String?,
      reportedByUid: freezed == reportedByUid
          ? _value.reportedByUid
          : reportedByUid // ignore: cast_nullable_to_non_nullable
              as String?,
      creationDate: freezed == creationDate
          ? _value.creationDate
          : creationDate // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      editDate: freezed == editDate
          ? _value.editDate
          : editDate // ignore: cast_nullable_to_non_nullable
              as DateTime?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$IncidentImplCopyWith<$Res>
    implements $IncidentCopyWith<$Res> {
  factory _$$IncidentImplCopyWith(
          _$IncidentImpl value, $Res Function(_$IncidentImpl) then) =
      __$$IncidentImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String id,
      String latitude,
      String longitude,
      String type,
      String severity,
      String description,
      DateTime reportedTime,
      String? reportedBy,
      String? reportedByUid,
      DateTime? creationDate,
      DateTime? editDate});
}

/// @nodoc
class __$$IncidentImplCopyWithImpl<$Res>
    extends _$IncidentCopyWithImpl<$Res, _$IncidentImpl>
    implements _$$IncidentImplCopyWith<$Res> {
  __$$IncidentImplCopyWithImpl(
      _$IncidentImpl _value, $Res Function(_$IncidentImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? latitude = null,
    Object? longitude = null,
    Object? type = null,
    Object? severity = null,
    Object? description = null,
    Object? reportedTime = null,
    Object? reportedBy = freezed,
    Object? reportedByUid = freezed,
    Object? creationDate = freezed,
    Object? editDate = freezed,
  }) {
    return _then(_$IncidentImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      latitude: null == latitude
          ? _value.latitude
          : latitude // ignore: cast_nullable_to_non_nullable
              as String,
      longitude: null == longitude
          ? _value.longitude
          : longitude // ignore: cast_nullable_to_non_nullable
              as String,
      type: null == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as String,
      severity: null == severity
          ? _value.severity
          : severity // ignore: cast_nullable_to_non_nullable
              as String,
      description: null == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
      reportedTime: null == reportedTime
          ? _value.reportedTime
          : reportedTime // ignore: cast_nullable_to_non_nullable
              as DateTime,
      reportedBy: freezed == reportedBy
          ? _value.reportedBy
          : reportedBy // ignore: cast_nullable_to_non_nullable
              as String?,
      reportedByUid: freezed == reportedByUid
          ? _value.reportedByUid
          : reportedByUid // ignore: cast_nullable_to_non_nullable
              as String?,
      creationDate: freezed == creationDate
          ? _value.creationDate
          : creationDate // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      editDate: freezed == editDate
          ? _value.editDate
          : editDate // ignore: cast_nullable_to_non_nullable
              as DateTime?,
    ));
  }
}

/// @nodoc

class _$IncidentImpl implements _Incident {
  const _$IncidentImpl(
      {required this.id,
      required this.latitude,
      required this.longitude,
      required this.type,
      required this.severity,
      required this.description,
      required this.reportedTime,
      this.reportedBy,
      this.reportedByUid,
      this.creationDate,
      this.editDate});

  @override
  final String id;
  @override
  final String latitude;
// vĩ độ
  @override
  final String longitude;
// kinh độ
  @override
  final String type;
// loại sự cố traffic, accident, construction, etc.
  @override
  final String severity;
// mức độ sự cố
  @override
  final String description;
// mô tả sự cố
  @override
  final DateTime reportedTime;
// thời gian báo cáo
  @override
  final String? reportedBy;
// tên người báo cáo (từ Google account)
  @override
  final String? reportedByUid;
// user ID người báo cáo
  @override
  final DateTime? creationDate;
// Thời gian ghi vào server
  @override
  final DateTime? editDate;

  @override
  String toString() {
    return 'Incident(id: $id, latitude: $latitude, longitude: $longitude, type: $type, severity: $severity, description: $description, reportedTime: $reportedTime, reportedBy: $reportedBy, reportedByUid: $reportedByUid, creationDate: $creationDate, editDate: $editDate)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$IncidentImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.latitude, latitude) ||
                other.latitude == latitude) &&
            (identical(other.longitude, longitude) ||
                other.longitude == longitude) &&
            (identical(other.type, type) || other.type == type) &&
            (identical(other.severity, severity) ||
                other.severity == severity) &&
            (identical(other.description, description) ||
                other.description == description) &&
            (identical(other.reportedTime, reportedTime) ||
                other.reportedTime == reportedTime) &&
            (identical(other.reportedBy, reportedBy) ||
                other.reportedBy == reportedBy) &&
            (identical(other.reportedByUid, reportedByUid) ||
                other.reportedByUid == reportedByUid) &&
            (identical(other.creationDate, creationDate) ||
                other.creationDate == creationDate) &&
            (identical(other.editDate, editDate) ||
                other.editDate == editDate));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      id,
      latitude,
      longitude,
      type,
      severity,
      description,
      reportedTime,
      reportedBy,
      reportedByUid,
      creationDate,
      editDate);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$IncidentImplCopyWith<_$IncidentImpl> get copyWith =>
      __$$IncidentImplCopyWithImpl<_$IncidentImpl>(this, _$identity);
}

abstract class _Incident implements Incident {
  const factory _Incident(
      {required final String id,
      required final String latitude,
      required final String longitude,
      required final String type,
      required final String severity,
      required final String description,
      required final DateTime reportedTime,
      final String? reportedBy,
      final String? reportedByUid,
      final DateTime? creationDate,
      final DateTime? editDate}) = _$IncidentImpl;

  @override
  String get id;
  @override
  String get latitude;
  @override // vĩ độ
  String get longitude;
  @override // kinh độ
  String get type;
  @override // loại sự cố traffic, accident, construction, etc.
  String get severity;
  @override // mức độ sự cố
  String get description;
  @override // mô tả sự cố
  DateTime get reportedTime;
  @override // thời gian báo cáo
  String? get reportedBy;
  @override // tên người báo cáo (từ Google account)
  String? get reportedByUid;
  @override // user ID người báo cáo
  DateTime? get creationDate;
  @override // Thời gian ghi vào server
  DateTime? get editDate;
  @override
  @JsonKey(ignore: true)
  _$$IncidentImplCopyWith<_$IncidentImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
