// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'search_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$SearchState {

 String get query; SearchMode get searchMode; bool get isLoading; List<AddressResult> get results; List<AddressResult> get historyResults; String? get errorMessage; String get houseNumber; String get street; String get ward; String get district; String get city; String get province; String get postalCode;
/// Create a copy of SearchState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$SearchStateCopyWith<SearchState> get copyWith => _$SearchStateCopyWithImpl<SearchState>(this as SearchState, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is SearchState&&(identical(other.query, query) || other.query == query)&&(identical(other.searchMode, searchMode) || other.searchMode == searchMode)&&(identical(other.isLoading, isLoading) || other.isLoading == isLoading)&&const DeepCollectionEquality().equals(other.results, results)&&const DeepCollectionEquality().equals(other.historyResults, historyResults)&&(identical(other.errorMessage, errorMessage) || other.errorMessage == errorMessage)&&(identical(other.houseNumber, houseNumber) || other.houseNumber == houseNumber)&&(identical(other.street, street) || other.street == street)&&(identical(other.ward, ward) || other.ward == ward)&&(identical(other.district, district) || other.district == district)&&(identical(other.city, city) || other.city == city)&&(identical(other.province, province) || other.province == province)&&(identical(other.postalCode, postalCode) || other.postalCode == postalCode));
}


@override
int get hashCode => Object.hash(runtimeType,query,searchMode,isLoading,const DeepCollectionEquality().hash(results),const DeepCollectionEquality().hash(historyResults),errorMessage,houseNumber,street,ward,district,city,province,postalCode);

@override
String toString() {
  return 'SearchState(query: $query, searchMode: $searchMode, isLoading: $isLoading, results: $results, historyResults: $historyResults, errorMessage: $errorMessage, houseNumber: $houseNumber, street: $street, ward: $ward, district: $district, city: $city, province: $province, postalCode: $postalCode)';
}


}

/// @nodoc
abstract mixin class $SearchStateCopyWith<$Res>  {
  factory $SearchStateCopyWith(SearchState value, $Res Function(SearchState) _then) = _$SearchStateCopyWithImpl;
@useResult
$Res call({
 String query, SearchMode searchMode, bool isLoading, List<AddressResult> results, List<AddressResult> historyResults, String? errorMessage, String houseNumber, String street, String ward, String district, String city, String province, String postalCode
});




}
/// @nodoc
class _$SearchStateCopyWithImpl<$Res>
    implements $SearchStateCopyWith<$Res> {
  _$SearchStateCopyWithImpl(this._self, this._then);

  final SearchState _self;
  final $Res Function(SearchState) _then;

/// Create a copy of SearchState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? query = null,Object? searchMode = null,Object? isLoading = null,Object? results = null,Object? historyResults = null,Object? errorMessage = freezed,Object? houseNumber = null,Object? street = null,Object? ward = null,Object? district = null,Object? city = null,Object? province = null,Object? postalCode = null,}) {
  return _then(_self.copyWith(
query: null == query ? _self.query : query // ignore: cast_nullable_to_non_nullable
as String,searchMode: null == searchMode ? _self.searchMode : searchMode // ignore: cast_nullable_to_non_nullable
as SearchMode,isLoading: null == isLoading ? _self.isLoading : isLoading // ignore: cast_nullable_to_non_nullable
as bool,results: null == results ? _self.results : results // ignore: cast_nullable_to_non_nullable
as List<AddressResult>,historyResults: null == historyResults ? _self.historyResults : historyResults // ignore: cast_nullable_to_non_nullable
as List<AddressResult>,errorMessage: freezed == errorMessage ? _self.errorMessage : errorMessage // ignore: cast_nullable_to_non_nullable
as String?,houseNumber: null == houseNumber ? _self.houseNumber : houseNumber // ignore: cast_nullable_to_non_nullable
as String,street: null == street ? _self.street : street // ignore: cast_nullable_to_non_nullable
as String,ward: null == ward ? _self.ward : ward // ignore: cast_nullable_to_non_nullable
as String,district: null == district ? _self.district : district // ignore: cast_nullable_to_non_nullable
as String,city: null == city ? _self.city : city // ignore: cast_nullable_to_non_nullable
as String,province: null == province ? _self.province : province // ignore: cast_nullable_to_non_nullable
as String,postalCode: null == postalCode ? _self.postalCode : postalCode // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// Adds pattern-matching-related methods to [SearchState].
extension SearchStatePatterns on SearchState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _SearchState value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _SearchState() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _SearchState value)  $default,){
final _that = this;
switch (_that) {
case _SearchState():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _SearchState value)?  $default,){
final _that = this;
switch (_that) {
case _SearchState() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String query,  SearchMode searchMode,  bool isLoading,  List<AddressResult> results,  List<AddressResult> historyResults,  String? errorMessage,  String houseNumber,  String street,  String ward,  String district,  String city,  String province,  String postalCode)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _SearchState() when $default != null:
return $default(_that.query,_that.searchMode,_that.isLoading,_that.results,_that.historyResults,_that.errorMessage,_that.houseNumber,_that.street,_that.ward,_that.district,_that.city,_that.province,_that.postalCode);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String query,  SearchMode searchMode,  bool isLoading,  List<AddressResult> results,  List<AddressResult> historyResults,  String? errorMessage,  String houseNumber,  String street,  String ward,  String district,  String city,  String province,  String postalCode)  $default,) {final _that = this;
switch (_that) {
case _SearchState():
return $default(_that.query,_that.searchMode,_that.isLoading,_that.results,_that.historyResults,_that.errorMessage,_that.houseNumber,_that.street,_that.ward,_that.district,_that.city,_that.province,_that.postalCode);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String query,  SearchMode searchMode,  bool isLoading,  List<AddressResult> results,  List<AddressResult> historyResults,  String? errorMessage,  String houseNumber,  String street,  String ward,  String district,  String city,  String province,  String postalCode)?  $default,) {final _that = this;
switch (_that) {
case _SearchState() when $default != null:
return $default(_that.query,_that.searchMode,_that.isLoading,_that.results,_that.historyResults,_that.errorMessage,_that.houseNumber,_that.street,_that.ward,_that.district,_that.city,_that.province,_that.postalCode);case _:
  return null;

}
}

}

/// @nodoc


class _SearchState implements SearchState {
  const _SearchState({this.query = '', this.searchMode = SearchMode.simple, this.isLoading = false, final  List<AddressResult> results = const [], final  List<AddressResult> historyResults = const [], this.errorMessage, this.houseNumber = '', this.street = '', this.ward = '', this.district = '', this.city = '', this.province = '', this.postalCode = ''}): _results = results,_historyResults = historyResults;
  

@override@JsonKey() final  String query;
@override@JsonKey() final  SearchMode searchMode;
@override@JsonKey() final  bool isLoading;
 final  List<AddressResult> _results;
@override@JsonKey() List<AddressResult> get results {
  if (_results is EqualUnmodifiableListView) return _results;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_results);
}

 final  List<AddressResult> _historyResults;
@override@JsonKey() List<AddressResult> get historyResults {
  if (_historyResults is EqualUnmodifiableListView) return _historyResults;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_historyResults);
}

@override final  String? errorMessage;
@override@JsonKey() final  String houseNumber;
@override@JsonKey() final  String street;
@override@JsonKey() final  String ward;
@override@JsonKey() final  String district;
@override@JsonKey() final  String city;
@override@JsonKey() final  String province;
@override@JsonKey() final  String postalCode;

/// Create a copy of SearchState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$SearchStateCopyWith<_SearchState> get copyWith => __$SearchStateCopyWithImpl<_SearchState>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _SearchState&&(identical(other.query, query) || other.query == query)&&(identical(other.searchMode, searchMode) || other.searchMode == searchMode)&&(identical(other.isLoading, isLoading) || other.isLoading == isLoading)&&const DeepCollectionEquality().equals(other._results, _results)&&const DeepCollectionEquality().equals(other._historyResults, _historyResults)&&(identical(other.errorMessage, errorMessage) || other.errorMessage == errorMessage)&&(identical(other.houseNumber, houseNumber) || other.houseNumber == houseNumber)&&(identical(other.street, street) || other.street == street)&&(identical(other.ward, ward) || other.ward == ward)&&(identical(other.district, district) || other.district == district)&&(identical(other.city, city) || other.city == city)&&(identical(other.province, province) || other.province == province)&&(identical(other.postalCode, postalCode) || other.postalCode == postalCode));
}


@override
int get hashCode => Object.hash(runtimeType,query,searchMode,isLoading,const DeepCollectionEquality().hash(_results),const DeepCollectionEquality().hash(_historyResults),errorMessage,houseNumber,street,ward,district,city,province,postalCode);

@override
String toString() {
  return 'SearchState(query: $query, searchMode: $searchMode, isLoading: $isLoading, results: $results, historyResults: $historyResults, errorMessage: $errorMessage, houseNumber: $houseNumber, street: $street, ward: $ward, district: $district, city: $city, province: $province, postalCode: $postalCode)';
}


}

/// @nodoc
abstract mixin class _$SearchStateCopyWith<$Res> implements $SearchStateCopyWith<$Res> {
  factory _$SearchStateCopyWith(_SearchState value, $Res Function(_SearchState) _then) = __$SearchStateCopyWithImpl;
@override @useResult
$Res call({
 String query, SearchMode searchMode, bool isLoading, List<AddressResult> results, List<AddressResult> historyResults, String? errorMessage, String houseNumber, String street, String ward, String district, String city, String province, String postalCode
});




}
/// @nodoc
class __$SearchStateCopyWithImpl<$Res>
    implements _$SearchStateCopyWith<$Res> {
  __$SearchStateCopyWithImpl(this._self, this._then);

  final _SearchState _self;
  final $Res Function(_SearchState) _then;

/// Create a copy of SearchState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? query = null,Object? searchMode = null,Object? isLoading = null,Object? results = null,Object? historyResults = null,Object? errorMessage = freezed,Object? houseNumber = null,Object? street = null,Object? ward = null,Object? district = null,Object? city = null,Object? province = null,Object? postalCode = null,}) {
  return _then(_SearchState(
query: null == query ? _self.query : query // ignore: cast_nullable_to_non_nullable
as String,searchMode: null == searchMode ? _self.searchMode : searchMode // ignore: cast_nullable_to_non_nullable
as SearchMode,isLoading: null == isLoading ? _self.isLoading : isLoading // ignore: cast_nullable_to_non_nullable
as bool,results: null == results ? _self._results : results // ignore: cast_nullable_to_non_nullable
as List<AddressResult>,historyResults: null == historyResults ? _self._historyResults : historyResults // ignore: cast_nullable_to_non_nullable
as List<AddressResult>,errorMessage: freezed == errorMessage ? _self.errorMessage : errorMessage // ignore: cast_nullable_to_non_nullable
as String?,houseNumber: null == houseNumber ? _self.houseNumber : houseNumber // ignore: cast_nullable_to_non_nullable
as String,street: null == street ? _self.street : street // ignore: cast_nullable_to_non_nullable
as String,ward: null == ward ? _self.ward : ward // ignore: cast_nullable_to_non_nullable
as String,district: null == district ? _self.district : district // ignore: cast_nullable_to_non_nullable
as String,city: null == city ? _self.city : city // ignore: cast_nullable_to_non_nullable
as String,province: null == province ? _self.province : province // ignore: cast_nullable_to_non_nullable
as String,postalCode: null == postalCode ? _self.postalCode : postalCode // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on
