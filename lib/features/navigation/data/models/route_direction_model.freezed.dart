// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'route_direction_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

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
  @JsonKey(name: 'envelope')
  RouteEnvelope? get envelope => throw _privateConstructorUsedError;

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
      @JsonKey(name: 'totalDriveTime') double? totalDriveTime,
      @JsonKey(name: 'envelope') RouteEnvelope? envelope});

  $RouteEnvelopeCopyWith<$Res>? get envelope;
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
    Object? envelope = freezed,
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
      envelope: freezed == envelope
          ? _value.envelope
          : envelope // ignore: cast_nullable_to_non_nullable
              as RouteEnvelope?,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $RouteEnvelopeCopyWith<$Res>? get envelope {
    if (_value.envelope == null) {
      return null;
    }

    return $RouteEnvelopeCopyWith<$Res>(_value.envelope!, (value) {
      return _then(_value.copyWith(envelope: value) as $Val);
    });
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
      @JsonKey(name: 'totalDriveTime') double? totalDriveTime,
      @JsonKey(name: 'envelope') RouteEnvelope? envelope});

  @override
  $RouteEnvelopeCopyWith<$Res>? get envelope;
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
    Object? envelope = freezed,
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
      envelope: freezed == envelope
          ? _value.envelope
          : envelope // ignore: cast_nullable_to_non_nullable
              as RouteEnvelope?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$RouteDirectionSummaryImpl implements _RouteDirectionSummary {
  const _$RouteDirectionSummaryImpl(
      {@JsonKey(name: 'totalLength') this.totalLength,
      @JsonKey(name: 'totalTime') this.totalTime,
      @JsonKey(name: 'totalDriveTime') this.totalDriveTime,
      @JsonKey(name: 'envelope') this.envelope});

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
  @JsonKey(name: 'envelope')
  final RouteEnvelope? envelope;

  @override
  String toString() {
    return 'RouteDirectionSummary(totalLength: $totalLength, totalTime: $totalTime, totalDriveTime: $totalDriveTime, envelope: $envelope)';
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
                other.totalDriveTime == totalDriveTime) &&
            (identical(other.envelope, envelope) ||
                other.envelope == envelope));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType, totalLength, totalTime, totalDriveTime, envelope);

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
          @JsonKey(name: 'totalDriveTime') final double? totalDriveTime,
          @JsonKey(name: 'envelope') final RouteEnvelope? envelope}) =
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
  @JsonKey(name: 'envelope')
  RouteEnvelope? get envelope;
  @override
  @JsonKey(ignore: true)
  _$$RouteDirectionSummaryImplCopyWith<_$RouteDirectionSummaryImpl>
      get copyWith => throw _privateConstructorUsedError;
}

RouteEnvelope _$RouteEnvelopeFromJson(Map<String, dynamic> json) {
  return _RouteEnvelope.fromJson(json);
}

/// @nodoc
mixin _$RouteEnvelope {
  double? get xmin => throw _privateConstructorUsedError;
  double? get ymin => throw _privateConstructorUsedError;
  double? get xmax => throw _privateConstructorUsedError;
  double? get ymax => throw _privateConstructorUsedError;
  Map<String, dynamic>? get spatialReference =>
      throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $RouteEnvelopeCopyWith<RouteEnvelope> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $RouteEnvelopeCopyWith<$Res> {
  factory $RouteEnvelopeCopyWith(
          RouteEnvelope value, $Res Function(RouteEnvelope) then) =
      _$RouteEnvelopeCopyWithImpl<$Res, RouteEnvelope>;
  @useResult
  $Res call(
      {double? xmin,
      double? ymin,
      double? xmax,
      double? ymax,
      Map<String, dynamic>? spatialReference});
}

/// @nodoc
class _$RouteEnvelopeCopyWithImpl<$Res, $Val extends RouteEnvelope>
    implements $RouteEnvelopeCopyWith<$Res> {
  _$RouteEnvelopeCopyWithImpl(this._value, this._then);

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
    Object? spatialReference = freezed,
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
      spatialReference: freezed == spatialReference
          ? _value.spatialReference
          : spatialReference // ignore: cast_nullable_to_non_nullable
              as Map<String, dynamic>?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$RouteEnvelopeImplCopyWith<$Res>
    implements $RouteEnvelopeCopyWith<$Res> {
  factory _$$RouteEnvelopeImplCopyWith(
          _$RouteEnvelopeImpl value, $Res Function(_$RouteEnvelopeImpl) then) =
      __$$RouteEnvelopeImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {double? xmin,
      double? ymin,
      double? xmax,
      double? ymax,
      Map<String, dynamic>? spatialReference});
}

/// @nodoc
class __$$RouteEnvelopeImplCopyWithImpl<$Res>
    extends _$RouteEnvelopeCopyWithImpl<$Res, _$RouteEnvelopeImpl>
    implements _$$RouteEnvelopeImplCopyWith<$Res> {
  __$$RouteEnvelopeImplCopyWithImpl(
      _$RouteEnvelopeImpl _value, $Res Function(_$RouteEnvelopeImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? xmin = freezed,
    Object? ymin = freezed,
    Object? xmax = freezed,
    Object? ymax = freezed,
    Object? spatialReference = freezed,
  }) {
    return _then(_$RouteEnvelopeImpl(
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
      spatialReference: freezed == spatialReference
          ? _value._spatialReference
          : spatialReference // ignore: cast_nullable_to_non_nullable
              as Map<String, dynamic>?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$RouteEnvelopeImpl implements _RouteEnvelope {
  const _$RouteEnvelopeImpl(
      {this.xmin,
      this.ymin,
      this.xmax,
      this.ymax,
      final Map<String, dynamic>? spatialReference})
      : _spatialReference = spatialReference;

  factory _$RouteEnvelopeImpl.fromJson(Map<String, dynamic> json) =>
      _$$RouteEnvelopeImplFromJson(json);

  @override
  final double? xmin;
  @override
  final double? ymin;
  @override
  final double? xmax;
  @override
  final double? ymax;
  final Map<String, dynamic>? _spatialReference;
  @override
  Map<String, dynamic>? get spatialReference {
    final value = _spatialReference;
    if (value == null) return null;
    if (_spatialReference is EqualUnmodifiableMapView) return _spatialReference;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableMapView(value);
  }

  @override
  String toString() {
    return 'RouteEnvelope(xmin: $xmin, ymin: $ymin, xmax: $xmax, ymax: $ymax, spatialReference: $spatialReference)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$RouteEnvelopeImpl &&
            (identical(other.xmin, xmin) || other.xmin == xmin) &&
            (identical(other.ymin, ymin) || other.ymin == ymin) &&
            (identical(other.xmax, xmax) || other.xmax == xmax) &&
            (identical(other.ymax, ymax) || other.ymax == ymax) &&
            const DeepCollectionEquality()
                .equals(other._spatialReference, _spatialReference));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, xmin, ymin, xmax, ymax,
      const DeepCollectionEquality().hash(_spatialReference));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$RouteEnvelopeImplCopyWith<_$RouteEnvelopeImpl> get copyWith =>
      __$$RouteEnvelopeImplCopyWithImpl<_$RouteEnvelopeImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$RouteEnvelopeImplToJson(
      this,
    );
  }
}

abstract class _RouteEnvelope implements RouteEnvelope {
  const factory _RouteEnvelope(
      {final double? xmin,
      final double? ymin,
      final double? xmax,
      final double? ymax,
      final Map<String, dynamic>? spatialReference}) = _$RouteEnvelopeImpl;

  factory _RouteEnvelope.fromJson(Map<String, dynamic> json) =
      _$RouteEnvelopeImpl.fromJson;

  @override
  double? get xmin;
  @override
  double? get ymin;
  @override
  double? get xmax;
  @override
  double? get ymax;
  @override
  Map<String, dynamic>? get spatialReference;
  @override
  @JsonKey(ignore: true)
  _$$RouteEnvelopeImplCopyWith<_$RouteEnvelopeImpl> get copyWith =>
      throw _privateConstructorUsedError;
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
  @JsonKey(name: 'ETA')
  double? get eta => throw _privateConstructorUsedError; //Thời gian đến
  @JsonKey(name: 'arriveTimeUTC')
  double? get arriveTimeUTC => throw _privateConstructorUsedError;

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
      @JsonKey(name: 'maneuverType') String? maneuverType,
      @JsonKey(name: 'ETA') double? eta,
      @JsonKey(name: 'arriveTimeUTC') double? arriveTimeUTC});
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
    Object? eta = freezed,
    Object? arriveTimeUTC = freezed,
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
      eta: freezed == eta
          ? _value.eta
          : eta // ignore: cast_nullable_to_non_nullable
              as double?,
      arriveTimeUTC: freezed == arriveTimeUTC
          ? _value.arriveTimeUTC
          : arriveTimeUTC // ignore: cast_nullable_to_non_nullable
              as double?,
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
      @JsonKey(name: 'maneuverType') String? maneuverType,
      @JsonKey(name: 'ETA') double? eta,
      @JsonKey(name: 'arriveTimeUTC') double? arriveTimeUTC});
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
    Object? eta = freezed,
    Object? arriveTimeUTC = freezed,
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
      eta: freezed == eta
          ? _value.eta
          : eta // ignore: cast_nullable_to_non_nullable
              as double?,
      arriveTimeUTC: freezed == arriveTimeUTC
          ? _value.arriveTimeUTC
          : arriveTimeUTC // ignore: cast_nullable_to_non_nullable
              as double?,
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
      @JsonKey(name: 'maneuverType') this.maneuverType,
      @JsonKey(name: 'ETA') this.eta,
      @JsonKey(name: 'arriveTimeUTC') this.arriveTimeUTC});

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
  @JsonKey(name: 'ETA')
  final double? eta;
//Thời gian đến
  @override
  @JsonKey(name: 'arriveTimeUTC')
  final double? arriveTimeUTC;

  @override
  String toString() {
    return 'RouteDirectionAttributes(length: $length, time: $time, text: $text, maneuverType: $maneuverType, eta: $eta, arriveTimeUTC: $arriveTimeUTC)';
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
                other.maneuverType == maneuverType) &&
            (identical(other.eta, eta) || other.eta == eta) &&
            (identical(other.arriveTimeUTC, arriveTimeUTC) ||
                other.arriveTimeUTC == arriveTimeUTC));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType, length, time, text, maneuverType, eta, arriveTimeUTC);

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
          @JsonKey(name: 'maneuverType') final String? maneuverType,
          @JsonKey(name: 'ETA') final double? eta,
          @JsonKey(name: 'arriveTimeUTC') final double? arriveTimeUTC}) =
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
  @JsonKey(name: 'ETA')
  double? get eta;
  @override //Thời gian đến
  @JsonKey(name: 'arriveTimeUTC')
  double? get arriveTimeUTC;
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
