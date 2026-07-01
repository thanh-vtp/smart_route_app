// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'incident_arcgis_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$IncidentArcgisModel {

 String get arcgisObjectId; String get incidentUuid; double get lat; double get lng; String get type; String get severity; String get status;
/// Create a copy of IncidentArcgisModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$IncidentArcgisModelCopyWith<IncidentArcgisModel> get copyWith => _$IncidentArcgisModelCopyWithImpl<IncidentArcgisModel>(this as IncidentArcgisModel, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is IncidentArcgisModel&&(identical(other.arcgisObjectId, arcgisObjectId) || other.arcgisObjectId == arcgisObjectId)&&(identical(other.incidentUuid, incidentUuid) || other.incidentUuid == incidentUuid)&&(identical(other.lat, lat) || other.lat == lat)&&(identical(other.lng, lng) || other.lng == lng)&&(identical(other.type, type) || other.type == type)&&(identical(other.severity, severity) || other.severity == severity)&&(identical(other.status, status) || other.status == status));
}


@override
int get hashCode => Object.hash(runtimeType,arcgisObjectId,incidentUuid,lat,lng,type,severity,status);

@override
String toString() {
  return 'IncidentArcgisModel(arcgisObjectId: $arcgisObjectId, incidentUuid: $incidentUuid, lat: $lat, lng: $lng, type: $type, severity: $severity, status: $status)';
}


}

/// @nodoc
abstract mixin class $IncidentArcgisModelCopyWith<$Res>  {
  factory $IncidentArcgisModelCopyWith(IncidentArcgisModel value, $Res Function(IncidentArcgisModel) _then) = _$IncidentArcgisModelCopyWithImpl;
@useResult
$Res call({
 String arcgisObjectId, String incidentUuid, double lat, double lng, String type, String severity, String status
});




}
/// @nodoc
class _$IncidentArcgisModelCopyWithImpl<$Res>
    implements $IncidentArcgisModelCopyWith<$Res> {
  _$IncidentArcgisModelCopyWithImpl(this._self, this._then);

  final IncidentArcgisModel _self;
  final $Res Function(IncidentArcgisModel) _then;

/// Create a copy of IncidentArcgisModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? arcgisObjectId = null,Object? incidentUuid = null,Object? lat = null,Object? lng = null,Object? type = null,Object? severity = null,Object? status = null,}) {
  return _then(_self.copyWith(
arcgisObjectId: null == arcgisObjectId ? _self.arcgisObjectId : arcgisObjectId // ignore: cast_nullable_to_non_nullable
as String,incidentUuid: null == incidentUuid ? _self.incidentUuid : incidentUuid // ignore: cast_nullable_to_non_nullable
as String,lat: null == lat ? _self.lat : lat // ignore: cast_nullable_to_non_nullable
as double,lng: null == lng ? _self.lng : lng // ignore: cast_nullable_to_non_nullable
as double,type: null == type ? _self.type : type // ignore: cast_nullable_to_non_nullable
as String,severity: null == severity ? _self.severity : severity // ignore: cast_nullable_to_non_nullable
as String,status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// Adds pattern-matching-related methods to [IncidentArcgisModel].
extension IncidentArcgisModelPatterns on IncidentArcgisModel {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _IncidentArcgisModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _IncidentArcgisModel() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _IncidentArcgisModel value)  $default,){
final _that = this;
switch (_that) {
case _IncidentArcgisModel():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _IncidentArcgisModel value)?  $default,){
final _that = this;
switch (_that) {
case _IncidentArcgisModel() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String arcgisObjectId,  String incidentUuid,  double lat,  double lng,  String type,  String severity,  String status)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _IncidentArcgisModel() when $default != null:
return $default(_that.arcgisObjectId,_that.incidentUuid,_that.lat,_that.lng,_that.type,_that.severity,_that.status);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String arcgisObjectId,  String incidentUuid,  double lat,  double lng,  String type,  String severity,  String status)  $default,) {final _that = this;
switch (_that) {
case _IncidentArcgisModel():
return $default(_that.arcgisObjectId,_that.incidentUuid,_that.lat,_that.lng,_that.type,_that.severity,_that.status);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String arcgisObjectId,  String incidentUuid,  double lat,  double lng,  String type,  String severity,  String status)?  $default,) {final _that = this;
switch (_that) {
case _IncidentArcgisModel() when $default != null:
return $default(_that.arcgisObjectId,_that.incidentUuid,_that.lat,_that.lng,_that.type,_that.severity,_that.status);case _:
  return null;

}
}

}

/// @nodoc


class _IncidentArcgisModel extends IncidentArcgisModel {
  const _IncidentArcgisModel({required this.arcgisObjectId, required this.incidentUuid, required this.lat, required this.lng, required this.type, required this.severity, required this.status}): super._();
  

@override final  String arcgisObjectId;
@override final  String incidentUuid;
@override final  double lat;
@override final  double lng;
@override final  String type;
@override final  String severity;
@override final  String status;

/// Create a copy of IncidentArcgisModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$IncidentArcgisModelCopyWith<_IncidentArcgisModel> get copyWith => __$IncidentArcgisModelCopyWithImpl<_IncidentArcgisModel>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _IncidentArcgisModel&&(identical(other.arcgisObjectId, arcgisObjectId) || other.arcgisObjectId == arcgisObjectId)&&(identical(other.incidentUuid, incidentUuid) || other.incidentUuid == incidentUuid)&&(identical(other.lat, lat) || other.lat == lat)&&(identical(other.lng, lng) || other.lng == lng)&&(identical(other.type, type) || other.type == type)&&(identical(other.severity, severity) || other.severity == severity)&&(identical(other.status, status) || other.status == status));
}


@override
int get hashCode => Object.hash(runtimeType,arcgisObjectId,incidentUuid,lat,lng,type,severity,status);

@override
String toString() {
  return 'IncidentArcgisModel(arcgisObjectId: $arcgisObjectId, incidentUuid: $incidentUuid, lat: $lat, lng: $lng, type: $type, severity: $severity, status: $status)';
}


}

/// @nodoc
abstract mixin class _$IncidentArcgisModelCopyWith<$Res> implements $IncidentArcgisModelCopyWith<$Res> {
  factory _$IncidentArcgisModelCopyWith(_IncidentArcgisModel value, $Res Function(_IncidentArcgisModel) _then) = __$IncidentArcgisModelCopyWithImpl;
@override @useResult
$Res call({
 String arcgisObjectId, String incidentUuid, double lat, double lng, String type, String severity, String status
});




}
/// @nodoc
class __$IncidentArcgisModelCopyWithImpl<$Res>
    implements _$IncidentArcgisModelCopyWith<$Res> {
  __$IncidentArcgisModelCopyWithImpl(this._self, this._then);

  final _IncidentArcgisModel _self;
  final $Res Function(_IncidentArcgisModel) _then;

/// Create a copy of IncidentArcgisModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? arcgisObjectId = null,Object? incidentUuid = null,Object? lat = null,Object? lng = null,Object? type = null,Object? severity = null,Object? status = null,}) {
  return _then(_IncidentArcgisModel(
arcgisObjectId: null == arcgisObjectId ? _self.arcgisObjectId : arcgisObjectId // ignore: cast_nullable_to_non_nullable
as String,incidentUuid: null == incidentUuid ? _self.incidentUuid : incidentUuid // ignore: cast_nullable_to_non_nullable
as String,lat: null == lat ? _self.lat : lat // ignore: cast_nullable_to_non_nullable
as double,lng: null == lng ? _self.lng : lng // ignore: cast_nullable_to_non_nullable
as double,type: null == type ? _self.type : type // ignore: cast_nullable_to_non_nullable
as String,severity: null == severity ? _self.severity : severity // ignore: cast_nullable_to_non_nullable
as String,status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on
