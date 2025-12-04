// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'route_info.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$RouteInfo {
  List<ArcGISPoint> get geometry =>
      throw _privateConstructorUsedError; // danh sách các điểm trên tuyến đường
  double get totalLengthKm => throw _privateConstructorUsedError;
  double get travelTimeMinutes => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $RouteInfoCopyWith<RouteInfo> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $RouteInfoCopyWith<$Res> {
  factory $RouteInfoCopyWith(RouteInfo value, $Res Function(RouteInfo) then) =
      _$RouteInfoCopyWithImpl<$Res, RouteInfo>;
  @useResult
  $Res call(
      {List<ArcGISPoint> geometry,
      double totalLengthKm,
      double travelTimeMinutes});
}

/// @nodoc
class _$RouteInfoCopyWithImpl<$Res, $Val extends RouteInfo>
    implements $RouteInfoCopyWith<$Res> {
  _$RouteInfoCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? geometry = null,
    Object? totalLengthKm = null,
    Object? travelTimeMinutes = null,
  }) {
    return _then(_value.copyWith(
      geometry: null == geometry
          ? _value.geometry
          : geometry // ignore: cast_nullable_to_non_nullable
              as List<ArcGISPoint>,
      totalLengthKm: null == totalLengthKm
          ? _value.totalLengthKm
          : totalLengthKm // ignore: cast_nullable_to_non_nullable
              as double,
      travelTimeMinutes: null == travelTimeMinutes
          ? _value.travelTimeMinutes
          : travelTimeMinutes // ignore: cast_nullable_to_non_nullable
              as double,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$RouteInfoImplCopyWith<$Res>
    implements $RouteInfoCopyWith<$Res> {
  factory _$$RouteInfoImplCopyWith(
          _$RouteInfoImpl value, $Res Function(_$RouteInfoImpl) then) =
      __$$RouteInfoImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {List<ArcGISPoint> geometry,
      double totalLengthKm,
      double travelTimeMinutes});
}

/// @nodoc
class __$$RouteInfoImplCopyWithImpl<$Res>
    extends _$RouteInfoCopyWithImpl<$Res, _$RouteInfoImpl>
    implements _$$RouteInfoImplCopyWith<$Res> {
  __$$RouteInfoImplCopyWithImpl(
      _$RouteInfoImpl _value, $Res Function(_$RouteInfoImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? geometry = null,
    Object? totalLengthKm = null,
    Object? travelTimeMinutes = null,
  }) {
    return _then(_$RouteInfoImpl(
      geometry: null == geometry
          ? _value._geometry
          : geometry // ignore: cast_nullable_to_non_nullable
              as List<ArcGISPoint>,
      totalLengthKm: null == totalLengthKm
          ? _value.totalLengthKm
          : totalLengthKm // ignore: cast_nullable_to_non_nullable
              as double,
      travelTimeMinutes: null == travelTimeMinutes
          ? _value.travelTimeMinutes
          : travelTimeMinutes // ignore: cast_nullable_to_non_nullable
              as double,
    ));
  }
}

/// @nodoc

class _$RouteInfoImpl implements _RouteInfo {
  const _$RouteInfoImpl(
      {required final List<ArcGISPoint> geometry,
      required this.totalLengthKm,
      required this.travelTimeMinutes})
      : _geometry = geometry;

  final List<ArcGISPoint> _geometry;
  @override
  List<ArcGISPoint> get geometry {
    if (_geometry is EqualUnmodifiableListView) return _geometry;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_geometry);
  }

// danh sách các điểm trên tuyến đường
  @override
  final double totalLengthKm;
  @override
  final double travelTimeMinutes;

  @override
  String toString() {
    return 'RouteInfo(geometry: $geometry, totalLengthKm: $totalLengthKm, travelTimeMinutes: $travelTimeMinutes)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$RouteInfoImpl &&
            const DeepCollectionEquality().equals(other._geometry, _geometry) &&
            (identical(other.totalLengthKm, totalLengthKm) ||
                other.totalLengthKm == totalLengthKm) &&
            (identical(other.travelTimeMinutes, travelTimeMinutes) ||
                other.travelTimeMinutes == travelTimeMinutes));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(_geometry),
      totalLengthKm,
      travelTimeMinutes);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$RouteInfoImplCopyWith<_$RouteInfoImpl> get copyWith =>
      __$$RouteInfoImplCopyWithImpl<_$RouteInfoImpl>(this, _$identity);
}

abstract class _RouteInfo implements RouteInfo {
  const factory _RouteInfo(
      {required final List<ArcGISPoint> geometry,
      required final double totalLengthKm,
      required final double travelTimeMinutes}) = _$RouteInfoImpl;

  @override
  List<ArcGISPoint> get geometry;
  @override // danh sách các điểm trên tuyến đường
  double get totalLengthKm;
  @override
  double get travelTimeMinutes;
  @override
  @JsonKey(ignore: true)
  _$$RouteInfoImplCopyWith<_$RouteInfoImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
