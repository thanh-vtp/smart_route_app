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
  /// Tổng số bản ghi sự cố được phân tích
  int get totalRecords => throw _privateConstructorUsedError;

  /// Số lượng cluster được tìm thấy (không tính noise)
  int get nClusters => throw _privateConstructorUsedError;

  /// Số lượng điểm nhiễu (outliers không thuộc cluster nào)
  int get nNoise => throw _privateConstructorUsedError;

  /// Số lượng điểm lõi (core points)
  int get nCorePoints => throw _privateConstructorUsedError;

  /// Danh sách các điểm sự cố gốc đã được gán cluster
  List<ClusterItem> get items => throw _privateConstructorUsedError;

  /// Danh sách các hotspot (vùng nguy hiểm) sau khi phân cụm
  List<ClusterHotspot> get clusters => throw _privateConstructorUsedError;

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
      List<ClusterItem> items,
      List<ClusterHotspot> clusters});
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
    Object? clusters = null,
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
      clusters: null == clusters
          ? _value.clusters
          : clusters // ignore: cast_nullable_to_non_nullable
              as List<ClusterHotspot>,
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
      List<ClusterItem> items,
      List<ClusterHotspot> clusters});
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
    Object? clusters = null,
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
      clusters: null == clusters
          ? _value._clusters
          : clusters // ignore: cast_nullable_to_non_nullable
              as List<ClusterHotspot>,
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
      required final List<ClusterItem> items,
      required final List<ClusterHotspot> clusters})
      : _items = items,
        _clusters = clusters;

  /// Tổng số bản ghi sự cố được phân tích
  @override
  final int totalRecords;

  /// Số lượng cluster được tìm thấy (không tính noise)
  @override
  final int nClusters;

  /// Số lượng điểm nhiễu (outliers không thuộc cluster nào)
  @override
  final int nNoise;

  /// Số lượng điểm lõi (core points)
  @override
  final int nCorePoints;

  /// Danh sách các điểm sự cố gốc đã được gán cluster
  final List<ClusterItem> _items;

  /// Danh sách các điểm sự cố gốc đã được gán cluster
  @override
  List<ClusterItem> get items {
    if (_items is EqualUnmodifiableListView) return _items;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_items);
  }

  /// Danh sách các hotspot (vùng nguy hiểm) sau khi phân cụm
  final List<ClusterHotspot> _clusters;

  /// Danh sách các hotspot (vùng nguy hiểm) sau khi phân cụm
  @override
  List<ClusterHotspot> get clusters {
    if (_clusters is EqualUnmodifiableListView) return _clusters;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_clusters);
  }

  @override
  String toString() {
    return 'ClusterResult(totalRecords: $totalRecords, nClusters: $nClusters, nNoise: $nNoise, nCorePoints: $nCorePoints, items: $items, clusters: $clusters)';
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
            const DeepCollectionEquality().equals(other._items, _items) &&
            const DeepCollectionEquality().equals(other._clusters, _clusters));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      totalRecords,
      nClusters,
      nNoise,
      nCorePoints,
      const DeepCollectionEquality().hash(_items),
      const DeepCollectionEquality().hash(_clusters));

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
      required final List<ClusterItem> items,
      required final List<ClusterHotspot> clusters}) = _$ClusterResultImpl;

  @override

  /// Tổng số bản ghi sự cố được phân tích
  int get totalRecords;
  @override

  /// Số lượng cluster được tìm thấy (không tính noise)
  int get nClusters;
  @override

  /// Số lượng điểm nhiễu (outliers không thuộc cluster nào)
  int get nNoise;
  @override

  /// Số lượng điểm lõi (core points)
  int get nCorePoints;
  @override

  /// Danh sách các điểm sự cố gốc đã được gán cluster
  List<ClusterItem> get items;
  @override

  /// Danh sách các hotspot (vùng nguy hiểm) sau khi phân cụm
  List<ClusterHotspot> get clusters;
  @override
  @JsonKey(ignore: true)
  _$$ClusterResultImplCopyWith<_$ClusterResultImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$ClusterItem {
  /// ID duy nhất của điểm sự cố (dạng String)
  String get id => throw _privateConstructorUsedError;

  /// Vĩ độ của điểm sự cố
  double get lat => throw _privateConstructorUsedError;

  /// Kinh độ của điểm sự cố
  double get lng => throw _privateConstructorUsedError;

  /// ID của cluster mà điểm này thuộc về
  /// Giá trị -1 nghĩa là điểm nhiễu (noise/outlier)
  int get clusterId => throw _privateConstructorUsedError;

  /// Đánh dấu điểm có phải là core point hay không
  /// true = core point (có đủ láng giềng), false = border point hoặc noise
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

  /// ID duy nhất của điểm sự cố (dạng String)
  @override
  final String id;

  /// Vĩ độ của điểm sự cố
  @override
  final double lat;

  /// Kinh độ của điểm sự cố
  @override
  final double lng;

  /// ID của cluster mà điểm này thuộc về
  /// Giá trị -1 nghĩa là điểm nhiễu (noise/outlier)
  @override
  final int clusterId;

  /// Đánh dấu điểm có phải là core point hay không
  /// true = core point (có đủ láng giềng), false = border point hoặc noise
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

  /// ID duy nhất của điểm sự cố (dạng String)
  String get id;
  @override

  /// Vĩ độ của điểm sự cố
  double get lat;
  @override

  /// Kinh độ của điểm sự cố
  double get lng;
  @override

  /// ID của cluster mà điểm này thuộc về
  /// Giá trị -1 nghĩa là điểm nhiễu (noise/outlier)
  int get clusterId;
  @override

  /// Đánh dấu điểm có phải là core point hay không
  /// true = core point (có đủ láng giềng), false = border point hoặc noise
  bool get isCorePoint;
  @override
  @JsonKey(ignore: true)
  _$$ClusterItemImplCopyWith<_$ClusterItemImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$ClusterHotspot {
  /// ID của cluster hotspot
  int get clusterId => throw _privateConstructorUsedError;

  /// Tổng số sự cố trong cluster này
  int get incidentCount => throw _privateConstructorUsedError;

  /// Danh sách ID của các sự cố thuộc cluster
  List<int> get incidentObjectIds => throw _privateConstructorUsedError;

  /// Vĩ độ tâm của cluster
  double get centerLat => throw _privateConstructorUsedError;

  /// Kinh độ tâm của cluster
  double get centerLng => throw _privateConstructorUsedError;

  /// Bán kính hiển thị hình tròn trên bản đồ (đơn vị: mét)
  /// Được tính từ khoảng cách xa nhất từ tâm đến các điểm
  double get displayRadiusM => throw _privateConstructorUsedError;

  /// Bán kính ảnh hưởng khuyến nghị (đơn vị: mét)
  /// Chỉ dùng tham khảo, không dùng cho routing
  double get impactRadiusM => throw _privateConstructorUsedError;

  /// Bán kính trung bình từ tâm đến các điểm (đơn vị: mét)
  /// Thể hiện độ phân tán của các sự cố trong cluster
  double get avgRadiusM => throw _privateConstructorUsedError;

  /// Mật độ sự cố (số sự cố / km²)
  double get density => throw _privateConstructorUsedError;

  /// Mức độ nguy hiểm: "high", "medium", "low"
  String get severity => throw _privateConstructorUsedError;

  /// Loại cluster: "dense", "spread", "isolated"
  String get clusterType => throw _privateConstructorUsedError;

  /// Hình chữ nhật bao quanh cluster
  ClusterBBox get bbox => throw _privateConstructorUsedError;

  /// Tọa độ polygon để hiển thị khi user tap vào hotspot
  /// Mỗi phần tử là [lng, lat]
  List<List<double>> get polygon => throw _privateConstructorUsedError;

  /// Thông tin hình học polygon theo chuẩn ArcGIS
  ClusterGeometry get geometry => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $ClusterHotspotCopyWith<ClusterHotspot> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ClusterHotspotCopyWith<$Res> {
  factory $ClusterHotspotCopyWith(
          ClusterHotspot value, $Res Function(ClusterHotspot) then) =
      _$ClusterHotspotCopyWithImpl<$Res, ClusterHotspot>;
  @useResult
  $Res call(
      {int clusterId,
      int incidentCount,
      List<int> incidentObjectIds,
      double centerLat,
      double centerLng,
      double displayRadiusM,
      double impactRadiusM,
      double avgRadiusM,
      double density,
      String severity,
      String clusterType,
      ClusterBBox bbox,
      List<List<double>> polygon,
      ClusterGeometry geometry});

  $ClusterBBoxCopyWith<$Res> get bbox;
  $ClusterGeometryCopyWith<$Res> get geometry;
}

/// @nodoc
class _$ClusterHotspotCopyWithImpl<$Res, $Val extends ClusterHotspot>
    implements $ClusterHotspotCopyWith<$Res> {
  _$ClusterHotspotCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? clusterId = null,
    Object? incidentCount = null,
    Object? incidentObjectIds = null,
    Object? centerLat = null,
    Object? centerLng = null,
    Object? displayRadiusM = null,
    Object? impactRadiusM = null,
    Object? avgRadiusM = null,
    Object? density = null,
    Object? severity = null,
    Object? clusterType = null,
    Object? bbox = null,
    Object? polygon = null,
    Object? geometry = null,
  }) {
    return _then(_value.copyWith(
      clusterId: null == clusterId
          ? _value.clusterId
          : clusterId // ignore: cast_nullable_to_non_nullable
              as int,
      incidentCount: null == incidentCount
          ? _value.incidentCount
          : incidentCount // ignore: cast_nullable_to_non_nullable
              as int,
      incidentObjectIds: null == incidentObjectIds
          ? _value.incidentObjectIds
          : incidentObjectIds // ignore: cast_nullable_to_non_nullable
              as List<int>,
      centerLat: null == centerLat
          ? _value.centerLat
          : centerLat // ignore: cast_nullable_to_non_nullable
              as double,
      centerLng: null == centerLng
          ? _value.centerLng
          : centerLng // ignore: cast_nullable_to_non_nullable
              as double,
      displayRadiusM: null == displayRadiusM
          ? _value.displayRadiusM
          : displayRadiusM // ignore: cast_nullable_to_non_nullable
              as double,
      impactRadiusM: null == impactRadiusM
          ? _value.impactRadiusM
          : impactRadiusM // ignore: cast_nullable_to_non_nullable
              as double,
      avgRadiusM: null == avgRadiusM
          ? _value.avgRadiusM
          : avgRadiusM // ignore: cast_nullable_to_non_nullable
              as double,
      density: null == density
          ? _value.density
          : density // ignore: cast_nullable_to_non_nullable
              as double,
      severity: null == severity
          ? _value.severity
          : severity // ignore: cast_nullable_to_non_nullable
              as String,
      clusterType: null == clusterType
          ? _value.clusterType
          : clusterType // ignore: cast_nullable_to_non_nullable
              as String,
      bbox: null == bbox
          ? _value.bbox
          : bbox // ignore: cast_nullable_to_non_nullable
              as ClusterBBox,
      polygon: null == polygon
          ? _value.polygon
          : polygon // ignore: cast_nullable_to_non_nullable
              as List<List<double>>,
      geometry: null == geometry
          ? _value.geometry
          : geometry // ignore: cast_nullable_to_non_nullable
              as ClusterGeometry,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $ClusterBBoxCopyWith<$Res> get bbox {
    return $ClusterBBoxCopyWith<$Res>(_value.bbox, (value) {
      return _then(_value.copyWith(bbox: value) as $Val);
    });
  }

  @override
  @pragma('vm:prefer-inline')
  $ClusterGeometryCopyWith<$Res> get geometry {
    return $ClusterGeometryCopyWith<$Res>(_value.geometry, (value) {
      return _then(_value.copyWith(geometry: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$ClusterHotspotImplCopyWith<$Res>
    implements $ClusterHotspotCopyWith<$Res> {
  factory _$$ClusterHotspotImplCopyWith(_$ClusterHotspotImpl value,
          $Res Function(_$ClusterHotspotImpl) then) =
      __$$ClusterHotspotImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int clusterId,
      int incidentCount,
      List<int> incidentObjectIds,
      double centerLat,
      double centerLng,
      double displayRadiusM,
      double impactRadiusM,
      double avgRadiusM,
      double density,
      String severity,
      String clusterType,
      ClusterBBox bbox,
      List<List<double>> polygon,
      ClusterGeometry geometry});

  @override
  $ClusterBBoxCopyWith<$Res> get bbox;
  @override
  $ClusterGeometryCopyWith<$Res> get geometry;
}

/// @nodoc
class __$$ClusterHotspotImplCopyWithImpl<$Res>
    extends _$ClusterHotspotCopyWithImpl<$Res, _$ClusterHotspotImpl>
    implements _$$ClusterHotspotImplCopyWith<$Res> {
  __$$ClusterHotspotImplCopyWithImpl(
      _$ClusterHotspotImpl _value, $Res Function(_$ClusterHotspotImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? clusterId = null,
    Object? incidentCount = null,
    Object? incidentObjectIds = null,
    Object? centerLat = null,
    Object? centerLng = null,
    Object? displayRadiusM = null,
    Object? impactRadiusM = null,
    Object? avgRadiusM = null,
    Object? density = null,
    Object? severity = null,
    Object? clusterType = null,
    Object? bbox = null,
    Object? polygon = null,
    Object? geometry = null,
  }) {
    return _then(_$ClusterHotspotImpl(
      clusterId: null == clusterId
          ? _value.clusterId
          : clusterId // ignore: cast_nullable_to_non_nullable
              as int,
      incidentCount: null == incidentCount
          ? _value.incidentCount
          : incidentCount // ignore: cast_nullable_to_non_nullable
              as int,
      incidentObjectIds: null == incidentObjectIds
          ? _value._incidentObjectIds
          : incidentObjectIds // ignore: cast_nullable_to_non_nullable
              as List<int>,
      centerLat: null == centerLat
          ? _value.centerLat
          : centerLat // ignore: cast_nullable_to_non_nullable
              as double,
      centerLng: null == centerLng
          ? _value.centerLng
          : centerLng // ignore: cast_nullable_to_non_nullable
              as double,
      displayRadiusM: null == displayRadiusM
          ? _value.displayRadiusM
          : displayRadiusM // ignore: cast_nullable_to_non_nullable
              as double,
      impactRadiusM: null == impactRadiusM
          ? _value.impactRadiusM
          : impactRadiusM // ignore: cast_nullable_to_non_nullable
              as double,
      avgRadiusM: null == avgRadiusM
          ? _value.avgRadiusM
          : avgRadiusM // ignore: cast_nullable_to_non_nullable
              as double,
      density: null == density
          ? _value.density
          : density // ignore: cast_nullable_to_non_nullable
              as double,
      severity: null == severity
          ? _value.severity
          : severity // ignore: cast_nullable_to_non_nullable
              as String,
      clusterType: null == clusterType
          ? _value.clusterType
          : clusterType // ignore: cast_nullable_to_non_nullable
              as String,
      bbox: null == bbox
          ? _value.bbox
          : bbox // ignore: cast_nullable_to_non_nullable
              as ClusterBBox,
      polygon: null == polygon
          ? _value._polygon
          : polygon // ignore: cast_nullable_to_non_nullable
              as List<List<double>>,
      geometry: null == geometry
          ? _value.geometry
          : geometry // ignore: cast_nullable_to_non_nullable
              as ClusterGeometry,
    ));
  }
}

/// @nodoc

class _$ClusterHotspotImpl implements _ClusterHotspot {
  const _$ClusterHotspotImpl(
      {required this.clusterId,
      required this.incidentCount,
      required final List<int> incidentObjectIds,
      required this.centerLat,
      required this.centerLng,
      required this.displayRadiusM,
      required this.impactRadiusM,
      required this.avgRadiusM,
      required this.density,
      required this.severity,
      required this.clusterType,
      required this.bbox,
      required final List<List<double>> polygon,
      required this.geometry})
      : _incidentObjectIds = incidentObjectIds,
        _polygon = polygon;

  /// ID của cluster hotspot
  @override
  final int clusterId;

  /// Tổng số sự cố trong cluster này
  @override
  final int incidentCount;

  /// Danh sách ID của các sự cố thuộc cluster
  final List<int> _incidentObjectIds;

  /// Danh sách ID của các sự cố thuộc cluster
  @override
  List<int> get incidentObjectIds {
    if (_incidentObjectIds is EqualUnmodifiableListView)
      return _incidentObjectIds;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_incidentObjectIds);
  }

  /// Vĩ độ tâm của cluster
  @override
  final double centerLat;

  /// Kinh độ tâm của cluster
  @override
  final double centerLng;

  /// Bán kính hiển thị hình tròn trên bản đồ (đơn vị: mét)
  /// Được tính từ khoảng cách xa nhất từ tâm đến các điểm
  @override
  final double displayRadiusM;

  /// Bán kính ảnh hưởng khuyến nghị (đơn vị: mét)
  /// Chỉ dùng tham khảo, không dùng cho routing
  @override
  final double impactRadiusM;

  /// Bán kính trung bình từ tâm đến các điểm (đơn vị: mét)
  /// Thể hiện độ phân tán của các sự cố trong cluster
  @override
  final double avgRadiusM;

  /// Mật độ sự cố (số sự cố / km²)
  @override
  final double density;

  /// Mức độ nguy hiểm: "high", "medium", "low"
  @override
  final String severity;

  /// Loại cluster: "dense", "spread", "isolated"
  @override
  final String clusterType;

  /// Hình chữ nhật bao quanh cluster
  @override
  final ClusterBBox bbox;

  /// Tọa độ polygon để hiển thị khi user tap vào hotspot
  /// Mỗi phần tử là [lng, lat]
  final List<List<double>> _polygon;

  /// Tọa độ polygon để hiển thị khi user tap vào hotspot
  /// Mỗi phần tử là [lng, lat]
  @override
  List<List<double>> get polygon {
    if (_polygon is EqualUnmodifiableListView) return _polygon;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_polygon);
  }

  /// Thông tin hình học polygon theo chuẩn ArcGIS
  @override
  final ClusterGeometry geometry;

  @override
  String toString() {
    return 'ClusterHotspot(clusterId: $clusterId, incidentCount: $incidentCount, incidentObjectIds: $incidentObjectIds, centerLat: $centerLat, centerLng: $centerLng, displayRadiusM: $displayRadiusM, impactRadiusM: $impactRadiusM, avgRadiusM: $avgRadiusM, density: $density, severity: $severity, clusterType: $clusterType, bbox: $bbox, polygon: $polygon, geometry: $geometry)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ClusterHotspotImpl &&
            (identical(other.clusterId, clusterId) ||
                other.clusterId == clusterId) &&
            (identical(other.incidentCount, incidentCount) ||
                other.incidentCount == incidentCount) &&
            const DeepCollectionEquality()
                .equals(other._incidentObjectIds, _incidentObjectIds) &&
            (identical(other.centerLat, centerLat) ||
                other.centerLat == centerLat) &&
            (identical(other.centerLng, centerLng) ||
                other.centerLng == centerLng) &&
            (identical(other.displayRadiusM, displayRadiusM) ||
                other.displayRadiusM == displayRadiusM) &&
            (identical(other.impactRadiusM, impactRadiusM) ||
                other.impactRadiusM == impactRadiusM) &&
            (identical(other.avgRadiusM, avgRadiusM) ||
                other.avgRadiusM == avgRadiusM) &&
            (identical(other.density, density) || other.density == density) &&
            (identical(other.severity, severity) ||
                other.severity == severity) &&
            (identical(other.clusterType, clusterType) ||
                other.clusterType == clusterType) &&
            (identical(other.bbox, bbox) || other.bbox == bbox) &&
            const DeepCollectionEquality().equals(other._polygon, _polygon) &&
            (identical(other.geometry, geometry) ||
                other.geometry == geometry));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      clusterId,
      incidentCount,
      const DeepCollectionEquality().hash(_incidentObjectIds),
      centerLat,
      centerLng,
      displayRadiusM,
      impactRadiusM,
      avgRadiusM,
      density,
      severity,
      clusterType,
      bbox,
      const DeepCollectionEquality().hash(_polygon),
      geometry);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ClusterHotspotImplCopyWith<_$ClusterHotspotImpl> get copyWith =>
      __$$ClusterHotspotImplCopyWithImpl<_$ClusterHotspotImpl>(
          this, _$identity);
}

abstract class _ClusterHotspot implements ClusterHotspot {
  const factory _ClusterHotspot(
      {required final int clusterId,
      required final int incidentCount,
      required final List<int> incidentObjectIds,
      required final double centerLat,
      required final double centerLng,
      required final double displayRadiusM,
      required final double impactRadiusM,
      required final double avgRadiusM,
      required final double density,
      required final String severity,
      required final String clusterType,
      required final ClusterBBox bbox,
      required final List<List<double>> polygon,
      required final ClusterGeometry geometry}) = _$ClusterHotspotImpl;

  @override

  /// ID của cluster hotspot
  int get clusterId;
  @override

  /// Tổng số sự cố trong cluster này
  int get incidentCount;
  @override

  /// Danh sách ID của các sự cố thuộc cluster
  List<int> get incidentObjectIds;
  @override

  /// Vĩ độ tâm của cluster
  double get centerLat;
  @override

  /// Kinh độ tâm của cluster
  double get centerLng;
  @override

  /// Bán kính hiển thị hình tròn trên bản đồ (đơn vị: mét)
  /// Được tính từ khoảng cách xa nhất từ tâm đến các điểm
  double get displayRadiusM;
  @override

  /// Bán kính ảnh hưởng khuyến nghị (đơn vị: mét)
  /// Chỉ dùng tham khảo, không dùng cho routing
  double get impactRadiusM;
  @override

  /// Bán kính trung bình từ tâm đến các điểm (đơn vị: mét)
  /// Thể hiện độ phân tán của các sự cố trong cluster
  double get avgRadiusM;
  @override

  /// Mật độ sự cố (số sự cố / km²)
  double get density;
  @override

  /// Mức độ nguy hiểm: "high", "medium", "low"
  String get severity;
  @override

  /// Loại cluster: "dense", "spread", "isolated"
  String get clusterType;
  @override

  /// Hình chữ nhật bao quanh cluster
  ClusterBBox get bbox;
  @override

  /// Tọa độ polygon để hiển thị khi user tap vào hotspot
  /// Mỗi phần tử là [lng, lat]
  List<List<double>> get polygon;
  @override

  /// Thông tin hình học polygon theo chuẩn ArcGIS
  ClusterGeometry get geometry;
  @override
  @JsonKey(ignore: true)
  _$$ClusterHotspotImplCopyWith<_$ClusterHotspotImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$ClusterBBox {
  /// Kinh độ nhỏ nhất (cạnh trái)
  double get xmin => throw _privateConstructorUsedError;

  /// Vĩ độ nhỏ nhất (cạnh dưới)
  double get ymin => throw _privateConstructorUsedError;

  /// Kinh độ lớn nhất (cạnh phải)
  double get xmax => throw _privateConstructorUsedError;

  /// Vĩ độ lớn nhất (cạnh trên)
  double get ymax => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $ClusterBBoxCopyWith<ClusterBBox> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ClusterBBoxCopyWith<$Res> {
  factory $ClusterBBoxCopyWith(
          ClusterBBox value, $Res Function(ClusterBBox) then) =
      _$ClusterBBoxCopyWithImpl<$Res, ClusterBBox>;
  @useResult
  $Res call({double xmin, double ymin, double xmax, double ymax});
}

/// @nodoc
class _$ClusterBBoxCopyWithImpl<$Res, $Val extends ClusterBBox>
    implements $ClusterBBoxCopyWith<$Res> {
  _$ClusterBBoxCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? xmin = null,
    Object? ymin = null,
    Object? xmax = null,
    Object? ymax = null,
  }) {
    return _then(_value.copyWith(
      xmin: null == xmin
          ? _value.xmin
          : xmin // ignore: cast_nullable_to_non_nullable
              as double,
      ymin: null == ymin
          ? _value.ymin
          : ymin // ignore: cast_nullable_to_non_nullable
              as double,
      xmax: null == xmax
          ? _value.xmax
          : xmax // ignore: cast_nullable_to_non_nullable
              as double,
      ymax: null == ymax
          ? _value.ymax
          : ymax // ignore: cast_nullable_to_non_nullable
              as double,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ClusterBBoxImplCopyWith<$Res>
    implements $ClusterBBoxCopyWith<$Res> {
  factory _$$ClusterBBoxImplCopyWith(
          _$ClusterBBoxImpl value, $Res Function(_$ClusterBBoxImpl) then) =
      __$$ClusterBBoxImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({double xmin, double ymin, double xmax, double ymax});
}

/// @nodoc
class __$$ClusterBBoxImplCopyWithImpl<$Res>
    extends _$ClusterBBoxCopyWithImpl<$Res, _$ClusterBBoxImpl>
    implements _$$ClusterBBoxImplCopyWith<$Res> {
  __$$ClusterBBoxImplCopyWithImpl(
      _$ClusterBBoxImpl _value, $Res Function(_$ClusterBBoxImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? xmin = null,
    Object? ymin = null,
    Object? xmax = null,
    Object? ymax = null,
  }) {
    return _then(_$ClusterBBoxImpl(
      xmin: null == xmin
          ? _value.xmin
          : xmin // ignore: cast_nullable_to_non_nullable
              as double,
      ymin: null == ymin
          ? _value.ymin
          : ymin // ignore: cast_nullable_to_non_nullable
              as double,
      xmax: null == xmax
          ? _value.xmax
          : xmax // ignore: cast_nullable_to_non_nullable
              as double,
      ymax: null == ymax
          ? _value.ymax
          : ymax // ignore: cast_nullable_to_non_nullable
              as double,
    ));
  }
}

/// @nodoc

class _$ClusterBBoxImpl implements _ClusterBBox {
  const _$ClusterBBoxImpl(
      {required this.xmin,
      required this.ymin,
      required this.xmax,
      required this.ymax});

  /// Kinh độ nhỏ nhất (cạnh trái)
  @override
  final double xmin;

  /// Vĩ độ nhỏ nhất (cạnh dưới)
  @override
  final double ymin;

  /// Kinh độ lớn nhất (cạnh phải)
  @override
  final double xmax;

  /// Vĩ độ lớn nhất (cạnh trên)
  @override
  final double ymax;

  @override
  String toString() {
    return 'ClusterBBox(xmin: $xmin, ymin: $ymin, xmax: $xmax, ymax: $ymax)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ClusterBBoxImpl &&
            (identical(other.xmin, xmin) || other.xmin == xmin) &&
            (identical(other.ymin, ymin) || other.ymin == ymin) &&
            (identical(other.xmax, xmax) || other.xmax == xmax) &&
            (identical(other.ymax, ymax) || other.ymax == ymax));
  }

  @override
  int get hashCode => Object.hash(runtimeType, xmin, ymin, xmax, ymax);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ClusterBBoxImplCopyWith<_$ClusterBBoxImpl> get copyWith =>
      __$$ClusterBBoxImplCopyWithImpl<_$ClusterBBoxImpl>(this, _$identity);
}

abstract class _ClusterBBox implements ClusterBBox {
  const factory _ClusterBBox(
      {required final double xmin,
      required final double ymin,
      required final double xmax,
      required final double ymax}) = _$ClusterBBoxImpl;

  @override

  /// Kinh độ nhỏ nhất (cạnh trái)
  double get xmin;
  @override

  /// Vĩ độ nhỏ nhất (cạnh dưới)
  double get ymin;
  @override

  /// Kinh độ lớn nhất (cạnh phải)
  double get xmax;
  @override

  /// Vĩ độ lớn nhất (cạnh trên)
  double get ymax;
  @override
  @JsonKey(ignore: true)
  _$$ClusterBBoxImplCopyWith<_$ClusterBBoxImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$ClusterGeometry {
  /// Danh sách các rings tạo thành polygon
  /// Mỗi ring là một mảng các tọa độ [lng, lat]
  /// Ring đầu tiên là outer ring, các ring sau (nếu có) là holes
  List<List<List<double>>> get rings => throw _privateConstructorUsedError;

  /// Well-Known ID của hệ tọa độ không gian
  /// Ví dụ: 4326 = WGS84, 3857 = Web Mercator
  int get wkid => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $ClusterGeometryCopyWith<ClusterGeometry> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ClusterGeometryCopyWith<$Res> {
  factory $ClusterGeometryCopyWith(
          ClusterGeometry value, $Res Function(ClusterGeometry) then) =
      _$ClusterGeometryCopyWithImpl<$Res, ClusterGeometry>;
  @useResult
  $Res call({List<List<List<double>>> rings, int wkid});
}

/// @nodoc
class _$ClusterGeometryCopyWithImpl<$Res, $Val extends ClusterGeometry>
    implements $ClusterGeometryCopyWith<$Res> {
  _$ClusterGeometryCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? rings = null,
    Object? wkid = null,
  }) {
    return _then(_value.copyWith(
      rings: null == rings
          ? _value.rings
          : rings // ignore: cast_nullable_to_non_nullable
              as List<List<List<double>>>,
      wkid: null == wkid
          ? _value.wkid
          : wkid // ignore: cast_nullable_to_non_nullable
              as int,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ClusterGeometryImplCopyWith<$Res>
    implements $ClusterGeometryCopyWith<$Res> {
  factory _$$ClusterGeometryImplCopyWith(_$ClusterGeometryImpl value,
          $Res Function(_$ClusterGeometryImpl) then) =
      __$$ClusterGeometryImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({List<List<List<double>>> rings, int wkid});
}

/// @nodoc
class __$$ClusterGeometryImplCopyWithImpl<$Res>
    extends _$ClusterGeometryCopyWithImpl<$Res, _$ClusterGeometryImpl>
    implements _$$ClusterGeometryImplCopyWith<$Res> {
  __$$ClusterGeometryImplCopyWithImpl(
      _$ClusterGeometryImpl _value, $Res Function(_$ClusterGeometryImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? rings = null,
    Object? wkid = null,
  }) {
    return _then(_$ClusterGeometryImpl(
      rings: null == rings
          ? _value._rings
          : rings // ignore: cast_nullable_to_non_nullable
              as List<List<List<double>>>,
      wkid: null == wkid
          ? _value.wkid
          : wkid // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc

class _$ClusterGeometryImpl implements _ClusterGeometry {
  const _$ClusterGeometryImpl(
      {required final List<List<List<double>>> rings, required this.wkid})
      : _rings = rings;

  /// Danh sách các rings tạo thành polygon
  /// Mỗi ring là một mảng các tọa độ [lng, lat]
  /// Ring đầu tiên là outer ring, các ring sau (nếu có) là holes
  final List<List<List<double>>> _rings;

  /// Danh sách các rings tạo thành polygon
  /// Mỗi ring là một mảng các tọa độ [lng, lat]
  /// Ring đầu tiên là outer ring, các ring sau (nếu có) là holes
  @override
  List<List<List<double>>> get rings {
    if (_rings is EqualUnmodifiableListView) return _rings;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_rings);
  }

  /// Well-Known ID của hệ tọa độ không gian
  /// Ví dụ: 4326 = WGS84, 3857 = Web Mercator
  @override
  final int wkid;

  @override
  String toString() {
    return 'ClusterGeometry(rings: $rings, wkid: $wkid)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ClusterGeometryImpl &&
            const DeepCollectionEquality().equals(other._rings, _rings) &&
            (identical(other.wkid, wkid) || other.wkid == wkid));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType, const DeepCollectionEquality().hash(_rings), wkid);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ClusterGeometryImplCopyWith<_$ClusterGeometryImpl> get copyWith =>
      __$$ClusterGeometryImplCopyWithImpl<_$ClusterGeometryImpl>(
          this, _$identity);
}

abstract class _ClusterGeometry implements ClusterGeometry {
  const factory _ClusterGeometry(
      {required final List<List<List<double>>> rings,
      required final int wkid}) = _$ClusterGeometryImpl;

  @override

  /// Danh sách các rings tạo thành polygon
  /// Mỗi ring là một mảng các tọa độ [lng, lat]
  /// Ring đầu tiên là outer ring, các ring sau (nếu có) là holes
  List<List<List<double>>> get rings;
  @override

  /// Well-Known ID của hệ tọa độ không gian
  /// Ví dụ: 4326 = WGS84, 3857 = Web Mercator
  int get wkid;
  @override
  @JsonKey(ignore: true)
  _$$ClusterGeometryImplCopyWith<_$ClusterGeometryImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
