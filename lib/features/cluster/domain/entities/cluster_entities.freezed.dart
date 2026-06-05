// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'cluster_entities.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$ClusterResult {
  int get totalRecords => throw _privateConstructorUsedError;
  int get nClusters =>
      throw _privateConstructorUsedError; // Số lượng cụm (Vùng nguy hiểm)
  int get nNoise =>
      throw _privateConstructorUsedError; // Số lượng điểm nhiễu (Sự cố đơn lẻ)
  int get nCorePoints =>
      throw _privateConstructorUsedError; // Số lượng điểm lõi
  List<ClusterItem> get items => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $ClusterResultCopyWith<ClusterResult> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ClusterResultCopyWith<$Res> {
  factory $ClusterResultCopyWith(
          ClusterResult value, $Res Function(ClusterResult) then) =
      _$ClusterResultCopyWithImpl<$Res, ClusterResult>;
  @useResult
  $Res call(
      {int totalRecords,
      int nClusters,
      int nNoise,
      int nCorePoints,
      List<ClusterItem> items});
}

/// @nodoc
class _$ClusterResultCopyWithImpl<$Res, $Val extends ClusterResult>
    implements $ClusterResultCopyWith<$Res> {
  _$ClusterResultCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? totalRecords = null,
    Object? nClusters = null,
    Object? nNoise = null,
    Object? nCorePoints = null,
    Object? items = null,
  }) {
    return _then(_value.copyWith(
      totalRecords: null == totalRecords
          ? _value.totalRecords
          : totalRecords // ignore: cast_nullable_to_non_nullable
              as int,
      nClusters: null == nClusters
          ? _value.nClusters
          : nClusters // ignore: cast_nullable_to_non_nullable
              as int,
      nNoise: null == nNoise
          ? _value.nNoise
          : nNoise // ignore: cast_nullable_to_non_nullable
              as int,
      nCorePoints: null == nCorePoints
          ? _value.nCorePoints
          : nCorePoints // ignore: cast_nullable_to_non_nullable
              as int,
      items: null == items
          ? _value.items
          : items // ignore: cast_nullable_to_non_nullable
              as List<ClusterItem>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ClusterResultImplCopyWith<$Res>
    implements $ClusterResultCopyWith<$Res> {
  factory _$$ClusterResultImplCopyWith(
          _$ClusterResultImpl value, $Res Function(_$ClusterResultImpl) then) =
      __$$ClusterResultImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int totalRecords,
      int nClusters,
      int nNoise,
      int nCorePoints,
      List<ClusterItem> items});
}

/// @nodoc
class __$$ClusterResultImplCopyWithImpl<$Res>
    extends _$ClusterResultCopyWithImpl<$Res, _$ClusterResultImpl>
    implements _$$ClusterResultImplCopyWith<$Res> {
  __$$ClusterResultImplCopyWithImpl(
      _$ClusterResultImpl _value, $Res Function(_$ClusterResultImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? totalRecords = null,
    Object? nClusters = null,
    Object? nNoise = null,
    Object? nCorePoints = null,
    Object? items = null,
  }) {
    return _then(_$ClusterResultImpl(
      totalRecords: null == totalRecords
          ? _value.totalRecords
          : totalRecords // ignore: cast_nullable_to_non_nullable
              as int,
      nClusters: null == nClusters
          ? _value.nClusters
          : nClusters // ignore: cast_nullable_to_non_nullable
              as int,
      nNoise: null == nNoise
          ? _value.nNoise
          : nNoise // ignore: cast_nullable_to_non_nullable
              as int,
      nCorePoints: null == nCorePoints
          ? _value.nCorePoints
          : nCorePoints // ignore: cast_nullable_to_non_nullable
              as int,
      items: null == items
          ? _value._items
          : items // ignore: cast_nullable_to_non_nullable
              as List<ClusterItem>,
    ));
  }
}

/// @nodoc

class _$ClusterResultImpl implements _ClusterResult {
  const _$ClusterResultImpl(
      {required this.totalRecords,
      required this.nClusters,
      required this.nNoise,
      required this.nCorePoints,
      required final List<ClusterItem> items})
      : _items = items;

  @override
  final int totalRecords;
  @override
  final int nClusters;
// Số lượng cụm (Vùng nguy hiểm)
  @override
  final int nNoise;
// Số lượng điểm nhiễu (Sự cố đơn lẻ)
  @override
  final int nCorePoints;
// Số lượng điểm lõi
  final List<ClusterItem> _items;
// Số lượng điểm lõi
  @override
  List<ClusterItem> get items {
    if (_items is EqualUnmodifiableListView) return _items;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_items);
  }

  @override
  String toString() {
    return 'ClusterResult(totalRecords: $totalRecords, nClusters: $nClusters, nNoise: $nNoise, nCorePoints: $nCorePoints, items: $items)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ClusterResultImpl &&
            (identical(other.totalRecords, totalRecords) ||
                other.totalRecords == totalRecords) &&
            (identical(other.nClusters, nClusters) ||
                other.nClusters == nClusters) &&
            (identical(other.nNoise, nNoise) || other.nNoise == nNoise) &&
            (identical(other.nCorePoints, nCorePoints) ||
                other.nCorePoints == nCorePoints) &&
            const DeepCollectionEquality().equals(other._items, _items));
  }

  @override
  int get hashCode => Object.hash(runtimeType, totalRecords, nClusters, nNoise,
      nCorePoints, const DeepCollectionEquality().hash(_items));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ClusterResultImplCopyWith<_$ClusterResultImpl> get copyWith =>
      __$$ClusterResultImplCopyWithImpl<_$ClusterResultImpl>(this, _$identity);
}

abstract class _ClusterResult implements ClusterResult {
  const factory _ClusterResult(
      {required final int totalRecords,
      required final int nClusters,
      required final int nNoise,
      required final int nCorePoints,
      required final List<ClusterItem> items}) = _$ClusterResultImpl;

  @override
  int get totalRecords;
  @override
  int get nClusters;
  @override // Số lượng cụm (Vùng nguy hiểm)
  int get nNoise;
  @override // Số lượng điểm nhiễu (Sự cố đơn lẻ)
  int get nCorePoints;
  @override // Số lượng điểm lõi
  List<ClusterItem> get items;
  @override
  @JsonKey(ignore: true)
  _$$ClusterResultImplCopyWith<_$ClusterResultImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$ClusterItem {
  String get id => throw _privateConstructorUsedError; // Ánh xạ từ OBJECTID
  double get lat => throw _privateConstructorUsedError; // Vĩ độ
  double get lng => throw _privateConstructorUsedError; // Kinh độ
  int get clusterId =>
      throw _privateConstructorUsedError; // ID cụm (-1 nếu là điểm đơn lẻ, >=0 nếu thuộc cụm)
  bool get isCorePoint => throw _privateConstructorUsedError;

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
  $Res call(
      {String id, double lat, double lng, int clusterId, bool isCorePoint});
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
    Object? id = null,
    Object? lat = null,
    Object? lng = null,
    Object? clusterId = null,
    Object? isCorePoint = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      lat: null == lat
          ? _value.lat
          : lat // ignore: cast_nullable_to_non_nullable
              as double,
      lng: null == lng
          ? _value.lng
          : lng // ignore: cast_nullable_to_non_nullable
              as double,
      clusterId: null == clusterId
          ? _value.clusterId
          : clusterId // ignore: cast_nullable_to_non_nullable
              as int,
      isCorePoint: null == isCorePoint
          ? _value.isCorePoint
          : isCorePoint // ignore: cast_nullable_to_non_nullable
              as bool,
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
  $Res call(
      {String id, double lat, double lng, int clusterId, bool isCorePoint});
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
    Object? id = null,
    Object? lat = null,
    Object? lng = null,
    Object? clusterId = null,
    Object? isCorePoint = null,
  }) {
    return _then(_$ClusterItemImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      lat: null == lat
          ? _value.lat
          : lat // ignore: cast_nullable_to_non_nullable
              as double,
      lng: null == lng
          ? _value.lng
          : lng // ignore: cast_nullable_to_non_nullable
              as double,
      clusterId: null == clusterId
          ? _value.clusterId
          : clusterId // ignore: cast_nullable_to_non_nullable
              as int,
      isCorePoint: null == isCorePoint
          ? _value.isCorePoint
          : isCorePoint // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc

class _$ClusterItemImpl implements _ClusterItem {
  const _$ClusterItemImpl(
      {required this.id,
      required this.lat,
      required this.lng,
      required this.clusterId,
      required this.isCorePoint});

  @override
  final String id;
// Ánh xạ từ OBJECTID
  @override
  final double lat;
// Vĩ độ
  @override
  final double lng;
// Kinh độ
  @override
  final int clusterId;
// ID cụm (-1 nếu là điểm đơn lẻ, >=0 nếu thuộc cụm)
  @override
  final bool isCorePoint;

  @override
  String toString() {
    return 'ClusterItem(id: $id, lat: $lat, lng: $lng, clusterId: $clusterId, isCorePoint: $isCorePoint)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ClusterItemImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.lat, lat) || other.lat == lat) &&
            (identical(other.lng, lng) || other.lng == lng) &&
            (identical(other.clusterId, clusterId) ||
                other.clusterId == clusterId) &&
            (identical(other.isCorePoint, isCorePoint) ||
                other.isCorePoint == isCorePoint));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, id, lat, lng, clusterId, isCorePoint);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ClusterItemImplCopyWith<_$ClusterItemImpl> get copyWith =>
      __$$ClusterItemImplCopyWithImpl<_$ClusterItemImpl>(this, _$identity);
}

abstract class _ClusterItem implements ClusterItem {
  const factory _ClusterItem(
      {required final String id,
      required final double lat,
      required final double lng,
      required final int clusterId,
      required final bool isCorePoint}) = _$ClusterItemImpl;

  @override
  String get id;
  @override // Ánh xạ từ OBJECTID
  double get lat;
  @override // Vĩ độ
  double get lng;
  @override // Kinh độ
  int get clusterId;
  @override // ID cụm (-1 nếu là điểm đơn lẻ, >=0 nếu thuộc cụm)
  bool get isCorePoint;
  @override
  @JsonKey(ignore: true)
  _$$ClusterItemImplCopyWith<_$ClusterItemImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
