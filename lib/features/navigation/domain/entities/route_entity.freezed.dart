// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'route_entity.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$RouteResult {
  String get routeName => throw _privateConstructorUsedError;
  double get totalDistanceMeters => throw _privateConstructorUsedError;
  double get totalTimeMinutes => throw _privateConstructorUsedError;
  List<RoutePoint> get polylinePoints =>
      throw _privateConstructorUsedError; // Để vẽ đường Line màu xanh trên map
  List<RouteDirection> get directions =>
      throw _privateConstructorUsedError; // Danh sách từng bước chỉ đường
  RouteBoundingBox? get boundingBox => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $RouteResultCopyWith<RouteResult> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $RouteResultCopyWith<$Res> {
  factory $RouteResultCopyWith(
          RouteResult value, $Res Function(RouteResult) then) =
      _$RouteResultCopyWithImpl<$Res, RouteResult>;
  @useResult
  $Res call(
      {String routeName,
      double totalDistanceMeters,
      double totalTimeMinutes,
      List<RoutePoint> polylinePoints,
      List<RouteDirection> directions,
      RouteBoundingBox? boundingBox});

  $RouteBoundingBoxCopyWith<$Res>? get boundingBox;
}

/// @nodoc
class _$RouteResultCopyWithImpl<$Res, $Val extends RouteResult>
    implements $RouteResultCopyWith<$Res> {
  _$RouteResultCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? routeName = null,
    Object? totalDistanceMeters = null,
    Object? totalTimeMinutes = null,
    Object? polylinePoints = null,
    Object? directions = null,
    Object? boundingBox = freezed,
  }) {
    return _then(_value.copyWith(
      routeName: null == routeName
          ? _value.routeName
          : routeName // ignore: cast_nullable_to_non_nullable
              as String,
      totalDistanceMeters: null == totalDistanceMeters
          ? _value.totalDistanceMeters
          : totalDistanceMeters // ignore: cast_nullable_to_non_nullable
              as double,
      totalTimeMinutes: null == totalTimeMinutes
          ? _value.totalTimeMinutes
          : totalTimeMinutes // ignore: cast_nullable_to_non_nullable
              as double,
      polylinePoints: null == polylinePoints
          ? _value.polylinePoints
          : polylinePoints // ignore: cast_nullable_to_non_nullable
              as List<RoutePoint>,
      directions: null == directions
          ? _value.directions
          : directions // ignore: cast_nullable_to_non_nullable
              as List<RouteDirection>,
      boundingBox: freezed == boundingBox
          ? _value.boundingBox
          : boundingBox // ignore: cast_nullable_to_non_nullable
              as RouteBoundingBox?,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $RouteBoundingBoxCopyWith<$Res>? get boundingBox {
    if (_value.boundingBox == null) {
      return null;
    }

    return $RouteBoundingBoxCopyWith<$Res>(_value.boundingBox!, (value) {
      return _then(_value.copyWith(boundingBox: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$RouteResultImplCopyWith<$Res>
    implements $RouteResultCopyWith<$Res> {
  factory _$$RouteResultImplCopyWith(
          _$RouteResultImpl value, $Res Function(_$RouteResultImpl) then) =
      __$$RouteResultImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String routeName,
      double totalDistanceMeters,
      double totalTimeMinutes,
      List<RoutePoint> polylinePoints,
      List<RouteDirection> directions,
      RouteBoundingBox? boundingBox});

  @override
  $RouteBoundingBoxCopyWith<$Res>? get boundingBox;
}

/// @nodoc
class __$$RouteResultImplCopyWithImpl<$Res>
    extends _$RouteResultCopyWithImpl<$Res, _$RouteResultImpl>
    implements _$$RouteResultImplCopyWith<$Res> {
  __$$RouteResultImplCopyWithImpl(
      _$RouteResultImpl _value, $Res Function(_$RouteResultImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? routeName = null,
    Object? totalDistanceMeters = null,
    Object? totalTimeMinutes = null,
    Object? polylinePoints = null,
    Object? directions = null,
    Object? boundingBox = freezed,
  }) {
    return _then(_$RouteResultImpl(
      routeName: null == routeName
          ? _value.routeName
          : routeName // ignore: cast_nullable_to_non_nullable
              as String,
      totalDistanceMeters: null == totalDistanceMeters
          ? _value.totalDistanceMeters
          : totalDistanceMeters // ignore: cast_nullable_to_non_nullable
              as double,
      totalTimeMinutes: null == totalTimeMinutes
          ? _value.totalTimeMinutes
          : totalTimeMinutes // ignore: cast_nullable_to_non_nullable
              as double,
      polylinePoints: null == polylinePoints
          ? _value._polylinePoints
          : polylinePoints // ignore: cast_nullable_to_non_nullable
              as List<RoutePoint>,
      directions: null == directions
          ? _value._directions
          : directions // ignore: cast_nullable_to_non_nullable
              as List<RouteDirection>,
      boundingBox: freezed == boundingBox
          ? _value.boundingBox
          : boundingBox // ignore: cast_nullable_to_non_nullable
              as RouteBoundingBox?,
    ));
  }
}

/// @nodoc

class _$RouteResultImpl extends _RouteResult {
  const _$RouteResultImpl(
      {required this.routeName,
      required this.totalDistanceMeters,
      required this.totalTimeMinutes,
      required final List<RoutePoint> polylinePoints,
      required final List<RouteDirection> directions,
      this.boundingBox})
      : _polylinePoints = polylinePoints,
        _directions = directions,
        super._();

  @override
  final String routeName;
  @override
  final double totalDistanceMeters;
  @override
  final double totalTimeMinutes;
  final List<RoutePoint> _polylinePoints;
  @override
  List<RoutePoint> get polylinePoints {
    if (_polylinePoints is EqualUnmodifiableListView) return _polylinePoints;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_polylinePoints);
  }

// Để vẽ đường Line màu xanh trên map
  final List<RouteDirection> _directions;
// Để vẽ đường Line màu xanh trên map
  @override
  List<RouteDirection> get directions {
    if (_directions is EqualUnmodifiableListView) return _directions;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_directions);
  }

// Danh sách từng bước chỉ đường
  @override
  final RouteBoundingBox? boundingBox;

  @override
  String toString() {
    return 'RouteResult(routeName: $routeName, totalDistanceMeters: $totalDistanceMeters, totalTimeMinutes: $totalTimeMinutes, polylinePoints: $polylinePoints, directions: $directions, boundingBox: $boundingBox)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$RouteResultImpl &&
            (identical(other.routeName, routeName) ||
                other.routeName == routeName) &&
            (identical(other.totalDistanceMeters, totalDistanceMeters) ||
                other.totalDistanceMeters == totalDistanceMeters) &&
            (identical(other.totalTimeMinutes, totalTimeMinutes) ||
                other.totalTimeMinutes == totalTimeMinutes) &&
            const DeepCollectionEquality()
                .equals(other._polylinePoints, _polylinePoints) &&
            const DeepCollectionEquality()
                .equals(other._directions, _directions) &&
            (identical(other.boundingBox, boundingBox) ||
                other.boundingBox == boundingBox));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      routeName,
      totalDistanceMeters,
      totalTimeMinutes,
      const DeepCollectionEquality().hash(_polylinePoints),
      const DeepCollectionEquality().hash(_directions),
      boundingBox);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$RouteResultImplCopyWith<_$RouteResultImpl> get copyWith =>
      __$$RouteResultImplCopyWithImpl<_$RouteResultImpl>(this, _$identity);
}

abstract class _RouteResult extends RouteResult {
  const factory _RouteResult(
      {required final String routeName,
      required final double totalDistanceMeters,
      required final double totalTimeMinutes,
      required final List<RoutePoint> polylinePoints,
      required final List<RouteDirection> directions,
      final RouteBoundingBox? boundingBox}) = _$RouteResultImpl;
  const _RouteResult._() : super._();

  @override
  String get routeName;
  @override
  double get totalDistanceMeters;
  @override
  double get totalTimeMinutes;
  @override
  List<RoutePoint> get polylinePoints;
  @override // Để vẽ đường Line màu xanh trên map
  List<RouteDirection> get directions;
  @override // Danh sách từng bước chỉ đường
  RouteBoundingBox? get boundingBox;
  @override
  @JsonKey(ignore: true)
  _$$RouteResultImplCopyWith<_$RouteResultImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$RoutePoint {
  double get lat => throw _privateConstructorUsedError;
  double get lng => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $RoutePointCopyWith<RoutePoint> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $RoutePointCopyWith<$Res> {
  factory $RoutePointCopyWith(
          RoutePoint value, $Res Function(RoutePoint) then) =
      _$RoutePointCopyWithImpl<$Res, RoutePoint>;
  @useResult
  $Res call({double lat, double lng});
}

/// @nodoc
class _$RoutePointCopyWithImpl<$Res, $Val extends RoutePoint>
    implements $RoutePointCopyWith<$Res> {
  _$RoutePointCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? lat = null,
    Object? lng = null,
  }) {
    return _then(_value.copyWith(
      lat: null == lat
          ? _value.lat
          : lat // ignore: cast_nullable_to_non_nullable
              as double,
      lng: null == lng
          ? _value.lng
          : lng // ignore: cast_nullable_to_non_nullable
              as double,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$RoutePointImplCopyWith<$Res>
    implements $RoutePointCopyWith<$Res> {
  factory _$$RoutePointImplCopyWith(
          _$RoutePointImpl value, $Res Function(_$RoutePointImpl) then) =
      __$$RoutePointImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({double lat, double lng});
}

/// @nodoc
class __$$RoutePointImplCopyWithImpl<$Res>
    extends _$RoutePointCopyWithImpl<$Res, _$RoutePointImpl>
    implements _$$RoutePointImplCopyWith<$Res> {
  __$$RoutePointImplCopyWithImpl(
      _$RoutePointImpl _value, $Res Function(_$RoutePointImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? lat = null,
    Object? lng = null,
  }) {
    return _then(_$RoutePointImpl(
      lat: null == lat
          ? _value.lat
          : lat // ignore: cast_nullable_to_non_nullable
              as double,
      lng: null == lng
          ? _value.lng
          : lng // ignore: cast_nullable_to_non_nullable
              as double,
    ));
  }
}

/// @nodoc

class _$RoutePointImpl implements _RoutePoint {
  const _$RoutePointImpl({required this.lat, required this.lng});

  @override
  final double lat;
  @override
  final double lng;

  @override
  String toString() {
    return 'RoutePoint(lat: $lat, lng: $lng)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$RoutePointImpl &&
            (identical(other.lat, lat) || other.lat == lat) &&
            (identical(other.lng, lng) || other.lng == lng));
  }

  @override
  int get hashCode => Object.hash(runtimeType, lat, lng);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$RoutePointImplCopyWith<_$RoutePointImpl> get copyWith =>
      __$$RoutePointImplCopyWithImpl<_$RoutePointImpl>(this, _$identity);
}

abstract class _RoutePoint implements RoutePoint {
  const factory _RoutePoint(
      {required final double lat,
      required final double lng}) = _$RoutePointImpl;

  @override
  double get lat;
  @override
  double get lng;
  @override
  @JsonKey(ignore: true)
  _$$RoutePointImplCopyWith<_$RoutePointImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$RouteBoundingBox {
  double get xMin => throw _privateConstructorUsedError;
  double get yMin => throw _privateConstructorUsedError;
  double get xMax => throw _privateConstructorUsedError;
  double get yMax => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $RouteBoundingBoxCopyWith<RouteBoundingBox> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $RouteBoundingBoxCopyWith<$Res> {
  factory $RouteBoundingBoxCopyWith(
          RouteBoundingBox value, $Res Function(RouteBoundingBox) then) =
      _$RouteBoundingBoxCopyWithImpl<$Res, RouteBoundingBox>;
  @useResult
  $Res call({double xMin, double yMin, double xMax, double yMax});
}

/// @nodoc
class _$RouteBoundingBoxCopyWithImpl<$Res, $Val extends RouteBoundingBox>
    implements $RouteBoundingBoxCopyWith<$Res> {
  _$RouteBoundingBoxCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? xMin = null,
    Object? yMin = null,
    Object? xMax = null,
    Object? yMax = null,
  }) {
    return _then(_value.copyWith(
      xMin: null == xMin
          ? _value.xMin
          : xMin // ignore: cast_nullable_to_non_nullable
              as double,
      yMin: null == yMin
          ? _value.yMin
          : yMin // ignore: cast_nullable_to_non_nullable
              as double,
      xMax: null == xMax
          ? _value.xMax
          : xMax // ignore: cast_nullable_to_non_nullable
              as double,
      yMax: null == yMax
          ? _value.yMax
          : yMax // ignore: cast_nullable_to_non_nullable
              as double,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$RouteBoundingBoxImplCopyWith<$Res>
    implements $RouteBoundingBoxCopyWith<$Res> {
  factory _$$RouteBoundingBoxImplCopyWith(_$RouteBoundingBoxImpl value,
          $Res Function(_$RouteBoundingBoxImpl) then) =
      __$$RouteBoundingBoxImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({double xMin, double yMin, double xMax, double yMax});
}

/// @nodoc
class __$$RouteBoundingBoxImplCopyWithImpl<$Res>
    extends _$RouteBoundingBoxCopyWithImpl<$Res, _$RouteBoundingBoxImpl>
    implements _$$RouteBoundingBoxImplCopyWith<$Res> {
  __$$RouteBoundingBoxImplCopyWithImpl(_$RouteBoundingBoxImpl _value,
      $Res Function(_$RouteBoundingBoxImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? xMin = null,
    Object? yMin = null,
    Object? xMax = null,
    Object? yMax = null,
  }) {
    return _then(_$RouteBoundingBoxImpl(
      xMin: null == xMin
          ? _value.xMin
          : xMin // ignore: cast_nullable_to_non_nullable
              as double,
      yMin: null == yMin
          ? _value.yMin
          : yMin // ignore: cast_nullable_to_non_nullable
              as double,
      xMax: null == xMax
          ? _value.xMax
          : xMax // ignore: cast_nullable_to_non_nullable
              as double,
      yMax: null == yMax
          ? _value.yMax
          : yMax // ignore: cast_nullable_to_non_nullable
              as double,
    ));
  }
}

/// @nodoc

class _$RouteBoundingBoxImpl implements _RouteBoundingBox {
  const _$RouteBoundingBoxImpl(
      {required this.xMin,
      required this.yMin,
      required this.xMax,
      required this.yMax});

  @override
  final double xMin;
  @override
  final double yMin;
  @override
  final double xMax;
  @override
  final double yMax;

  @override
  String toString() {
    return 'RouteBoundingBox(xMin: $xMin, yMin: $yMin, xMax: $xMax, yMax: $yMax)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$RouteBoundingBoxImpl &&
            (identical(other.xMin, xMin) || other.xMin == xMin) &&
            (identical(other.yMin, yMin) || other.yMin == yMin) &&
            (identical(other.xMax, xMax) || other.xMax == xMax) &&
            (identical(other.yMax, yMax) || other.yMax == yMax));
  }

  @override
  int get hashCode => Object.hash(runtimeType, xMin, yMin, xMax, yMax);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$RouteBoundingBoxImplCopyWith<_$RouteBoundingBoxImpl> get copyWith =>
      __$$RouteBoundingBoxImplCopyWithImpl<_$RouteBoundingBoxImpl>(
          this, _$identity);
}

abstract class _RouteBoundingBox implements RouteBoundingBox {
  const factory _RouteBoundingBox(
      {required final double xMin,
      required final double yMin,
      required final double xMax,
      required final double yMax}) = _$RouteBoundingBoxImpl;

  @override
  double get xMin;
  @override
  double get yMin;
  @override
  double get xMax;
  @override
  double get yMax;
  @override
  @JsonKey(ignore: true)
  _$$RouteBoundingBoxImplCopyWith<_$RouteBoundingBoxImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$RouteDirection {
  String get instruction => throw _privateConstructorUsedError;
  double get distanceMeters => throw _privateConstructorUsedError;
  double get timeMinutes => throw _privateConstructorUsedError;
  ManeuverType get maneuverType => throw _privateConstructorUsedError;
  String? get streetName => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $RouteDirectionCopyWith<RouteDirection> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $RouteDirectionCopyWith<$Res> {
  factory $RouteDirectionCopyWith(
          RouteDirection value, $Res Function(RouteDirection) then) =
      _$RouteDirectionCopyWithImpl<$Res, RouteDirection>;
  @useResult
  $Res call(
      {String instruction,
      double distanceMeters,
      double timeMinutes,
      ManeuverType maneuverType,
      String? streetName});
}

/// @nodoc
class _$RouteDirectionCopyWithImpl<$Res, $Val extends RouteDirection>
    implements $RouteDirectionCopyWith<$Res> {
  _$RouteDirectionCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? instruction = null,
    Object? distanceMeters = null,
    Object? timeMinutes = null,
    Object? maneuverType = null,
    Object? streetName = freezed,
  }) {
    return _then(_value.copyWith(
      instruction: null == instruction
          ? _value.instruction
          : instruction // ignore: cast_nullable_to_non_nullable
              as String,
      distanceMeters: null == distanceMeters
          ? _value.distanceMeters
          : distanceMeters // ignore: cast_nullable_to_non_nullable
              as double,
      timeMinutes: null == timeMinutes
          ? _value.timeMinutes
          : timeMinutes // ignore: cast_nullable_to_non_nullable
              as double,
      maneuverType: null == maneuverType
          ? _value.maneuverType
          : maneuverType // ignore: cast_nullable_to_non_nullable
              as ManeuverType,
      streetName: freezed == streetName
          ? _value.streetName
          : streetName // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$RouteDirectionImplCopyWith<$Res>
    implements $RouteDirectionCopyWith<$Res> {
  factory _$$RouteDirectionImplCopyWith(_$RouteDirectionImpl value,
          $Res Function(_$RouteDirectionImpl) then) =
      __$$RouteDirectionImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String instruction,
      double distanceMeters,
      double timeMinutes,
      ManeuverType maneuverType,
      String? streetName});
}

/// @nodoc
class __$$RouteDirectionImplCopyWithImpl<$Res>
    extends _$RouteDirectionCopyWithImpl<$Res, _$RouteDirectionImpl>
    implements _$$RouteDirectionImplCopyWith<$Res> {
  __$$RouteDirectionImplCopyWithImpl(
      _$RouteDirectionImpl _value, $Res Function(_$RouteDirectionImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? instruction = null,
    Object? distanceMeters = null,
    Object? timeMinutes = null,
    Object? maneuverType = null,
    Object? streetName = freezed,
  }) {
    return _then(_$RouteDirectionImpl(
      instruction: null == instruction
          ? _value.instruction
          : instruction // ignore: cast_nullable_to_non_nullable
              as String,
      distanceMeters: null == distanceMeters
          ? _value.distanceMeters
          : distanceMeters // ignore: cast_nullable_to_non_nullable
              as double,
      timeMinutes: null == timeMinutes
          ? _value.timeMinutes
          : timeMinutes // ignore: cast_nullable_to_non_nullable
              as double,
      maneuverType: null == maneuverType
          ? _value.maneuverType
          : maneuverType // ignore: cast_nullable_to_non_nullable
              as ManeuverType,
      streetName: freezed == streetName
          ? _value.streetName
          : streetName // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc

class _$RouteDirectionImpl extends _RouteDirection {
  const _$RouteDirectionImpl(
      {required this.instruction,
      required this.distanceMeters,
      required this.timeMinutes,
      required this.maneuverType,
      this.streetName})
      : super._();

  @override
  final String instruction;
  @override
  final double distanceMeters;
  @override
  final double timeMinutes;
  @override
  final ManeuverType maneuverType;
  @override
  final String? streetName;

  @override
  String toString() {
    return 'RouteDirection(instruction: $instruction, distanceMeters: $distanceMeters, timeMinutes: $timeMinutes, maneuverType: $maneuverType, streetName: $streetName)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$RouteDirectionImpl &&
            (identical(other.instruction, instruction) ||
                other.instruction == instruction) &&
            (identical(other.distanceMeters, distanceMeters) ||
                other.distanceMeters == distanceMeters) &&
            (identical(other.timeMinutes, timeMinutes) ||
                other.timeMinutes == timeMinutes) &&
            (identical(other.maneuverType, maneuverType) ||
                other.maneuverType == maneuverType) &&
            (identical(other.streetName, streetName) ||
                other.streetName == streetName));
  }

  @override
  int get hashCode => Object.hash(runtimeType, instruction, distanceMeters,
      timeMinutes, maneuverType, streetName);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$RouteDirectionImplCopyWith<_$RouteDirectionImpl> get copyWith =>
      __$$RouteDirectionImplCopyWithImpl<_$RouteDirectionImpl>(
          this, _$identity);
}

abstract class _RouteDirection extends RouteDirection {
  const factory _RouteDirection(
      {required final String instruction,
      required final double distanceMeters,
      required final double timeMinutes,
      required final ManeuverType maneuverType,
      final String? streetName}) = _$RouteDirectionImpl;
  const _RouteDirection._() : super._();

  @override
  String get instruction;
  @override
  double get distanceMeters;
  @override
  double get timeMinutes;
  @override
  ManeuverType get maneuverType;
  @override
  String? get streetName;
  @override
  @JsonKey(ignore: true)
  _$$RouteDirectionImplCopyWith<_$RouteDirectionImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$AlternativeRoutesResult {
  RouteResult get recommendedRoute =>
      throw _privateConstructorUsedError; // Route được đề xuất (thường là balanced)
  List<RouteAlternative> get alternatives => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $AlternativeRoutesResultCopyWith<AlternativeRoutesResult> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AlternativeRoutesResultCopyWith<$Res> {
  factory $AlternativeRoutesResultCopyWith(AlternativeRoutesResult value,
          $Res Function(AlternativeRoutesResult) then) =
      _$AlternativeRoutesResultCopyWithImpl<$Res, AlternativeRoutesResult>;
  @useResult
  $Res call(
      {RouteResult recommendedRoute, List<RouteAlternative> alternatives});

  $RouteResultCopyWith<$Res> get recommendedRoute;
}

/// @nodoc
class _$AlternativeRoutesResultCopyWithImpl<$Res,
        $Val extends AlternativeRoutesResult>
    implements $AlternativeRoutesResultCopyWith<$Res> {
  _$AlternativeRoutesResultCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? recommendedRoute = null,
    Object? alternatives = null,
  }) {
    return _then(_value.copyWith(
      recommendedRoute: null == recommendedRoute
          ? _value.recommendedRoute
          : recommendedRoute // ignore: cast_nullable_to_non_nullable
              as RouteResult,
      alternatives: null == alternatives
          ? _value.alternatives
          : alternatives // ignore: cast_nullable_to_non_nullable
              as List<RouteAlternative>,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $RouteResultCopyWith<$Res> get recommendedRoute {
    return $RouteResultCopyWith<$Res>(_value.recommendedRoute, (value) {
      return _then(_value.copyWith(recommendedRoute: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$AlternativeRoutesResultImplCopyWith<$Res>
    implements $AlternativeRoutesResultCopyWith<$Res> {
  factory _$$AlternativeRoutesResultImplCopyWith(
          _$AlternativeRoutesResultImpl value,
          $Res Function(_$AlternativeRoutesResultImpl) then) =
      __$$AlternativeRoutesResultImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {RouteResult recommendedRoute, List<RouteAlternative> alternatives});

  @override
  $RouteResultCopyWith<$Res> get recommendedRoute;
}

/// @nodoc
class __$$AlternativeRoutesResultImplCopyWithImpl<$Res>
    extends _$AlternativeRoutesResultCopyWithImpl<$Res,
        _$AlternativeRoutesResultImpl>
    implements _$$AlternativeRoutesResultImplCopyWith<$Res> {
  __$$AlternativeRoutesResultImplCopyWithImpl(
      _$AlternativeRoutesResultImpl _value,
      $Res Function(_$AlternativeRoutesResultImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? recommendedRoute = null,
    Object? alternatives = null,
  }) {
    return _then(_$AlternativeRoutesResultImpl(
      recommendedRoute: null == recommendedRoute
          ? _value.recommendedRoute
          : recommendedRoute // ignore: cast_nullable_to_non_nullable
              as RouteResult,
      alternatives: null == alternatives
          ? _value._alternatives
          : alternatives // ignore: cast_nullable_to_non_nullable
              as List<RouteAlternative>,
    ));
  }
}

/// @nodoc

class _$AlternativeRoutesResultImpl extends _AlternativeRoutesResult {
  const _$AlternativeRoutesResultImpl(
      {required this.recommendedRoute,
      required final List<RouteAlternative> alternatives})
      : _alternatives = alternatives,
        super._();

  @override
  final RouteResult recommendedRoute;
// Route được đề xuất (thường là balanced)
  final List<RouteAlternative> _alternatives;
// Route được đề xuất (thường là balanced)
  @override
  List<RouteAlternative> get alternatives {
    if (_alternatives is EqualUnmodifiableListView) return _alternatives;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_alternatives);
  }

  @override
  String toString() {
    return 'AlternativeRoutesResult(recommendedRoute: $recommendedRoute, alternatives: $alternatives)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AlternativeRoutesResultImpl &&
            (identical(other.recommendedRoute, recommendedRoute) ||
                other.recommendedRoute == recommendedRoute) &&
            const DeepCollectionEquality()
                .equals(other._alternatives, _alternatives));
  }

  @override
  int get hashCode => Object.hash(runtimeType, recommendedRoute,
      const DeepCollectionEquality().hash(_alternatives));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$AlternativeRoutesResultImplCopyWith<_$AlternativeRoutesResultImpl>
      get copyWith => __$$AlternativeRoutesResultImplCopyWithImpl<
          _$AlternativeRoutesResultImpl>(this, _$identity);
}

abstract class _AlternativeRoutesResult extends AlternativeRoutesResult {
  const factory _AlternativeRoutesResult(
          {required final RouteResult recommendedRoute,
          required final List<RouteAlternative> alternatives}) =
      _$AlternativeRoutesResultImpl;
  const _AlternativeRoutesResult._() : super._();

  @override
  RouteResult get recommendedRoute;
  @override // Route được đề xuất (thường là balanced)
  List<RouteAlternative> get alternatives;
  @override
  @JsonKey(ignore: true)
  _$$AlternativeRoutesResultImplCopyWith<_$AlternativeRoutesResultImpl>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$RouteAlternative {
  RouteStrategy get strategy => throw _privateConstructorUsedError;
  RouteResult get route => throw _privateConstructorUsedError;
  String? get comparisonNote => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $RouteAlternativeCopyWith<RouteAlternative> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $RouteAlternativeCopyWith<$Res> {
  factory $RouteAlternativeCopyWith(
          RouteAlternative value, $Res Function(RouteAlternative) then) =
      _$RouteAlternativeCopyWithImpl<$Res, RouteAlternative>;
  @useResult
  $Res call(
      {RouteStrategy strategy, RouteResult route, String? comparisonNote});

  $RouteResultCopyWith<$Res> get route;
}

/// @nodoc
class _$RouteAlternativeCopyWithImpl<$Res, $Val extends RouteAlternative>
    implements $RouteAlternativeCopyWith<$Res> {
  _$RouteAlternativeCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? strategy = null,
    Object? route = null,
    Object? comparisonNote = freezed,
  }) {
    return _then(_value.copyWith(
      strategy: null == strategy
          ? _value.strategy
          : strategy // ignore: cast_nullable_to_non_nullable
              as RouteStrategy,
      route: null == route
          ? _value.route
          : route // ignore: cast_nullable_to_non_nullable
              as RouteResult,
      comparisonNote: freezed == comparisonNote
          ? _value.comparisonNote
          : comparisonNote // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $RouteResultCopyWith<$Res> get route {
    return $RouteResultCopyWith<$Res>(_value.route, (value) {
      return _then(_value.copyWith(route: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$RouteAlternativeImplCopyWith<$Res>
    implements $RouteAlternativeCopyWith<$Res> {
  factory _$$RouteAlternativeImplCopyWith(_$RouteAlternativeImpl value,
          $Res Function(_$RouteAlternativeImpl) then) =
      __$$RouteAlternativeImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {RouteStrategy strategy, RouteResult route, String? comparisonNote});

  @override
  $RouteResultCopyWith<$Res> get route;
}

/// @nodoc
class __$$RouteAlternativeImplCopyWithImpl<$Res>
    extends _$RouteAlternativeCopyWithImpl<$Res, _$RouteAlternativeImpl>
    implements _$$RouteAlternativeImplCopyWith<$Res> {
  __$$RouteAlternativeImplCopyWithImpl(_$RouteAlternativeImpl _value,
      $Res Function(_$RouteAlternativeImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? strategy = null,
    Object? route = null,
    Object? comparisonNote = freezed,
  }) {
    return _then(_$RouteAlternativeImpl(
      strategy: null == strategy
          ? _value.strategy
          : strategy // ignore: cast_nullable_to_non_nullable
              as RouteStrategy,
      route: null == route
          ? _value.route
          : route // ignore: cast_nullable_to_non_nullable
              as RouteResult,
      comparisonNote: freezed == comparisonNote
          ? _value.comparisonNote
          : comparisonNote // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc

class _$RouteAlternativeImpl extends _RouteAlternative {
  const _$RouteAlternativeImpl(
      {required this.strategy, required this.route, this.comparisonNote})
      : super._();

  @override
  final RouteStrategy strategy;
  @override
  final RouteResult route;
  @override
  final String? comparisonNote;

  @override
  String toString() {
    return 'RouteAlternative(strategy: $strategy, route: $route, comparisonNote: $comparisonNote)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$RouteAlternativeImpl &&
            (identical(other.strategy, strategy) ||
                other.strategy == strategy) &&
            (identical(other.route, route) || other.route == route) &&
            (identical(other.comparisonNote, comparisonNote) ||
                other.comparisonNote == comparisonNote));
  }

  @override
  int get hashCode => Object.hash(runtimeType, strategy, route, comparisonNote);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$RouteAlternativeImplCopyWith<_$RouteAlternativeImpl> get copyWith =>
      __$$RouteAlternativeImplCopyWithImpl<_$RouteAlternativeImpl>(
          this, _$identity);
}

abstract class _RouteAlternative extends RouteAlternative {
  const factory _RouteAlternative(
      {required final RouteStrategy strategy,
      required final RouteResult route,
      final String? comparisonNote}) = _$RouteAlternativeImpl;
  const _RouteAlternative._() : super._();

  @override
  RouteStrategy get strategy;
  @override
  RouteResult get route;
  @override
  String? get comparisonNote;
  @override
  @JsonKey(ignore: true)
  _$$RouteAlternativeImplCopyWith<_$RouteAlternativeImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
