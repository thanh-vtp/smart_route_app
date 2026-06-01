// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'routing_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

RouteResponseModel _$RouteResponseModelFromJson(Map<String, dynamic> json) {
  return _RouteResponseModel.fromJson(json);
}

/// @nodoc
mixin _$RouteResponseModel {
  @JsonKey(name: 'routes')
  RouteFeaturesResultModel get routes => throw _privateConstructorUsedError;
  @JsonKey(name: 'directions')
  List<RouteDirectionSetModel> get directions =>
      throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $RouteResponseModelCopyWith<RouteResponseModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $RouteResponseModelCopyWith<$Res> {
  factory $RouteResponseModelCopyWith(
          RouteResponseModel value, $Res Function(RouteResponseModel) then) =
      _$RouteResponseModelCopyWithImpl<$Res, RouteResponseModel>;
  @useResult
  $Res call(
      {@JsonKey(name: 'routes') RouteFeaturesResultModel routes,
      @JsonKey(name: 'directions') List<RouteDirectionSetModel> directions});

  $RouteFeaturesResultModelCopyWith<$Res> get routes;
}

/// @nodoc
class _$RouteResponseModelCopyWithImpl<$Res, $Val extends RouteResponseModel>
    implements $RouteResponseModelCopyWith<$Res> {
  _$RouteResponseModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? routes = null,
    Object? directions = null,
  }) {
    return _then(_value.copyWith(
      routes: null == routes
          ? _value.routes
          : routes // ignore: cast_nullable_to_non_nullable
              as RouteFeaturesResultModel,
      directions: null == directions
          ? _value.directions
          : directions // ignore: cast_nullable_to_non_nullable
              as List<RouteDirectionSetModel>,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $RouteFeaturesResultModelCopyWith<$Res> get routes {
    return $RouteFeaturesResultModelCopyWith<$Res>(_value.routes, (value) {
      return _then(_value.copyWith(routes: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$RouteResponseModelImplCopyWith<$Res>
    implements $RouteResponseModelCopyWith<$Res> {
  factory _$$RouteResponseModelImplCopyWith(_$RouteResponseModelImpl value,
          $Res Function(_$RouteResponseModelImpl) then) =
      __$$RouteResponseModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'routes') RouteFeaturesResultModel routes,
      @JsonKey(name: 'directions') List<RouteDirectionSetModel> directions});

  @override
  $RouteFeaturesResultModelCopyWith<$Res> get routes;
}

/// @nodoc
class __$$RouteResponseModelImplCopyWithImpl<$Res>
    extends _$RouteResponseModelCopyWithImpl<$Res, _$RouteResponseModelImpl>
    implements _$$RouteResponseModelImplCopyWith<$Res> {
  __$$RouteResponseModelImplCopyWithImpl(_$RouteResponseModelImpl _value,
      $Res Function(_$RouteResponseModelImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? routes = null,
    Object? directions = null,
  }) {
    return _then(_$RouteResponseModelImpl(
      routes: null == routes
          ? _value.routes
          : routes // ignore: cast_nullable_to_non_nullable
              as RouteFeaturesResultModel,
      directions: null == directions
          ? _value._directions
          : directions // ignore: cast_nullable_to_non_nullable
              as List<RouteDirectionSetModel>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$RouteResponseModelImpl extends _RouteResponseModel {
  const _$RouteResponseModelImpl(
      {@JsonKey(name: 'routes') required this.routes,
      @JsonKey(name: 'directions')
      final List<RouteDirectionSetModel> directions = const []})
      : _directions = directions,
        super._();

  factory _$RouteResponseModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$RouteResponseModelImplFromJson(json);

  @override
  @JsonKey(name: 'routes')
  final RouteFeaturesResultModel routes;
  final List<RouteDirectionSetModel> _directions;
  @override
  @JsonKey(name: 'directions')
  List<RouteDirectionSetModel> get directions {
    if (_directions is EqualUnmodifiableListView) return _directions;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_directions);
  }

  @override
  String toString() {
    return 'RouteResponseModel(routes: $routes, directions: $directions)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$RouteResponseModelImpl &&
            (identical(other.routes, routes) || other.routes == routes) &&
            const DeepCollectionEquality()
                .equals(other._directions, _directions));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType, routes, const DeepCollectionEquality().hash(_directions));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$RouteResponseModelImplCopyWith<_$RouteResponseModelImpl> get copyWith =>
      __$$RouteResponseModelImplCopyWithImpl<_$RouteResponseModelImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$RouteResponseModelImplToJson(
      this,
    );
  }
}

abstract class _RouteResponseModel extends RouteResponseModel {
  const factory _RouteResponseModel(
      {@JsonKey(name: 'routes') required final RouteFeaturesResultModel routes,
      @JsonKey(name: 'directions')
      final List<RouteDirectionSetModel>
          directions}) = _$RouteResponseModelImpl;
  const _RouteResponseModel._() : super._();

  factory _RouteResponseModel.fromJson(Map<String, dynamic> json) =
      _$RouteResponseModelImpl.fromJson;

  @override
  @JsonKey(name: 'routes')
  RouteFeaturesResultModel get routes;
  @override
  @JsonKey(name: 'directions')
  List<RouteDirectionSetModel> get directions;
  @override
  @JsonKey(ignore: true)
  _$$RouteResponseModelImplCopyWith<_$RouteResponseModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

RouteFeaturesResultModel _$RouteFeaturesResultModelFromJson(
    Map<String, dynamic> json) {
  return _RouteFeaturesResultModel.fromJson(json);
}

/// @nodoc
mixin _$RouteFeaturesResultModel {
  @JsonKey(name: 'features')
  List<RouteFeatureModel> get features => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $RouteFeaturesResultModelCopyWith<RouteFeaturesResultModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $RouteFeaturesResultModelCopyWith<$Res> {
  factory $RouteFeaturesResultModelCopyWith(RouteFeaturesResultModel value,
          $Res Function(RouteFeaturesResultModel) then) =
      _$RouteFeaturesResultModelCopyWithImpl<$Res, RouteFeaturesResultModel>;
  @useResult
  $Res call({@JsonKey(name: 'features') List<RouteFeatureModel> features});
}

/// @nodoc
class _$RouteFeaturesResultModelCopyWithImpl<$Res,
        $Val extends RouteFeaturesResultModel>
    implements $RouteFeaturesResultModelCopyWith<$Res> {
  _$RouteFeaturesResultModelCopyWithImpl(this._value, this._then);

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
              as List<RouteFeatureModel>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$RouteFeaturesResultModelImplCopyWith<$Res>
    implements $RouteFeaturesResultModelCopyWith<$Res> {
  factory _$$RouteFeaturesResultModelImplCopyWith(
          _$RouteFeaturesResultModelImpl value,
          $Res Function(_$RouteFeaturesResultModelImpl) then) =
      __$$RouteFeaturesResultModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({@JsonKey(name: 'features') List<RouteFeatureModel> features});
}

/// @nodoc
class __$$RouteFeaturesResultModelImplCopyWithImpl<$Res>
    extends _$RouteFeaturesResultModelCopyWithImpl<$Res,
        _$RouteFeaturesResultModelImpl>
    implements _$$RouteFeaturesResultModelImplCopyWith<$Res> {
  __$$RouteFeaturesResultModelImplCopyWithImpl(
      _$RouteFeaturesResultModelImpl _value,
      $Res Function(_$RouteFeaturesResultModelImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? features = null,
  }) {
    return _then(_$RouteFeaturesResultModelImpl(
      features: null == features
          ? _value._features
          : features // ignore: cast_nullable_to_non_nullable
              as List<RouteFeatureModel>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$RouteFeaturesResultModelImpl implements _RouteFeaturesResultModel {
  const _$RouteFeaturesResultModelImpl(
      {@JsonKey(name: 'features')
      final List<RouteFeatureModel> features = const []})
      : _features = features;

  factory _$RouteFeaturesResultModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$RouteFeaturesResultModelImplFromJson(json);

  final List<RouteFeatureModel> _features;
  @override
  @JsonKey(name: 'features')
  List<RouteFeatureModel> get features {
    if (_features is EqualUnmodifiableListView) return _features;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_features);
  }

  @override
  String toString() {
    return 'RouteFeaturesResultModel(features: $features)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$RouteFeaturesResultModelImpl &&
            const DeepCollectionEquality().equals(other._features, _features));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(_features));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$RouteFeaturesResultModelImplCopyWith<_$RouteFeaturesResultModelImpl>
      get copyWith => __$$RouteFeaturesResultModelImplCopyWithImpl<
          _$RouteFeaturesResultModelImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$RouteFeaturesResultModelImplToJson(
      this,
    );
  }
}

abstract class _RouteFeaturesResultModel implements RouteFeaturesResultModel {
  const factory _RouteFeaturesResultModel(
          {@JsonKey(name: 'features') final List<RouteFeatureModel> features}) =
      _$RouteFeaturesResultModelImpl;

  factory _RouteFeaturesResultModel.fromJson(Map<String, dynamic> json) =
      _$RouteFeaturesResultModelImpl.fromJson;

  @override
  @JsonKey(name: 'features')
  List<RouteFeatureModel> get features;
  @override
  @JsonKey(ignore: true)
  _$$RouteFeaturesResultModelImplCopyWith<_$RouteFeaturesResultModelImpl>
      get copyWith => throw _privateConstructorUsedError;
}

RouteFeatureModel _$RouteFeatureModelFromJson(Map<String, dynamic> json) {
  return _RouteFeatureModel.fromJson(json);
}

/// @nodoc
mixin _$RouteFeatureModel {
  @JsonKey(name: 'attributes')
  RouteAttributesModel get attributes => throw _privateConstructorUsedError;
  @JsonKey(name: 'geometry')
  RouteGeometryModel? get geometry => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $RouteFeatureModelCopyWith<RouteFeatureModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $RouteFeatureModelCopyWith<$Res> {
  factory $RouteFeatureModelCopyWith(
          RouteFeatureModel value, $Res Function(RouteFeatureModel) then) =
      _$RouteFeatureModelCopyWithImpl<$Res, RouteFeatureModel>;
  @useResult
  $Res call(
      {@JsonKey(name: 'attributes') RouteAttributesModel attributes,
      @JsonKey(name: 'geometry') RouteGeometryModel? geometry});

  $RouteAttributesModelCopyWith<$Res> get attributes;
  $RouteGeometryModelCopyWith<$Res>? get geometry;
}

/// @nodoc
class _$RouteFeatureModelCopyWithImpl<$Res, $Val extends RouteFeatureModel>
    implements $RouteFeatureModelCopyWith<$Res> {
  _$RouteFeatureModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? attributes = null,
    Object? geometry = freezed,
  }) {
    return _then(_value.copyWith(
      attributes: null == attributes
          ? _value.attributes
          : attributes // ignore: cast_nullable_to_non_nullable
              as RouteAttributesModel,
      geometry: freezed == geometry
          ? _value.geometry
          : geometry // ignore: cast_nullable_to_non_nullable
              as RouteGeometryModel?,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $RouteAttributesModelCopyWith<$Res> get attributes {
    return $RouteAttributesModelCopyWith<$Res>(_value.attributes, (value) {
      return _then(_value.copyWith(attributes: value) as $Val);
    });
  }

  @override
  @pragma('vm:prefer-inline')
  $RouteGeometryModelCopyWith<$Res>? get geometry {
    if (_value.geometry == null) {
      return null;
    }

    return $RouteGeometryModelCopyWith<$Res>(_value.geometry!, (value) {
      return _then(_value.copyWith(geometry: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$RouteFeatureModelImplCopyWith<$Res>
    implements $RouteFeatureModelCopyWith<$Res> {
  factory _$$RouteFeatureModelImplCopyWith(_$RouteFeatureModelImpl value,
          $Res Function(_$RouteFeatureModelImpl) then) =
      __$$RouteFeatureModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'attributes') RouteAttributesModel attributes,
      @JsonKey(name: 'geometry') RouteGeometryModel? geometry});

  @override
  $RouteAttributesModelCopyWith<$Res> get attributes;
  @override
  $RouteGeometryModelCopyWith<$Res>? get geometry;
}

/// @nodoc
class __$$RouteFeatureModelImplCopyWithImpl<$Res>
    extends _$RouteFeatureModelCopyWithImpl<$Res, _$RouteFeatureModelImpl>
    implements _$$RouteFeatureModelImplCopyWith<$Res> {
  __$$RouteFeatureModelImplCopyWithImpl(_$RouteFeatureModelImpl _value,
      $Res Function(_$RouteFeatureModelImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? attributes = null,
    Object? geometry = freezed,
  }) {
    return _then(_$RouteFeatureModelImpl(
      attributes: null == attributes
          ? _value.attributes
          : attributes // ignore: cast_nullable_to_non_nullable
              as RouteAttributesModel,
      geometry: freezed == geometry
          ? _value.geometry
          : geometry // ignore: cast_nullable_to_non_nullable
              as RouteGeometryModel?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$RouteFeatureModelImpl implements _RouteFeatureModel {
  const _$RouteFeatureModelImpl(
      {@JsonKey(name: 'attributes') required this.attributes,
      @JsonKey(name: 'geometry') this.geometry});

  factory _$RouteFeatureModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$RouteFeatureModelImplFromJson(json);

  @override
  @JsonKey(name: 'attributes')
  final RouteAttributesModel attributes;
  @override
  @JsonKey(name: 'geometry')
  final RouteGeometryModel? geometry;

  @override
  String toString() {
    return 'RouteFeatureModel(attributes: $attributes, geometry: $geometry)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$RouteFeatureModelImpl &&
            (identical(other.attributes, attributes) ||
                other.attributes == attributes) &&
            (identical(other.geometry, geometry) ||
                other.geometry == geometry));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, attributes, geometry);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$RouteFeatureModelImplCopyWith<_$RouteFeatureModelImpl> get copyWith =>
      __$$RouteFeatureModelImplCopyWithImpl<_$RouteFeatureModelImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$RouteFeatureModelImplToJson(
      this,
    );
  }
}

abstract class _RouteFeatureModel implements RouteFeatureModel {
  const factory _RouteFeatureModel(
          {@JsonKey(name: 'attributes')
          required final RouteAttributesModel attributes,
          @JsonKey(name: 'geometry') final RouteGeometryModel? geometry}) =
      _$RouteFeatureModelImpl;

  factory _RouteFeatureModel.fromJson(Map<String, dynamic> json) =
      _$RouteFeatureModelImpl.fromJson;

  @override
  @JsonKey(name: 'attributes')
  RouteAttributesModel get attributes;
  @override
  @JsonKey(name: 'geometry')
  RouteGeometryModel? get geometry;
  @override
  @JsonKey(ignore: true)
  _$$RouteFeatureModelImplCopyWith<_$RouteFeatureModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

RouteAttributesModel _$RouteAttributesModelFromJson(Map<String, dynamic> json) {
  return _RouteAttributesModel.fromJson(json);
}

/// @nodoc
mixin _$RouteAttributesModel {
  @JsonKey(name: 'Name')
  String? get name => throw _privateConstructorUsedError;
  @JsonKey(name: 'Total_TravelTime')
  double? get totalTravelTime => throw _privateConstructorUsedError;
  @JsonKey(name: 'Total_Kilometers')
  double? get totalKilometers => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $RouteAttributesModelCopyWith<RouteAttributesModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $RouteAttributesModelCopyWith<$Res> {
  factory $RouteAttributesModelCopyWith(RouteAttributesModel value,
          $Res Function(RouteAttributesModel) then) =
      _$RouteAttributesModelCopyWithImpl<$Res, RouteAttributesModel>;
  @useResult
  $Res call(
      {@JsonKey(name: 'Name') String? name,
      @JsonKey(name: 'Total_TravelTime') double? totalTravelTime,
      @JsonKey(name: 'Total_Kilometers') double? totalKilometers});
}

/// @nodoc
class _$RouteAttributesModelCopyWithImpl<$Res,
        $Val extends RouteAttributesModel>
    implements $RouteAttributesModelCopyWith<$Res> {
  _$RouteAttributesModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = freezed,
    Object? totalTravelTime = freezed,
    Object? totalKilometers = freezed,
  }) {
    return _then(_value.copyWith(
      name: freezed == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String?,
      totalTravelTime: freezed == totalTravelTime
          ? _value.totalTravelTime
          : totalTravelTime // ignore: cast_nullable_to_non_nullable
              as double?,
      totalKilometers: freezed == totalKilometers
          ? _value.totalKilometers
          : totalKilometers // ignore: cast_nullable_to_non_nullable
              as double?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$RouteAttributesModelImplCopyWith<$Res>
    implements $RouteAttributesModelCopyWith<$Res> {
  factory _$$RouteAttributesModelImplCopyWith(_$RouteAttributesModelImpl value,
          $Res Function(_$RouteAttributesModelImpl) then) =
      __$$RouteAttributesModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'Name') String? name,
      @JsonKey(name: 'Total_TravelTime') double? totalTravelTime,
      @JsonKey(name: 'Total_Kilometers') double? totalKilometers});
}

/// @nodoc
class __$$RouteAttributesModelImplCopyWithImpl<$Res>
    extends _$RouteAttributesModelCopyWithImpl<$Res, _$RouteAttributesModelImpl>
    implements _$$RouteAttributesModelImplCopyWith<$Res> {
  __$$RouteAttributesModelImplCopyWithImpl(_$RouteAttributesModelImpl _value,
      $Res Function(_$RouteAttributesModelImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = freezed,
    Object? totalTravelTime = freezed,
    Object? totalKilometers = freezed,
  }) {
    return _then(_$RouteAttributesModelImpl(
      name: freezed == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String?,
      totalTravelTime: freezed == totalTravelTime
          ? _value.totalTravelTime
          : totalTravelTime // ignore: cast_nullable_to_non_nullable
              as double?,
      totalKilometers: freezed == totalKilometers
          ? _value.totalKilometers
          : totalKilometers // ignore: cast_nullable_to_non_nullable
              as double?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$RouteAttributesModelImpl implements _RouteAttributesModel {
  const _$RouteAttributesModelImpl(
      {@JsonKey(name: 'Name') this.name,
      @JsonKey(name: 'Total_TravelTime') this.totalTravelTime,
      @JsonKey(name: 'Total_Kilometers') this.totalKilometers});

  factory _$RouteAttributesModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$RouteAttributesModelImplFromJson(json);

  @override
  @JsonKey(name: 'Name')
  final String? name;
  @override
  @JsonKey(name: 'Total_TravelTime')
  final double? totalTravelTime;
  @override
  @JsonKey(name: 'Total_Kilometers')
  final double? totalKilometers;

  @override
  String toString() {
    return 'RouteAttributesModel(name: $name, totalTravelTime: $totalTravelTime, totalKilometers: $totalKilometers)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$RouteAttributesModelImpl &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.totalTravelTime, totalTravelTime) ||
                other.totalTravelTime == totalTravelTime) &&
            (identical(other.totalKilometers, totalKilometers) ||
                other.totalKilometers == totalKilometers));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode =>
      Object.hash(runtimeType, name, totalTravelTime, totalKilometers);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$RouteAttributesModelImplCopyWith<_$RouteAttributesModelImpl>
      get copyWith =>
          __$$RouteAttributesModelImplCopyWithImpl<_$RouteAttributesModelImpl>(
              this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$RouteAttributesModelImplToJson(
      this,
    );
  }
}

abstract class _RouteAttributesModel implements RouteAttributesModel {
  const factory _RouteAttributesModel(
          {@JsonKey(name: 'Name') final String? name,
          @JsonKey(name: 'Total_TravelTime') final double? totalTravelTime,
          @JsonKey(name: 'Total_Kilometers') final double? totalKilometers}) =
      _$RouteAttributesModelImpl;

  factory _RouteAttributesModel.fromJson(Map<String, dynamic> json) =
      _$RouteAttributesModelImpl.fromJson;

  @override
  @JsonKey(name: 'Name')
  String? get name;
  @override
  @JsonKey(name: 'Total_TravelTime')
  double? get totalTravelTime;
  @override
  @JsonKey(name: 'Total_Kilometers')
  double? get totalKilometers;
  @override
  @JsonKey(ignore: true)
  _$$RouteAttributesModelImplCopyWith<_$RouteAttributesModelImpl>
      get copyWith => throw _privateConstructorUsedError;
}

RouteGeometryModel _$RouteGeometryModelFromJson(Map<String, dynamic> json) {
  return _RouteGeometryModel.fromJson(json);
}

/// @nodoc
mixin _$RouteGeometryModel {
// Type List<List<List<double>>> dùng để map cái mảng paths phức tạp của ArcGIS
  @JsonKey(name: 'paths')
  List<List<List<double>>> get paths => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $RouteGeometryModelCopyWith<RouteGeometryModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $RouteGeometryModelCopyWith<$Res> {
  factory $RouteGeometryModelCopyWith(
          RouteGeometryModel value, $Res Function(RouteGeometryModel) then) =
      _$RouteGeometryModelCopyWithImpl<$Res, RouteGeometryModel>;
  @useResult
  $Res call({@JsonKey(name: 'paths') List<List<List<double>>> paths});
}

/// @nodoc
class _$RouteGeometryModelCopyWithImpl<$Res, $Val extends RouteGeometryModel>
    implements $RouteGeometryModelCopyWith<$Res> {
  _$RouteGeometryModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? paths = null,
  }) {
    return _then(_value.copyWith(
      paths: null == paths
          ? _value.paths
          : paths // ignore: cast_nullable_to_non_nullable
              as List<List<List<double>>>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$RouteGeometryModelImplCopyWith<$Res>
    implements $RouteGeometryModelCopyWith<$Res> {
  factory _$$RouteGeometryModelImplCopyWith(_$RouteGeometryModelImpl value,
          $Res Function(_$RouteGeometryModelImpl) then) =
      __$$RouteGeometryModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({@JsonKey(name: 'paths') List<List<List<double>>> paths});
}

/// @nodoc
class __$$RouteGeometryModelImplCopyWithImpl<$Res>
    extends _$RouteGeometryModelCopyWithImpl<$Res, _$RouteGeometryModelImpl>
    implements _$$RouteGeometryModelImplCopyWith<$Res> {
  __$$RouteGeometryModelImplCopyWithImpl(_$RouteGeometryModelImpl _value,
      $Res Function(_$RouteGeometryModelImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? paths = null,
  }) {
    return _then(_$RouteGeometryModelImpl(
      paths: null == paths
          ? _value._paths
          : paths // ignore: cast_nullable_to_non_nullable
              as List<List<List<double>>>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$RouteGeometryModelImpl implements _RouteGeometryModel {
  const _$RouteGeometryModelImpl(
      {@JsonKey(name: 'paths') final List<List<List<double>>> paths = const []})
      : _paths = paths;

  factory _$RouteGeometryModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$RouteGeometryModelImplFromJson(json);

// Type List<List<List<double>>> dùng để map cái mảng paths phức tạp của ArcGIS
  final List<List<List<double>>> _paths;
// Type List<List<List<double>>> dùng để map cái mảng paths phức tạp của ArcGIS
  @override
  @JsonKey(name: 'paths')
  List<List<List<double>>> get paths {
    if (_paths is EqualUnmodifiableListView) return _paths;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_paths);
  }

  @override
  String toString() {
    return 'RouteGeometryModel(paths: $paths)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$RouteGeometryModelImpl &&
            const DeepCollectionEquality().equals(other._paths, _paths));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(_paths));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$RouteGeometryModelImplCopyWith<_$RouteGeometryModelImpl> get copyWith =>
      __$$RouteGeometryModelImplCopyWithImpl<_$RouteGeometryModelImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$RouteGeometryModelImplToJson(
      this,
    );
  }
}

abstract class _RouteGeometryModel implements RouteGeometryModel {
  const factory _RouteGeometryModel(
          {@JsonKey(name: 'paths') final List<List<List<double>>> paths}) =
      _$RouteGeometryModelImpl;

  factory _RouteGeometryModel.fromJson(Map<String, dynamic> json) =
      _$RouteGeometryModelImpl.fromJson;

  @override // Type List<List<List<double>>> dùng để map cái mảng paths phức tạp của ArcGIS
  @JsonKey(name: 'paths')
  List<List<List<double>>> get paths;
  @override
  @JsonKey(ignore: true)
  _$$RouteGeometryModelImplCopyWith<_$RouteGeometryModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

RouteDirectionSetModel _$RouteDirectionSetModelFromJson(
    Map<String, dynamic> json) {
  return _RouteDirectionSetModel.fromJson(json);
}

/// @nodoc
mixin _$RouteDirectionSetModel {
  @JsonKey(name: 'summary')
  RouteDirectionSummaryModel? get summary => throw _privateConstructorUsedError;
  @JsonKey(name: 'features')
  List<RouteDirectionFeatureModel> get features =>
      throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $RouteDirectionSetModelCopyWith<RouteDirectionSetModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $RouteDirectionSetModelCopyWith<$Res> {
  factory $RouteDirectionSetModelCopyWith(RouteDirectionSetModel value,
          $Res Function(RouteDirectionSetModel) then) =
      _$RouteDirectionSetModelCopyWithImpl<$Res, RouteDirectionSetModel>;
  @useResult
  $Res call(
      {@JsonKey(name: 'summary') RouteDirectionSummaryModel? summary,
      @JsonKey(name: 'features') List<RouteDirectionFeatureModel> features});

  $RouteDirectionSummaryModelCopyWith<$Res>? get summary;
}

/// @nodoc
class _$RouteDirectionSetModelCopyWithImpl<$Res,
        $Val extends RouteDirectionSetModel>
    implements $RouteDirectionSetModelCopyWith<$Res> {
  _$RouteDirectionSetModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? summary = freezed,
    Object? features = null,
  }) {
    return _then(_value.copyWith(
      summary: freezed == summary
          ? _value.summary
          : summary // ignore: cast_nullable_to_non_nullable
              as RouteDirectionSummaryModel?,
      features: null == features
          ? _value.features
          : features // ignore: cast_nullable_to_non_nullable
              as List<RouteDirectionFeatureModel>,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $RouteDirectionSummaryModelCopyWith<$Res>? get summary {
    if (_value.summary == null) {
      return null;
    }

    return $RouteDirectionSummaryModelCopyWith<$Res>(_value.summary!, (value) {
      return _then(_value.copyWith(summary: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$RouteDirectionSetModelImplCopyWith<$Res>
    implements $RouteDirectionSetModelCopyWith<$Res> {
  factory _$$RouteDirectionSetModelImplCopyWith(
          _$RouteDirectionSetModelImpl value,
          $Res Function(_$RouteDirectionSetModelImpl) then) =
      __$$RouteDirectionSetModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'summary') RouteDirectionSummaryModel? summary,
      @JsonKey(name: 'features') List<RouteDirectionFeatureModel> features});

  @override
  $RouteDirectionSummaryModelCopyWith<$Res>? get summary;
}

/// @nodoc
class __$$RouteDirectionSetModelImplCopyWithImpl<$Res>
    extends _$RouteDirectionSetModelCopyWithImpl<$Res,
        _$RouteDirectionSetModelImpl>
    implements _$$RouteDirectionSetModelImplCopyWith<$Res> {
  __$$RouteDirectionSetModelImplCopyWithImpl(
      _$RouteDirectionSetModelImpl _value,
      $Res Function(_$RouteDirectionSetModelImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? summary = freezed,
    Object? features = null,
  }) {
    return _then(_$RouteDirectionSetModelImpl(
      summary: freezed == summary
          ? _value.summary
          : summary // ignore: cast_nullable_to_non_nullable
              as RouteDirectionSummaryModel?,
      features: null == features
          ? _value._features
          : features // ignore: cast_nullable_to_non_nullable
              as List<RouteDirectionFeatureModel>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$RouteDirectionSetModelImpl implements _RouteDirectionSetModel {
  const _$RouteDirectionSetModelImpl(
      {@JsonKey(name: 'summary') this.summary,
      @JsonKey(name: 'features')
      final List<RouteDirectionFeatureModel> features = const []})
      : _features = features;

  factory _$RouteDirectionSetModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$RouteDirectionSetModelImplFromJson(json);

  @override
  @JsonKey(name: 'summary')
  final RouteDirectionSummaryModel? summary;
  final List<RouteDirectionFeatureModel> _features;
  @override
  @JsonKey(name: 'features')
  List<RouteDirectionFeatureModel> get features {
    if (_features is EqualUnmodifiableListView) return _features;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_features);
  }

  @override
  String toString() {
    return 'RouteDirectionSetModel(summary: $summary, features: $features)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$RouteDirectionSetModelImpl &&
            (identical(other.summary, summary) || other.summary == summary) &&
            const DeepCollectionEquality().equals(other._features, _features));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType, summary, const DeepCollectionEquality().hash(_features));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$RouteDirectionSetModelImplCopyWith<_$RouteDirectionSetModelImpl>
      get copyWith => __$$RouteDirectionSetModelImplCopyWithImpl<
          _$RouteDirectionSetModelImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$RouteDirectionSetModelImplToJson(
      this,
    );
  }
}

abstract class _RouteDirectionSetModel implements RouteDirectionSetModel {
  const factory _RouteDirectionSetModel(
          {@JsonKey(name: 'summary') final RouteDirectionSummaryModel? summary,
          @JsonKey(name: 'features')
          final List<RouteDirectionFeatureModel> features}) =
      _$RouteDirectionSetModelImpl;

  factory _RouteDirectionSetModel.fromJson(Map<String, dynamic> json) =
      _$RouteDirectionSetModelImpl.fromJson;

  @override
  @JsonKey(name: 'summary')
  RouteDirectionSummaryModel? get summary;
  @override
  @JsonKey(name: 'features')
  List<RouteDirectionFeatureModel> get features;
  @override
  @JsonKey(ignore: true)
  _$$RouteDirectionSetModelImplCopyWith<_$RouteDirectionSetModelImpl>
      get copyWith => throw _privateConstructorUsedError;
}

RouteDirectionSummaryModel _$RouteDirectionSummaryModelFromJson(
    Map<String, dynamic> json) {
  return _RouteDirectionSummaryModel.fromJson(json);
}

/// @nodoc
mixin _$RouteDirectionSummaryModel {
  @JsonKey(name: 'envelope')
  RouteEnvelopeModel? get envelope => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $RouteDirectionSummaryModelCopyWith<RouteDirectionSummaryModel>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $RouteDirectionSummaryModelCopyWith<$Res> {
  factory $RouteDirectionSummaryModelCopyWith(RouteDirectionSummaryModel value,
          $Res Function(RouteDirectionSummaryModel) then) =
      _$RouteDirectionSummaryModelCopyWithImpl<$Res,
          RouteDirectionSummaryModel>;
  @useResult
  $Res call({@JsonKey(name: 'envelope') RouteEnvelopeModel? envelope});

  $RouteEnvelopeModelCopyWith<$Res>? get envelope;
}

/// @nodoc
class _$RouteDirectionSummaryModelCopyWithImpl<$Res,
        $Val extends RouteDirectionSummaryModel>
    implements $RouteDirectionSummaryModelCopyWith<$Res> {
  _$RouteDirectionSummaryModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? envelope = freezed,
  }) {
    return _then(_value.copyWith(
      envelope: freezed == envelope
          ? _value.envelope
          : envelope // ignore: cast_nullable_to_non_nullable
              as RouteEnvelopeModel?,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $RouteEnvelopeModelCopyWith<$Res>? get envelope {
    if (_value.envelope == null) {
      return null;
    }

    return $RouteEnvelopeModelCopyWith<$Res>(_value.envelope!, (value) {
      return _then(_value.copyWith(envelope: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$RouteDirectionSummaryModelImplCopyWith<$Res>
    implements $RouteDirectionSummaryModelCopyWith<$Res> {
  factory _$$RouteDirectionSummaryModelImplCopyWith(
          _$RouteDirectionSummaryModelImpl value,
          $Res Function(_$RouteDirectionSummaryModelImpl) then) =
      __$$RouteDirectionSummaryModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({@JsonKey(name: 'envelope') RouteEnvelopeModel? envelope});

  @override
  $RouteEnvelopeModelCopyWith<$Res>? get envelope;
}

/// @nodoc
class __$$RouteDirectionSummaryModelImplCopyWithImpl<$Res>
    extends _$RouteDirectionSummaryModelCopyWithImpl<$Res,
        _$RouteDirectionSummaryModelImpl>
    implements _$$RouteDirectionSummaryModelImplCopyWith<$Res> {
  __$$RouteDirectionSummaryModelImplCopyWithImpl(
      _$RouteDirectionSummaryModelImpl _value,
      $Res Function(_$RouteDirectionSummaryModelImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? envelope = freezed,
  }) {
    return _then(_$RouteDirectionSummaryModelImpl(
      envelope: freezed == envelope
          ? _value.envelope
          : envelope // ignore: cast_nullable_to_non_nullable
              as RouteEnvelopeModel?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$RouteDirectionSummaryModelImpl implements _RouteDirectionSummaryModel {
  const _$RouteDirectionSummaryModelImpl(
      {@JsonKey(name: 'envelope') this.envelope});

  factory _$RouteDirectionSummaryModelImpl.fromJson(
          Map<String, dynamic> json) =>
      _$$RouteDirectionSummaryModelImplFromJson(json);

  @override
  @JsonKey(name: 'envelope')
  final RouteEnvelopeModel? envelope;

  @override
  String toString() {
    return 'RouteDirectionSummaryModel(envelope: $envelope)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$RouteDirectionSummaryModelImpl &&
            (identical(other.envelope, envelope) ||
                other.envelope == envelope));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, envelope);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$RouteDirectionSummaryModelImplCopyWith<_$RouteDirectionSummaryModelImpl>
      get copyWith => __$$RouteDirectionSummaryModelImplCopyWithImpl<
          _$RouteDirectionSummaryModelImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$RouteDirectionSummaryModelImplToJson(
      this,
    );
  }
}

abstract class _RouteDirectionSummaryModel
    implements RouteDirectionSummaryModel {
  const factory _RouteDirectionSummaryModel(
          {@JsonKey(name: 'envelope') final RouteEnvelopeModel? envelope}) =
      _$RouteDirectionSummaryModelImpl;

  factory _RouteDirectionSummaryModel.fromJson(Map<String, dynamic> json) =
      _$RouteDirectionSummaryModelImpl.fromJson;

  @override
  @JsonKey(name: 'envelope')
  RouteEnvelopeModel? get envelope;
  @override
  @JsonKey(ignore: true)
  _$$RouteDirectionSummaryModelImplCopyWith<_$RouteDirectionSummaryModelImpl>
      get copyWith => throw _privateConstructorUsedError;
}

RouteEnvelopeModel _$RouteEnvelopeModelFromJson(Map<String, dynamic> json) {
  return _RouteEnvelopeModel.fromJson(json);
}

/// @nodoc
mixin _$RouteEnvelopeModel {
  double? get xmin => throw _privateConstructorUsedError;
  double? get ymin => throw _privateConstructorUsedError;
  double? get xmax => throw _privateConstructorUsedError;
  double? get ymax => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $RouteEnvelopeModelCopyWith<RouteEnvelopeModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $RouteEnvelopeModelCopyWith<$Res> {
  factory $RouteEnvelopeModelCopyWith(
          RouteEnvelopeModel value, $Res Function(RouteEnvelopeModel) then) =
      _$RouteEnvelopeModelCopyWithImpl<$Res, RouteEnvelopeModel>;
  @useResult
  $Res call({double? xmin, double? ymin, double? xmax, double? ymax});
}

/// @nodoc
class _$RouteEnvelopeModelCopyWithImpl<$Res, $Val extends RouteEnvelopeModel>
    implements $RouteEnvelopeModelCopyWith<$Res> {
  _$RouteEnvelopeModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? xmin = freezed,
    Object? ymin = freezed,
    Object? xmax = freezed,
    Object? ymax = freezed,
  }) {
    return _then(_value.copyWith(
      xmin: freezed == xmin
          ? _value.xmin
          : xmin // ignore: cast_nullable_to_non_nullable
              as double?,
      ymin: freezed == ymin
          ? _value.ymin
          : ymin // ignore: cast_nullable_to_non_nullable
              as double?,
      xmax: freezed == xmax
          ? _value.xmax
          : xmax // ignore: cast_nullable_to_non_nullable
              as double?,
      ymax: freezed == ymax
          ? _value.ymax
          : ymax // ignore: cast_nullable_to_non_nullable
              as double?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$RouteEnvelopeModelImplCopyWith<$Res>
    implements $RouteEnvelopeModelCopyWith<$Res> {
  factory _$$RouteEnvelopeModelImplCopyWith(_$RouteEnvelopeModelImpl value,
          $Res Function(_$RouteEnvelopeModelImpl) then) =
      __$$RouteEnvelopeModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({double? xmin, double? ymin, double? xmax, double? ymax});
}

/// @nodoc
class __$$RouteEnvelopeModelImplCopyWithImpl<$Res>
    extends _$RouteEnvelopeModelCopyWithImpl<$Res, _$RouteEnvelopeModelImpl>
    implements _$$RouteEnvelopeModelImplCopyWith<$Res> {
  __$$RouteEnvelopeModelImplCopyWithImpl(_$RouteEnvelopeModelImpl _value,
      $Res Function(_$RouteEnvelopeModelImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? xmin = freezed,
    Object? ymin = freezed,
    Object? xmax = freezed,
    Object? ymax = freezed,
  }) {
    return _then(_$RouteEnvelopeModelImpl(
      xmin: freezed == xmin
          ? _value.xmin
          : xmin // ignore: cast_nullable_to_non_nullable
              as double?,
      ymin: freezed == ymin
          ? _value.ymin
          : ymin // ignore: cast_nullable_to_non_nullable
              as double?,
      xmax: freezed == xmax
          ? _value.xmax
          : xmax // ignore: cast_nullable_to_non_nullable
              as double?,
      ymax: freezed == ymax
          ? _value.ymax
          : ymax // ignore: cast_nullable_to_non_nullable
              as double?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$RouteEnvelopeModelImpl implements _RouteEnvelopeModel {
  const _$RouteEnvelopeModelImpl({this.xmin, this.ymin, this.xmax, this.ymax});

  factory _$RouteEnvelopeModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$RouteEnvelopeModelImplFromJson(json);

  @override
  final double? xmin;
  @override
  final double? ymin;
  @override
  final double? xmax;
  @override
  final double? ymax;

  @override
  String toString() {
    return 'RouteEnvelopeModel(xmin: $xmin, ymin: $ymin, xmax: $xmax, ymax: $ymax)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$RouteEnvelopeModelImpl &&
            (identical(other.xmin, xmin) || other.xmin == xmin) &&
            (identical(other.ymin, ymin) || other.ymin == ymin) &&
            (identical(other.xmax, xmax) || other.xmax == xmax) &&
            (identical(other.ymax, ymax) || other.ymax == ymax));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, xmin, ymin, xmax, ymax);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$RouteEnvelopeModelImplCopyWith<_$RouteEnvelopeModelImpl> get copyWith =>
      __$$RouteEnvelopeModelImplCopyWithImpl<_$RouteEnvelopeModelImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$RouteEnvelopeModelImplToJson(
      this,
    );
  }
}

abstract class _RouteEnvelopeModel implements RouteEnvelopeModel {
  const factory _RouteEnvelopeModel(
      {final double? xmin,
      final double? ymin,
      final double? xmax,
      final double? ymax}) = _$RouteEnvelopeModelImpl;

  factory _RouteEnvelopeModel.fromJson(Map<String, dynamic> json) =
      _$RouteEnvelopeModelImpl.fromJson;

  @override
  double? get xmin;
  @override
  double? get ymin;
  @override
  double? get xmax;
  @override
  double? get ymax;
  @override
  @JsonKey(ignore: true)
  _$$RouteEnvelopeModelImplCopyWith<_$RouteEnvelopeModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

RouteDirectionFeatureModel _$RouteDirectionFeatureModelFromJson(
    Map<String, dynamic> json) {
  return _RouteDirectionFeatureModel.fromJson(json);
}

/// @nodoc
mixin _$RouteDirectionFeatureModel {
  @JsonKey(name: 'attributes')
  RouteDirectionAttributesModel get attributes =>
      throw _privateConstructorUsedError;
  @JsonKey(name: 'strings')
  List<RouteDirectionStringModel> get strings =>
      throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $RouteDirectionFeatureModelCopyWith<RouteDirectionFeatureModel>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $RouteDirectionFeatureModelCopyWith<$Res> {
  factory $RouteDirectionFeatureModelCopyWith(RouteDirectionFeatureModel value,
          $Res Function(RouteDirectionFeatureModel) then) =
      _$RouteDirectionFeatureModelCopyWithImpl<$Res,
          RouteDirectionFeatureModel>;
  @useResult
  $Res call(
      {@JsonKey(name: 'attributes') RouteDirectionAttributesModel attributes,
      @JsonKey(name: 'strings') List<RouteDirectionStringModel> strings});

  $RouteDirectionAttributesModelCopyWith<$Res> get attributes;
}

/// @nodoc
class _$RouteDirectionFeatureModelCopyWithImpl<$Res,
        $Val extends RouteDirectionFeatureModel>
    implements $RouteDirectionFeatureModelCopyWith<$Res> {
  _$RouteDirectionFeatureModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? attributes = null,
    Object? strings = null,
  }) {
    return _then(_value.copyWith(
      attributes: null == attributes
          ? _value.attributes
          : attributes // ignore: cast_nullable_to_non_nullable
              as RouteDirectionAttributesModel,
      strings: null == strings
          ? _value.strings
          : strings // ignore: cast_nullable_to_non_nullable
              as List<RouteDirectionStringModel>,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $RouteDirectionAttributesModelCopyWith<$Res> get attributes {
    return $RouteDirectionAttributesModelCopyWith<$Res>(_value.attributes,
        (value) {
      return _then(_value.copyWith(attributes: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$RouteDirectionFeatureModelImplCopyWith<$Res>
    implements $RouteDirectionFeatureModelCopyWith<$Res> {
  factory _$$RouteDirectionFeatureModelImplCopyWith(
          _$RouteDirectionFeatureModelImpl value,
          $Res Function(_$RouteDirectionFeatureModelImpl) then) =
      __$$RouteDirectionFeatureModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'attributes') RouteDirectionAttributesModel attributes,
      @JsonKey(name: 'strings') List<RouteDirectionStringModel> strings});

  @override
  $RouteDirectionAttributesModelCopyWith<$Res> get attributes;
}

/// @nodoc
class __$$RouteDirectionFeatureModelImplCopyWithImpl<$Res>
    extends _$RouteDirectionFeatureModelCopyWithImpl<$Res,
        _$RouteDirectionFeatureModelImpl>
    implements _$$RouteDirectionFeatureModelImplCopyWith<$Res> {
  __$$RouteDirectionFeatureModelImplCopyWithImpl(
      _$RouteDirectionFeatureModelImpl _value,
      $Res Function(_$RouteDirectionFeatureModelImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? attributes = null,
    Object? strings = null,
  }) {
    return _then(_$RouteDirectionFeatureModelImpl(
      attributes: null == attributes
          ? _value.attributes
          : attributes // ignore: cast_nullable_to_non_nullable
              as RouteDirectionAttributesModel,
      strings: null == strings
          ? _value._strings
          : strings // ignore: cast_nullable_to_non_nullable
              as List<RouteDirectionStringModel>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$RouteDirectionFeatureModelImpl implements _RouteDirectionFeatureModel {
  const _$RouteDirectionFeatureModelImpl(
      {@JsonKey(name: 'attributes') required this.attributes,
      @JsonKey(name: 'strings')
      final List<RouteDirectionStringModel> strings = const []})
      : _strings = strings;

  factory _$RouteDirectionFeatureModelImpl.fromJson(
          Map<String, dynamic> json) =>
      _$$RouteDirectionFeatureModelImplFromJson(json);

  @override
  @JsonKey(name: 'attributes')
  final RouteDirectionAttributesModel attributes;
  final List<RouteDirectionStringModel> _strings;
  @override
  @JsonKey(name: 'strings')
  List<RouteDirectionStringModel> get strings {
    if (_strings is EqualUnmodifiableListView) return _strings;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_strings);
  }

  @override
  String toString() {
    return 'RouteDirectionFeatureModel(attributes: $attributes, strings: $strings)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$RouteDirectionFeatureModelImpl &&
            (identical(other.attributes, attributes) ||
                other.attributes == attributes) &&
            const DeepCollectionEquality().equals(other._strings, _strings));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType, attributes, const DeepCollectionEquality().hash(_strings));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$RouteDirectionFeatureModelImplCopyWith<_$RouteDirectionFeatureModelImpl>
      get copyWith => __$$RouteDirectionFeatureModelImplCopyWithImpl<
          _$RouteDirectionFeatureModelImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$RouteDirectionFeatureModelImplToJson(
      this,
    );
  }
}

abstract class _RouteDirectionFeatureModel
    implements RouteDirectionFeatureModel {
  const factory _RouteDirectionFeatureModel(
          {@JsonKey(name: 'attributes')
          required final RouteDirectionAttributesModel attributes,
          @JsonKey(name: 'strings')
          final List<RouteDirectionStringModel> strings}) =
      _$RouteDirectionFeatureModelImpl;

  factory _RouteDirectionFeatureModel.fromJson(Map<String, dynamic> json) =
      _$RouteDirectionFeatureModelImpl.fromJson;

  @override
  @JsonKey(name: 'attributes')
  RouteDirectionAttributesModel get attributes;
  @override
  @JsonKey(name: 'strings')
  List<RouteDirectionStringModel> get strings;
  @override
  @JsonKey(ignore: true)
  _$$RouteDirectionFeatureModelImplCopyWith<_$RouteDirectionFeatureModelImpl>
      get copyWith => throw _privateConstructorUsedError;
}

RouteDirectionAttributesModel _$RouteDirectionAttributesModelFromJson(
    Map<String, dynamic> json) {
  return _RouteDirectionAttributesModel.fromJson(json);
}

/// @nodoc
mixin _$RouteDirectionAttributesModel {
  @JsonKey(name: 'length')
  double get length => throw _privateConstructorUsedError;
  @JsonKey(name: 'time')
  double get time => throw _privateConstructorUsedError;
  @JsonKey(name: 'text')
  String? get text => throw _privateConstructorUsedError;
  @JsonKey(name: 'maneuverType')
  String? get maneuverType => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $RouteDirectionAttributesModelCopyWith<RouteDirectionAttributesModel>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $RouteDirectionAttributesModelCopyWith<$Res> {
  factory $RouteDirectionAttributesModelCopyWith(
          RouteDirectionAttributesModel value,
          $Res Function(RouteDirectionAttributesModel) then) =
      _$RouteDirectionAttributesModelCopyWithImpl<$Res,
          RouteDirectionAttributesModel>;
  @useResult
  $Res call(
      {@JsonKey(name: 'length') double length,
      @JsonKey(name: 'time') double time,
      @JsonKey(name: 'text') String? text,
      @JsonKey(name: 'maneuverType') String? maneuverType});
}

/// @nodoc
class _$RouteDirectionAttributesModelCopyWithImpl<$Res,
        $Val extends RouteDirectionAttributesModel>
    implements $RouteDirectionAttributesModelCopyWith<$Res> {
  _$RouteDirectionAttributesModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? length = null,
    Object? time = null,
    Object? text = freezed,
    Object? maneuverType = freezed,
  }) {
    return _then(_value.copyWith(
      length: null == length
          ? _value.length
          : length // ignore: cast_nullable_to_non_nullable
              as double,
      time: null == time
          ? _value.time
          : time // ignore: cast_nullable_to_non_nullable
              as double,
      text: freezed == text
          ? _value.text
          : text // ignore: cast_nullable_to_non_nullable
              as String?,
      maneuverType: freezed == maneuverType
          ? _value.maneuverType
          : maneuverType // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$RouteDirectionAttributesModelImplCopyWith<$Res>
    implements $RouteDirectionAttributesModelCopyWith<$Res> {
  factory _$$RouteDirectionAttributesModelImplCopyWith(
          _$RouteDirectionAttributesModelImpl value,
          $Res Function(_$RouteDirectionAttributesModelImpl) then) =
      __$$RouteDirectionAttributesModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'length') double length,
      @JsonKey(name: 'time') double time,
      @JsonKey(name: 'text') String? text,
      @JsonKey(name: 'maneuverType') String? maneuverType});
}

/// @nodoc
class __$$RouteDirectionAttributesModelImplCopyWithImpl<$Res>
    extends _$RouteDirectionAttributesModelCopyWithImpl<$Res,
        _$RouteDirectionAttributesModelImpl>
    implements _$$RouteDirectionAttributesModelImplCopyWith<$Res> {
  __$$RouteDirectionAttributesModelImplCopyWithImpl(
      _$RouteDirectionAttributesModelImpl _value,
      $Res Function(_$RouteDirectionAttributesModelImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? length = null,
    Object? time = null,
    Object? text = freezed,
    Object? maneuverType = freezed,
  }) {
    return _then(_$RouteDirectionAttributesModelImpl(
      length: null == length
          ? _value.length
          : length // ignore: cast_nullable_to_non_nullable
              as double,
      time: null == time
          ? _value.time
          : time // ignore: cast_nullable_to_non_nullable
              as double,
      text: freezed == text
          ? _value.text
          : text // ignore: cast_nullable_to_non_nullable
              as String?,
      maneuverType: freezed == maneuverType
          ? _value.maneuverType
          : maneuverType // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$RouteDirectionAttributesModelImpl
    implements _RouteDirectionAttributesModel {
  const _$RouteDirectionAttributesModelImpl(
      {@JsonKey(name: 'length') this.length = 0,
      @JsonKey(name: 'time') this.time = 0,
      @JsonKey(name: 'text') this.text,
      @JsonKey(name: 'maneuverType') this.maneuverType});

  factory _$RouteDirectionAttributesModelImpl.fromJson(
          Map<String, dynamic> json) =>
      _$$RouteDirectionAttributesModelImplFromJson(json);

  @override
  @JsonKey(name: 'length')
  final double length;
  @override
  @JsonKey(name: 'time')
  final double time;
  @override
  @JsonKey(name: 'text')
  final String? text;
  @override
  @JsonKey(name: 'maneuverType')
  final String? maneuverType;

  @override
  String toString() {
    return 'RouteDirectionAttributesModel(length: $length, time: $time, text: $text, maneuverType: $maneuverType)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$RouteDirectionAttributesModelImpl &&
            (identical(other.length, length) || other.length == length) &&
            (identical(other.time, time) || other.time == time) &&
            (identical(other.text, text) || other.text == text) &&
            (identical(other.maneuverType, maneuverType) ||
                other.maneuverType == maneuverType));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode =>
      Object.hash(runtimeType, length, time, text, maneuverType);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$RouteDirectionAttributesModelImplCopyWith<
          _$RouteDirectionAttributesModelImpl>
      get copyWith => __$$RouteDirectionAttributesModelImplCopyWithImpl<
          _$RouteDirectionAttributesModelImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$RouteDirectionAttributesModelImplToJson(
      this,
    );
  }
}

abstract class _RouteDirectionAttributesModel
    implements RouteDirectionAttributesModel {
  const factory _RouteDirectionAttributesModel(
          {@JsonKey(name: 'length') final double length,
          @JsonKey(name: 'time') final double time,
          @JsonKey(name: 'text') final String? text,
          @JsonKey(name: 'maneuverType') final String? maneuverType}) =
      _$RouteDirectionAttributesModelImpl;

  factory _RouteDirectionAttributesModel.fromJson(Map<String, dynamic> json) =
      _$RouteDirectionAttributesModelImpl.fromJson;

  @override
  @JsonKey(name: 'length')
  double get length;
  @override
  @JsonKey(name: 'time')
  double get time;
  @override
  @JsonKey(name: 'text')
  String? get text;
  @override
  @JsonKey(name: 'maneuverType')
  String? get maneuverType;
  @override
  @JsonKey(ignore: true)
  _$$RouteDirectionAttributesModelImplCopyWith<
          _$RouteDirectionAttributesModelImpl>
      get copyWith => throw _privateConstructorUsedError;
}

RouteDirectionStringModel _$RouteDirectionStringModelFromJson(
    Map<String, dynamic> json) {
  return _RouteDirectionStringModel.fromJson(json);
}

/// @nodoc
mixin _$RouteDirectionStringModel {
  @JsonKey(name: 'string')
  String? get string => throw _privateConstructorUsedError;
  @JsonKey(name: 'stringType')
  String? get stringType => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $RouteDirectionStringModelCopyWith<RouteDirectionStringModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $RouteDirectionStringModelCopyWith<$Res> {
  factory $RouteDirectionStringModelCopyWith(RouteDirectionStringModel value,
          $Res Function(RouteDirectionStringModel) then) =
      _$RouteDirectionStringModelCopyWithImpl<$Res, RouteDirectionStringModel>;
  @useResult
  $Res call(
      {@JsonKey(name: 'string') String? string,
      @JsonKey(name: 'stringType') String? stringType});
}

/// @nodoc
class _$RouteDirectionStringModelCopyWithImpl<$Res,
        $Val extends RouteDirectionStringModel>
    implements $RouteDirectionStringModelCopyWith<$Res> {
  _$RouteDirectionStringModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? string = freezed,
    Object? stringType = freezed,
  }) {
    return _then(_value.copyWith(
      string: freezed == string
          ? _value.string
          : string // ignore: cast_nullable_to_non_nullable
              as String?,
      stringType: freezed == stringType
          ? _value.stringType
          : stringType // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$RouteDirectionStringModelImplCopyWith<$Res>
    implements $RouteDirectionStringModelCopyWith<$Res> {
  factory _$$RouteDirectionStringModelImplCopyWith(
          _$RouteDirectionStringModelImpl value,
          $Res Function(_$RouteDirectionStringModelImpl) then) =
      __$$RouteDirectionStringModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'string') String? string,
      @JsonKey(name: 'stringType') String? stringType});
}

/// @nodoc
class __$$RouteDirectionStringModelImplCopyWithImpl<$Res>
    extends _$RouteDirectionStringModelCopyWithImpl<$Res,
        _$RouteDirectionStringModelImpl>
    implements _$$RouteDirectionStringModelImplCopyWith<$Res> {
  __$$RouteDirectionStringModelImplCopyWithImpl(
      _$RouteDirectionStringModelImpl _value,
      $Res Function(_$RouteDirectionStringModelImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? string = freezed,
    Object? stringType = freezed,
  }) {
    return _then(_$RouteDirectionStringModelImpl(
      string: freezed == string
          ? _value.string
          : string // ignore: cast_nullable_to_non_nullable
              as String?,
      stringType: freezed == stringType
          ? _value.stringType
          : stringType // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$RouteDirectionStringModelImpl implements _RouteDirectionStringModel {
  const _$RouteDirectionStringModelImpl(
      {@JsonKey(name: 'string') this.string,
      @JsonKey(name: 'stringType') this.stringType});

  factory _$RouteDirectionStringModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$RouteDirectionStringModelImplFromJson(json);

  @override
  @JsonKey(name: 'string')
  final String? string;
  @override
  @JsonKey(name: 'stringType')
  final String? stringType;

  @override
  String toString() {
    return 'RouteDirectionStringModel(string: $string, stringType: $stringType)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$RouteDirectionStringModelImpl &&
            (identical(other.string, string) || other.string == string) &&
            (identical(other.stringType, stringType) ||
                other.stringType == stringType));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, string, stringType);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$RouteDirectionStringModelImplCopyWith<_$RouteDirectionStringModelImpl>
      get copyWith => __$$RouteDirectionStringModelImplCopyWithImpl<
          _$RouteDirectionStringModelImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$RouteDirectionStringModelImplToJson(
      this,
    );
  }
}

abstract class _RouteDirectionStringModel implements RouteDirectionStringModel {
  const factory _RouteDirectionStringModel(
          {@JsonKey(name: 'string') final String? string,
          @JsonKey(name: 'stringType') final String? stringType}) =
      _$RouteDirectionStringModelImpl;

  factory _RouteDirectionStringModel.fromJson(Map<String, dynamic> json) =
      _$RouteDirectionStringModelImpl.fromJson;

  @override
  @JsonKey(name: 'string')
  String? get string;
  @override
  @JsonKey(name: 'stringType')
  String? get stringType;
  @override
  @JsonKey(ignore: true)
  _$$RouteDirectionStringModelImplCopyWith<_$RouteDirectionStringModelImpl>
      get copyWith => throw _privateConstructorUsedError;
}
