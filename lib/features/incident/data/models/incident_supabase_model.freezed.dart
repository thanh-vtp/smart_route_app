// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'incident_supabase_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$IncidentSupabaseModel {

 String get id;@JsonKey(name: 'arcgis_object_id') String? get arcgisObjectId; String get type; String get severity; double get lat; double get lng; String? get description; String? get address;@JsonKey(name: 'reported_by') String? get reportedBy; int get upvotes; int get downvotes; String get status;@JsonKey(name: 'expires_at') DateTime? get expiresAt;@JsonKey(name: 'created_at') DateTime? get createdAt;@JsonKey(name: 'updated_at') DateTime? get updatedAt;
/// Create a copy of IncidentSupabaseModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$IncidentSupabaseModelCopyWith<IncidentSupabaseModel> get copyWith => _$IncidentSupabaseModelCopyWithImpl<IncidentSupabaseModel>(this as IncidentSupabaseModel, _$identity);

  /// Serializes this IncidentSupabaseModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is IncidentSupabaseModel&&(identical(other.id, id) || other.id == id)&&(identical(other.arcgisObjectId, arcgisObjectId) || other.arcgisObjectId == arcgisObjectId)&&(identical(other.type, type) || other.type == type)&&(identical(other.severity, severity) || other.severity == severity)&&(identical(other.lat, lat) || other.lat == lat)&&(identical(other.lng, lng) || other.lng == lng)&&(identical(other.description, description) || other.description == description)&&(identical(other.address, address) || other.address == address)&&(identical(other.reportedBy, reportedBy) || other.reportedBy == reportedBy)&&(identical(other.upvotes, upvotes) || other.upvotes == upvotes)&&(identical(other.downvotes, downvotes) || other.downvotes == downvotes)&&(identical(other.status, status) || other.status == status)&&(identical(other.expiresAt, expiresAt) || other.expiresAt == expiresAt)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.updatedAt, updatedAt) || other.updatedAt == updatedAt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,arcgisObjectId,type,severity,lat,lng,description,address,reportedBy,upvotes,downvotes,status,expiresAt,createdAt,updatedAt);

@override
String toString() {
  return 'IncidentSupabaseModel(id: $id, arcgisObjectId: $arcgisObjectId, type: $type, severity: $severity, lat: $lat, lng: $lng, description: $description, address: $address, reportedBy: $reportedBy, upvotes: $upvotes, downvotes: $downvotes, status: $status, expiresAt: $expiresAt, createdAt: $createdAt, updatedAt: $updatedAt)';
}


}

/// @nodoc
abstract mixin class $IncidentSupabaseModelCopyWith<$Res>  {
  factory $IncidentSupabaseModelCopyWith(IncidentSupabaseModel value, $Res Function(IncidentSupabaseModel) _then) = _$IncidentSupabaseModelCopyWithImpl;
@useResult
$Res call({
 String id,@JsonKey(name: 'arcgis_object_id') String? arcgisObjectId, String type, String severity, double lat, double lng, String? description, String? address,@JsonKey(name: 'reported_by') String? reportedBy, int upvotes, int downvotes, String status,@JsonKey(name: 'expires_at') DateTime? expiresAt,@JsonKey(name: 'created_at') DateTime? createdAt,@JsonKey(name: 'updated_at') DateTime? updatedAt
});




}
/// @nodoc
class _$IncidentSupabaseModelCopyWithImpl<$Res>
    implements $IncidentSupabaseModelCopyWith<$Res> {
  _$IncidentSupabaseModelCopyWithImpl(this._self, this._then);

  final IncidentSupabaseModel _self;
  final $Res Function(IncidentSupabaseModel) _then;

/// Create a copy of IncidentSupabaseModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? arcgisObjectId = freezed,Object? type = null,Object? severity = null,Object? lat = null,Object? lng = null,Object? description = freezed,Object? address = freezed,Object? reportedBy = freezed,Object? upvotes = null,Object? downvotes = null,Object? status = null,Object? expiresAt = freezed,Object? createdAt = freezed,Object? updatedAt = freezed,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,arcgisObjectId: freezed == arcgisObjectId ? _self.arcgisObjectId : arcgisObjectId // ignore: cast_nullable_to_non_nullable
as String?,type: null == type ? _self.type : type // ignore: cast_nullable_to_non_nullable
as String,severity: null == severity ? _self.severity : severity // ignore: cast_nullable_to_non_nullable
as String,lat: null == lat ? _self.lat : lat // ignore: cast_nullable_to_non_nullable
as double,lng: null == lng ? _self.lng : lng // ignore: cast_nullable_to_non_nullable
as double,description: freezed == description ? _self.description : description // ignore: cast_nullable_to_non_nullable
as String?,address: freezed == address ? _self.address : address // ignore: cast_nullable_to_non_nullable
as String?,reportedBy: freezed == reportedBy ? _self.reportedBy : reportedBy // ignore: cast_nullable_to_non_nullable
as String?,upvotes: null == upvotes ? _self.upvotes : upvotes // ignore: cast_nullable_to_non_nullable
as int,downvotes: null == downvotes ? _self.downvotes : downvotes // ignore: cast_nullable_to_non_nullable
as int,status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as String,expiresAt: freezed == expiresAt ? _self.expiresAt : expiresAt // ignore: cast_nullable_to_non_nullable
as DateTime?,createdAt: freezed == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime?,updatedAt: freezed == updatedAt ? _self.updatedAt : updatedAt // ignore: cast_nullable_to_non_nullable
as DateTime?,
  ));
}

}


/// Adds pattern-matching-related methods to [IncidentSupabaseModel].
extension IncidentSupabaseModelPatterns on IncidentSupabaseModel {
/// A variant of `map` that fallback to returning `orElse`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _IncidentSupabaseModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _IncidentSupabaseModel() when $default != null:
return $default(_that);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// Callbacks receives the raw object, upcasted.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case final Subclass2 value:
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _IncidentSupabaseModel value)  $default,){
final _that = this;
switch (_that) {
case _IncidentSupabaseModel():
return $default(_that);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `map` that fallback to returning `null`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _IncidentSupabaseModel value)?  $default,){
final _that = this;
switch (_that) {
case _IncidentSupabaseModel() when $default != null:
return $default(_that);case _:
  return null;

}
}
/// A variant of `when` that fallback to an `orElse` callback.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id, @JsonKey(name: 'arcgis_object_id')  String? arcgisObjectId,  String type,  String severity,  double lat,  double lng,  String? description,  String? address, @JsonKey(name: 'reported_by')  String? reportedBy,  int upvotes,  int downvotes,  String status, @JsonKey(name: 'expires_at')  DateTime? expiresAt, @JsonKey(name: 'created_at')  DateTime? createdAt, @JsonKey(name: 'updated_at')  DateTime? updatedAt)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _IncidentSupabaseModel() when $default != null:
return $default(_that.id,_that.arcgisObjectId,_that.type,_that.severity,_that.lat,_that.lng,_that.description,_that.address,_that.reportedBy,_that.upvotes,_that.downvotes,_that.status,_that.expiresAt,_that.createdAt,_that.updatedAt);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// As opposed to `map`, this offers destructuring.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case Subclass2(:final field2):
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id, @JsonKey(name: 'arcgis_object_id')  String? arcgisObjectId,  String type,  String severity,  double lat,  double lng,  String? description,  String? address, @JsonKey(name: 'reported_by')  String? reportedBy,  int upvotes,  int downvotes,  String status, @JsonKey(name: 'expires_at')  DateTime? expiresAt, @JsonKey(name: 'created_at')  DateTime? createdAt, @JsonKey(name: 'updated_at')  DateTime? updatedAt)  $default,) {final _that = this;
switch (_that) {
case _IncidentSupabaseModel():
return $default(_that.id,_that.arcgisObjectId,_that.type,_that.severity,_that.lat,_that.lng,_that.description,_that.address,_that.reportedBy,_that.upvotes,_that.downvotes,_that.status,_that.expiresAt,_that.createdAt,_that.updatedAt);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `when` that fallback to returning `null`
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id, @JsonKey(name: 'arcgis_object_id')  String? arcgisObjectId,  String type,  String severity,  double lat,  double lng,  String? description,  String? address, @JsonKey(name: 'reported_by')  String? reportedBy,  int upvotes,  int downvotes,  String status, @JsonKey(name: 'expires_at')  DateTime? expiresAt, @JsonKey(name: 'created_at')  DateTime? createdAt, @JsonKey(name: 'updated_at')  DateTime? updatedAt)?  $default,) {final _that = this;
switch (_that) {
case _IncidentSupabaseModel() when $default != null:
return $default(_that.id,_that.arcgisObjectId,_that.type,_that.severity,_that.lat,_that.lng,_that.description,_that.address,_that.reportedBy,_that.upvotes,_that.downvotes,_that.status,_that.expiresAt,_that.createdAt,_that.updatedAt);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _IncidentSupabaseModel extends IncidentSupabaseModel {
  const _IncidentSupabaseModel({required this.id, @JsonKey(name: 'arcgis_object_id') required this.arcgisObjectId, required this.type, required this.severity, required this.lat, required this.lng, this.description, this.address, @JsonKey(name: 'reported_by') this.reportedBy, this.upvotes = 0, this.downvotes = 0, this.status = 'active', @JsonKey(name: 'expires_at') this.expiresAt, @JsonKey(name: 'created_at') this.createdAt, @JsonKey(name: 'updated_at') this.updatedAt}): super._();
  factory _IncidentSupabaseModel.fromJson(Map<String, dynamic> json) => _$IncidentSupabaseModelFromJson(json);

@override final  String id;
@override@JsonKey(name: 'arcgis_object_id') final  String? arcgisObjectId;
@override final  String type;
@override final  String severity;
@override final  double lat;
@override final  double lng;
@override final  String? description;
@override final  String? address;
@override@JsonKey(name: 'reported_by') final  String? reportedBy;
@override@JsonKey() final  int upvotes;
@override@JsonKey() final  int downvotes;
@override@JsonKey() final  String status;
@override@JsonKey(name: 'expires_at') final  DateTime? expiresAt;
@override@JsonKey(name: 'created_at') final  DateTime? createdAt;
@override@JsonKey(name: 'updated_at') final  DateTime? updatedAt;

/// Create a copy of IncidentSupabaseModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$IncidentSupabaseModelCopyWith<_IncidentSupabaseModel> get copyWith => __$IncidentSupabaseModelCopyWithImpl<_IncidentSupabaseModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$IncidentSupabaseModelToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _IncidentSupabaseModel&&(identical(other.id, id) || other.id == id)&&(identical(other.arcgisObjectId, arcgisObjectId) || other.arcgisObjectId == arcgisObjectId)&&(identical(other.type, type) || other.type == type)&&(identical(other.severity, severity) || other.severity == severity)&&(identical(other.lat, lat) || other.lat == lat)&&(identical(other.lng, lng) || other.lng == lng)&&(identical(other.description, description) || other.description == description)&&(identical(other.address, address) || other.address == address)&&(identical(other.reportedBy, reportedBy) || other.reportedBy == reportedBy)&&(identical(other.upvotes, upvotes) || other.upvotes == upvotes)&&(identical(other.downvotes, downvotes) || other.downvotes == downvotes)&&(identical(other.status, status) || other.status == status)&&(identical(other.expiresAt, expiresAt) || other.expiresAt == expiresAt)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.updatedAt, updatedAt) || other.updatedAt == updatedAt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,arcgisObjectId,type,severity,lat,lng,description,address,reportedBy,upvotes,downvotes,status,expiresAt,createdAt,updatedAt);

@override
String toString() {
  return 'IncidentSupabaseModel(id: $id, arcgisObjectId: $arcgisObjectId, type: $type, severity: $severity, lat: $lat, lng: $lng, description: $description, address: $address, reportedBy: $reportedBy, upvotes: $upvotes, downvotes: $downvotes, status: $status, expiresAt: $expiresAt, createdAt: $createdAt, updatedAt: $updatedAt)';
}


}

/// @nodoc
abstract mixin class _$IncidentSupabaseModelCopyWith<$Res> implements $IncidentSupabaseModelCopyWith<$Res> {
  factory _$IncidentSupabaseModelCopyWith(_IncidentSupabaseModel value, $Res Function(_IncidentSupabaseModel) _then) = __$IncidentSupabaseModelCopyWithImpl;
@override @useResult
$Res call({
 String id,@JsonKey(name: 'arcgis_object_id') String? arcgisObjectId, String type, String severity, double lat, double lng, String? description, String? address,@JsonKey(name: 'reported_by') String? reportedBy, int upvotes, int downvotes, String status,@JsonKey(name: 'expires_at') DateTime? expiresAt,@JsonKey(name: 'created_at') DateTime? createdAt,@JsonKey(name: 'updated_at') DateTime? updatedAt
});




}
/// @nodoc
class __$IncidentSupabaseModelCopyWithImpl<$Res>
    implements _$IncidentSupabaseModelCopyWith<$Res> {
  __$IncidentSupabaseModelCopyWithImpl(this._self, this._then);

  final _IncidentSupabaseModel _self;
  final $Res Function(_IncidentSupabaseModel) _then;

/// Create a copy of IncidentSupabaseModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? arcgisObjectId = freezed,Object? type = null,Object? severity = null,Object? lat = null,Object? lng = null,Object? description = freezed,Object? address = freezed,Object? reportedBy = freezed,Object? upvotes = null,Object? downvotes = null,Object? status = null,Object? expiresAt = freezed,Object? createdAt = freezed,Object? updatedAt = freezed,}) {
  return _then(_IncidentSupabaseModel(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,arcgisObjectId: freezed == arcgisObjectId ? _self.arcgisObjectId : arcgisObjectId // ignore: cast_nullable_to_non_nullable
as String?,type: null == type ? _self.type : type // ignore: cast_nullable_to_non_nullable
as String,severity: null == severity ? _self.severity : severity // ignore: cast_nullable_to_non_nullable
as String,lat: null == lat ? _self.lat : lat // ignore: cast_nullable_to_non_nullable
as double,lng: null == lng ? _self.lng : lng // ignore: cast_nullable_to_non_nullable
as double,description: freezed == description ? _self.description : description // ignore: cast_nullable_to_non_nullable
as String?,address: freezed == address ? _self.address : address // ignore: cast_nullable_to_non_nullable
as String?,reportedBy: freezed == reportedBy ? _self.reportedBy : reportedBy // ignore: cast_nullable_to_non_nullable
as String?,upvotes: null == upvotes ? _self.upvotes : upvotes // ignore: cast_nullable_to_non_nullable
as int,downvotes: null == downvotes ? _self.downvotes : downvotes // ignore: cast_nullable_to_non_nullable
as int,status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as String,expiresAt: freezed == expiresAt ? _self.expiresAt : expiresAt // ignore: cast_nullable_to_non_nullable
as DateTime?,createdAt: freezed == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime?,updatedAt: freezed == updatedAt ? _self.updatedAt : updatedAt // ignore: cast_nullable_to_non_nullable
as DateTime?,
  ));
}


}

// dart format on
