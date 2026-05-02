// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'cluster_item.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$ClusterItem {
  int get objectId => throw _privateConstructorUsedError;
  double get latitude => throw _privateConstructorUsedError;
  double get longitude => throw _privateConstructorUsedError;
  int get clusterId => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $ClusterItemCopyWith<ClusterItem> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ClusterItemCopyWith<$Res> {
  factory $ClusterItemCopyWith(
          ClusterItem value, $Res Function(ClusterItem) then) =
      _$ClusterItemCopyWithImpl<$Res, ClusterItem>;
  @useResult
  $Res call({int objectId, double latitude, double longitude, int clusterId});
}

/// @nodoc
class _$ClusterItemCopyWithImpl<$Res, $Val extends ClusterItem>
    implements $ClusterItemCopyWith<$Res> {
  _$ClusterItemCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? objectId = null,
    Object? latitude = null,
    Object? longitude = null,
    Object? clusterId = null,
  }) {
    return _then(_value.copyWith(
      objectId: null == objectId
          ? _value.objectId
          : objectId // ignore: cast_nullable_to_non_nullable
              as int,
      latitude: null == latitude
          ? _value.latitude
          : latitude // ignore: cast_nullable_to_non_nullable
              as double,
      longitude: null == longitude
          ? _value.longitude
          : longitude // ignore: cast_nullable_to_non_nullable
              as double,
      clusterId: null == clusterId
          ? _value.clusterId
          : clusterId // ignore: cast_nullable_to_non_nullable
              as int,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ClusterItemImplCopyWith<$Res>
    implements $ClusterItemCopyWith<$Res> {
  factory _$$ClusterItemImplCopyWith(
          _$ClusterItemImpl value, $Res Function(_$ClusterItemImpl) then) =
      __$$ClusterItemImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({int objectId, double latitude, double longitude, int clusterId});
}

/// @nodoc
class __$$ClusterItemImplCopyWithImpl<$Res>
    extends _$ClusterItemCopyWithImpl<$Res, _$ClusterItemImpl>
    implements _$$ClusterItemImplCopyWith<$Res> {
  __$$ClusterItemImplCopyWithImpl(
      _$ClusterItemImpl _value, $Res Function(_$ClusterItemImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? objectId = null,
    Object? latitude = null,
    Object? longitude = null,
    Object? clusterId = null,
  }) {
    return _then(_$ClusterItemImpl(
      objectId: null == objectId
          ? _value.objectId
          : objectId // ignore: cast_nullable_to_non_nullable
              as int,
      latitude: null == latitude
          ? _value.latitude
          : latitude // ignore: cast_nullable_to_non_nullable
              as double,
      longitude: null == longitude
          ? _value.longitude
          : longitude // ignore: cast_nullable_to_non_nullable
              as double,
      clusterId: null == clusterId
          ? _value.clusterId
          : clusterId // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc

class _$ClusterItemImpl extends _ClusterItem {
  _$ClusterItemImpl(
      {required this.objectId,
      required this.latitude,
      required this.longitude,
      required this.clusterId})
      : super._();

  @override
  final int objectId;
  @override
  final double latitude;
  @override
  final double longitude;
  @override
  final int clusterId;

  @override
  String toString() {
    return 'ClusterItem(objectId: $objectId, latitude: $latitude, longitude: $longitude, clusterId: $clusterId)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ClusterItemImpl &&
            (identical(other.objectId, objectId) ||
                other.objectId == objectId) &&
            (identical(other.latitude, latitude) ||
                other.latitude == latitude) &&
            (identical(other.longitude, longitude) ||
                other.longitude == longitude) &&
            (identical(other.clusterId, clusterId) ||
                other.clusterId == clusterId));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, objectId, latitude, longitude, clusterId);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ClusterItemImplCopyWith<_$ClusterItemImpl> get copyWith =>
      __$$ClusterItemImplCopyWithImpl<_$ClusterItemImpl>(this, _$identity);
}

abstract class _ClusterItem extends ClusterItem {
  factory _ClusterItem(
      {required final int objectId,
      required final double latitude,
      required final double longitude,
      required final int clusterId}) = _$ClusterItemImpl;
  _ClusterItem._() : super._();

  @override
  int get objectId;
  @override
  double get latitude;
  @override
  double get longitude;
  @override
  int get clusterId;
  @override
  @JsonKey(ignore: true)
  _$$ClusterItemImplCopyWith<_$ClusterItemImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
