// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'route_barriers_result.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

RouteBarriersResult _$RouteBarriersResultFromJson(Map<String, dynamic> json) {
  return _RouteBarriersResult.fromJson(json);
}

/// @nodoc
mixin _$RouteBarriersResult {
  @JsonKey(name: 'features')
  List<RouteBarrierFeature> get features => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $RouteBarriersResultCopyWith<RouteBarriersResult> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $RouteBarriersResultCopyWith<$Res> {
  factory $RouteBarriersResultCopyWith(
          RouteBarriersResult value, $Res Function(RouteBarriersResult) then) =
      _$RouteBarriersResultCopyWithImpl<$Res, RouteBarriersResult>;
  @useResult
  $Res call({@JsonKey(name: 'features') List<RouteBarrierFeature> features});
}

/// @nodoc
class _$RouteBarriersResultCopyWithImpl<$Res, $Val extends RouteBarriersResult>
    implements $RouteBarriersResultCopyWith<$Res> {
  _$RouteBarriersResultCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? features = null,
  }) {
    return _then(_value.copyWith(
      features: null == features
          ? _value.features
          : features // ignore: cast_nullable_to_non_nullable
              as List<RouteBarrierFeature>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$RouteBarriersResultImplCopyWith<$Res>
    implements $RouteBarriersResultCopyWith<$Res> {
  factory _$$RouteBarriersResultImplCopyWith(_$RouteBarriersResultImpl value,
          $Res Function(_$RouteBarriersResultImpl) then) =
      __$$RouteBarriersResultImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({@JsonKey(name: 'features') List<RouteBarrierFeature> features});
}

/// @nodoc
class __$$RouteBarriersResultImplCopyWithImpl<$Res>
    extends _$RouteBarriersResultCopyWithImpl<$Res, _$RouteBarriersResultImpl>
    implements _$$RouteBarriersResultImplCopyWith<$Res> {
  __$$RouteBarriersResultImplCopyWithImpl(_$RouteBarriersResultImpl _value,
      $Res Function(_$RouteBarriersResultImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? features = null,
  }) {
    return _then(_$RouteBarriersResultImpl(
      features: null == features
          ? _value._features
          : features // ignore: cast_nullable_to_non_nullable
              as List<RouteBarrierFeature>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$RouteBarriersResultImpl implements _RouteBarriersResult {
  const _$RouteBarriersResultImpl(
      {@JsonKey(name: 'features')
      required final List<RouteBarrierFeature> features})
      : _features = features;

  factory _$RouteBarriersResultImpl.fromJson(Map<String, dynamic> json) =>
      _$$RouteBarriersResultImplFromJson(json);

  final List<RouteBarrierFeature> _features;
  @override
  @JsonKey(name: 'features')
  List<RouteBarrierFeature> get features {
    if (_features is EqualUnmodifiableListView) return _features;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_features);
  }

  @override
  String toString() {
    return 'RouteBarriersResult(features: $features)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$RouteBarriersResultImpl &&
            const DeepCollectionEquality().equals(other._features, _features));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(_features));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$RouteBarriersResultImplCopyWith<_$RouteBarriersResultImpl> get copyWith =>
      __$$RouteBarriersResultImplCopyWithImpl<_$RouteBarriersResultImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$RouteBarriersResultImplToJson(
      this,
    );
  }
}

abstract class _RouteBarriersResult implements RouteBarriersResult {
  const factory _RouteBarriersResult(
          {@JsonKey(name: 'features')
          required final List<RouteBarrierFeature> features}) =
      _$RouteBarriersResultImpl;

  factory _RouteBarriersResult.fromJson(Map<String, dynamic> json) =
      _$RouteBarriersResultImpl.fromJson;

  @override
  @JsonKey(name: 'features')
  List<RouteBarrierFeature> get features;
  @override
  @JsonKey(ignore: true)
  _$$RouteBarriersResultImplCopyWith<_$RouteBarriersResultImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

RouteBarrierFeature _$RouteBarrierFeatureFromJson(Map<String, dynamic> json) {
  return _RouteBarrierFeature.fromJson(json);
}

/// @nodoc
mixin _$RouteBarrierFeature {
  @JsonKey(name: 'geometry')
  RoutePointGeometry get geometry => throw _privateConstructorUsedError;
  @JsonKey(name: 'attributes')
  Map<String, dynamic>? get attributes => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $RouteBarrierFeatureCopyWith<RouteBarrierFeature> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $RouteBarrierFeatureCopyWith<$Res> {
  factory $RouteBarrierFeatureCopyWith(
          RouteBarrierFeature value, $Res Function(RouteBarrierFeature) then) =
      _$RouteBarrierFeatureCopyWithImpl<$Res, RouteBarrierFeature>;
  @useResult
  $Res call(
      {@JsonKey(name: 'geometry') RoutePointGeometry geometry,
      @JsonKey(name: 'attributes') Map<String, dynamic>? attributes});

  $RoutePointGeometryCopyWith<$Res> get geometry;
}

/// @nodoc
class _$RouteBarrierFeatureCopyWithImpl<$Res, $Val extends RouteBarrierFeature>
    implements $RouteBarrierFeatureCopyWith<$Res> {
  _$RouteBarrierFeatureCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? geometry = null,
    Object? attributes = freezed,
  }) {
    return _then(_value.copyWith(
      geometry: null == geometry
          ? _value.geometry
          : geometry // ignore: cast_nullable_to_non_nullable
              as RoutePointGeometry,
      attributes: freezed == attributes
          ? _value.attributes
          : attributes // ignore: cast_nullable_to_non_nullable
              as Map<String, dynamic>?,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $RoutePointGeometryCopyWith<$Res> get geometry {
    return $RoutePointGeometryCopyWith<$Res>(_value.geometry, (value) {
      return _then(_value.copyWith(geometry: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$RouteBarrierFeatureImplCopyWith<$Res>
    implements $RouteBarrierFeatureCopyWith<$Res> {
  factory _$$RouteBarrierFeatureImplCopyWith(_$RouteBarrierFeatureImpl value,
          $Res Function(_$RouteBarrierFeatureImpl) then) =
      __$$RouteBarrierFeatureImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'geometry') RoutePointGeometry geometry,
      @JsonKey(name: 'attributes') Map<String, dynamic>? attributes});

  @override
  $RoutePointGeometryCopyWith<$Res> get geometry;
}

/// @nodoc
class __$$RouteBarrierFeatureImplCopyWithImpl<$Res>
    extends _$RouteBarrierFeatureCopyWithImpl<$Res, _$RouteBarrierFeatureImpl>
    implements _$$RouteBarrierFeatureImplCopyWith<$Res> {
  __$$RouteBarrierFeatureImplCopyWithImpl(_$RouteBarrierFeatureImpl _value,
      $Res Function(_$RouteBarrierFeatureImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? geometry = null,
    Object? attributes = freezed,
  }) {
    return _then(_$RouteBarrierFeatureImpl(
      geometry: null == geometry
          ? _value.geometry
          : geometry // ignore: cast_nullable_to_non_nullable
              as RoutePointGeometry,
      attributes: freezed == attributes
          ? _value._attributes
          : attributes // ignore: cast_nullable_to_non_nullable
              as Map<String, dynamic>?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$RouteBarrierFeatureImpl implements _RouteBarrierFeature {
  const _$RouteBarrierFeatureImpl(
      {@JsonKey(name: 'geometry') required this.geometry,
      @JsonKey(name: 'attributes') final Map<String, dynamic>? attributes})
      : _attributes = attributes;

  factory _$RouteBarrierFeatureImpl.fromJson(Map<String, dynamic> json) =>
      _$$RouteBarrierFeatureImplFromJson(json);

  @override
  @JsonKey(name: 'geometry')
  final RoutePointGeometry geometry;
  final Map<String, dynamic>? _attributes;
  @override
  @JsonKey(name: 'attributes')
  Map<String, dynamic>? get attributes {
    final value = _attributes;
    if (value == null) return null;
    if (_attributes is EqualUnmodifiableMapView) return _attributes;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableMapView(value);
  }

  @override
  String toString() {
    return 'RouteBarrierFeature(geometry: $geometry, attributes: $attributes)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$RouteBarrierFeatureImpl &&
            (identical(other.geometry, geometry) ||
                other.geometry == geometry) &&
            const DeepCollectionEquality()
                .equals(other._attributes, _attributes));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType, geometry, const DeepCollectionEquality().hash(_attributes));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$RouteBarrierFeatureImplCopyWith<_$RouteBarrierFeatureImpl> get copyWith =>
      __$$RouteBarrierFeatureImplCopyWithImpl<_$RouteBarrierFeatureImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$RouteBarrierFeatureImplToJson(
      this,
    );
  }
}

abstract class _RouteBarrierFeature implements RouteBarrierFeature {
  const factory _RouteBarrierFeature(
      {@JsonKey(name: 'geometry') required final RoutePointGeometry geometry,
      @JsonKey(name: 'attributes')
      final Map<String, dynamic>? attributes}) = _$RouteBarrierFeatureImpl;

  factory _RouteBarrierFeature.fromJson(Map<String, dynamic> json) =
      _$RouteBarrierFeatureImpl.fromJson;

  @override
  @JsonKey(name: 'geometry')
  RoutePointGeometry get geometry;
  @override
  @JsonKey(name: 'attributes')
  Map<String, dynamic>? get attributes;
  @override
  @JsonKey(ignore: true)
  _$$RouteBarrierFeatureImplCopyWith<_$RouteBarrierFeatureImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

RoutePointGeometry _$RoutePointGeometryFromJson(Map<String, dynamic> json) {
  return _RoutePointGeometry.fromJson(json);
}

/// @nodoc
mixin _$RoutePointGeometry {
  double? get x => throw _privateConstructorUsedError;
  double? get y => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $RoutePointGeometryCopyWith<RoutePointGeometry> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $RoutePointGeometryCopyWith<$Res> {
  factory $RoutePointGeometryCopyWith(
          RoutePointGeometry value, $Res Function(RoutePointGeometry) then) =
      _$RoutePointGeometryCopyWithImpl<$Res, RoutePointGeometry>;
  @useResult
  $Res call({double? x, double? y});
}

/// @nodoc
class _$RoutePointGeometryCopyWithImpl<$Res, $Val extends RoutePointGeometry>
    implements $RoutePointGeometryCopyWith<$Res> {
  _$RoutePointGeometryCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? x = freezed,
    Object? y = freezed,
  }) {
    return _then(_value.copyWith(
      x: freezed == x
          ? _value.x
          : x // ignore: cast_nullable_to_non_nullable
              as double?,
      y: freezed == y
          ? _value.y
          : y // ignore: cast_nullable_to_non_nullable
              as double?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$RoutePointGeometryImplCopyWith<$Res>
    implements $RoutePointGeometryCopyWith<$Res> {
  factory _$$RoutePointGeometryImplCopyWith(_$RoutePointGeometryImpl value,
          $Res Function(_$RoutePointGeometryImpl) then) =
      __$$RoutePointGeometryImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({double? x, double? y});
}

/// @nodoc
class __$$RoutePointGeometryImplCopyWithImpl<$Res>
    extends _$RoutePointGeometryCopyWithImpl<$Res, _$RoutePointGeometryImpl>
    implements _$$RoutePointGeometryImplCopyWith<$Res> {
  __$$RoutePointGeometryImplCopyWithImpl(_$RoutePointGeometryImpl _value,
      $Res Function(_$RoutePointGeometryImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? x = freezed,
    Object? y = freezed,
  }) {
    return _then(_$RoutePointGeometryImpl(
      x: freezed == x
          ? _value.x
          : x // ignore: cast_nullable_to_non_nullable
              as double?,
      y: freezed == y
          ? _value.y
          : y // ignore: cast_nullable_to_non_nullable
              as double?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$RoutePointGeometryImpl implements _RoutePointGeometry {
  const _$RoutePointGeometryImpl({this.x, this.y});

  factory _$RoutePointGeometryImpl.fromJson(Map<String, dynamic> json) =>
      _$$RoutePointGeometryImplFromJson(json);

  @override
  final double? x;
  @override
  final double? y;

  @override
  String toString() {
    return 'RoutePointGeometry(x: $x, y: $y)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$RoutePointGeometryImpl &&
            (identical(other.x, x) || other.x == x) &&
            (identical(other.y, y) || other.y == y));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, x, y);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$RoutePointGeometryImplCopyWith<_$RoutePointGeometryImpl> get copyWith =>
      __$$RoutePointGeometryImplCopyWithImpl<_$RoutePointGeometryImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$RoutePointGeometryImplToJson(
      this,
    );
  }
}

abstract class _RoutePointGeometry implements RoutePointGeometry {
  const factory _RoutePointGeometry({final double? x, final double? y}) =
      _$RoutePointGeometryImpl;

  factory _RoutePointGeometry.fromJson(Map<String, dynamic> json) =
      _$RoutePointGeometryImpl.fromJson;

  @override
  double? get x;
  @override
  double? get y;
  @override
  @JsonKey(ignore: true)
  _$$RoutePointGeometryImplCopyWith<_$RoutePointGeometryImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
