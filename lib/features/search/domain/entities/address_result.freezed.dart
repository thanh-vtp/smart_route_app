// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'address_result.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$AddressResult {

 String get fullAddress; double get lat; double get lng; double get score; String? get houseNumber; String? get streetPrefix; String? get streetName; String? get ward; String? get district; String? get city; String? get province; String? get countryName; String? get postalCode; String? get placeName; String? get placeType; String? get phoneNumber; String? get longLabel; String? get shortLabel;
/// Create a copy of AddressResult
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$AddressResultCopyWith<AddressResult> get copyWith => _$AddressResultCopyWithImpl<AddressResult>(this as AddressResult, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is AddressResult&&(identical(other.fullAddress, fullAddress) || other.fullAddress == fullAddress)&&(identical(other.lat, lat) || other.lat == lat)&&(identical(other.lng, lng) || other.lng == lng)&&(identical(other.score, score) || other.score == score)&&(identical(other.houseNumber, houseNumber) || other.houseNumber == houseNumber)&&(identical(other.streetPrefix, streetPrefix) || other.streetPrefix == streetPrefix)&&(identical(other.streetName, streetName) || other.streetName == streetName)&&(identical(other.ward, ward) || other.ward == ward)&&(identical(other.district, district) || other.district == district)&&(identical(other.city, city) || other.city == city)&&(identical(other.province, province) || other.province == province)&&(identical(other.countryName, countryName) || other.countryName == countryName)&&(identical(other.postalCode, postalCode) || other.postalCode == postalCode)&&(identical(other.placeName, placeName) || other.placeName == placeName)&&(identical(other.placeType, placeType) || other.placeType == placeType)&&(identical(other.phoneNumber, phoneNumber) || other.phoneNumber == phoneNumber)&&(identical(other.longLabel, longLabel) || other.longLabel == longLabel)&&(identical(other.shortLabel, shortLabel) || other.shortLabel == shortLabel));
}


@override
int get hashCode => Object.hash(runtimeType,fullAddress,lat,lng,score,houseNumber,streetPrefix,streetName,ward,district,city,province,countryName,postalCode,placeName,placeType,phoneNumber,longLabel,shortLabel);

@override
String toString() {
  return 'AddressResult(fullAddress: $fullAddress, lat: $lat, lng: $lng, score: $score, houseNumber: $houseNumber, streetPrefix: $streetPrefix, streetName: $streetName, ward: $ward, district: $district, city: $city, province: $province, countryName: $countryName, postalCode: $postalCode, placeName: $placeName, placeType: $placeType, phoneNumber: $phoneNumber, longLabel: $longLabel, shortLabel: $shortLabel)';
}


}

/// @nodoc
abstract mixin class $AddressResultCopyWith<$Res>  {
  factory $AddressResultCopyWith(AddressResult value, $Res Function(AddressResult) _then) = _$AddressResultCopyWithImpl;
@useResult
$Res call({
 String fullAddress, double lat, double lng, double score, String? houseNumber, String? streetPrefix, String? streetName, String? ward, String? district, String? city, String? province, String? countryName, String? postalCode, String? placeName, String? placeType, String? phoneNumber, String? longLabel, String? shortLabel
});




}
/// @nodoc
class _$AddressResultCopyWithImpl<$Res>
    implements $AddressResultCopyWith<$Res> {
  _$AddressResultCopyWithImpl(this._self, this._then);

  final AddressResult _self;
  final $Res Function(AddressResult) _then;

/// Create a copy of AddressResult
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? fullAddress = null,Object? lat = null,Object? lng = null,Object? score = null,Object? houseNumber = freezed,Object? streetPrefix = freezed,Object? streetName = freezed,Object? ward = freezed,Object? district = freezed,Object? city = freezed,Object? province = freezed,Object? countryName = freezed,Object? postalCode = freezed,Object? placeName = freezed,Object? placeType = freezed,Object? phoneNumber = freezed,Object? longLabel = freezed,Object? shortLabel = freezed,}) {
  return _then(_self.copyWith(
fullAddress: null == fullAddress ? _self.fullAddress : fullAddress // ignore: cast_nullable_to_non_nullable
as String,lat: null == lat ? _self.lat : lat // ignore: cast_nullable_to_non_nullable
as double,lng: null == lng ? _self.lng : lng // ignore: cast_nullable_to_non_nullable
as double,score: null == score ? _self.score : score // ignore: cast_nullable_to_non_nullable
as double,houseNumber: freezed == houseNumber ? _self.houseNumber : houseNumber // ignore: cast_nullable_to_non_nullable
as String?,streetPrefix: freezed == streetPrefix ? _self.streetPrefix : streetPrefix // ignore: cast_nullable_to_non_nullable
as String?,streetName: freezed == streetName ? _self.streetName : streetName // ignore: cast_nullable_to_non_nullable
as String?,ward: freezed == ward ? _self.ward : ward // ignore: cast_nullable_to_non_nullable
as String?,district: freezed == district ? _self.district : district // ignore: cast_nullable_to_non_nullable
as String?,city: freezed == city ? _self.city : city // ignore: cast_nullable_to_non_nullable
as String?,province: freezed == province ? _self.province : province // ignore: cast_nullable_to_non_nullable
as String?,countryName: freezed == countryName ? _self.countryName : countryName // ignore: cast_nullable_to_non_nullable
as String?,postalCode: freezed == postalCode ? _self.postalCode : postalCode // ignore: cast_nullable_to_non_nullable
as String?,placeName: freezed == placeName ? _self.placeName : placeName // ignore: cast_nullable_to_non_nullable
as String?,placeType: freezed == placeType ? _self.placeType : placeType // ignore: cast_nullable_to_non_nullable
as String?,phoneNumber: freezed == phoneNumber ? _self.phoneNumber : phoneNumber // ignore: cast_nullable_to_non_nullable
as String?,longLabel: freezed == longLabel ? _self.longLabel : longLabel // ignore: cast_nullable_to_non_nullable
as String?,shortLabel: freezed == shortLabel ? _self.shortLabel : shortLabel // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// Adds pattern-matching-related methods to [AddressResult].
extension AddressResultPatterns on AddressResult {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _AddressResult value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _AddressResult() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _AddressResult value)  $default,){
final _that = this;
switch (_that) {
case _AddressResult():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _AddressResult value)?  $default,){
final _that = this;
switch (_that) {
case _AddressResult() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String fullAddress,  double lat,  double lng,  double score,  String? houseNumber,  String? streetPrefix,  String? streetName,  String? ward,  String? district,  String? city,  String? province,  String? countryName,  String? postalCode,  String? placeName,  String? placeType,  String? phoneNumber,  String? longLabel,  String? shortLabel)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _AddressResult() when $default != null:
return $default(_that.fullAddress,_that.lat,_that.lng,_that.score,_that.houseNumber,_that.streetPrefix,_that.streetName,_that.ward,_that.district,_that.city,_that.province,_that.countryName,_that.postalCode,_that.placeName,_that.placeType,_that.phoneNumber,_that.longLabel,_that.shortLabel);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String fullAddress,  double lat,  double lng,  double score,  String? houseNumber,  String? streetPrefix,  String? streetName,  String? ward,  String? district,  String? city,  String? province,  String? countryName,  String? postalCode,  String? placeName,  String? placeType,  String? phoneNumber,  String? longLabel,  String? shortLabel)  $default,) {final _that = this;
switch (_that) {
case _AddressResult():
return $default(_that.fullAddress,_that.lat,_that.lng,_that.score,_that.houseNumber,_that.streetPrefix,_that.streetName,_that.ward,_that.district,_that.city,_that.province,_that.countryName,_that.postalCode,_that.placeName,_that.placeType,_that.phoneNumber,_that.longLabel,_that.shortLabel);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String fullAddress,  double lat,  double lng,  double score,  String? houseNumber,  String? streetPrefix,  String? streetName,  String? ward,  String? district,  String? city,  String? province,  String? countryName,  String? postalCode,  String? placeName,  String? placeType,  String? phoneNumber,  String? longLabel,  String? shortLabel)?  $default,) {final _that = this;
switch (_that) {
case _AddressResult() when $default != null:
return $default(_that.fullAddress,_that.lat,_that.lng,_that.score,_that.houseNumber,_that.streetPrefix,_that.streetName,_that.ward,_that.district,_that.city,_that.province,_that.countryName,_that.postalCode,_that.placeName,_that.placeType,_that.phoneNumber,_that.longLabel,_that.shortLabel);case _:
  return null;

}
}

}

/// @nodoc


class _AddressResult extends AddressResult {
  const _AddressResult({required this.fullAddress, required this.lat, required this.lng, required this.score, this.houseNumber, this.streetPrefix, this.streetName, this.ward, this.district, this.city, this.province, this.countryName, this.postalCode, this.placeName, this.placeType, this.phoneNumber, this.longLabel, this.shortLabel}): super._();
  

@override final  String fullAddress;
@override final  double lat;
@override final  double lng;
@override final  double score;
@override final  String? houseNumber;
@override final  String? streetPrefix;
@override final  String? streetName;
@override final  String? ward;
@override final  String? district;
@override final  String? city;
@override final  String? province;
@override final  String? countryName;
@override final  String? postalCode;
@override final  String? placeName;
@override final  String? placeType;
@override final  String? phoneNumber;
@override final  String? longLabel;
@override final  String? shortLabel;

/// Create a copy of AddressResult
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$AddressResultCopyWith<_AddressResult> get copyWith => __$AddressResultCopyWithImpl<_AddressResult>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _AddressResult&&(identical(other.fullAddress, fullAddress) || other.fullAddress == fullAddress)&&(identical(other.lat, lat) || other.lat == lat)&&(identical(other.lng, lng) || other.lng == lng)&&(identical(other.score, score) || other.score == score)&&(identical(other.houseNumber, houseNumber) || other.houseNumber == houseNumber)&&(identical(other.streetPrefix, streetPrefix) || other.streetPrefix == streetPrefix)&&(identical(other.streetName, streetName) || other.streetName == streetName)&&(identical(other.ward, ward) || other.ward == ward)&&(identical(other.district, district) || other.district == district)&&(identical(other.city, city) || other.city == city)&&(identical(other.province, province) || other.province == province)&&(identical(other.countryName, countryName) || other.countryName == countryName)&&(identical(other.postalCode, postalCode) || other.postalCode == postalCode)&&(identical(other.placeName, placeName) || other.placeName == placeName)&&(identical(other.placeType, placeType) || other.placeType == placeType)&&(identical(other.phoneNumber, phoneNumber) || other.phoneNumber == phoneNumber)&&(identical(other.longLabel, longLabel) || other.longLabel == longLabel)&&(identical(other.shortLabel, shortLabel) || other.shortLabel == shortLabel));
}


@override
int get hashCode => Object.hash(runtimeType,fullAddress,lat,lng,score,houseNumber,streetPrefix,streetName,ward,district,city,province,countryName,postalCode,placeName,placeType,phoneNumber,longLabel,shortLabel);

@override
String toString() {
  return 'AddressResult(fullAddress: $fullAddress, lat: $lat, lng: $lng, score: $score, houseNumber: $houseNumber, streetPrefix: $streetPrefix, streetName: $streetName, ward: $ward, district: $district, city: $city, province: $province, countryName: $countryName, postalCode: $postalCode, placeName: $placeName, placeType: $placeType, phoneNumber: $phoneNumber, longLabel: $longLabel, shortLabel: $shortLabel)';
}


}

/// @nodoc
abstract mixin class _$AddressResultCopyWith<$Res> implements $AddressResultCopyWith<$Res> {
  factory _$AddressResultCopyWith(_AddressResult value, $Res Function(_AddressResult) _then) = __$AddressResultCopyWithImpl;
@override @useResult
$Res call({
 String fullAddress, double lat, double lng, double score, String? houseNumber, String? streetPrefix, String? streetName, String? ward, String? district, String? city, String? province, String? countryName, String? postalCode, String? placeName, String? placeType, String? phoneNumber, String? longLabel, String? shortLabel
});




}
/// @nodoc
class __$AddressResultCopyWithImpl<$Res>
    implements _$AddressResultCopyWith<$Res> {
  __$AddressResultCopyWithImpl(this._self, this._then);

  final _AddressResult _self;
  final $Res Function(_AddressResult) _then;

/// Create a copy of AddressResult
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? fullAddress = null,Object? lat = null,Object? lng = null,Object? score = null,Object? houseNumber = freezed,Object? streetPrefix = freezed,Object? streetName = freezed,Object? ward = freezed,Object? district = freezed,Object? city = freezed,Object? province = freezed,Object? countryName = freezed,Object? postalCode = freezed,Object? placeName = freezed,Object? placeType = freezed,Object? phoneNumber = freezed,Object? longLabel = freezed,Object? shortLabel = freezed,}) {
  return _then(_AddressResult(
fullAddress: null == fullAddress ? _self.fullAddress : fullAddress // ignore: cast_nullable_to_non_nullable
as String,lat: null == lat ? _self.lat : lat // ignore: cast_nullable_to_non_nullable
as double,lng: null == lng ? _self.lng : lng // ignore: cast_nullable_to_non_nullable
as double,score: null == score ? _self.score : score // ignore: cast_nullable_to_non_nullable
as double,houseNumber: freezed == houseNumber ? _self.houseNumber : houseNumber // ignore: cast_nullable_to_non_nullable
as String?,streetPrefix: freezed == streetPrefix ? _self.streetPrefix : streetPrefix // ignore: cast_nullable_to_non_nullable
as String?,streetName: freezed == streetName ? _self.streetName : streetName // ignore: cast_nullable_to_non_nullable
as String?,ward: freezed == ward ? _self.ward : ward // ignore: cast_nullable_to_non_nullable
as String?,district: freezed == district ? _self.district : district // ignore: cast_nullable_to_non_nullable
as String?,city: freezed == city ? _self.city : city // ignore: cast_nullable_to_non_nullable
as String?,province: freezed == province ? _self.province : province // ignore: cast_nullable_to_non_nullable
as String?,countryName: freezed == countryName ? _self.countryName : countryName // ignore: cast_nullable_to_non_nullable
as String?,postalCode: freezed == postalCode ? _self.postalCode : postalCode // ignore: cast_nullable_to_non_nullable
as String?,placeName: freezed == placeName ? _self.placeName : placeName // ignore: cast_nullable_to_non_nullable
as String?,placeType: freezed == placeType ? _self.placeType : placeType // ignore: cast_nullable_to_non_nullable
as String?,phoneNumber: freezed == phoneNumber ? _self.phoneNumber : phoneNumber // ignore: cast_nullable_to_non_nullable
as String?,longLabel: freezed == longLabel ? _self.longLabel : longLabel // ignore: cast_nullable_to_non_nullable
as String?,shortLabel: freezed == shortLabel ? _self.shortLabel : shortLabel // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}

// dart format on
