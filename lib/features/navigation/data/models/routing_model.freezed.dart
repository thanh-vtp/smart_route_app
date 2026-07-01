// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'routing_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$RouteResponseModel {

@JsonKey(name: 'routes') RouteFeaturesResultModel get routes;@JsonKey(name: 'directions') List<RouteDirectionSetModel> get directions;
/// Create a copy of RouteResponseModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$RouteResponseModelCopyWith<RouteResponseModel> get copyWith => _$RouteResponseModelCopyWithImpl<RouteResponseModel>(this as RouteResponseModel, _$identity);

  /// Serializes this RouteResponseModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is RouteResponseModel&&(identical(other.routes, routes) || other.routes == routes)&&const DeepCollectionEquality().equals(other.directions, directions));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,routes,const DeepCollectionEquality().hash(directions));

@override
String toString() {
  return 'RouteResponseModel(routes: $routes, directions: $directions)';
}


}

/// @nodoc
abstract mixin class $RouteResponseModelCopyWith<$Res>  {
  factory $RouteResponseModelCopyWith(RouteResponseModel value, $Res Function(RouteResponseModel) _then) = _$RouteResponseModelCopyWithImpl;
@useResult
$Res call({
@JsonKey(name: 'routes') RouteFeaturesResultModel routes,@JsonKey(name: 'directions') List<RouteDirectionSetModel> directions
});


$RouteFeaturesResultModelCopyWith<$Res> get routes;

}
/// @nodoc
class _$RouteResponseModelCopyWithImpl<$Res>
    implements $RouteResponseModelCopyWith<$Res> {
  _$RouteResponseModelCopyWithImpl(this._self, this._then);

  final RouteResponseModel _self;
  final $Res Function(RouteResponseModel) _then;

/// Create a copy of RouteResponseModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? routes = null,Object? directions = null,}) {
  return _then(_self.copyWith(
routes: null == routes ? _self.routes : routes // ignore: cast_nullable_to_non_nullable
as RouteFeaturesResultModel,directions: null == directions ? _self.directions : directions // ignore: cast_nullable_to_non_nullable
as List<RouteDirectionSetModel>,
  ));
}
/// Create a copy of RouteResponseModel
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$RouteFeaturesResultModelCopyWith<$Res> get routes {
  
  return $RouteFeaturesResultModelCopyWith<$Res>(_self.routes, (value) {
    return _then(_self.copyWith(routes: value));
  });
}
}


/// Adds pattern-matching-related methods to [RouteResponseModel].
extension RouteResponseModelPatterns on RouteResponseModel {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _RouteResponseModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _RouteResponseModel() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _RouteResponseModel value)  $default,){
final _that = this;
switch (_that) {
case _RouteResponseModel():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _RouteResponseModel value)?  $default,){
final _that = this;
switch (_that) {
case _RouteResponseModel() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function(@JsonKey(name: 'routes')  RouteFeaturesResultModel routes, @JsonKey(name: 'directions')  List<RouteDirectionSetModel> directions)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _RouteResponseModel() when $default != null:
return $default(_that.routes,_that.directions);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function(@JsonKey(name: 'routes')  RouteFeaturesResultModel routes, @JsonKey(name: 'directions')  List<RouteDirectionSetModel> directions)  $default,) {final _that = this;
switch (_that) {
case _RouteResponseModel():
return $default(_that.routes,_that.directions);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function(@JsonKey(name: 'routes')  RouteFeaturesResultModel routes, @JsonKey(name: 'directions')  List<RouteDirectionSetModel> directions)?  $default,) {final _that = this;
switch (_that) {
case _RouteResponseModel() when $default != null:
return $default(_that.routes,_that.directions);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _RouteResponseModel extends RouteResponseModel {
  const _RouteResponseModel({@JsonKey(name: 'routes') required this.routes, @JsonKey(name: 'directions') final  List<RouteDirectionSetModel> directions = const []}): _directions = directions,super._();
  factory _RouteResponseModel.fromJson(Map<String, dynamic> json) => _$RouteResponseModelFromJson(json);

@override@JsonKey(name: 'routes') final  RouteFeaturesResultModel routes;
 final  List<RouteDirectionSetModel> _directions;
@override@JsonKey(name: 'directions') List<RouteDirectionSetModel> get directions {
  if (_directions is EqualUnmodifiableListView) return _directions;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_directions);
}


/// Create a copy of RouteResponseModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$RouteResponseModelCopyWith<_RouteResponseModel> get copyWith => __$RouteResponseModelCopyWithImpl<_RouteResponseModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$RouteResponseModelToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _RouteResponseModel&&(identical(other.routes, routes) || other.routes == routes)&&const DeepCollectionEquality().equals(other._directions, _directions));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,routes,const DeepCollectionEquality().hash(_directions));

@override
String toString() {
  return 'RouteResponseModel(routes: $routes, directions: $directions)';
}


}

/// @nodoc
abstract mixin class _$RouteResponseModelCopyWith<$Res> implements $RouteResponseModelCopyWith<$Res> {
  factory _$RouteResponseModelCopyWith(_RouteResponseModel value, $Res Function(_RouteResponseModel) _then) = __$RouteResponseModelCopyWithImpl;
@override @useResult
$Res call({
@JsonKey(name: 'routes') RouteFeaturesResultModel routes,@JsonKey(name: 'directions') List<RouteDirectionSetModel> directions
});


@override $RouteFeaturesResultModelCopyWith<$Res> get routes;

}
/// @nodoc
class __$RouteResponseModelCopyWithImpl<$Res>
    implements _$RouteResponseModelCopyWith<$Res> {
  __$RouteResponseModelCopyWithImpl(this._self, this._then);

  final _RouteResponseModel _self;
  final $Res Function(_RouteResponseModel) _then;

/// Create a copy of RouteResponseModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? routes = null,Object? directions = null,}) {
  return _then(_RouteResponseModel(
routes: null == routes ? _self.routes : routes // ignore: cast_nullable_to_non_nullable
as RouteFeaturesResultModel,directions: null == directions ? _self._directions : directions // ignore: cast_nullable_to_non_nullable
as List<RouteDirectionSetModel>,
  ));
}

/// Create a copy of RouteResponseModel
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$RouteFeaturesResultModelCopyWith<$Res> get routes {
  
  return $RouteFeaturesResultModelCopyWith<$Res>(_self.routes, (value) {
    return _then(_self.copyWith(routes: value));
  });
}
}


/// @nodoc
mixin _$RouteFeaturesResultModel {

@JsonKey(name: 'features') List<RouteFeatureModel> get features;
/// Create a copy of RouteFeaturesResultModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$RouteFeaturesResultModelCopyWith<RouteFeaturesResultModel> get copyWith => _$RouteFeaturesResultModelCopyWithImpl<RouteFeaturesResultModel>(this as RouteFeaturesResultModel, _$identity);

  /// Serializes this RouteFeaturesResultModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is RouteFeaturesResultModel&&const DeepCollectionEquality().equals(other.features, features));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(features));

@override
String toString() {
  return 'RouteFeaturesResultModel(features: $features)';
}


}

/// @nodoc
abstract mixin class $RouteFeaturesResultModelCopyWith<$Res>  {
  factory $RouteFeaturesResultModelCopyWith(RouteFeaturesResultModel value, $Res Function(RouteFeaturesResultModel) _then) = _$RouteFeaturesResultModelCopyWithImpl;
@useResult
$Res call({
@JsonKey(name: 'features') List<RouteFeatureModel> features
});




}
/// @nodoc
class _$RouteFeaturesResultModelCopyWithImpl<$Res>
    implements $RouteFeaturesResultModelCopyWith<$Res> {
  _$RouteFeaturesResultModelCopyWithImpl(this._self, this._then);

  final RouteFeaturesResultModel _self;
  final $Res Function(RouteFeaturesResultModel) _then;

/// Create a copy of RouteFeaturesResultModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? features = null,}) {
  return _then(_self.copyWith(
features: null == features ? _self.features : features // ignore: cast_nullable_to_non_nullable
as List<RouteFeatureModel>,
  ));
}

}


/// Adds pattern-matching-related methods to [RouteFeaturesResultModel].
extension RouteFeaturesResultModelPatterns on RouteFeaturesResultModel {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _RouteFeaturesResultModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _RouteFeaturesResultModel() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _RouteFeaturesResultModel value)  $default,){
final _that = this;
switch (_that) {
case _RouteFeaturesResultModel():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _RouteFeaturesResultModel value)?  $default,){
final _that = this;
switch (_that) {
case _RouteFeaturesResultModel() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function(@JsonKey(name: 'features')  List<RouteFeatureModel> features)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _RouteFeaturesResultModel() when $default != null:
return $default(_that.features);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function(@JsonKey(name: 'features')  List<RouteFeatureModel> features)  $default,) {final _that = this;
switch (_that) {
case _RouteFeaturesResultModel():
return $default(_that.features);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function(@JsonKey(name: 'features')  List<RouteFeatureModel> features)?  $default,) {final _that = this;
switch (_that) {
case _RouteFeaturesResultModel() when $default != null:
return $default(_that.features);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _RouteFeaturesResultModel implements RouteFeaturesResultModel {
  const _RouteFeaturesResultModel({@JsonKey(name: 'features') final  List<RouteFeatureModel> features = const []}): _features = features;
  factory _RouteFeaturesResultModel.fromJson(Map<String, dynamic> json) => _$RouteFeaturesResultModelFromJson(json);

 final  List<RouteFeatureModel> _features;
@override@JsonKey(name: 'features') List<RouteFeatureModel> get features {
  if (_features is EqualUnmodifiableListView) return _features;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_features);
}


/// Create a copy of RouteFeaturesResultModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$RouteFeaturesResultModelCopyWith<_RouteFeaturesResultModel> get copyWith => __$RouteFeaturesResultModelCopyWithImpl<_RouteFeaturesResultModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$RouteFeaturesResultModelToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _RouteFeaturesResultModel&&const DeepCollectionEquality().equals(other._features, _features));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(_features));

@override
String toString() {
  return 'RouteFeaturesResultModel(features: $features)';
}


}

/// @nodoc
abstract mixin class _$RouteFeaturesResultModelCopyWith<$Res> implements $RouteFeaturesResultModelCopyWith<$Res> {
  factory _$RouteFeaturesResultModelCopyWith(_RouteFeaturesResultModel value, $Res Function(_RouteFeaturesResultModel) _then) = __$RouteFeaturesResultModelCopyWithImpl;
@override @useResult
$Res call({
@JsonKey(name: 'features') List<RouteFeatureModel> features
});




}
/// @nodoc
class __$RouteFeaturesResultModelCopyWithImpl<$Res>
    implements _$RouteFeaturesResultModelCopyWith<$Res> {
  __$RouteFeaturesResultModelCopyWithImpl(this._self, this._then);

  final _RouteFeaturesResultModel _self;
  final $Res Function(_RouteFeaturesResultModel) _then;

/// Create a copy of RouteFeaturesResultModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? features = null,}) {
  return _then(_RouteFeaturesResultModel(
features: null == features ? _self._features : features // ignore: cast_nullable_to_non_nullable
as List<RouteFeatureModel>,
  ));
}


}


/// @nodoc
mixin _$RouteFeatureModel {

@JsonKey(name: 'attributes') RouteAttributesModel get attributes;@JsonKey(name: 'geometry') RouteGeometryModel? get geometry;
/// Create a copy of RouteFeatureModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$RouteFeatureModelCopyWith<RouteFeatureModel> get copyWith => _$RouteFeatureModelCopyWithImpl<RouteFeatureModel>(this as RouteFeatureModel, _$identity);

  /// Serializes this RouteFeatureModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is RouteFeatureModel&&(identical(other.attributes, attributes) || other.attributes == attributes)&&(identical(other.geometry, geometry) || other.geometry == geometry));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,attributes,geometry);

@override
String toString() {
  return 'RouteFeatureModel(attributes: $attributes, geometry: $geometry)';
}


}

/// @nodoc
abstract mixin class $RouteFeatureModelCopyWith<$Res>  {
  factory $RouteFeatureModelCopyWith(RouteFeatureModel value, $Res Function(RouteFeatureModel) _then) = _$RouteFeatureModelCopyWithImpl;
@useResult
$Res call({
@JsonKey(name: 'attributes') RouteAttributesModel attributes,@JsonKey(name: 'geometry') RouteGeometryModel? geometry
});


$RouteAttributesModelCopyWith<$Res> get attributes;$RouteGeometryModelCopyWith<$Res>? get geometry;

}
/// @nodoc
class _$RouteFeatureModelCopyWithImpl<$Res>
    implements $RouteFeatureModelCopyWith<$Res> {
  _$RouteFeatureModelCopyWithImpl(this._self, this._then);

  final RouteFeatureModel _self;
  final $Res Function(RouteFeatureModel) _then;

/// Create a copy of RouteFeatureModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? attributes = null,Object? geometry = freezed,}) {
  return _then(_self.copyWith(
attributes: null == attributes ? _self.attributes : attributes // ignore: cast_nullable_to_non_nullable
as RouteAttributesModel,geometry: freezed == geometry ? _self.geometry : geometry // ignore: cast_nullable_to_non_nullable
as RouteGeometryModel?,
  ));
}
/// Create a copy of RouteFeatureModel
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$RouteAttributesModelCopyWith<$Res> get attributes {
  
  return $RouteAttributesModelCopyWith<$Res>(_self.attributes, (value) {
    return _then(_self.copyWith(attributes: value));
  });
}/// Create a copy of RouteFeatureModel
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$RouteGeometryModelCopyWith<$Res>? get geometry {
    if (_self.geometry == null) {
    return null;
  }

  return $RouteGeometryModelCopyWith<$Res>(_self.geometry!, (value) {
    return _then(_self.copyWith(geometry: value));
  });
}
}


/// Adds pattern-matching-related methods to [RouteFeatureModel].
extension RouteFeatureModelPatterns on RouteFeatureModel {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _RouteFeatureModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _RouteFeatureModel() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _RouteFeatureModel value)  $default,){
final _that = this;
switch (_that) {
case _RouteFeatureModel():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _RouteFeatureModel value)?  $default,){
final _that = this;
switch (_that) {
case _RouteFeatureModel() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function(@JsonKey(name: 'attributes')  RouteAttributesModel attributes, @JsonKey(name: 'geometry')  RouteGeometryModel? geometry)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _RouteFeatureModel() when $default != null:
return $default(_that.attributes,_that.geometry);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function(@JsonKey(name: 'attributes')  RouteAttributesModel attributes, @JsonKey(name: 'geometry')  RouteGeometryModel? geometry)  $default,) {final _that = this;
switch (_that) {
case _RouteFeatureModel():
return $default(_that.attributes,_that.geometry);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function(@JsonKey(name: 'attributes')  RouteAttributesModel attributes, @JsonKey(name: 'geometry')  RouteGeometryModel? geometry)?  $default,) {final _that = this;
switch (_that) {
case _RouteFeatureModel() when $default != null:
return $default(_that.attributes,_that.geometry);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _RouteFeatureModel implements RouteFeatureModel {
  const _RouteFeatureModel({@JsonKey(name: 'attributes') required this.attributes, @JsonKey(name: 'geometry') this.geometry});
  factory _RouteFeatureModel.fromJson(Map<String, dynamic> json) => _$RouteFeatureModelFromJson(json);

@override@JsonKey(name: 'attributes') final  RouteAttributesModel attributes;
@override@JsonKey(name: 'geometry') final  RouteGeometryModel? geometry;

/// Create a copy of RouteFeatureModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$RouteFeatureModelCopyWith<_RouteFeatureModel> get copyWith => __$RouteFeatureModelCopyWithImpl<_RouteFeatureModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$RouteFeatureModelToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _RouteFeatureModel&&(identical(other.attributes, attributes) || other.attributes == attributes)&&(identical(other.geometry, geometry) || other.geometry == geometry));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,attributes,geometry);

@override
String toString() {
  return 'RouteFeatureModel(attributes: $attributes, geometry: $geometry)';
}


}

/// @nodoc
abstract mixin class _$RouteFeatureModelCopyWith<$Res> implements $RouteFeatureModelCopyWith<$Res> {
  factory _$RouteFeatureModelCopyWith(_RouteFeatureModel value, $Res Function(_RouteFeatureModel) _then) = __$RouteFeatureModelCopyWithImpl;
@override @useResult
$Res call({
@JsonKey(name: 'attributes') RouteAttributesModel attributes,@JsonKey(name: 'geometry') RouteGeometryModel? geometry
});


@override $RouteAttributesModelCopyWith<$Res> get attributes;@override $RouteGeometryModelCopyWith<$Res>? get geometry;

}
/// @nodoc
class __$RouteFeatureModelCopyWithImpl<$Res>
    implements _$RouteFeatureModelCopyWith<$Res> {
  __$RouteFeatureModelCopyWithImpl(this._self, this._then);

  final _RouteFeatureModel _self;
  final $Res Function(_RouteFeatureModel) _then;

/// Create a copy of RouteFeatureModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? attributes = null,Object? geometry = freezed,}) {
  return _then(_RouteFeatureModel(
attributes: null == attributes ? _self.attributes : attributes // ignore: cast_nullable_to_non_nullable
as RouteAttributesModel,geometry: freezed == geometry ? _self.geometry : geometry // ignore: cast_nullable_to_non_nullable
as RouteGeometryModel?,
  ));
}

/// Create a copy of RouteFeatureModel
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$RouteAttributesModelCopyWith<$Res> get attributes {
  
  return $RouteAttributesModelCopyWith<$Res>(_self.attributes, (value) {
    return _then(_self.copyWith(attributes: value));
  });
}/// Create a copy of RouteFeatureModel
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$RouteGeometryModelCopyWith<$Res>? get geometry {
    if (_self.geometry == null) {
    return null;
  }

  return $RouteGeometryModelCopyWith<$Res>(_self.geometry!, (value) {
    return _then(_self.copyWith(geometry: value));
  });
}
}


/// @nodoc
mixin _$RouteAttributesModel {

@JsonKey(name: 'Name') String? get name;@JsonKey(name: 'Total_TravelTime') double? get totalTravelTime;@JsonKey(name: 'Total_Kilometers') double? get totalKilometers;
/// Create a copy of RouteAttributesModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$RouteAttributesModelCopyWith<RouteAttributesModel> get copyWith => _$RouteAttributesModelCopyWithImpl<RouteAttributesModel>(this as RouteAttributesModel, _$identity);

  /// Serializes this RouteAttributesModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is RouteAttributesModel&&(identical(other.name, name) || other.name == name)&&(identical(other.totalTravelTime, totalTravelTime) || other.totalTravelTime == totalTravelTime)&&(identical(other.totalKilometers, totalKilometers) || other.totalKilometers == totalKilometers));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,name,totalTravelTime,totalKilometers);

@override
String toString() {
  return 'RouteAttributesModel(name: $name, totalTravelTime: $totalTravelTime, totalKilometers: $totalKilometers)';
}


}

/// @nodoc
abstract mixin class $RouteAttributesModelCopyWith<$Res>  {
  factory $RouteAttributesModelCopyWith(RouteAttributesModel value, $Res Function(RouteAttributesModel) _then) = _$RouteAttributesModelCopyWithImpl;
@useResult
$Res call({
@JsonKey(name: 'Name') String? name,@JsonKey(name: 'Total_TravelTime') double? totalTravelTime,@JsonKey(name: 'Total_Kilometers') double? totalKilometers
});




}
/// @nodoc
class _$RouteAttributesModelCopyWithImpl<$Res>
    implements $RouteAttributesModelCopyWith<$Res> {
  _$RouteAttributesModelCopyWithImpl(this._self, this._then);

  final RouteAttributesModel _self;
  final $Res Function(RouteAttributesModel) _then;

/// Create a copy of RouteAttributesModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? name = freezed,Object? totalTravelTime = freezed,Object? totalKilometers = freezed,}) {
  return _then(_self.copyWith(
name: freezed == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String?,totalTravelTime: freezed == totalTravelTime ? _self.totalTravelTime : totalTravelTime // ignore: cast_nullable_to_non_nullable
as double?,totalKilometers: freezed == totalKilometers ? _self.totalKilometers : totalKilometers // ignore: cast_nullable_to_non_nullable
as double?,
  ));
}

}


/// Adds pattern-matching-related methods to [RouteAttributesModel].
extension RouteAttributesModelPatterns on RouteAttributesModel {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _RouteAttributesModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _RouteAttributesModel() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _RouteAttributesModel value)  $default,){
final _that = this;
switch (_that) {
case _RouteAttributesModel():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _RouteAttributesModel value)?  $default,){
final _that = this;
switch (_that) {
case _RouteAttributesModel() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function(@JsonKey(name: 'Name')  String? name, @JsonKey(name: 'Total_TravelTime')  double? totalTravelTime, @JsonKey(name: 'Total_Kilometers')  double? totalKilometers)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _RouteAttributesModel() when $default != null:
return $default(_that.name,_that.totalTravelTime,_that.totalKilometers);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function(@JsonKey(name: 'Name')  String? name, @JsonKey(name: 'Total_TravelTime')  double? totalTravelTime, @JsonKey(name: 'Total_Kilometers')  double? totalKilometers)  $default,) {final _that = this;
switch (_that) {
case _RouteAttributesModel():
return $default(_that.name,_that.totalTravelTime,_that.totalKilometers);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function(@JsonKey(name: 'Name')  String? name, @JsonKey(name: 'Total_TravelTime')  double? totalTravelTime, @JsonKey(name: 'Total_Kilometers')  double? totalKilometers)?  $default,) {final _that = this;
switch (_that) {
case _RouteAttributesModel() when $default != null:
return $default(_that.name,_that.totalTravelTime,_that.totalKilometers);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _RouteAttributesModel implements RouteAttributesModel {
  const _RouteAttributesModel({@JsonKey(name: 'Name') this.name, @JsonKey(name: 'Total_TravelTime') this.totalTravelTime, @JsonKey(name: 'Total_Kilometers') this.totalKilometers});
  factory _RouteAttributesModel.fromJson(Map<String, dynamic> json) => _$RouteAttributesModelFromJson(json);

@override@JsonKey(name: 'Name') final  String? name;
@override@JsonKey(name: 'Total_TravelTime') final  double? totalTravelTime;
@override@JsonKey(name: 'Total_Kilometers') final  double? totalKilometers;

/// Create a copy of RouteAttributesModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$RouteAttributesModelCopyWith<_RouteAttributesModel> get copyWith => __$RouteAttributesModelCopyWithImpl<_RouteAttributesModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$RouteAttributesModelToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _RouteAttributesModel&&(identical(other.name, name) || other.name == name)&&(identical(other.totalTravelTime, totalTravelTime) || other.totalTravelTime == totalTravelTime)&&(identical(other.totalKilometers, totalKilometers) || other.totalKilometers == totalKilometers));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,name,totalTravelTime,totalKilometers);

@override
String toString() {
  return 'RouteAttributesModel(name: $name, totalTravelTime: $totalTravelTime, totalKilometers: $totalKilometers)';
}


}

/// @nodoc
abstract mixin class _$RouteAttributesModelCopyWith<$Res> implements $RouteAttributesModelCopyWith<$Res> {
  factory _$RouteAttributesModelCopyWith(_RouteAttributesModel value, $Res Function(_RouteAttributesModel) _then) = __$RouteAttributesModelCopyWithImpl;
@override @useResult
$Res call({
@JsonKey(name: 'Name') String? name,@JsonKey(name: 'Total_TravelTime') double? totalTravelTime,@JsonKey(name: 'Total_Kilometers') double? totalKilometers
});




}
/// @nodoc
class __$RouteAttributesModelCopyWithImpl<$Res>
    implements _$RouteAttributesModelCopyWith<$Res> {
  __$RouteAttributesModelCopyWithImpl(this._self, this._then);

  final _RouteAttributesModel _self;
  final $Res Function(_RouteAttributesModel) _then;

/// Create a copy of RouteAttributesModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? name = freezed,Object? totalTravelTime = freezed,Object? totalKilometers = freezed,}) {
  return _then(_RouteAttributesModel(
name: freezed == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String?,totalTravelTime: freezed == totalTravelTime ? _self.totalTravelTime : totalTravelTime // ignore: cast_nullable_to_non_nullable
as double?,totalKilometers: freezed == totalKilometers ? _self.totalKilometers : totalKilometers // ignore: cast_nullable_to_non_nullable
as double?,
  ));
}


}


/// @nodoc
mixin _$RouteGeometryModel {

@JsonKey(name: 'paths') List<List<List<double>>> get paths;
/// Create a copy of RouteGeometryModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$RouteGeometryModelCopyWith<RouteGeometryModel> get copyWith => _$RouteGeometryModelCopyWithImpl<RouteGeometryModel>(this as RouteGeometryModel, _$identity);

  /// Serializes this RouteGeometryModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is RouteGeometryModel&&const DeepCollectionEquality().equals(other.paths, paths));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(paths));

@override
String toString() {
  return 'RouteGeometryModel(paths: $paths)';
}


}

/// @nodoc
abstract mixin class $RouteGeometryModelCopyWith<$Res>  {
  factory $RouteGeometryModelCopyWith(RouteGeometryModel value, $Res Function(RouteGeometryModel) _then) = _$RouteGeometryModelCopyWithImpl;
@useResult
$Res call({
@JsonKey(name: 'paths') List<List<List<double>>> paths
});




}
/// @nodoc
class _$RouteGeometryModelCopyWithImpl<$Res>
    implements $RouteGeometryModelCopyWith<$Res> {
  _$RouteGeometryModelCopyWithImpl(this._self, this._then);

  final RouteGeometryModel _self;
  final $Res Function(RouteGeometryModel) _then;

/// Create a copy of RouteGeometryModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? paths = null,}) {
  return _then(_self.copyWith(
paths: null == paths ? _self.paths : paths // ignore: cast_nullable_to_non_nullable
as List<List<List<double>>>,
  ));
}

}


/// Adds pattern-matching-related methods to [RouteGeometryModel].
extension RouteGeometryModelPatterns on RouteGeometryModel {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _RouteGeometryModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _RouteGeometryModel() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _RouteGeometryModel value)  $default,){
final _that = this;
switch (_that) {
case _RouteGeometryModel():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _RouteGeometryModel value)?  $default,){
final _that = this;
switch (_that) {
case _RouteGeometryModel() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function(@JsonKey(name: 'paths')  List<List<List<double>>> paths)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _RouteGeometryModel() when $default != null:
return $default(_that.paths);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function(@JsonKey(name: 'paths')  List<List<List<double>>> paths)  $default,) {final _that = this;
switch (_that) {
case _RouteGeometryModel():
return $default(_that.paths);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function(@JsonKey(name: 'paths')  List<List<List<double>>> paths)?  $default,) {final _that = this;
switch (_that) {
case _RouteGeometryModel() when $default != null:
return $default(_that.paths);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _RouteGeometryModel implements RouteGeometryModel {
  const _RouteGeometryModel({@JsonKey(name: 'paths') final  List<List<List<double>>> paths = const []}): _paths = paths;
  factory _RouteGeometryModel.fromJson(Map<String, dynamic> json) => _$RouteGeometryModelFromJson(json);

 final  List<List<List<double>>> _paths;
@override@JsonKey(name: 'paths') List<List<List<double>>> get paths {
  if (_paths is EqualUnmodifiableListView) return _paths;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_paths);
}


/// Create a copy of RouteGeometryModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$RouteGeometryModelCopyWith<_RouteGeometryModel> get copyWith => __$RouteGeometryModelCopyWithImpl<_RouteGeometryModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$RouteGeometryModelToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _RouteGeometryModel&&const DeepCollectionEquality().equals(other._paths, _paths));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(_paths));

@override
String toString() {
  return 'RouteGeometryModel(paths: $paths)';
}


}

/// @nodoc
abstract mixin class _$RouteGeometryModelCopyWith<$Res> implements $RouteGeometryModelCopyWith<$Res> {
  factory _$RouteGeometryModelCopyWith(_RouteGeometryModel value, $Res Function(_RouteGeometryModel) _then) = __$RouteGeometryModelCopyWithImpl;
@override @useResult
$Res call({
@JsonKey(name: 'paths') List<List<List<double>>> paths
});




}
/// @nodoc
class __$RouteGeometryModelCopyWithImpl<$Res>
    implements _$RouteGeometryModelCopyWith<$Res> {
  __$RouteGeometryModelCopyWithImpl(this._self, this._then);

  final _RouteGeometryModel _self;
  final $Res Function(_RouteGeometryModel) _then;

/// Create a copy of RouteGeometryModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? paths = null,}) {
  return _then(_RouteGeometryModel(
paths: null == paths ? _self._paths : paths // ignore: cast_nullable_to_non_nullable
as List<List<List<double>>>,
  ));
}


}


/// @nodoc
mixin _$RouteDirectionSetModel {

@JsonKey(name: 'summary') RouteDirectionSummaryModel? get summary;@JsonKey(name: 'features') List<RouteDirectionFeatureModel> get features;
/// Create a copy of RouteDirectionSetModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$RouteDirectionSetModelCopyWith<RouteDirectionSetModel> get copyWith => _$RouteDirectionSetModelCopyWithImpl<RouteDirectionSetModel>(this as RouteDirectionSetModel, _$identity);

  /// Serializes this RouteDirectionSetModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is RouteDirectionSetModel&&(identical(other.summary, summary) || other.summary == summary)&&const DeepCollectionEquality().equals(other.features, features));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,summary,const DeepCollectionEquality().hash(features));

@override
String toString() {
  return 'RouteDirectionSetModel(summary: $summary, features: $features)';
}


}

/// @nodoc
abstract mixin class $RouteDirectionSetModelCopyWith<$Res>  {
  factory $RouteDirectionSetModelCopyWith(RouteDirectionSetModel value, $Res Function(RouteDirectionSetModel) _then) = _$RouteDirectionSetModelCopyWithImpl;
@useResult
$Res call({
@JsonKey(name: 'summary') RouteDirectionSummaryModel? summary,@JsonKey(name: 'features') List<RouteDirectionFeatureModel> features
});


$RouteDirectionSummaryModelCopyWith<$Res>? get summary;

}
/// @nodoc
class _$RouteDirectionSetModelCopyWithImpl<$Res>
    implements $RouteDirectionSetModelCopyWith<$Res> {
  _$RouteDirectionSetModelCopyWithImpl(this._self, this._then);

  final RouteDirectionSetModel _self;
  final $Res Function(RouteDirectionSetModel) _then;

/// Create a copy of RouteDirectionSetModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? summary = freezed,Object? features = null,}) {
  return _then(_self.copyWith(
summary: freezed == summary ? _self.summary : summary // ignore: cast_nullable_to_non_nullable
as RouteDirectionSummaryModel?,features: null == features ? _self.features : features // ignore: cast_nullable_to_non_nullable
as List<RouteDirectionFeatureModel>,
  ));
}
/// Create a copy of RouteDirectionSetModel
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$RouteDirectionSummaryModelCopyWith<$Res>? get summary {
    if (_self.summary == null) {
    return null;
  }

  return $RouteDirectionSummaryModelCopyWith<$Res>(_self.summary!, (value) {
    return _then(_self.copyWith(summary: value));
  });
}
}


/// Adds pattern-matching-related methods to [RouteDirectionSetModel].
extension RouteDirectionSetModelPatterns on RouteDirectionSetModel {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _RouteDirectionSetModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _RouteDirectionSetModel() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _RouteDirectionSetModel value)  $default,){
final _that = this;
switch (_that) {
case _RouteDirectionSetModel():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _RouteDirectionSetModel value)?  $default,){
final _that = this;
switch (_that) {
case _RouteDirectionSetModel() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function(@JsonKey(name: 'summary')  RouteDirectionSummaryModel? summary, @JsonKey(name: 'features')  List<RouteDirectionFeatureModel> features)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _RouteDirectionSetModel() when $default != null:
return $default(_that.summary,_that.features);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function(@JsonKey(name: 'summary')  RouteDirectionSummaryModel? summary, @JsonKey(name: 'features')  List<RouteDirectionFeatureModel> features)  $default,) {final _that = this;
switch (_that) {
case _RouteDirectionSetModel():
return $default(_that.summary,_that.features);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function(@JsonKey(name: 'summary')  RouteDirectionSummaryModel? summary, @JsonKey(name: 'features')  List<RouteDirectionFeatureModel> features)?  $default,) {final _that = this;
switch (_that) {
case _RouteDirectionSetModel() when $default != null:
return $default(_that.summary,_that.features);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _RouteDirectionSetModel implements RouteDirectionSetModel {
  const _RouteDirectionSetModel({@JsonKey(name: 'summary') this.summary, @JsonKey(name: 'features') final  List<RouteDirectionFeatureModel> features = const []}): _features = features;
  factory _RouteDirectionSetModel.fromJson(Map<String, dynamic> json) => _$RouteDirectionSetModelFromJson(json);

@override@JsonKey(name: 'summary') final  RouteDirectionSummaryModel? summary;
 final  List<RouteDirectionFeatureModel> _features;
@override@JsonKey(name: 'features') List<RouteDirectionFeatureModel> get features {
  if (_features is EqualUnmodifiableListView) return _features;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_features);
}


/// Create a copy of RouteDirectionSetModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$RouteDirectionSetModelCopyWith<_RouteDirectionSetModel> get copyWith => __$RouteDirectionSetModelCopyWithImpl<_RouteDirectionSetModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$RouteDirectionSetModelToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _RouteDirectionSetModel&&(identical(other.summary, summary) || other.summary == summary)&&const DeepCollectionEquality().equals(other._features, _features));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,summary,const DeepCollectionEquality().hash(_features));

@override
String toString() {
  return 'RouteDirectionSetModel(summary: $summary, features: $features)';
}


}

/// @nodoc
abstract mixin class _$RouteDirectionSetModelCopyWith<$Res> implements $RouteDirectionSetModelCopyWith<$Res> {
  factory _$RouteDirectionSetModelCopyWith(_RouteDirectionSetModel value, $Res Function(_RouteDirectionSetModel) _then) = __$RouteDirectionSetModelCopyWithImpl;
@override @useResult
$Res call({
@JsonKey(name: 'summary') RouteDirectionSummaryModel? summary,@JsonKey(name: 'features') List<RouteDirectionFeatureModel> features
});


@override $RouteDirectionSummaryModelCopyWith<$Res>? get summary;

}
/// @nodoc
class __$RouteDirectionSetModelCopyWithImpl<$Res>
    implements _$RouteDirectionSetModelCopyWith<$Res> {
  __$RouteDirectionSetModelCopyWithImpl(this._self, this._then);

  final _RouteDirectionSetModel _self;
  final $Res Function(_RouteDirectionSetModel) _then;

/// Create a copy of RouteDirectionSetModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? summary = freezed,Object? features = null,}) {
  return _then(_RouteDirectionSetModel(
summary: freezed == summary ? _self.summary : summary // ignore: cast_nullable_to_non_nullable
as RouteDirectionSummaryModel?,features: null == features ? _self._features : features // ignore: cast_nullable_to_non_nullable
as List<RouteDirectionFeatureModel>,
  ));
}

/// Create a copy of RouteDirectionSetModel
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$RouteDirectionSummaryModelCopyWith<$Res>? get summary {
    if (_self.summary == null) {
    return null;
  }

  return $RouteDirectionSummaryModelCopyWith<$Res>(_self.summary!, (value) {
    return _then(_self.copyWith(summary: value));
  });
}
}


/// @nodoc
mixin _$RouteDirectionSummaryModel {

@JsonKey(name: 'envelope') RouteEnvelopeModel? get envelope;
/// Create a copy of RouteDirectionSummaryModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$RouteDirectionSummaryModelCopyWith<RouteDirectionSummaryModel> get copyWith => _$RouteDirectionSummaryModelCopyWithImpl<RouteDirectionSummaryModel>(this as RouteDirectionSummaryModel, _$identity);

  /// Serializes this RouteDirectionSummaryModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is RouteDirectionSummaryModel&&(identical(other.envelope, envelope) || other.envelope == envelope));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,envelope);

@override
String toString() {
  return 'RouteDirectionSummaryModel(envelope: $envelope)';
}


}

/// @nodoc
abstract mixin class $RouteDirectionSummaryModelCopyWith<$Res>  {
  factory $RouteDirectionSummaryModelCopyWith(RouteDirectionSummaryModel value, $Res Function(RouteDirectionSummaryModel) _then) = _$RouteDirectionSummaryModelCopyWithImpl;
@useResult
$Res call({
@JsonKey(name: 'envelope') RouteEnvelopeModel? envelope
});


$RouteEnvelopeModelCopyWith<$Res>? get envelope;

}
/// @nodoc
class _$RouteDirectionSummaryModelCopyWithImpl<$Res>
    implements $RouteDirectionSummaryModelCopyWith<$Res> {
  _$RouteDirectionSummaryModelCopyWithImpl(this._self, this._then);

  final RouteDirectionSummaryModel _self;
  final $Res Function(RouteDirectionSummaryModel) _then;

/// Create a copy of RouteDirectionSummaryModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? envelope = freezed,}) {
  return _then(_self.copyWith(
envelope: freezed == envelope ? _self.envelope : envelope // ignore: cast_nullable_to_non_nullable
as RouteEnvelopeModel?,
  ));
}
/// Create a copy of RouteDirectionSummaryModel
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$RouteEnvelopeModelCopyWith<$Res>? get envelope {
    if (_self.envelope == null) {
    return null;
  }

  return $RouteEnvelopeModelCopyWith<$Res>(_self.envelope!, (value) {
    return _then(_self.copyWith(envelope: value));
  });
}
}


/// Adds pattern-matching-related methods to [RouteDirectionSummaryModel].
extension RouteDirectionSummaryModelPatterns on RouteDirectionSummaryModel {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _RouteDirectionSummaryModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _RouteDirectionSummaryModel() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _RouteDirectionSummaryModel value)  $default,){
final _that = this;
switch (_that) {
case _RouteDirectionSummaryModel():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _RouteDirectionSummaryModel value)?  $default,){
final _that = this;
switch (_that) {
case _RouteDirectionSummaryModel() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function(@JsonKey(name: 'envelope')  RouteEnvelopeModel? envelope)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _RouteDirectionSummaryModel() when $default != null:
return $default(_that.envelope);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function(@JsonKey(name: 'envelope')  RouteEnvelopeModel? envelope)  $default,) {final _that = this;
switch (_that) {
case _RouteDirectionSummaryModel():
return $default(_that.envelope);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function(@JsonKey(name: 'envelope')  RouteEnvelopeModel? envelope)?  $default,) {final _that = this;
switch (_that) {
case _RouteDirectionSummaryModel() when $default != null:
return $default(_that.envelope);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _RouteDirectionSummaryModel implements RouteDirectionSummaryModel {
  const _RouteDirectionSummaryModel({@JsonKey(name: 'envelope') this.envelope});
  factory _RouteDirectionSummaryModel.fromJson(Map<String, dynamic> json) => _$RouteDirectionSummaryModelFromJson(json);

@override@JsonKey(name: 'envelope') final  RouteEnvelopeModel? envelope;

/// Create a copy of RouteDirectionSummaryModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$RouteDirectionSummaryModelCopyWith<_RouteDirectionSummaryModel> get copyWith => __$RouteDirectionSummaryModelCopyWithImpl<_RouteDirectionSummaryModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$RouteDirectionSummaryModelToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _RouteDirectionSummaryModel&&(identical(other.envelope, envelope) || other.envelope == envelope));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,envelope);

@override
String toString() {
  return 'RouteDirectionSummaryModel(envelope: $envelope)';
}


}

/// @nodoc
abstract mixin class _$RouteDirectionSummaryModelCopyWith<$Res> implements $RouteDirectionSummaryModelCopyWith<$Res> {
  factory _$RouteDirectionSummaryModelCopyWith(_RouteDirectionSummaryModel value, $Res Function(_RouteDirectionSummaryModel) _then) = __$RouteDirectionSummaryModelCopyWithImpl;
@override @useResult
$Res call({
@JsonKey(name: 'envelope') RouteEnvelopeModel? envelope
});


@override $RouteEnvelopeModelCopyWith<$Res>? get envelope;

}
/// @nodoc
class __$RouteDirectionSummaryModelCopyWithImpl<$Res>
    implements _$RouteDirectionSummaryModelCopyWith<$Res> {
  __$RouteDirectionSummaryModelCopyWithImpl(this._self, this._then);

  final _RouteDirectionSummaryModel _self;
  final $Res Function(_RouteDirectionSummaryModel) _then;

/// Create a copy of RouteDirectionSummaryModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? envelope = freezed,}) {
  return _then(_RouteDirectionSummaryModel(
envelope: freezed == envelope ? _self.envelope : envelope // ignore: cast_nullable_to_non_nullable
as RouteEnvelopeModel?,
  ));
}

/// Create a copy of RouteDirectionSummaryModel
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$RouteEnvelopeModelCopyWith<$Res>? get envelope {
    if (_self.envelope == null) {
    return null;
  }

  return $RouteEnvelopeModelCopyWith<$Res>(_self.envelope!, (value) {
    return _then(_self.copyWith(envelope: value));
  });
}
}


/// @nodoc
mixin _$RouteEnvelopeModel {

 double? get xmin; double? get ymin; double? get xmax; double? get ymax;
/// Create a copy of RouteEnvelopeModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$RouteEnvelopeModelCopyWith<RouteEnvelopeModel> get copyWith => _$RouteEnvelopeModelCopyWithImpl<RouteEnvelopeModel>(this as RouteEnvelopeModel, _$identity);

  /// Serializes this RouteEnvelopeModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is RouteEnvelopeModel&&(identical(other.xmin, xmin) || other.xmin == xmin)&&(identical(other.ymin, ymin) || other.ymin == ymin)&&(identical(other.xmax, xmax) || other.xmax == xmax)&&(identical(other.ymax, ymax) || other.ymax == ymax));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,xmin,ymin,xmax,ymax);

@override
String toString() {
  return 'RouteEnvelopeModel(xmin: $xmin, ymin: $ymin, xmax: $xmax, ymax: $ymax)';
}


}

/// @nodoc
abstract mixin class $RouteEnvelopeModelCopyWith<$Res>  {
  factory $RouteEnvelopeModelCopyWith(RouteEnvelopeModel value, $Res Function(RouteEnvelopeModel) _then) = _$RouteEnvelopeModelCopyWithImpl;
@useResult
$Res call({
 double? xmin, double? ymin, double? xmax, double? ymax
});




}
/// @nodoc
class _$RouteEnvelopeModelCopyWithImpl<$Res>
    implements $RouteEnvelopeModelCopyWith<$Res> {
  _$RouteEnvelopeModelCopyWithImpl(this._self, this._then);

  final RouteEnvelopeModel _self;
  final $Res Function(RouteEnvelopeModel) _then;

/// Create a copy of RouteEnvelopeModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? xmin = freezed,Object? ymin = freezed,Object? xmax = freezed,Object? ymax = freezed,}) {
  return _then(_self.copyWith(
xmin: freezed == xmin ? _self.xmin : xmin // ignore: cast_nullable_to_non_nullable
as double?,ymin: freezed == ymin ? _self.ymin : ymin // ignore: cast_nullable_to_non_nullable
as double?,xmax: freezed == xmax ? _self.xmax : xmax // ignore: cast_nullable_to_non_nullable
as double?,ymax: freezed == ymax ? _self.ymax : ymax // ignore: cast_nullable_to_non_nullable
as double?,
  ));
}

}


/// Adds pattern-matching-related methods to [RouteEnvelopeModel].
extension RouteEnvelopeModelPatterns on RouteEnvelopeModel {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _RouteEnvelopeModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _RouteEnvelopeModel() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _RouteEnvelopeModel value)  $default,){
final _that = this;
switch (_that) {
case _RouteEnvelopeModel():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _RouteEnvelopeModel value)?  $default,){
final _that = this;
switch (_that) {
case _RouteEnvelopeModel() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( double? xmin,  double? ymin,  double? xmax,  double? ymax)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _RouteEnvelopeModel() when $default != null:
return $default(_that.xmin,_that.ymin,_that.xmax,_that.ymax);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( double? xmin,  double? ymin,  double? xmax,  double? ymax)  $default,) {final _that = this;
switch (_that) {
case _RouteEnvelopeModel():
return $default(_that.xmin,_that.ymin,_that.xmax,_that.ymax);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( double? xmin,  double? ymin,  double? xmax,  double? ymax)?  $default,) {final _that = this;
switch (_that) {
case _RouteEnvelopeModel() when $default != null:
return $default(_that.xmin,_that.ymin,_that.xmax,_that.ymax);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _RouteEnvelopeModel implements RouteEnvelopeModel {
  const _RouteEnvelopeModel({this.xmin, this.ymin, this.xmax, this.ymax});
  factory _RouteEnvelopeModel.fromJson(Map<String, dynamic> json) => _$RouteEnvelopeModelFromJson(json);

@override final  double? xmin;
@override final  double? ymin;
@override final  double? xmax;
@override final  double? ymax;

/// Create a copy of RouteEnvelopeModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$RouteEnvelopeModelCopyWith<_RouteEnvelopeModel> get copyWith => __$RouteEnvelopeModelCopyWithImpl<_RouteEnvelopeModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$RouteEnvelopeModelToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _RouteEnvelopeModel&&(identical(other.xmin, xmin) || other.xmin == xmin)&&(identical(other.ymin, ymin) || other.ymin == ymin)&&(identical(other.xmax, xmax) || other.xmax == xmax)&&(identical(other.ymax, ymax) || other.ymax == ymax));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,xmin,ymin,xmax,ymax);

@override
String toString() {
  return 'RouteEnvelopeModel(xmin: $xmin, ymin: $ymin, xmax: $xmax, ymax: $ymax)';
}


}

/// @nodoc
abstract mixin class _$RouteEnvelopeModelCopyWith<$Res> implements $RouteEnvelopeModelCopyWith<$Res> {
  factory _$RouteEnvelopeModelCopyWith(_RouteEnvelopeModel value, $Res Function(_RouteEnvelopeModel) _then) = __$RouteEnvelopeModelCopyWithImpl;
@override @useResult
$Res call({
 double? xmin, double? ymin, double? xmax, double? ymax
});




}
/// @nodoc
class __$RouteEnvelopeModelCopyWithImpl<$Res>
    implements _$RouteEnvelopeModelCopyWith<$Res> {
  __$RouteEnvelopeModelCopyWithImpl(this._self, this._then);

  final _RouteEnvelopeModel _self;
  final $Res Function(_RouteEnvelopeModel) _then;

/// Create a copy of RouteEnvelopeModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? xmin = freezed,Object? ymin = freezed,Object? xmax = freezed,Object? ymax = freezed,}) {
  return _then(_RouteEnvelopeModel(
xmin: freezed == xmin ? _self.xmin : xmin // ignore: cast_nullable_to_non_nullable
as double?,ymin: freezed == ymin ? _self.ymin : ymin // ignore: cast_nullable_to_non_nullable
as double?,xmax: freezed == xmax ? _self.xmax : xmax // ignore: cast_nullable_to_non_nullable
as double?,ymax: freezed == ymax ? _self.ymax : ymax // ignore: cast_nullable_to_non_nullable
as double?,
  ));
}


}


/// @nodoc
mixin _$RouteDirectionFeatureModel {

@JsonKey(name: 'attributes') RouteDirectionAttributesModel get attributes;@JsonKey(name: 'strings') List<RouteDirectionStringModel> get strings;
/// Create a copy of RouteDirectionFeatureModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$RouteDirectionFeatureModelCopyWith<RouteDirectionFeatureModel> get copyWith => _$RouteDirectionFeatureModelCopyWithImpl<RouteDirectionFeatureModel>(this as RouteDirectionFeatureModel, _$identity);

  /// Serializes this RouteDirectionFeatureModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is RouteDirectionFeatureModel&&(identical(other.attributes, attributes) || other.attributes == attributes)&&const DeepCollectionEquality().equals(other.strings, strings));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,attributes,const DeepCollectionEquality().hash(strings));

@override
String toString() {
  return 'RouteDirectionFeatureModel(attributes: $attributes, strings: $strings)';
}


}

/// @nodoc
abstract mixin class $RouteDirectionFeatureModelCopyWith<$Res>  {
  factory $RouteDirectionFeatureModelCopyWith(RouteDirectionFeatureModel value, $Res Function(RouteDirectionFeatureModel) _then) = _$RouteDirectionFeatureModelCopyWithImpl;
@useResult
$Res call({
@JsonKey(name: 'attributes') RouteDirectionAttributesModel attributes,@JsonKey(name: 'strings') List<RouteDirectionStringModel> strings
});


$RouteDirectionAttributesModelCopyWith<$Res> get attributes;

}
/// @nodoc
class _$RouteDirectionFeatureModelCopyWithImpl<$Res>
    implements $RouteDirectionFeatureModelCopyWith<$Res> {
  _$RouteDirectionFeatureModelCopyWithImpl(this._self, this._then);

  final RouteDirectionFeatureModel _self;
  final $Res Function(RouteDirectionFeatureModel) _then;

/// Create a copy of RouteDirectionFeatureModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? attributes = null,Object? strings = null,}) {
  return _then(_self.copyWith(
attributes: null == attributes ? _self.attributes : attributes // ignore: cast_nullable_to_non_nullable
as RouteDirectionAttributesModel,strings: null == strings ? _self.strings : strings // ignore: cast_nullable_to_non_nullable
as List<RouteDirectionStringModel>,
  ));
}
/// Create a copy of RouteDirectionFeatureModel
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$RouteDirectionAttributesModelCopyWith<$Res> get attributes {
  
  return $RouteDirectionAttributesModelCopyWith<$Res>(_self.attributes, (value) {
    return _then(_self.copyWith(attributes: value));
  });
}
}


/// Adds pattern-matching-related methods to [RouteDirectionFeatureModel].
extension RouteDirectionFeatureModelPatterns on RouteDirectionFeatureModel {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _RouteDirectionFeatureModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _RouteDirectionFeatureModel() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _RouteDirectionFeatureModel value)  $default,){
final _that = this;
switch (_that) {
case _RouteDirectionFeatureModel():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _RouteDirectionFeatureModel value)?  $default,){
final _that = this;
switch (_that) {
case _RouteDirectionFeatureModel() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function(@JsonKey(name: 'attributes')  RouteDirectionAttributesModel attributes, @JsonKey(name: 'strings')  List<RouteDirectionStringModel> strings)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _RouteDirectionFeatureModel() when $default != null:
return $default(_that.attributes,_that.strings);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function(@JsonKey(name: 'attributes')  RouteDirectionAttributesModel attributes, @JsonKey(name: 'strings')  List<RouteDirectionStringModel> strings)  $default,) {final _that = this;
switch (_that) {
case _RouteDirectionFeatureModel():
return $default(_that.attributes,_that.strings);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function(@JsonKey(name: 'attributes')  RouteDirectionAttributesModel attributes, @JsonKey(name: 'strings')  List<RouteDirectionStringModel> strings)?  $default,) {final _that = this;
switch (_that) {
case _RouteDirectionFeatureModel() when $default != null:
return $default(_that.attributes,_that.strings);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _RouteDirectionFeatureModel implements RouteDirectionFeatureModel {
  const _RouteDirectionFeatureModel({@JsonKey(name: 'attributes') required this.attributes, @JsonKey(name: 'strings') final  List<RouteDirectionStringModel> strings = const []}): _strings = strings;
  factory _RouteDirectionFeatureModel.fromJson(Map<String, dynamic> json) => _$RouteDirectionFeatureModelFromJson(json);

@override@JsonKey(name: 'attributes') final  RouteDirectionAttributesModel attributes;
 final  List<RouteDirectionStringModel> _strings;
@override@JsonKey(name: 'strings') List<RouteDirectionStringModel> get strings {
  if (_strings is EqualUnmodifiableListView) return _strings;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_strings);
}


/// Create a copy of RouteDirectionFeatureModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$RouteDirectionFeatureModelCopyWith<_RouteDirectionFeatureModel> get copyWith => __$RouteDirectionFeatureModelCopyWithImpl<_RouteDirectionFeatureModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$RouteDirectionFeatureModelToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _RouteDirectionFeatureModel&&(identical(other.attributes, attributes) || other.attributes == attributes)&&const DeepCollectionEquality().equals(other._strings, _strings));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,attributes,const DeepCollectionEquality().hash(_strings));

@override
String toString() {
  return 'RouteDirectionFeatureModel(attributes: $attributes, strings: $strings)';
}


}

/// @nodoc
abstract mixin class _$RouteDirectionFeatureModelCopyWith<$Res> implements $RouteDirectionFeatureModelCopyWith<$Res> {
  factory _$RouteDirectionFeatureModelCopyWith(_RouteDirectionFeatureModel value, $Res Function(_RouteDirectionFeatureModel) _then) = __$RouteDirectionFeatureModelCopyWithImpl;
@override @useResult
$Res call({
@JsonKey(name: 'attributes') RouteDirectionAttributesModel attributes,@JsonKey(name: 'strings') List<RouteDirectionStringModel> strings
});


@override $RouteDirectionAttributesModelCopyWith<$Res> get attributes;

}
/// @nodoc
class __$RouteDirectionFeatureModelCopyWithImpl<$Res>
    implements _$RouteDirectionFeatureModelCopyWith<$Res> {
  __$RouteDirectionFeatureModelCopyWithImpl(this._self, this._then);

  final _RouteDirectionFeatureModel _self;
  final $Res Function(_RouteDirectionFeatureModel) _then;

/// Create a copy of RouteDirectionFeatureModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? attributes = null,Object? strings = null,}) {
  return _then(_RouteDirectionFeatureModel(
attributes: null == attributes ? _self.attributes : attributes // ignore: cast_nullable_to_non_nullable
as RouteDirectionAttributesModel,strings: null == strings ? _self._strings : strings // ignore: cast_nullable_to_non_nullable
as List<RouteDirectionStringModel>,
  ));
}

/// Create a copy of RouteDirectionFeatureModel
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$RouteDirectionAttributesModelCopyWith<$Res> get attributes {
  
  return $RouteDirectionAttributesModelCopyWith<$Res>(_self.attributes, (value) {
    return _then(_self.copyWith(attributes: value));
  });
}
}


/// @nodoc
mixin _$RouteDirectionAttributesModel {

@JsonKey(name: 'length') double get length;@JsonKey(name: 'time') double get time;@JsonKey(name: 'text') String? get text;@JsonKey(name: 'maneuverType') String? get maneuverType;
/// Create a copy of RouteDirectionAttributesModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$RouteDirectionAttributesModelCopyWith<RouteDirectionAttributesModel> get copyWith => _$RouteDirectionAttributesModelCopyWithImpl<RouteDirectionAttributesModel>(this as RouteDirectionAttributesModel, _$identity);

  /// Serializes this RouteDirectionAttributesModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is RouteDirectionAttributesModel&&(identical(other.length, length) || other.length == length)&&(identical(other.time, time) || other.time == time)&&(identical(other.text, text) || other.text == text)&&(identical(other.maneuverType, maneuverType) || other.maneuverType == maneuverType));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,length,time,text,maneuverType);

@override
String toString() {
  return 'RouteDirectionAttributesModel(length: $length, time: $time, text: $text, maneuverType: $maneuverType)';
}


}

/// @nodoc
abstract mixin class $RouteDirectionAttributesModelCopyWith<$Res>  {
  factory $RouteDirectionAttributesModelCopyWith(RouteDirectionAttributesModel value, $Res Function(RouteDirectionAttributesModel) _then) = _$RouteDirectionAttributesModelCopyWithImpl;
@useResult
$Res call({
@JsonKey(name: 'length') double length,@JsonKey(name: 'time') double time,@JsonKey(name: 'text') String? text,@JsonKey(name: 'maneuverType') String? maneuverType
});




}
/// @nodoc
class _$RouteDirectionAttributesModelCopyWithImpl<$Res>
    implements $RouteDirectionAttributesModelCopyWith<$Res> {
  _$RouteDirectionAttributesModelCopyWithImpl(this._self, this._then);

  final RouteDirectionAttributesModel _self;
  final $Res Function(RouteDirectionAttributesModel) _then;

/// Create a copy of RouteDirectionAttributesModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? length = null,Object? time = null,Object? text = freezed,Object? maneuverType = freezed,}) {
  return _then(_self.copyWith(
length: null == length ? _self.length : length // ignore: cast_nullable_to_non_nullable
as double,time: null == time ? _self.time : time // ignore: cast_nullable_to_non_nullable
as double,text: freezed == text ? _self.text : text // ignore: cast_nullable_to_non_nullable
as String?,maneuverType: freezed == maneuverType ? _self.maneuverType : maneuverType // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// Adds pattern-matching-related methods to [RouteDirectionAttributesModel].
extension RouteDirectionAttributesModelPatterns on RouteDirectionAttributesModel {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _RouteDirectionAttributesModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _RouteDirectionAttributesModel() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _RouteDirectionAttributesModel value)  $default,){
final _that = this;
switch (_that) {
case _RouteDirectionAttributesModel():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _RouteDirectionAttributesModel value)?  $default,){
final _that = this;
switch (_that) {
case _RouteDirectionAttributesModel() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function(@JsonKey(name: 'length')  double length, @JsonKey(name: 'time')  double time, @JsonKey(name: 'text')  String? text, @JsonKey(name: 'maneuverType')  String? maneuverType)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _RouteDirectionAttributesModel() when $default != null:
return $default(_that.length,_that.time,_that.text,_that.maneuverType);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function(@JsonKey(name: 'length')  double length, @JsonKey(name: 'time')  double time, @JsonKey(name: 'text')  String? text, @JsonKey(name: 'maneuverType')  String? maneuverType)  $default,) {final _that = this;
switch (_that) {
case _RouteDirectionAttributesModel():
return $default(_that.length,_that.time,_that.text,_that.maneuverType);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function(@JsonKey(name: 'length')  double length, @JsonKey(name: 'time')  double time, @JsonKey(name: 'text')  String? text, @JsonKey(name: 'maneuverType')  String? maneuverType)?  $default,) {final _that = this;
switch (_that) {
case _RouteDirectionAttributesModel() when $default != null:
return $default(_that.length,_that.time,_that.text,_that.maneuverType);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _RouteDirectionAttributesModel implements RouteDirectionAttributesModel {
  const _RouteDirectionAttributesModel({@JsonKey(name: 'length') this.length = 0, @JsonKey(name: 'time') this.time = 0, @JsonKey(name: 'text') this.text, @JsonKey(name: 'maneuverType') this.maneuverType});
  factory _RouteDirectionAttributesModel.fromJson(Map<String, dynamic> json) => _$RouteDirectionAttributesModelFromJson(json);

@override@JsonKey(name: 'length') final  double length;
@override@JsonKey(name: 'time') final  double time;
@override@JsonKey(name: 'text') final  String? text;
@override@JsonKey(name: 'maneuverType') final  String? maneuverType;

/// Create a copy of RouteDirectionAttributesModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$RouteDirectionAttributesModelCopyWith<_RouteDirectionAttributesModel> get copyWith => __$RouteDirectionAttributesModelCopyWithImpl<_RouteDirectionAttributesModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$RouteDirectionAttributesModelToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _RouteDirectionAttributesModel&&(identical(other.length, length) || other.length == length)&&(identical(other.time, time) || other.time == time)&&(identical(other.text, text) || other.text == text)&&(identical(other.maneuverType, maneuverType) || other.maneuverType == maneuverType));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,length,time,text,maneuverType);

@override
String toString() {
  return 'RouteDirectionAttributesModel(length: $length, time: $time, text: $text, maneuverType: $maneuverType)';
}


}

/// @nodoc
abstract mixin class _$RouteDirectionAttributesModelCopyWith<$Res> implements $RouteDirectionAttributesModelCopyWith<$Res> {
  factory _$RouteDirectionAttributesModelCopyWith(_RouteDirectionAttributesModel value, $Res Function(_RouteDirectionAttributesModel) _then) = __$RouteDirectionAttributesModelCopyWithImpl;
@override @useResult
$Res call({
@JsonKey(name: 'length') double length,@JsonKey(name: 'time') double time,@JsonKey(name: 'text') String? text,@JsonKey(name: 'maneuverType') String? maneuverType
});




}
/// @nodoc
class __$RouteDirectionAttributesModelCopyWithImpl<$Res>
    implements _$RouteDirectionAttributesModelCopyWith<$Res> {
  __$RouteDirectionAttributesModelCopyWithImpl(this._self, this._then);

  final _RouteDirectionAttributesModel _self;
  final $Res Function(_RouteDirectionAttributesModel) _then;

/// Create a copy of RouteDirectionAttributesModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? length = null,Object? time = null,Object? text = freezed,Object? maneuverType = freezed,}) {
  return _then(_RouteDirectionAttributesModel(
length: null == length ? _self.length : length // ignore: cast_nullable_to_non_nullable
as double,time: null == time ? _self.time : time // ignore: cast_nullable_to_non_nullable
as double,text: freezed == text ? _self.text : text // ignore: cast_nullable_to_non_nullable
as String?,maneuverType: freezed == maneuverType ? _self.maneuverType : maneuverType // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}


/// @nodoc
mixin _$RouteDirectionStringModel {

@JsonKey(name: 'string') String? get string;@JsonKey(name: 'stringType') String? get stringType;
/// Create a copy of RouteDirectionStringModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$RouteDirectionStringModelCopyWith<RouteDirectionStringModel> get copyWith => _$RouteDirectionStringModelCopyWithImpl<RouteDirectionStringModel>(this as RouteDirectionStringModel, _$identity);

  /// Serializes this RouteDirectionStringModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is RouteDirectionStringModel&&(identical(other.string, string) || other.string == string)&&(identical(other.stringType, stringType) || other.stringType == stringType));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,string,stringType);

@override
String toString() {
  return 'RouteDirectionStringModel(string: $string, stringType: $stringType)';
}


}

/// @nodoc
abstract mixin class $RouteDirectionStringModelCopyWith<$Res>  {
  factory $RouteDirectionStringModelCopyWith(RouteDirectionStringModel value, $Res Function(RouteDirectionStringModel) _then) = _$RouteDirectionStringModelCopyWithImpl;
@useResult
$Res call({
@JsonKey(name: 'string') String? string,@JsonKey(name: 'stringType') String? stringType
});




}
/// @nodoc
class _$RouteDirectionStringModelCopyWithImpl<$Res>
    implements $RouteDirectionStringModelCopyWith<$Res> {
  _$RouteDirectionStringModelCopyWithImpl(this._self, this._then);

  final RouteDirectionStringModel _self;
  final $Res Function(RouteDirectionStringModel) _then;

/// Create a copy of RouteDirectionStringModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? string = freezed,Object? stringType = freezed,}) {
  return _then(_self.copyWith(
string: freezed == string ? _self.string : string // ignore: cast_nullable_to_non_nullable
as String?,stringType: freezed == stringType ? _self.stringType : stringType // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// Adds pattern-matching-related methods to [RouteDirectionStringModel].
extension RouteDirectionStringModelPatterns on RouteDirectionStringModel {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _RouteDirectionStringModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _RouteDirectionStringModel() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _RouteDirectionStringModel value)  $default,){
final _that = this;
switch (_that) {
case _RouteDirectionStringModel():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _RouteDirectionStringModel value)?  $default,){
final _that = this;
switch (_that) {
case _RouteDirectionStringModel() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function(@JsonKey(name: 'string')  String? string, @JsonKey(name: 'stringType')  String? stringType)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _RouteDirectionStringModel() when $default != null:
return $default(_that.string,_that.stringType);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function(@JsonKey(name: 'string')  String? string, @JsonKey(name: 'stringType')  String? stringType)  $default,) {final _that = this;
switch (_that) {
case _RouteDirectionStringModel():
return $default(_that.string,_that.stringType);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function(@JsonKey(name: 'string')  String? string, @JsonKey(name: 'stringType')  String? stringType)?  $default,) {final _that = this;
switch (_that) {
case _RouteDirectionStringModel() when $default != null:
return $default(_that.string,_that.stringType);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _RouteDirectionStringModel implements RouteDirectionStringModel {
  const _RouteDirectionStringModel({@JsonKey(name: 'string') this.string, @JsonKey(name: 'stringType') this.stringType});
  factory _RouteDirectionStringModel.fromJson(Map<String, dynamic> json) => _$RouteDirectionStringModelFromJson(json);

@override@JsonKey(name: 'string') final  String? string;
@override@JsonKey(name: 'stringType') final  String? stringType;

/// Create a copy of RouteDirectionStringModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$RouteDirectionStringModelCopyWith<_RouteDirectionStringModel> get copyWith => __$RouteDirectionStringModelCopyWithImpl<_RouteDirectionStringModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$RouteDirectionStringModelToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _RouteDirectionStringModel&&(identical(other.string, string) || other.string == string)&&(identical(other.stringType, stringType) || other.stringType == stringType));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,string,stringType);

@override
String toString() {
  return 'RouteDirectionStringModel(string: $string, stringType: $stringType)';
}


}

/// @nodoc
abstract mixin class _$RouteDirectionStringModelCopyWith<$Res> implements $RouteDirectionStringModelCopyWith<$Res> {
  factory _$RouteDirectionStringModelCopyWith(_RouteDirectionStringModel value, $Res Function(_RouteDirectionStringModel) _then) = __$RouteDirectionStringModelCopyWithImpl;
@override @useResult
$Res call({
@JsonKey(name: 'string') String? string,@JsonKey(name: 'stringType') String? stringType
});




}
/// @nodoc
class __$RouteDirectionStringModelCopyWithImpl<$Res>
    implements _$RouteDirectionStringModelCopyWith<$Res> {
  __$RouteDirectionStringModelCopyWithImpl(this._self, this._then);

  final _RouteDirectionStringModel _self;
  final $Res Function(_RouteDirectionStringModel) _then;

/// Create a copy of RouteDirectionStringModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? string = freezed,Object? stringType = freezed,}) {
  return _then(_RouteDirectionStringModel(
string: freezed == string ? _self.string : string // ignore: cast_nullable_to_non_nullable
as String?,stringType: freezed == stringType ? _self.stringType : stringType // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}

// dart format on
