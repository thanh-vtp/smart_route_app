// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'incident_supabase_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

IncidentSupabaseModel _$IncidentSupabaseModelFromJson(
    Map<String, dynamic> json) {
  return _IncidentSupabaseModel.fromJson(json);
}

/// @nodoc
mixin _$IncidentSupabaseModel {
  String get id => throw _privateConstructorUsedError;
  @JsonKey(name: 'arcgis_object_id')
  String? get arcgisObjectId => throw _privateConstructorUsedError;
  String get type => throw _privateConstructorUsedError;
  String get severity => throw _privateConstructorUsedError;
  double get lat => throw _privateConstructorUsedError; // vĩ độ
  double get lng => throw _privateConstructorUsedError; // kinh độ
  String? get description => throw _privateConstructorUsedError;
  String? get address => throw _privateConstructorUsedError;
  @JsonKey(name: 'reported_by')
  String? get reportedBy => throw _privateConstructorUsedError;
  int get upvotes => throw _privateConstructorUsedError;
  int get downvotes => throw _privateConstructorUsedError;
  String get status => throw _privateConstructorUsedError;
  @JsonKey(name: 'expires_at')
  DateTime? get expiresAt => throw _privateConstructorUsedError;
  @JsonKey(name: 'created_at')
  DateTime? get createdAt => throw _privateConstructorUsedError;
  @JsonKey(name: 'updated_at')
  DateTime? get updatedAt => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $IncidentSupabaseModelCopyWith<IncidentSupabaseModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $IncidentSupabaseModelCopyWith<$Res> {
  factory $IncidentSupabaseModelCopyWith(IncidentSupabaseModel value,
          $Res Function(IncidentSupabaseModel) then) =
      _$IncidentSupabaseModelCopyWithImpl<$Res, IncidentSupabaseModel>;
  @useResult
  $Res call(
      {String id,
      @JsonKey(name: 'arcgis_object_id') String? arcgisObjectId,
      String type,
      String severity,
      double lat,
      double lng,
      String? description,
      String? address,
      @JsonKey(name: 'reported_by') String? reportedBy,
      int upvotes,
      int downvotes,
      String status,
      @JsonKey(name: 'expires_at') DateTime? expiresAt,
      @JsonKey(name: 'created_at') DateTime? createdAt,
      @JsonKey(name: 'updated_at') DateTime? updatedAt});
}

/// @nodoc
class _$IncidentSupabaseModelCopyWithImpl<$Res,
        $Val extends IncidentSupabaseModel>
    implements $IncidentSupabaseModelCopyWith<$Res> {
  _$IncidentSupabaseModelCopyWithImpl(this._value, this._then);

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
abstract class _$$IncidentSupabaseModelImplCopyWith<$Res>
    implements $IncidentSupabaseModelCopyWith<$Res> {
  factory _$$IncidentSupabaseModelImplCopyWith(
          _$IncidentSupabaseModelImpl value,
          $Res Function(_$IncidentSupabaseModelImpl) then) =
      __$$IncidentSupabaseModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String id,
      @JsonKey(name: 'arcgis_object_id') String? arcgisObjectId,
      String type,
      String severity,
      double lat,
      double lng,
      String? description,
      String? address,
      @JsonKey(name: 'reported_by') String? reportedBy,
      int upvotes,
      int downvotes,
      String status,
      @JsonKey(name: 'expires_at') DateTime? expiresAt,
      @JsonKey(name: 'created_at') DateTime? createdAt,
      @JsonKey(name: 'updated_at') DateTime? updatedAt});
}

/// @nodoc
class __$$IncidentSupabaseModelImplCopyWithImpl<$Res>
    extends _$IncidentSupabaseModelCopyWithImpl<$Res,
        _$IncidentSupabaseModelImpl>
    implements _$$IncidentSupabaseModelImplCopyWith<$Res> {
  __$$IncidentSupabaseModelImplCopyWithImpl(_$IncidentSupabaseModelImpl _value,
      $Res Function(_$IncidentSupabaseModelImpl) _then)
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
    return _then(_$IncidentSupabaseModelImpl(
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
@JsonSerializable()
class _$IncidentSupabaseModelImpl extends _IncidentSupabaseModel {
  const _$IncidentSupabaseModelImpl(
      {required this.id,
      @JsonKey(name: 'arcgis_object_id') required this.arcgisObjectId,
      required this.type,
      required this.severity,
      required this.lat,
      required this.lng,
      this.description,
      this.address,
      @JsonKey(name: 'reported_by') this.reportedBy,
      this.upvotes = 0,
      this.downvotes = 0,
      this.status = 'active',
      @JsonKey(name: 'expires_at') this.expiresAt,
      @JsonKey(name: 'created_at') this.createdAt,
      @JsonKey(name: 'updated_at') this.updatedAt})
      : super._();

  factory _$IncidentSupabaseModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$IncidentSupabaseModelImplFromJson(json);

  @override
  final String id;
  @override
  @JsonKey(name: 'arcgis_object_id')
  final String? arcgisObjectId;
  @override
  final String type;
  @override
  final String severity;
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
  @JsonKey(name: 'reported_by')
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
  @JsonKey(name: 'expires_at')
  final DateTime? expiresAt;
  @override
  @JsonKey(name: 'created_at')
  final DateTime? createdAt;
  @override
  @JsonKey(name: 'updated_at')
  final DateTime? updatedAt;

  @override
  String toString() {
    return 'IncidentSupabaseModel(id: $id, arcgisObjectId: $arcgisObjectId, type: $type, severity: $severity, lat: $lat, lng: $lng, description: $description, address: $address, reportedBy: $reportedBy, upvotes: $upvotes, downvotes: $downvotes, status: $status, expiresAt: $expiresAt, createdAt: $createdAt, updatedAt: $updatedAt)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$IncidentSupabaseModelImpl &&
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

  @JsonKey(ignore: true)
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
  _$$IncidentSupabaseModelImplCopyWith<_$IncidentSupabaseModelImpl>
      get copyWith => __$$IncidentSupabaseModelImplCopyWithImpl<
          _$IncidentSupabaseModelImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$IncidentSupabaseModelImplToJson(
      this,
    );
  }
}

abstract class _IncidentSupabaseModel extends IncidentSupabaseModel {
  const factory _IncidentSupabaseModel(
      {required final String id,
      @JsonKey(name: 'arcgis_object_id') required final String? arcgisObjectId,
      required final String type,
      required final String severity,
      required final double lat,
      required final double lng,
      final String? description,
      final String? address,
      @JsonKey(name: 'reported_by') final String? reportedBy,
      final int upvotes,
      final int downvotes,
      final String status,
      @JsonKey(name: 'expires_at') final DateTime? expiresAt,
      @JsonKey(name: 'created_at') final DateTime? createdAt,
      @JsonKey(name: 'updated_at')
      final DateTime? updatedAt}) = _$IncidentSupabaseModelImpl;
  const _IncidentSupabaseModel._() : super._();

  factory _IncidentSupabaseModel.fromJson(Map<String, dynamic> json) =
      _$IncidentSupabaseModelImpl.fromJson;

  @override
  String get id;
  @override
  @JsonKey(name: 'arcgis_object_id')
  String? get arcgisObjectId;
  @override
  String get type;
  @override
  String get severity;
  @override
  double get lat;
  @override // vĩ độ
  double get lng;
  @override // kinh độ
  String? get description;
  @override
  String? get address;
  @override
  @JsonKey(name: 'reported_by')
  String? get reportedBy;
  @override
  int get upvotes;
  @override
  int get downvotes;
  @override
  String get status;
  @override
  @JsonKey(name: 'expires_at')
  DateTime? get expiresAt;
  @override
  @JsonKey(name: 'created_at')
  DateTime? get createdAt;
  @override
  @JsonKey(name: 'updated_at')
  DateTime? get updatedAt;
  @override
  @JsonKey(ignore: true)
  _$$IncidentSupabaseModelImplCopyWith<_$IncidentSupabaseModelImpl>
      get copyWith => throw _privateConstructorUsedError;
}
