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
  String? get arcgisObjectId => throw _privateConstructorUsedError;
  String get type =>
      throw _privateConstructorUsedError; // loại sự cố traffic, accident, construction, etc.
  String get severity => throw _privateConstructorUsedError; // mức độ sự cố
  double get lat => throw _privateConstructorUsedError; // vĩ độ
  double get lng => throw _privateConstructorUsedError; // kinh độ
  String? get description => throw _privateConstructorUsedError;
  String? get address => throw _privateConstructorUsedError;
  String? get reportedBy => throw _privateConstructorUsedError;
  int get upvotes => throw _privateConstructorUsedError;
  int get downvotes => throw _privateConstructorUsedError;
  String get status => throw _privateConstructorUsedError;
  DateTime? get expiresAt => throw _privateConstructorUsedError;
  DateTime? get createdAt => throw _privateConstructorUsedError;
  DateTime? get updatedAt => throw _privateConstructorUsedError;

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
      String? arcgisObjectId,
      String type,
      String severity,
      double lat,
      double lng,
      String? description,
      String? address,
      String? reportedBy,
      int upvotes,
      int downvotes,
      String status,
      DateTime? expiresAt,
      DateTime? createdAt,
      DateTime? updatedAt});
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
    Object? arcgisObjectId = freezed,
    Object? type = null,
    Object? severity = null,
    Object? lat = null,
    Object? lng = null,
    Object? description = freezed,
    Object? address = freezed,
    Object? reportedBy = freezed,
    Object? upvotes = null,
    Object? downvotes = null,
    Object? status = null,
    Object? expiresAt = freezed,
    Object? createdAt = freezed,
    Object? updatedAt = freezed,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      arcgisObjectId: freezed == arcgisObjectId
          ? _value.arcgisObjectId
          : arcgisObjectId // ignore: cast_nullable_to_non_nullable
              as String?,
      type: null == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as String,
      severity: null == severity
          ? _value.severity
          : severity // ignore: cast_nullable_to_non_nullable
              as String,
      lat: null == lat
          ? _value.lat
          : lat // ignore: cast_nullable_to_non_nullable
              as double,
      lng: null == lng
          ? _value.lng
          : lng // ignore: cast_nullable_to_non_nullable
              as double,
      description: freezed == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String?,
      address: freezed == address
          ? _value.address
          : address // ignore: cast_nullable_to_non_nullable
              as String?,
      reportedBy: freezed == reportedBy
          ? _value.reportedBy
          : reportedBy // ignore: cast_nullable_to_non_nullable
              as String?,
      upvotes: null == upvotes
          ? _value.upvotes
          : upvotes // ignore: cast_nullable_to_non_nullable
              as int,
      downvotes: null == downvotes
          ? _value.downvotes
          : downvotes // ignore: cast_nullable_to_non_nullable
              as int,
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as String,
      expiresAt: freezed == expiresAt
          ? _value.expiresAt
          : expiresAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      createdAt: freezed == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      updatedAt: freezed == updatedAt
          ? _value.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
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
      String? arcgisObjectId,
      String type,
      String severity,
      double lat,
      double lng,
      String? description,
      String? address,
      String? reportedBy,
      int upvotes,
      int downvotes,
      String status,
      DateTime? expiresAt,
      DateTime? createdAt,
      DateTime? updatedAt});
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
    Object? arcgisObjectId = freezed,
    Object? type = null,
    Object? severity = null,
    Object? lat = null,
    Object? lng = null,
    Object? description = freezed,
    Object? address = freezed,
    Object? reportedBy = freezed,
    Object? upvotes = null,
    Object? downvotes = null,
    Object? status = null,
    Object? expiresAt = freezed,
    Object? createdAt = freezed,
    Object? updatedAt = freezed,
  }) {
    return _then(_$IncidentImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      arcgisObjectId: freezed == arcgisObjectId
          ? _value.arcgisObjectId
          : arcgisObjectId // ignore: cast_nullable_to_non_nullable
              as String?,
      type: null == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as String,
      severity: null == severity
          ? _value.severity
          : severity // ignore: cast_nullable_to_non_nullable
              as String,
      lat: null == lat
          ? _value.lat
          : lat // ignore: cast_nullable_to_non_nullable
              as double,
      lng: null == lng
          ? _value.lng
          : lng // ignore: cast_nullable_to_non_nullable
              as double,
      description: freezed == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String?,
      address: freezed == address
          ? _value.address
          : address // ignore: cast_nullable_to_non_nullable
              as String?,
      reportedBy: freezed == reportedBy
          ? _value.reportedBy
          : reportedBy // ignore: cast_nullable_to_non_nullable
              as String?,
      upvotes: null == upvotes
          ? _value.upvotes
          : upvotes // ignore: cast_nullable_to_non_nullable
              as int,
      downvotes: null == downvotes
          ? _value.downvotes
          : downvotes // ignore: cast_nullable_to_non_nullable
              as int,
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as String,
      expiresAt: freezed == expiresAt
          ? _value.expiresAt
          : expiresAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      createdAt: freezed == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      updatedAt: freezed == updatedAt
          ? _value.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
    ));
  }
}

/// @nodoc

class _$IncidentImpl implements _Incident {
  const _$IncidentImpl(
      {required this.id,
      this.arcgisObjectId,
      required this.type,
      required this.severity,
      required this.lat,
      required this.lng,
      this.description,
      this.address,
      this.reportedBy,
      this.upvotes = 0,
      this.downvotes = 0,
      this.status = 'active',
      this.expiresAt,
      this.createdAt,
      this.updatedAt});

  @override
  final String id;
  @override
  final String? arcgisObjectId;
  @override
  final String type;
// loại sự cố traffic, accident, construction, etc.
  @override
  final String severity;
// mức độ sự cố
  @override
  final double lat;
// vĩ độ
  @override
  final double lng;
// kinh độ
  @override
  final String? description;
  @override
  final String? address;
  @override
  final String? reportedBy;
  @override
  @JsonKey()
  final int upvotes;
  @override
  @JsonKey()
  final int downvotes;
  @override
  @JsonKey()
  final String status;
  @override
  final DateTime? expiresAt;
  @override
  final DateTime? createdAt;
  @override
  final DateTime? updatedAt;

  @override
  String toString() {
    return 'Incident(id: $id, arcgisObjectId: $arcgisObjectId, type: $type, severity: $severity, lat: $lat, lng: $lng, description: $description, address: $address, reportedBy: $reportedBy, upvotes: $upvotes, downvotes: $downvotes, status: $status, expiresAt: $expiresAt, createdAt: $createdAt, updatedAt: $updatedAt)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$IncidentImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.arcgisObjectId, arcgisObjectId) ||
                other.arcgisObjectId == arcgisObjectId) &&
            (identical(other.type, type) || other.type == type) &&
            (identical(other.severity, severity) ||
                other.severity == severity) &&
            (identical(other.lat, lat) || other.lat == lat) &&
            (identical(other.lng, lng) || other.lng == lng) &&
            (identical(other.description, description) ||
                other.description == description) &&
            (identical(other.address, address) || other.address == address) &&
            (identical(other.reportedBy, reportedBy) ||
                other.reportedBy == reportedBy) &&
            (identical(other.upvotes, upvotes) || other.upvotes == upvotes) &&
            (identical(other.downvotes, downvotes) ||
                other.downvotes == downvotes) &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.expiresAt, expiresAt) ||
                other.expiresAt == expiresAt) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt) &&
            (identical(other.updatedAt, updatedAt) ||
                other.updatedAt == updatedAt));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      id,
      arcgisObjectId,
      type,
      severity,
      lat,
      lng,
      description,
      address,
      reportedBy,
      upvotes,
      downvotes,
      status,
      expiresAt,
      createdAt,
      updatedAt);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$IncidentImplCopyWith<_$IncidentImpl> get copyWith =>
      __$$IncidentImplCopyWithImpl<_$IncidentImpl>(this, _$identity);
}

abstract class _Incident implements Incident {
  const factory _Incident(
      {required final String id,
      final String? arcgisObjectId,
      required final String type,
      required final String severity,
      required final double lat,
      required final double lng,
      final String? description,
      final String? address,
      final String? reportedBy,
      final int upvotes,
      final int downvotes,
      final String status,
      final DateTime? expiresAt,
      final DateTime? createdAt,
      final DateTime? updatedAt}) = _$IncidentImpl;

  @override
  String get id;
  @override
  String? get arcgisObjectId;
  @override
  String get type;
  @override // loại sự cố traffic, accident, construction, etc.
  String get severity;
  @override // mức độ sự cố
  double get lat;
  @override // vĩ độ
  double get lng;
  @override // kinh độ
  String? get description;
  @override
  String? get address;
  @override
  String? get reportedBy;
  @override
  int get upvotes;
  @override
  int get downvotes;
  @override
  String get status;
  @override
  DateTime? get expiresAt;
  @override
  DateTime? get createdAt;
  @override
  DateTime? get updatedAt;
  @override
  @JsonKey(ignore: true)
  _$$IncidentImplCopyWith<_$IncidentImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
