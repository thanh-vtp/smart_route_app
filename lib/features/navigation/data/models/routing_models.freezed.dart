// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'routing_models.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

RouteResponse _$RouteResponseFromJson(Map<String, dynamic> json) {
  return _RouteResponse.fromJson(json);
}

/// @nodoc
mixin _$RouteResponse {
  @JsonKey(name: 'routes')
  RouteFeaturesResult get routes => throw _privateConstructorUsedError;
  @JsonKey(name: 'directions')
  List<RouteDirectionSet> get directions => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $RouteResponseCopyWith<RouteResponse> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $RouteResponseCopyWith<$Res> {
  factory $RouteResponseCopyWith(
          RouteResponse value, $Res Function(RouteResponse) then) =
      _$RouteResponseCopyWithImpl<$Res, RouteResponse>;
  @useResult
  $Res call(
      {@JsonKey(name: 'routes') RouteFeaturesResult routes,
      @JsonKey(name: 'directions') List<RouteDirectionSet> directions});

  $RouteFeaturesResultCopyWith<$Res> get routes;
}

/// @nodoc
class _$RouteResponseCopyWithImpl<$Res, $Val extends RouteResponse>
    implements $RouteResponseCopyWith<$Res> {
  _$RouteResponseCopyWithImpl(this._value, this._then);

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
              as RouteFeaturesResult,
      directions: null == directions
          ? _value.directions
          : directions // ignore: cast_nullable_to_non_nullable
              as List<RouteDirectionSet>,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $RouteFeaturesResultCopyWith<$Res> get routes {
    return $RouteFeaturesResultCopyWith<$Res>(_value.routes, (value) {
      return _then(_value.copyWith(routes: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$RouteResponseImplCopyWith<$Res>
    implements $RouteResponseCopyWith<$Res> {
  factory _$$RouteResponseImplCopyWith(
          _$RouteResponseImpl value, $Res Function(_$RouteResponseImpl) then) =
      __$$RouteResponseImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'routes') RouteFeaturesResult routes,
      @JsonKey(name: 'directions') List<RouteDirectionSet> directions});

  @override
  $RouteFeaturesResultCopyWith<$Res> get routes;
}

/// @nodoc
class __$$RouteResponseImplCopyWithImpl<$Res>
    extends _$RouteResponseCopyWithImpl<$Res, _$RouteResponseImpl>
    implements _$$RouteResponseImplCopyWith<$Res> {
  __$$RouteResponseImplCopyWithImpl(
      _$RouteResponseImpl _value, $Res Function(_$RouteResponseImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? routes = null,
    Object? directions = null,
  }) {
    return _then(_$RouteResponseImpl(
      routes: null == routes
          ? _value.routes
          : routes // ignore: cast_nullable_to_non_nullable
              as RouteFeaturesResult,
      directions: null == directions
          ? _value._directions
          : directions // ignore: cast_nullable_to_non_nullable
              as List<RouteDirectionSet>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$RouteResponseImpl implements _RouteResponse {
  const _$RouteResponseImpl(
      {@JsonKey(name: 'routes') required this.routes,
      @JsonKey(name: 'directions')
      final List<RouteDirectionSet> directions = const []})
      : _directions = directions;

  factory _$RouteResponseImpl.fromJson(Map<String, dynamic> json) =>
      _$$RouteResponseImplFromJson(json);

  @override
  @JsonKey(name: 'routes')
  final RouteFeaturesResult routes;
  final List<RouteDirectionSet> _directions;
  @override
  @JsonKey(name: 'directions')
  List<RouteDirectionSet> get directions {
    if (_directions is EqualUnmodifiableListView) return _directions;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_directions);
  }

  @override
  String toString() {
    return 'RouteResponse(routes: $routes, directions: $directions)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$RouteResponseImpl &&
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
  _$$RouteResponseImplCopyWith<_$RouteResponseImpl> get copyWith =>
      __$$RouteResponseImplCopyWithImpl<_$RouteResponseImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$RouteResponseImplToJson(
      this,
    );
  }
}

abstract class _RouteResponse implements RouteResponse {
  const factory _RouteResponse(
      {@JsonKey(name: 'routes') required final RouteFeaturesResult routes,
      @JsonKey(name: 'directions')
      final List<RouteDirectionSet> directions}) = _$RouteResponseImpl;

  factory _RouteResponse.fromJson(Map<String, dynamic> json) =
      _$RouteResponseImpl.fromJson;

  @override
  @JsonKey(name: 'routes')
  RouteFeaturesResult get routes;
  @override
  @JsonKey(name: 'directions')
  List<RouteDirectionSet> get directions;
  @override
  @JsonKey(ignore: true)
  _$$RouteResponseImplCopyWith<_$RouteResponseImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

RouteDirectionSet _$RouteDirectionSetFromJson(Map<String, dynamic> json) {
  return _RouteDirectionSet.fromJson(json);
}

/// @nodoc
mixin _$RouteDirectionSet {
  @JsonKey(name: 'routeId')
  int? get routeId => throw _privateConstructorUsedError;
  @JsonKey(name: 'routeName')
  String? get routeName => throw _privateConstructorUsedError;
  @JsonKey(name: 'summary')
  RouteDirectionSummary? get summary => throw _privateConstructorUsedError;
  @JsonKey(name: 'features')
  List<RouteDirectionFeature> get features =>
      throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $RouteDirectionSetCopyWith<RouteDirectionSet> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $RouteDirectionSetCopyWith<$Res> {
  factory $RouteDirectionSetCopyWith(
          RouteDirectionSet value, $Res Function(RouteDirectionSet) then) =
      _$RouteDirectionSetCopyWithImpl<$Res, RouteDirectionSet>;
  @useResult
  $Res call(
      {@JsonKey(name: 'routeId') int? routeId,
      @JsonKey(name: 'routeName') String? routeName,
      @JsonKey(name: 'summary') RouteDirectionSummary? summary,
      @JsonKey(name: 'features') List<RouteDirectionFeature> features});

  $RouteDirectionSummaryCopyWith<$Res>? get summary;
}

/// @nodoc
class _$RouteDirectionSetCopyWithImpl<$Res, $Val extends RouteDirectionSet>
    implements $RouteDirectionSetCopyWith<$Res> {
  _$RouteDirectionSetCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? routeId = freezed,
    Object? routeName = freezed,
    Object? summary = freezed,
    Object? features = null,
  }) {
    return _then(_value.copyWith(
      routeId: freezed == routeId
          ? _value.routeId
          : routeId // ignore: cast_nullable_to_non_nullable
              as int?,
      routeName: freezed == routeName
          ? _value.routeName
          : routeName // ignore: cast_nullable_to_non_nullable
              as String?,
      summary: freezed == summary
          ? _value.summary
          : summary // ignore: cast_nullable_to_non_nullable
              as RouteDirectionSummary?,
      features: null == features
          ? _value.features
          : features // ignore: cast_nullable_to_non_nullable
              as List<RouteDirectionFeature>,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $RouteDirectionSummaryCopyWith<$Res>? get summary {
    if (_value.summary == null) {
      return null;
    }

    return $RouteDirectionSummaryCopyWith<$Res>(_value.summary!, (value) {
      return _then(_value.copyWith(summary: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$RouteDirectionSetImplCopyWith<$Res>
    implements $RouteDirectionSetCopyWith<$Res> {
  factory _$$RouteDirectionSetImplCopyWith(_$RouteDirectionSetImpl value,
          $Res Function(_$RouteDirectionSetImpl) then) =
      __$$RouteDirectionSetImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'routeId') int? routeId,
      @JsonKey(name: 'routeName') String? routeName,
      @JsonKey(name: 'summary') RouteDirectionSummary? summary,
      @JsonKey(name: 'features') List<RouteDirectionFeature> features});

  @override
  $RouteDirectionSummaryCopyWith<$Res>? get summary;
}

/// @nodoc
class __$$RouteDirectionSetImplCopyWithImpl<$Res>
    extends _$RouteDirectionSetCopyWithImpl<$Res, _$RouteDirectionSetImpl>
    implements _$$RouteDirectionSetImplCopyWith<$Res> {
  __$$RouteDirectionSetImplCopyWithImpl(_$RouteDirectionSetImpl _value,
      $Res Function(_$RouteDirectionSetImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? routeId = freezed,
    Object? routeName = freezed,
    Object? summary = freezed,
    Object? features = null,
  }) {
    return _then(_$RouteDirectionSetImpl(
      routeId: freezed == routeId
          ? _value.routeId
          : routeId // ignore: cast_nullable_to_non_nullable
              as int?,
      routeName: freezed == routeName
          ? _value.routeName
          : routeName // ignore: cast_nullable_to_non_nullable
              as String?,
      summary: freezed == summary
          ? _value.summary
          : summary // ignore: cast_nullable_to_non_nullable
              as RouteDirectionSummary?,
      features: null == features
          ? _value._features
          : features // ignore: cast_nullable_to_non_nullable
              as List<RouteDirectionFeature>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$RouteDirectionSetImpl implements _RouteDirectionSet {
  const _$RouteDirectionSetImpl(
      {@JsonKey(name: 'routeId') this.routeId,
      @JsonKey(name: 'routeName') this.routeName,
      @JsonKey(name: 'summary') this.summary,
      @JsonKey(name: 'features')
      final List<RouteDirectionFeature> features = const []})
      : _features = features;

  factory _$RouteDirectionSetImpl.fromJson(Map<String, dynamic> json) =>
      _$$RouteDirectionSetImplFromJson(json);

  @override
  @JsonKey(name: 'routeId')
  final int? routeId;
  @override
  @JsonKey(name: 'routeName')
  final String? routeName;
  @override
  @JsonKey(name: 'summary')
  final RouteDirectionSummary? summary;
  final List<RouteDirectionFeature> _features;
  @override
  @JsonKey(name: 'features')
  List<RouteDirectionFeature> get features {
    if (_features is EqualUnmodifiableListView) return _features;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_features);
  }

  @override
  String toString() {
    return 'RouteDirectionSet(routeId: $routeId, routeName: $routeName, summary: $summary, features: $features)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$RouteDirectionSetImpl &&
            (identical(other.routeId, routeId) || other.routeId == routeId) &&
            (identical(other.routeName, routeName) ||
                other.routeName == routeName) &&
            (identical(other.summary, summary) || other.summary == summary) &&
            const DeepCollectionEquality().equals(other._features, _features));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, routeId, routeName, summary,
      const DeepCollectionEquality().hash(_features));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$RouteDirectionSetImplCopyWith<_$RouteDirectionSetImpl> get copyWith =>
      __$$RouteDirectionSetImplCopyWithImpl<_$RouteDirectionSetImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$RouteDirectionSetImplToJson(
      this,
    );
  }
}

abstract class _RouteDirectionSet implements RouteDirectionSet {
  const factory _RouteDirectionSet(
      {@JsonKey(name: 'routeId') final int? routeId,
      @JsonKey(name: 'routeName') final String? routeName,
      @JsonKey(name: 'summary') final RouteDirectionSummary? summary,
      @JsonKey(name: 'features')
      final List<RouteDirectionFeature> features}) = _$RouteDirectionSetImpl;

  factory _RouteDirectionSet.fromJson(Map<String, dynamic> json) =
      _$RouteDirectionSetImpl.fromJson;

  @override
  @JsonKey(name: 'routeId')
  int? get routeId;
  @override
  @JsonKey(name: 'routeName')
  String? get routeName;
  @override
  @JsonKey(name: 'summary')
  RouteDirectionSummary? get summary;
  @override
  @JsonKey(name: 'features')
  List<RouteDirectionFeature> get features;
  @override
  @JsonKey(ignore: true)
  _$$RouteDirectionSetImplCopyWith<_$RouteDirectionSetImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

RouteDirectionSummary _$RouteDirectionSummaryFromJson(
    Map<String, dynamic> json) {
  return _RouteDirectionSummary.fromJson(json);
}

/// @nodoc
mixin _$RouteDirectionSummary {
  @JsonKey(name: 'totalLength')
  double? get totalLength => throw _privateConstructorUsedError;
  @JsonKey(name: 'totalTime')
  double? get totalTime => throw _privateConstructorUsedError;
  @JsonKey(name: 'totalDriveTime')
  double? get totalDriveTime => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $RouteDirectionSummaryCopyWith<RouteDirectionSummary> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $RouteDirectionSummaryCopyWith<$Res> {
  factory $RouteDirectionSummaryCopyWith(RouteDirectionSummary value,
          $Res Function(RouteDirectionSummary) then) =
      _$RouteDirectionSummaryCopyWithImpl<$Res, RouteDirectionSummary>;
  @useResult
  $Res call(
      {@JsonKey(name: 'totalLength') double? totalLength,
      @JsonKey(name: 'totalTime') double? totalTime,
      @JsonKey(name: 'totalDriveTime') double? totalDriveTime});
}

/// @nodoc
class _$RouteDirectionSummaryCopyWithImpl<$Res,
        $Val extends RouteDirectionSummary>
    implements $RouteDirectionSummaryCopyWith<$Res> {
  _$RouteDirectionSummaryCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? totalLength = freezed,
    Object? totalTime = freezed,
    Object? totalDriveTime = freezed,
  }) {
    return _then(_value.copyWith(
      totalLength: freezed == totalLength
          ? _value.totalLength
          : totalLength // ignore: cast_nullable_to_non_nullable
              as double?,
      totalTime: freezed == totalTime
          ? _value.totalTime
          : totalTime // ignore: cast_nullable_to_non_nullable
              as double?,
      totalDriveTime: freezed == totalDriveTime
          ? _value.totalDriveTime
          : totalDriveTime // ignore: cast_nullable_to_non_nullable
              as double?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$RouteDirectionSummaryImplCopyWith<$Res>
    implements $RouteDirectionSummaryCopyWith<$Res> {
  factory _$$RouteDirectionSummaryImplCopyWith(
          _$RouteDirectionSummaryImpl value,
          $Res Function(_$RouteDirectionSummaryImpl) then) =
      __$$RouteDirectionSummaryImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'totalLength') double? totalLength,
      @JsonKey(name: 'totalTime') double? totalTime,
      @JsonKey(name: 'totalDriveTime') double? totalDriveTime});
}

/// @nodoc
class __$$RouteDirectionSummaryImplCopyWithImpl<$Res>
    extends _$RouteDirectionSummaryCopyWithImpl<$Res,
        _$RouteDirectionSummaryImpl>
    implements _$$RouteDirectionSummaryImplCopyWith<$Res> {
  __$$RouteDirectionSummaryImplCopyWithImpl(_$RouteDirectionSummaryImpl _value,
      $Res Function(_$RouteDirectionSummaryImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? totalLength = freezed,
    Object? totalTime = freezed,
    Object? totalDriveTime = freezed,
  }) {
    return _then(_$RouteDirectionSummaryImpl(
      totalLength: freezed == totalLength
          ? _value.totalLength
          : totalLength // ignore: cast_nullable_to_non_nullable
              as double?,
      totalTime: freezed == totalTime
          ? _value.totalTime
          : totalTime // ignore: cast_nullable_to_non_nullable
              as double?,
      totalDriveTime: freezed == totalDriveTime
          ? _value.totalDriveTime
          : totalDriveTime // ignore: cast_nullable_to_non_nullable
              as double?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$RouteDirectionSummaryImpl implements _RouteDirectionSummary {
  const _$RouteDirectionSummaryImpl(
      {@JsonKey(name: 'totalLength') this.totalLength,
      @JsonKey(name: 'totalTime') this.totalTime,
      @JsonKey(name: 'totalDriveTime') this.totalDriveTime});

  factory _$RouteDirectionSummaryImpl.fromJson(Map<String, dynamic> json) =>
      _$$RouteDirectionSummaryImplFromJson(json);

  @override
  @JsonKey(name: 'totalLength')
  final double? totalLength;
  @override
  @JsonKey(name: 'totalTime')
  final double? totalTime;
  @override
  @JsonKey(name: 'totalDriveTime')
  final double? totalDriveTime;

  @override
  String toString() {
    return 'RouteDirectionSummary(totalLength: $totalLength, totalTime: $totalTime, totalDriveTime: $totalDriveTime)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$RouteDirectionSummaryImpl &&
            (identical(other.totalLength, totalLength) ||
                other.totalLength == totalLength) &&
            (identical(other.totalTime, totalTime) ||
                other.totalTime == totalTime) &&
            (identical(other.totalDriveTime, totalDriveTime) ||
                other.totalDriveTime == totalDriveTime));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode =>
      Object.hash(runtimeType, totalLength, totalTime, totalDriveTime);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$RouteDirectionSummaryImplCopyWith<_$RouteDirectionSummaryImpl>
      get copyWith => __$$RouteDirectionSummaryImplCopyWithImpl<
          _$RouteDirectionSummaryImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$RouteDirectionSummaryImplToJson(
      this,
    );
  }
}

abstract class _RouteDirectionSummary implements RouteDirectionSummary {
  const factory _RouteDirectionSummary(
          {@JsonKey(name: 'totalLength') final double? totalLength,
          @JsonKey(name: 'totalTime') final double? totalTime,
          @JsonKey(name: 'totalDriveTime') final double? totalDriveTime}) =
      _$RouteDirectionSummaryImpl;

  factory _RouteDirectionSummary.fromJson(Map<String, dynamic> json) =
      _$RouteDirectionSummaryImpl.fromJson;

  @override
  @JsonKey(name: 'totalLength')
  double? get totalLength;
  @override
  @JsonKey(name: 'totalTime')
  double? get totalTime;
  @override
  @JsonKey(name: 'totalDriveTime')
  double? get totalDriveTime;
  @override
  @JsonKey(ignore: true)
  _$$RouteDirectionSummaryImplCopyWith<_$RouteDirectionSummaryImpl>
      get copyWith => throw _privateConstructorUsedError;
}

RouteDirectionFeature _$RouteDirectionFeatureFromJson(
    Map<String, dynamic> json) {
  return _RouteDirectionFeature.fromJson(json);
}

/// @nodoc
mixin _$RouteDirectionFeature {
  @JsonKey(name: 'attributes')
  RouteDirectionAttributes get attributes => throw _privateConstructorUsedError;
  @JsonKey(name: 'strings')
  List<RouteDirectionString> get strings => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $RouteDirectionFeatureCopyWith<RouteDirectionFeature> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $RouteDirectionFeatureCopyWith<$Res> {
  factory $RouteDirectionFeatureCopyWith(RouteDirectionFeature value,
          $Res Function(RouteDirectionFeature) then) =
      _$RouteDirectionFeatureCopyWithImpl<$Res, RouteDirectionFeature>;
  @useResult
  $Res call(
      {@JsonKey(name: 'attributes') RouteDirectionAttributes attributes,
      @JsonKey(name: 'strings') List<RouteDirectionString> strings});

  $RouteDirectionAttributesCopyWith<$Res> get attributes;
}

/// @nodoc
class _$RouteDirectionFeatureCopyWithImpl<$Res,
        $Val extends RouteDirectionFeature>
    implements $RouteDirectionFeatureCopyWith<$Res> {
  _$RouteDirectionFeatureCopyWithImpl(this._value, this._then);

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
              as RouteDirectionAttributes,
      strings: null == strings
          ? _value.strings
          : strings // ignore: cast_nullable_to_non_nullable
              as List<RouteDirectionString>,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $RouteDirectionAttributesCopyWith<$Res> get attributes {
    return $RouteDirectionAttributesCopyWith<$Res>(_value.attributes, (value) {
      return _then(_value.copyWith(attributes: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$RouteDirectionFeatureImplCopyWith<$Res>
    implements $RouteDirectionFeatureCopyWith<$Res> {
  factory _$$RouteDirectionFeatureImplCopyWith(
          _$RouteDirectionFeatureImpl value,
          $Res Function(_$RouteDirectionFeatureImpl) then) =
      __$$RouteDirectionFeatureImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'attributes') RouteDirectionAttributes attributes,
      @JsonKey(name: 'strings') List<RouteDirectionString> strings});

  @override
  $RouteDirectionAttributesCopyWith<$Res> get attributes;
}

/// @nodoc
class __$$RouteDirectionFeatureImplCopyWithImpl<$Res>
    extends _$RouteDirectionFeatureCopyWithImpl<$Res,
        _$RouteDirectionFeatureImpl>
    implements _$$RouteDirectionFeatureImplCopyWith<$Res> {
  __$$RouteDirectionFeatureImplCopyWithImpl(_$RouteDirectionFeatureImpl _value,
      $Res Function(_$RouteDirectionFeatureImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? attributes = null,
    Object? strings = null,
  }) {
    return _then(_$RouteDirectionFeatureImpl(
      attributes: null == attributes
          ? _value.attributes
          : attributes // ignore: cast_nullable_to_non_nullable
              as RouteDirectionAttributes,
      strings: null == strings
          ? _value._strings
          : strings // ignore: cast_nullable_to_non_nullable
              as List<RouteDirectionString>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$RouteDirectionFeatureImpl implements _RouteDirectionFeature {
  const _$RouteDirectionFeatureImpl(
      {@JsonKey(name: 'attributes') required this.attributes,
      @JsonKey(name: 'strings')
      final List<RouteDirectionString> strings = const []})
      : _strings = strings;

  factory _$RouteDirectionFeatureImpl.fromJson(Map<String, dynamic> json) =>
      _$$RouteDirectionFeatureImplFromJson(json);

  @override
  @JsonKey(name: 'attributes')
  final RouteDirectionAttributes attributes;
  final List<RouteDirectionString> _strings;
  @override
  @JsonKey(name: 'strings')
  List<RouteDirectionString> get strings {
    if (_strings is EqualUnmodifiableListView) return _strings;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_strings);
  }

  @override
  String toString() {
    return 'RouteDirectionFeature(attributes: $attributes, strings: $strings)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$RouteDirectionFeatureImpl &&
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
  _$$RouteDirectionFeatureImplCopyWith<_$RouteDirectionFeatureImpl>
      get copyWith => __$$RouteDirectionFeatureImplCopyWithImpl<
          _$RouteDirectionFeatureImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$RouteDirectionFeatureImplToJson(
      this,
    );
  }
}

abstract class _RouteDirectionFeature implements RouteDirectionFeature {
  const factory _RouteDirectionFeature(
          {@JsonKey(name: 'attributes')
          required final RouteDirectionAttributes attributes,
          @JsonKey(name: 'strings') final List<RouteDirectionString> strings}) =
      _$RouteDirectionFeatureImpl;

  factory _RouteDirectionFeature.fromJson(Map<String, dynamic> json) =
      _$RouteDirectionFeatureImpl.fromJson;

  @override
  @JsonKey(name: 'attributes')
  RouteDirectionAttributes get attributes;
  @override
  @JsonKey(name: 'strings')
  List<RouteDirectionString> get strings;
  @override
  @JsonKey(ignore: true)
  _$$RouteDirectionFeatureImplCopyWith<_$RouteDirectionFeatureImpl>
      get copyWith => throw _privateConstructorUsedError;
}

RouteDirectionAttributes _$RouteDirectionAttributesFromJson(
    Map<String, dynamic> json) {
  return _RouteDirectionAttributes.fromJson(json);
}

/// @nodoc
mixin _$RouteDirectionAttributes {
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
  $RouteDirectionAttributesCopyWith<RouteDirectionAttributes> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $RouteDirectionAttributesCopyWith<$Res> {
  factory $RouteDirectionAttributesCopyWith(RouteDirectionAttributes value,
          $Res Function(RouteDirectionAttributes) then) =
      _$RouteDirectionAttributesCopyWithImpl<$Res, RouteDirectionAttributes>;
  @useResult
  $Res call(
      {@JsonKey(name: 'length') double length,
      @JsonKey(name: 'time') double time,
      @JsonKey(name: 'text') String? text,
      @JsonKey(name: 'maneuverType') String? maneuverType});
}

/// @nodoc
class _$RouteDirectionAttributesCopyWithImpl<$Res,
        $Val extends RouteDirectionAttributes>
    implements $RouteDirectionAttributesCopyWith<$Res> {
  _$RouteDirectionAttributesCopyWithImpl(this._value, this._then);

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
abstract class _$$RouteDirectionAttributesImplCopyWith<$Res>
    implements $RouteDirectionAttributesCopyWith<$Res> {
  factory _$$RouteDirectionAttributesImplCopyWith(
          _$RouteDirectionAttributesImpl value,
          $Res Function(_$RouteDirectionAttributesImpl) then) =
      __$$RouteDirectionAttributesImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'length') double length,
      @JsonKey(name: 'time') double time,
      @JsonKey(name: 'text') String? text,
      @JsonKey(name: 'maneuverType') String? maneuverType});
}

/// @nodoc
class __$$RouteDirectionAttributesImplCopyWithImpl<$Res>
    extends _$RouteDirectionAttributesCopyWithImpl<$Res,
        _$RouteDirectionAttributesImpl>
    implements _$$RouteDirectionAttributesImplCopyWith<$Res> {
  __$$RouteDirectionAttributesImplCopyWithImpl(
      _$RouteDirectionAttributesImpl _value,
      $Res Function(_$RouteDirectionAttributesImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? length = null,
    Object? time = null,
    Object? text = freezed,
    Object? maneuverType = freezed,
  }) {
    return _then(_$RouteDirectionAttributesImpl(
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
class _$RouteDirectionAttributesImpl implements _RouteDirectionAttributes {
  const _$RouteDirectionAttributesImpl(
      {@JsonKey(name: 'length') this.length = 0,
      @JsonKey(name: 'time') this.time = 0,
      @JsonKey(name: 'text') this.text,
      @JsonKey(name: 'maneuverType') this.maneuverType});

  factory _$RouteDirectionAttributesImpl.fromJson(Map<String, dynamic> json) =>
      _$$RouteDirectionAttributesImplFromJson(json);

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
    return 'RouteDirectionAttributes(length: $length, time: $time, text: $text, maneuverType: $maneuverType)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$RouteDirectionAttributesImpl &&
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
  _$$RouteDirectionAttributesImplCopyWith<_$RouteDirectionAttributesImpl>
      get copyWith => __$$RouteDirectionAttributesImplCopyWithImpl<
          _$RouteDirectionAttributesImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$RouteDirectionAttributesImplToJson(
      this,
    );
  }
}

abstract class _RouteDirectionAttributes implements RouteDirectionAttributes {
  const factory _RouteDirectionAttributes(
          {@JsonKey(name: 'length') final double length,
          @JsonKey(name: 'time') final double time,
          @JsonKey(name: 'text') final String? text,
          @JsonKey(name: 'maneuverType') final String? maneuverType}) =
      _$RouteDirectionAttributesImpl;

  factory _RouteDirectionAttributes.fromJson(Map<String, dynamic> json) =
      _$RouteDirectionAttributesImpl.fromJson;

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
  _$$RouteDirectionAttributesImplCopyWith<_$RouteDirectionAttributesImpl>
      get copyWith => throw _privateConstructorUsedError;
}

RouteDirectionString _$RouteDirectionStringFromJson(Map<String, dynamic> json) {
  return _RouteDirectionString.fromJson(json);
}

/// @nodoc
mixin _$RouteDirectionString {
  @JsonKey(name: 'string')
  String? get string => throw _privateConstructorUsedError;
  @JsonKey(name: 'stringType')
  String? get stringType => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $RouteDirectionStringCopyWith<RouteDirectionString> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $RouteDirectionStringCopyWith<$Res> {
  factory $RouteDirectionStringCopyWith(RouteDirectionString value,
          $Res Function(RouteDirectionString) then) =
      _$RouteDirectionStringCopyWithImpl<$Res, RouteDirectionString>;
  @useResult
  $Res call(
      {@JsonKey(name: 'string') String? string,
      @JsonKey(name: 'stringType') String? stringType});
}

/// @nodoc
class _$RouteDirectionStringCopyWithImpl<$Res,
        $Val extends RouteDirectionString>
    implements $RouteDirectionStringCopyWith<$Res> {
  _$RouteDirectionStringCopyWithImpl(this._value, this._then);

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
abstract class _$$RouteDirectionStringImplCopyWith<$Res>
    implements $RouteDirectionStringCopyWith<$Res> {
  factory _$$RouteDirectionStringImplCopyWith(_$RouteDirectionStringImpl value,
          $Res Function(_$RouteDirectionStringImpl) then) =
      __$$RouteDirectionStringImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'string') String? string,
      @JsonKey(name: 'stringType') String? stringType});
}

/// @nodoc
class __$$RouteDirectionStringImplCopyWithImpl<$Res>
    extends _$RouteDirectionStringCopyWithImpl<$Res, _$RouteDirectionStringImpl>
    implements _$$RouteDirectionStringImplCopyWith<$Res> {
  __$$RouteDirectionStringImplCopyWithImpl(_$RouteDirectionStringImpl _value,
      $Res Function(_$RouteDirectionStringImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? string = freezed,
    Object? stringType = freezed,
  }) {
    return _then(_$RouteDirectionStringImpl(
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
class _$RouteDirectionStringImpl implements _RouteDirectionString {
  const _$RouteDirectionStringImpl(
      {@JsonKey(name: 'string') this.string,
      @JsonKey(name: 'stringType') this.stringType});

  factory _$RouteDirectionStringImpl.fromJson(Map<String, dynamic> json) =>
      _$$RouteDirectionStringImplFromJson(json);

  @override
  @JsonKey(name: 'string')
  final String? string;
  @override
  @JsonKey(name: 'stringType')
  final String? stringType;

  @override
  String toString() {
    return 'RouteDirectionString(string: $string, stringType: $stringType)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$RouteDirectionStringImpl &&
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
  _$$RouteDirectionStringImplCopyWith<_$RouteDirectionStringImpl>
      get copyWith =>
          __$$RouteDirectionStringImplCopyWithImpl<_$RouteDirectionStringImpl>(
              this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$RouteDirectionStringImplToJson(
      this,
    );
  }
}

abstract class _RouteDirectionString implements RouteDirectionString {
  const factory _RouteDirectionString(
          {@JsonKey(name: 'string') final String? string,
          @JsonKey(name: 'stringType') final String? stringType}) =
      _$RouteDirectionStringImpl;

  factory _RouteDirectionString.fromJson(Map<String, dynamic> json) =
      _$RouteDirectionStringImpl.fromJson;

  @override
  @JsonKey(name: 'string')
  String? get string;
  @override
  @JsonKey(name: 'stringType')
  String? get stringType;
  @override
  @JsonKey(ignore: true)
  _$$RouteDirectionStringImplCopyWith<_$RouteDirectionStringImpl>
      get copyWith => throw _privateConstructorUsedError;
}

RouteFeaturesResult _$RouteFeaturesResultFromJson(Map<String, dynamic> json) {
  return _RouteFeaturesResult.fromJson(json);
}

/// @nodoc
mixin _$RouteFeaturesResult {
  @JsonKey(name: 'features')
  List<RouteFeature> get features => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $RouteFeaturesResultCopyWith<RouteFeaturesResult> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $RouteFeaturesResultCopyWith<$Res> {
  factory $RouteFeaturesResultCopyWith(
          RouteFeaturesResult value, $Res Function(RouteFeaturesResult) then) =
      _$RouteFeaturesResultCopyWithImpl<$Res, RouteFeaturesResult>;
  @useResult
  $Res call({@JsonKey(name: 'features') List<RouteFeature> features});
}

/// @nodoc
class _$RouteFeaturesResultCopyWithImpl<$Res, $Val extends RouteFeaturesResult>
    implements $RouteFeaturesResultCopyWith<$Res> {
  _$RouteFeaturesResultCopyWithImpl(this._value, this._then);

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
              as List<RouteFeature>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$RouteFeaturesResultImplCopyWith<$Res>
    implements $RouteFeaturesResultCopyWith<$Res> {
  factory _$$RouteFeaturesResultImplCopyWith(_$RouteFeaturesResultImpl value,
          $Res Function(_$RouteFeaturesResultImpl) then) =
      __$$RouteFeaturesResultImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({@JsonKey(name: 'features') List<RouteFeature> features});
}

/// @nodoc
class __$$RouteFeaturesResultImplCopyWithImpl<$Res>
    extends _$RouteFeaturesResultCopyWithImpl<$Res, _$RouteFeaturesResultImpl>
    implements _$$RouteFeaturesResultImplCopyWith<$Res> {
  __$$RouteFeaturesResultImplCopyWithImpl(_$RouteFeaturesResultImpl _value,
      $Res Function(_$RouteFeaturesResultImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? features = null,
  }) {
    return _then(_$RouteFeaturesResultImpl(
      features: null == features
          ? _value._features
          : features // ignore: cast_nullable_to_non_nullable
              as List<RouteFeature>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$RouteFeaturesResultImpl implements _RouteFeaturesResult {
  const _$RouteFeaturesResultImpl(
      {@JsonKey(name: 'features') required final List<RouteFeature> features})
      : _features = features;

  factory _$RouteFeaturesResultImpl.fromJson(Map<String, dynamic> json) =>
      _$$RouteFeaturesResultImplFromJson(json);

  final List<RouteFeature> _features;
  @override
  @JsonKey(name: 'features')
  List<RouteFeature> get features {
    if (_features is EqualUnmodifiableListView) return _features;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_features);
  }

  @override
  String toString() {
    return 'RouteFeaturesResult(features: $features)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$RouteFeaturesResultImpl &&
            const DeepCollectionEquality().equals(other._features, _features));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(_features));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$RouteFeaturesResultImplCopyWith<_$RouteFeaturesResultImpl> get copyWith =>
      __$$RouteFeaturesResultImplCopyWithImpl<_$RouteFeaturesResultImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$RouteFeaturesResultImplToJson(
      this,
    );
  }
}

abstract class _RouteFeaturesResult implements RouteFeaturesResult {
  const factory _RouteFeaturesResult(
      {@JsonKey(name: 'features')
      required final List<RouteFeature> features}) = _$RouteFeaturesResultImpl;

  factory _RouteFeaturesResult.fromJson(Map<String, dynamic> json) =
      _$RouteFeaturesResultImpl.fromJson;

  @override
  @JsonKey(name: 'features')
  List<RouteFeature> get features;
  @override
  @JsonKey(ignore: true)
  _$$RouteFeaturesResultImplCopyWith<_$RouteFeaturesResultImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

RouteFeature _$RouteFeatureFromJson(Map<String, dynamic> json) {
  return _RouteFeature.fromJson(json);
}

/// @nodoc
mixin _$RouteFeature {
  @JsonKey(name: 'attributes')
  RouteAttributes get attributes => throw _privateConstructorUsedError;
  @JsonKey(name: 'geometry')
  RouteGeometry get geometry => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $RouteFeatureCopyWith<RouteFeature> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $RouteFeatureCopyWith<$Res> {
  factory $RouteFeatureCopyWith(
          RouteFeature value, $Res Function(RouteFeature) then) =
      _$RouteFeatureCopyWithImpl<$Res, RouteFeature>;
  @useResult
  $Res call(
      {@JsonKey(name: 'attributes') RouteAttributes attributes,
      @JsonKey(name: 'geometry') RouteGeometry geometry});

  $RouteAttributesCopyWith<$Res> get attributes;
  $RouteGeometryCopyWith<$Res> get geometry;
}

/// @nodoc
class _$RouteFeatureCopyWithImpl<$Res, $Val extends RouteFeature>
    implements $RouteFeatureCopyWith<$Res> {
  _$RouteFeatureCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? attributes = null,
    Object? geometry = null,
  }) {
    return _then(_value.copyWith(
      attributes: null == attributes
          ? _value.attributes
          : attributes // ignore: cast_nullable_to_non_nullable
              as RouteAttributes,
      geometry: null == geometry
          ? _value.geometry
          : geometry // ignore: cast_nullable_to_non_nullable
              as RouteGeometry,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $RouteAttributesCopyWith<$Res> get attributes {
    return $RouteAttributesCopyWith<$Res>(_value.attributes, (value) {
      return _then(_value.copyWith(attributes: value) as $Val);
    });
  }

  @override
  @pragma('vm:prefer-inline')
  $RouteGeometryCopyWith<$Res> get geometry {
    return $RouteGeometryCopyWith<$Res>(_value.geometry, (value) {
      return _then(_value.copyWith(geometry: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$RouteFeatureImplCopyWith<$Res>
    implements $RouteFeatureCopyWith<$Res> {
  factory _$$RouteFeatureImplCopyWith(
          _$RouteFeatureImpl value, $Res Function(_$RouteFeatureImpl) then) =
      __$$RouteFeatureImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'attributes') RouteAttributes attributes,
      @JsonKey(name: 'geometry') RouteGeometry geometry});

  @override
  $RouteAttributesCopyWith<$Res> get attributes;
  @override
  $RouteGeometryCopyWith<$Res> get geometry;
}

/// @nodoc
class __$$RouteFeatureImplCopyWithImpl<$Res>
    extends _$RouteFeatureCopyWithImpl<$Res, _$RouteFeatureImpl>
    implements _$$RouteFeatureImplCopyWith<$Res> {
  __$$RouteFeatureImplCopyWithImpl(
      _$RouteFeatureImpl _value, $Res Function(_$RouteFeatureImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? attributes = null,
    Object? geometry = null,
  }) {
    return _then(_$RouteFeatureImpl(
      attributes: null == attributes
          ? _value.attributes
          : attributes // ignore: cast_nullable_to_non_nullable
              as RouteAttributes,
      geometry: null == geometry
          ? _value.geometry
          : geometry // ignore: cast_nullable_to_non_nullable
              as RouteGeometry,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$RouteFeatureImpl implements _RouteFeature {
  const _$RouteFeatureImpl(
      {@JsonKey(name: 'attributes') required this.attributes,
      @JsonKey(name: 'geometry') required this.geometry});

  factory _$RouteFeatureImpl.fromJson(Map<String, dynamic> json) =>
      _$$RouteFeatureImplFromJson(json);

  @override
  @JsonKey(name: 'attributes')
  final RouteAttributes attributes;
  @override
  @JsonKey(name: 'geometry')
  final RouteGeometry geometry;

  @override
  String toString() {
    return 'RouteFeature(attributes: $attributes, geometry: $geometry)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$RouteFeatureImpl &&
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
  _$$RouteFeatureImplCopyWith<_$RouteFeatureImpl> get copyWith =>
      __$$RouteFeatureImplCopyWithImpl<_$RouteFeatureImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$RouteFeatureImplToJson(
      this,
    );
  }
}

abstract class _RouteFeature implements RouteFeature {
  const factory _RouteFeature(
      {@JsonKey(name: 'attributes') required final RouteAttributes attributes,
      @JsonKey(name: 'geometry')
      required final RouteGeometry geometry}) = _$RouteFeatureImpl;

  factory _RouteFeature.fromJson(Map<String, dynamic> json) =
      _$RouteFeatureImpl.fromJson;

  @override
  @JsonKey(name: 'attributes')
  RouteAttributes get attributes;
  @override
  @JsonKey(name: 'geometry')
  RouteGeometry get geometry;
  @override
  @JsonKey(ignore: true)
  _$$RouteFeatureImplCopyWith<_$RouteFeatureImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

RouteAttributes _$RouteAttributesFromJson(Map<String, dynamic> json) {
  return _RouteAttributes.fromJson(json);
}

/// @nodoc
mixin _$RouteAttributes {
  @JsonKey(name: 'ObjectID')
  int? get objectId => throw _privateConstructorUsedError;
  @JsonKey(name: 'Name')
  String? get name => throw _privateConstructorUsedError;
  @JsonKey(name: 'FirstStopID')
  int? get firstStopId => throw _privateConstructorUsedError;
  @JsonKey(name: 'LastStopID')
  int? get lastStopId => throw _privateConstructorUsedError;
  @JsonKey(name: 'StopCount')
  int? get stopCount => throw _privateConstructorUsedError;
  @JsonKey(name: 'Total_TravelTime')
  double? get totalTime => throw _privateConstructorUsedError;
  @JsonKey(name: 'Total_Kilometers')
  double? get totalKilometers => throw _privateConstructorUsedError;
  @JsonKey(name: 'Total_Miles')
  double? get totalMiles => throw _privateConstructorUsedError;
  @JsonKey(name: 'Shape_Length')
  double? get shapeLength => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $RouteAttributesCopyWith<RouteAttributes> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $RouteAttributesCopyWith<$Res> {
  factory $RouteAttributesCopyWith(
          RouteAttributes value, $Res Function(RouteAttributes) then) =
      _$RouteAttributesCopyWithImpl<$Res, RouteAttributes>;
  @useResult
  $Res call(
      {@JsonKey(name: 'ObjectID') int? objectId,
      @JsonKey(name: 'Name') String? name,
      @JsonKey(name: 'FirstStopID') int? firstStopId,
      @JsonKey(name: 'LastStopID') int? lastStopId,
      @JsonKey(name: 'StopCount') int? stopCount,
      @JsonKey(name: 'Total_TravelTime') double? totalTime,
      @JsonKey(name: 'Total_Kilometers') double? totalKilometers,
      @JsonKey(name: 'Total_Miles') double? totalMiles,
      @JsonKey(name: 'Shape_Length') double? shapeLength});
}

/// @nodoc
class _$RouteAttributesCopyWithImpl<$Res, $Val extends RouteAttributes>
    implements $RouteAttributesCopyWith<$Res> {
  _$RouteAttributesCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? objectId = freezed,
    Object? name = freezed,
    Object? firstStopId = freezed,
    Object? lastStopId = freezed,
    Object? stopCount = freezed,
    Object? totalTime = freezed,
    Object? totalKilometers = freezed,
    Object? totalMiles = freezed,
    Object? shapeLength = freezed,
  }) {
    return _then(_value.copyWith(
      objectId: freezed == objectId
          ? _value.objectId
          : objectId // ignore: cast_nullable_to_non_nullable
              as int?,
      name: freezed == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String?,
      firstStopId: freezed == firstStopId
          ? _value.firstStopId
          : firstStopId // ignore: cast_nullable_to_non_nullable
              as int?,
      lastStopId: freezed == lastStopId
          ? _value.lastStopId
          : lastStopId // ignore: cast_nullable_to_non_nullable
              as int?,
      stopCount: freezed == stopCount
          ? _value.stopCount
          : stopCount // ignore: cast_nullable_to_non_nullable
              as int?,
      totalTime: freezed == totalTime
          ? _value.totalTime
          : totalTime // ignore: cast_nullable_to_non_nullable
              as double?,
      totalKilometers: freezed == totalKilometers
          ? _value.totalKilometers
          : totalKilometers // ignore: cast_nullable_to_non_nullable
              as double?,
      totalMiles: freezed == totalMiles
          ? _value.totalMiles
          : totalMiles // ignore: cast_nullable_to_non_nullable
              as double?,
      shapeLength: freezed == shapeLength
          ? _value.shapeLength
          : shapeLength // ignore: cast_nullable_to_non_nullable
              as double?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$RouteAttributesImplCopyWith<$Res>
    implements $RouteAttributesCopyWith<$Res> {
  factory _$$RouteAttributesImplCopyWith(_$RouteAttributesImpl value,
          $Res Function(_$RouteAttributesImpl) then) =
      __$$RouteAttributesImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'ObjectID') int? objectId,
      @JsonKey(name: 'Name') String? name,
      @JsonKey(name: 'FirstStopID') int? firstStopId,
      @JsonKey(name: 'LastStopID') int? lastStopId,
      @JsonKey(name: 'StopCount') int? stopCount,
      @JsonKey(name: 'Total_TravelTime') double? totalTime,
      @JsonKey(name: 'Total_Kilometers') double? totalKilometers,
      @JsonKey(name: 'Total_Miles') double? totalMiles,
      @JsonKey(name: 'Shape_Length') double? shapeLength});
}

/// @nodoc
class __$$RouteAttributesImplCopyWithImpl<$Res>
    extends _$RouteAttributesCopyWithImpl<$Res, _$RouteAttributesImpl>
    implements _$$RouteAttributesImplCopyWith<$Res> {
  __$$RouteAttributesImplCopyWithImpl(
      _$RouteAttributesImpl _value, $Res Function(_$RouteAttributesImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? objectId = freezed,
    Object? name = freezed,
    Object? firstStopId = freezed,
    Object? lastStopId = freezed,
    Object? stopCount = freezed,
    Object? totalTime = freezed,
    Object? totalKilometers = freezed,
    Object? totalMiles = freezed,
    Object? shapeLength = freezed,
  }) {
    return _then(_$RouteAttributesImpl(
      objectId: freezed == objectId
          ? _value.objectId
          : objectId // ignore: cast_nullable_to_non_nullable
              as int?,
      name: freezed == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String?,
      firstStopId: freezed == firstStopId
          ? _value.firstStopId
          : firstStopId // ignore: cast_nullable_to_non_nullable
              as int?,
      lastStopId: freezed == lastStopId
          ? _value.lastStopId
          : lastStopId // ignore: cast_nullable_to_non_nullable
              as int?,
      stopCount: freezed == stopCount
          ? _value.stopCount
          : stopCount // ignore: cast_nullable_to_non_nullable
              as int?,
      totalTime: freezed == totalTime
          ? _value.totalTime
          : totalTime // ignore: cast_nullable_to_non_nullable
              as double?,
      totalKilometers: freezed == totalKilometers
          ? _value.totalKilometers
          : totalKilometers // ignore: cast_nullable_to_non_nullable
              as double?,
      totalMiles: freezed == totalMiles
          ? _value.totalMiles
          : totalMiles // ignore: cast_nullable_to_non_nullable
              as double?,
      shapeLength: freezed == shapeLength
          ? _value.shapeLength
          : shapeLength // ignore: cast_nullable_to_non_nullable
              as double?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$RouteAttributesImpl implements _RouteAttributes {
  const _$RouteAttributesImpl(
      {@JsonKey(name: 'ObjectID') this.objectId,
      @JsonKey(name: 'Name') this.name,
      @JsonKey(name: 'FirstStopID') this.firstStopId,
      @JsonKey(name: 'LastStopID') this.lastStopId,
      @JsonKey(name: 'StopCount') this.stopCount,
      @JsonKey(name: 'Total_TravelTime') this.totalTime,
      @JsonKey(name: 'Total_Kilometers') this.totalKilometers,
      @JsonKey(name: 'Total_Miles') this.totalMiles,
      @JsonKey(name: 'Shape_Length') this.shapeLength});

  factory _$RouteAttributesImpl.fromJson(Map<String, dynamic> json) =>
      _$$RouteAttributesImplFromJson(json);

  @override
  @JsonKey(name: 'ObjectID')
  final int? objectId;
  @override
  @JsonKey(name: 'Name')
  final String? name;
  @override
  @JsonKey(name: 'FirstStopID')
  final int? firstStopId;
  @override
  @JsonKey(name: 'LastStopID')
  final int? lastStopId;
  @override
  @JsonKey(name: 'StopCount')
  final int? stopCount;
  @override
  @JsonKey(name: 'Total_TravelTime')
  final double? totalTime;
  @override
  @JsonKey(name: 'Total_Kilometers')
  final double? totalKilometers;
  @override
  @JsonKey(name: 'Total_Miles')
  final double? totalMiles;
  @override
  @JsonKey(name: 'Shape_Length')
  final double? shapeLength;

  @override
  String toString() {
    return 'RouteAttributes(objectId: $objectId, name: $name, firstStopId: $firstStopId, lastStopId: $lastStopId, stopCount: $stopCount, totalTime: $totalTime, totalKilometers: $totalKilometers, totalMiles: $totalMiles, shapeLength: $shapeLength)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$RouteAttributesImpl &&
            (identical(other.objectId, objectId) ||
                other.objectId == objectId) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.firstStopId, firstStopId) ||
                other.firstStopId == firstStopId) &&
            (identical(other.lastStopId, lastStopId) ||
                other.lastStopId == lastStopId) &&
            (identical(other.stopCount, stopCount) ||
                other.stopCount == stopCount) &&
            (identical(other.totalTime, totalTime) ||
                other.totalTime == totalTime) &&
            (identical(other.totalKilometers, totalKilometers) ||
                other.totalKilometers == totalKilometers) &&
            (identical(other.totalMiles, totalMiles) ||
                other.totalMiles == totalMiles) &&
            (identical(other.shapeLength, shapeLength) ||
                other.shapeLength == shapeLength));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      objectId,
      name,
      firstStopId,
      lastStopId,
      stopCount,
      totalTime,
      totalKilometers,
      totalMiles,
      shapeLength);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$RouteAttributesImplCopyWith<_$RouteAttributesImpl> get copyWith =>
      __$$RouteAttributesImplCopyWithImpl<_$RouteAttributesImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$RouteAttributesImplToJson(
      this,
    );
  }
}

abstract class _RouteAttributes implements RouteAttributes {
  const factory _RouteAttributes(
          {@JsonKey(name: 'ObjectID') final int? objectId,
          @JsonKey(name: 'Name') final String? name,
          @JsonKey(name: 'FirstStopID') final int? firstStopId,
          @JsonKey(name: 'LastStopID') final int? lastStopId,
          @JsonKey(name: 'StopCount') final int? stopCount,
          @JsonKey(name: 'Total_TravelTime') final double? totalTime,
          @JsonKey(name: 'Total_Kilometers') final double? totalKilometers,
          @JsonKey(name: 'Total_Miles') final double? totalMiles,
          @JsonKey(name: 'Shape_Length') final double? shapeLength}) =
      _$RouteAttributesImpl;

  factory _RouteAttributes.fromJson(Map<String, dynamic> json) =
      _$RouteAttributesImpl.fromJson;

  @override
  @JsonKey(name: 'ObjectID')
  int? get objectId;
  @override
  @JsonKey(name: 'Name')
  String? get name;
  @override
  @JsonKey(name: 'FirstStopID')
  int? get firstStopId;
  @override
  @JsonKey(name: 'LastStopID')
  int? get lastStopId;
  @override
  @JsonKey(name: 'StopCount')
  int? get stopCount;
  @override
  @JsonKey(name: 'Total_TravelTime')
  double? get totalTime;
  @override
  @JsonKey(name: 'Total_Kilometers')
  double? get totalKilometers;
  @override
  @JsonKey(name: 'Total_Miles')
  double? get totalMiles;
  @override
  @JsonKey(name: 'Shape_Length')
  double? get shapeLength;
  @override
  @JsonKey(ignore: true)
  _$$RouteAttributesImplCopyWith<_$RouteAttributesImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

RouteGeometry _$RouteGeometryFromJson(Map<String, dynamic> json) {
  return _RouteGeometry.fromJson(json);
}

/// @nodoc
mixin _$RouteGeometry {
  @JsonKey(name: 'paths')
  List<List<List<double>>> get paths => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $RouteGeometryCopyWith<RouteGeometry> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $RouteGeometryCopyWith<$Res> {
  factory $RouteGeometryCopyWith(
          RouteGeometry value, $Res Function(RouteGeometry) then) =
      _$RouteGeometryCopyWithImpl<$Res, RouteGeometry>;
  @useResult
  $Res call({@JsonKey(name: 'paths') List<List<List<double>>> paths});
}

/// @nodoc
class _$RouteGeometryCopyWithImpl<$Res, $Val extends RouteGeometry>
    implements $RouteGeometryCopyWith<$Res> {
  _$RouteGeometryCopyWithImpl(this._value, this._then);

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
abstract class _$$RouteGeometryImplCopyWith<$Res>
    implements $RouteGeometryCopyWith<$Res> {
  factory _$$RouteGeometryImplCopyWith(
          _$RouteGeometryImpl value, $Res Function(_$RouteGeometryImpl) then) =
      __$$RouteGeometryImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({@JsonKey(name: 'paths') List<List<List<double>>> paths});
}

/// @nodoc
class __$$RouteGeometryImplCopyWithImpl<$Res>
    extends _$RouteGeometryCopyWithImpl<$Res, _$RouteGeometryImpl>
    implements _$$RouteGeometryImplCopyWith<$Res> {
  __$$RouteGeometryImplCopyWithImpl(
      _$RouteGeometryImpl _value, $Res Function(_$RouteGeometryImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? paths = null,
  }) {
    return _then(_$RouteGeometryImpl(
      paths: null == paths
          ? _value._paths
          : paths // ignore: cast_nullable_to_non_nullable
              as List<List<List<double>>>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$RouteGeometryImpl implements _RouteGeometry {
  const _$RouteGeometryImpl(
      {@JsonKey(name: 'paths') required final List<List<List<double>>> paths})
      : _paths = paths;

  factory _$RouteGeometryImpl.fromJson(Map<String, dynamic> json) =>
      _$$RouteGeometryImplFromJson(json);

  final List<List<List<double>>> _paths;
  @override
  @JsonKey(name: 'paths')
  List<List<List<double>>> get paths {
    if (_paths is EqualUnmodifiableListView) return _paths;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_paths);
  }

  @override
  String toString() {
    return 'RouteGeometry(paths: $paths)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$RouteGeometryImpl &&
            const DeepCollectionEquality().equals(other._paths, _paths));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(_paths));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$RouteGeometryImplCopyWith<_$RouteGeometryImpl> get copyWith =>
      __$$RouteGeometryImplCopyWithImpl<_$RouteGeometryImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$RouteGeometryImplToJson(
      this,
    );
  }
}

abstract class _RouteGeometry implements RouteGeometry {
  const factory _RouteGeometry(
      {@JsonKey(name: 'paths')
      required final List<List<List<double>>> paths}) = _$RouteGeometryImpl;

  factory _RouteGeometry.fromJson(Map<String, dynamic> json) =
      _$RouteGeometryImpl.fromJson;

  @override
  @JsonKey(name: 'paths')
  List<List<List<double>>> get paths;
  @override
  @JsonKey(ignore: true)
  _$$RouteGeometryImplCopyWith<_$RouteGeometryImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
