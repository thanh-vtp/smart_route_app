// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'cluster_entities.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$ClusterResult {

/// Tổng số bản ghi sự cố được phân tích
 int get totalRecords;/// Số lượng cluster được tìm thấy (không tính noise)
 int get nClusters;/// Số lượng điểm nhiễu (outliers không thuộc cluster nào)
 int get nNoise;/// Số lượng điểm lõi (core points)
 int get nCorePoints;/// Danh sách các điểm sự cố gốc đã được gán cluster
 List<ClusterItem> get items;/// Danh sách các hotspot (vùng nguy hiểm) sau khi phân cụm
 List<ClusterHotspot> get clusters;
/// Create a copy of ClusterResult
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ClusterResultCopyWith<ClusterResult> get copyWith => _$ClusterResultCopyWithImpl<ClusterResult>(this as ClusterResult, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ClusterResult&&(identical(other.totalRecords, totalRecords) || other.totalRecords == totalRecords)&&(identical(other.nClusters, nClusters) || other.nClusters == nClusters)&&(identical(other.nNoise, nNoise) || other.nNoise == nNoise)&&(identical(other.nCorePoints, nCorePoints) || other.nCorePoints == nCorePoints)&&const DeepCollectionEquality().equals(other.items, items)&&const DeepCollectionEquality().equals(other.clusters, clusters));
}


@override
int get hashCode => Object.hash(runtimeType,totalRecords,nClusters,nNoise,nCorePoints,const DeepCollectionEquality().hash(items),const DeepCollectionEquality().hash(clusters));

@override
String toString() {
  return 'ClusterResult(totalRecords: $totalRecords, nClusters: $nClusters, nNoise: $nNoise, nCorePoints: $nCorePoints, items: $items, clusters: $clusters)';
}


}

/// @nodoc
abstract mixin class $ClusterResultCopyWith<$Res>  {
  factory $ClusterResultCopyWith(ClusterResult value, $Res Function(ClusterResult) _then) = _$ClusterResultCopyWithImpl;
@useResult
$Res call({
 int totalRecords, int nClusters, int nNoise, int nCorePoints, List<ClusterItem> items, List<ClusterHotspot> clusters
});




}
/// @nodoc
class _$ClusterResultCopyWithImpl<$Res>
    implements $ClusterResultCopyWith<$Res> {
  _$ClusterResultCopyWithImpl(this._self, this._then);

  final ClusterResult _self;
  final $Res Function(ClusterResult) _then;

/// Create a copy of ClusterResult
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? totalRecords = null,Object? nClusters = null,Object? nNoise = null,Object? nCorePoints = null,Object? items = null,Object? clusters = null,}) {
  return _then(_self.copyWith(
totalRecords: null == totalRecords ? _self.totalRecords : totalRecords // ignore: cast_nullable_to_non_nullable
as int,nClusters: null == nClusters ? _self.nClusters : nClusters // ignore: cast_nullable_to_non_nullable
as int,nNoise: null == nNoise ? _self.nNoise : nNoise // ignore: cast_nullable_to_non_nullable
as int,nCorePoints: null == nCorePoints ? _self.nCorePoints : nCorePoints // ignore: cast_nullable_to_non_nullable
as int,items: null == items ? _self.items : items // ignore: cast_nullable_to_non_nullable
as List<ClusterItem>,clusters: null == clusters ? _self.clusters : clusters // ignore: cast_nullable_to_non_nullable
as List<ClusterHotspot>,
  ));
}

}


/// Adds pattern-matching-related methods to [ClusterResult].
extension ClusterResultPatterns on ClusterResult {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _ClusterResult value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _ClusterResult() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _ClusterResult value)  $default,){
final _that = this;
switch (_that) {
case _ClusterResult():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _ClusterResult value)?  $default,){
final _that = this;
switch (_that) {
case _ClusterResult() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int totalRecords,  int nClusters,  int nNoise,  int nCorePoints,  List<ClusterItem> items,  List<ClusterHotspot> clusters)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _ClusterResult() when $default != null:
return $default(_that.totalRecords,_that.nClusters,_that.nNoise,_that.nCorePoints,_that.items,_that.clusters);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int totalRecords,  int nClusters,  int nNoise,  int nCorePoints,  List<ClusterItem> items,  List<ClusterHotspot> clusters)  $default,) {final _that = this;
switch (_that) {
case _ClusterResult():
return $default(_that.totalRecords,_that.nClusters,_that.nNoise,_that.nCorePoints,_that.items,_that.clusters);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int totalRecords,  int nClusters,  int nNoise,  int nCorePoints,  List<ClusterItem> items,  List<ClusterHotspot> clusters)?  $default,) {final _that = this;
switch (_that) {
case _ClusterResult() when $default != null:
return $default(_that.totalRecords,_that.nClusters,_that.nNoise,_that.nCorePoints,_that.items,_that.clusters);case _:
  return null;

}
}

}

/// @nodoc


class _ClusterResult implements ClusterResult {
  const _ClusterResult({required this.totalRecords, required this.nClusters, required this.nNoise, required this.nCorePoints, required final  List<ClusterItem> items, required final  List<ClusterHotspot> clusters}): _items = items,_clusters = clusters;
  

/// Tổng số bản ghi sự cố được phân tích
@override final  int totalRecords;
/// Số lượng cluster được tìm thấy (không tính noise)
@override final  int nClusters;
/// Số lượng điểm nhiễu (outliers không thuộc cluster nào)
@override final  int nNoise;
/// Số lượng điểm lõi (core points)
@override final  int nCorePoints;
/// Danh sách các điểm sự cố gốc đã được gán cluster
 final  List<ClusterItem> _items;
/// Danh sách các điểm sự cố gốc đã được gán cluster
@override List<ClusterItem> get items {
  if (_items is EqualUnmodifiableListView) return _items;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_items);
}

/// Danh sách các hotspot (vùng nguy hiểm) sau khi phân cụm
 final  List<ClusterHotspot> _clusters;
/// Danh sách các hotspot (vùng nguy hiểm) sau khi phân cụm
@override List<ClusterHotspot> get clusters {
  if (_clusters is EqualUnmodifiableListView) return _clusters;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_clusters);
}


/// Create a copy of ClusterResult
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ClusterResultCopyWith<_ClusterResult> get copyWith => __$ClusterResultCopyWithImpl<_ClusterResult>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ClusterResult&&(identical(other.totalRecords, totalRecords) || other.totalRecords == totalRecords)&&(identical(other.nClusters, nClusters) || other.nClusters == nClusters)&&(identical(other.nNoise, nNoise) || other.nNoise == nNoise)&&(identical(other.nCorePoints, nCorePoints) || other.nCorePoints == nCorePoints)&&const DeepCollectionEquality().equals(other._items, _items)&&const DeepCollectionEquality().equals(other._clusters, _clusters));
}


@override
int get hashCode => Object.hash(runtimeType,totalRecords,nClusters,nNoise,nCorePoints,const DeepCollectionEquality().hash(_items),const DeepCollectionEquality().hash(_clusters));

@override
String toString() {
  return 'ClusterResult(totalRecords: $totalRecords, nClusters: $nClusters, nNoise: $nNoise, nCorePoints: $nCorePoints, items: $items, clusters: $clusters)';
}


}

/// @nodoc
abstract mixin class _$ClusterResultCopyWith<$Res> implements $ClusterResultCopyWith<$Res> {
  factory _$ClusterResultCopyWith(_ClusterResult value, $Res Function(_ClusterResult) _then) = __$ClusterResultCopyWithImpl;
@override @useResult
$Res call({
 int totalRecords, int nClusters, int nNoise, int nCorePoints, List<ClusterItem> items, List<ClusterHotspot> clusters
});




}
/// @nodoc
class __$ClusterResultCopyWithImpl<$Res>
    implements _$ClusterResultCopyWith<$Res> {
  __$ClusterResultCopyWithImpl(this._self, this._then);

  final _ClusterResult _self;
  final $Res Function(_ClusterResult) _then;

/// Create a copy of ClusterResult
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? totalRecords = null,Object? nClusters = null,Object? nNoise = null,Object? nCorePoints = null,Object? items = null,Object? clusters = null,}) {
  return _then(_ClusterResult(
totalRecords: null == totalRecords ? _self.totalRecords : totalRecords // ignore: cast_nullable_to_non_nullable
as int,nClusters: null == nClusters ? _self.nClusters : nClusters // ignore: cast_nullable_to_non_nullable
as int,nNoise: null == nNoise ? _self.nNoise : nNoise // ignore: cast_nullable_to_non_nullable
as int,nCorePoints: null == nCorePoints ? _self.nCorePoints : nCorePoints // ignore: cast_nullable_to_non_nullable
as int,items: null == items ? _self._items : items // ignore: cast_nullable_to_non_nullable
as List<ClusterItem>,clusters: null == clusters ? _self._clusters : clusters // ignore: cast_nullable_to_non_nullable
as List<ClusterHotspot>,
  ));
}


}

/// @nodoc
mixin _$ClusterItem {

/// ID duy nhất của điểm sự cố (dạng String)
 String get id;/// Vĩ độ của điểm sự cố
 double get lat;/// Kinh độ của điểm sự cố
 double get lng;/// ID của cluster mà điểm này thuộc về
/// Giá trị -1 nghĩa là điểm nhiễu (noise/outlier)
 int get clusterId;/// Đánh dấu điểm có phải là core point hay không
/// true = core point (có đủ láng giềng), false = border point hoặc noise
 bool get isCorePoint;
/// Create a copy of ClusterItem
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ClusterItemCopyWith<ClusterItem> get copyWith => _$ClusterItemCopyWithImpl<ClusterItem>(this as ClusterItem, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ClusterItem&&(identical(other.id, id) || other.id == id)&&(identical(other.lat, lat) || other.lat == lat)&&(identical(other.lng, lng) || other.lng == lng)&&(identical(other.clusterId, clusterId) || other.clusterId == clusterId)&&(identical(other.isCorePoint, isCorePoint) || other.isCorePoint == isCorePoint));
}


@override
int get hashCode => Object.hash(runtimeType,id,lat,lng,clusterId,isCorePoint);

@override
String toString() {
  return 'ClusterItem(id: $id, lat: $lat, lng: $lng, clusterId: $clusterId, isCorePoint: $isCorePoint)';
}


}

/// @nodoc
abstract mixin class $ClusterItemCopyWith<$Res>  {
  factory $ClusterItemCopyWith(ClusterItem value, $Res Function(ClusterItem) _then) = _$ClusterItemCopyWithImpl;
@useResult
$Res call({
 String id, double lat, double lng, int clusterId, bool isCorePoint
});




}
/// @nodoc
class _$ClusterItemCopyWithImpl<$Res>
    implements $ClusterItemCopyWith<$Res> {
  _$ClusterItemCopyWithImpl(this._self, this._then);

  final ClusterItem _self;
  final $Res Function(ClusterItem) _then;

/// Create a copy of ClusterItem
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? lat = null,Object? lng = null,Object? clusterId = null,Object? isCorePoint = null,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,lat: null == lat ? _self.lat : lat // ignore: cast_nullable_to_non_nullable
as double,lng: null == lng ? _self.lng : lng // ignore: cast_nullable_to_non_nullable
as double,clusterId: null == clusterId ? _self.clusterId : clusterId // ignore: cast_nullable_to_non_nullable
as int,isCorePoint: null == isCorePoint ? _self.isCorePoint : isCorePoint // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}

}


/// Adds pattern-matching-related methods to [ClusterItem].
extension ClusterItemPatterns on ClusterItem {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _ClusterItem value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _ClusterItem() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _ClusterItem value)  $default,){
final _that = this;
switch (_that) {
case _ClusterItem():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _ClusterItem value)?  $default,){
final _that = this;
switch (_that) {
case _ClusterItem() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id,  double lat,  double lng,  int clusterId,  bool isCorePoint)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _ClusterItem() when $default != null:
return $default(_that.id,_that.lat,_that.lng,_that.clusterId,_that.isCorePoint);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id,  double lat,  double lng,  int clusterId,  bool isCorePoint)  $default,) {final _that = this;
switch (_that) {
case _ClusterItem():
return $default(_that.id,_that.lat,_that.lng,_that.clusterId,_that.isCorePoint);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id,  double lat,  double lng,  int clusterId,  bool isCorePoint)?  $default,) {final _that = this;
switch (_that) {
case _ClusterItem() when $default != null:
return $default(_that.id,_that.lat,_that.lng,_that.clusterId,_that.isCorePoint);case _:
  return null;

}
}

}

/// @nodoc


class _ClusterItem implements ClusterItem {
  const _ClusterItem({required this.id, required this.lat, required this.lng, required this.clusterId, required this.isCorePoint});
  

/// ID duy nhất của điểm sự cố (dạng String)
@override final  String id;
/// Vĩ độ của điểm sự cố
@override final  double lat;
/// Kinh độ của điểm sự cố
@override final  double lng;
/// ID của cluster mà điểm này thuộc về
/// Giá trị -1 nghĩa là điểm nhiễu (noise/outlier)
@override final  int clusterId;
/// Đánh dấu điểm có phải là core point hay không
/// true = core point (có đủ láng giềng), false = border point hoặc noise
@override final  bool isCorePoint;

/// Create a copy of ClusterItem
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ClusterItemCopyWith<_ClusterItem> get copyWith => __$ClusterItemCopyWithImpl<_ClusterItem>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ClusterItem&&(identical(other.id, id) || other.id == id)&&(identical(other.lat, lat) || other.lat == lat)&&(identical(other.lng, lng) || other.lng == lng)&&(identical(other.clusterId, clusterId) || other.clusterId == clusterId)&&(identical(other.isCorePoint, isCorePoint) || other.isCorePoint == isCorePoint));
}


@override
int get hashCode => Object.hash(runtimeType,id,lat,lng,clusterId,isCorePoint);

@override
String toString() {
  return 'ClusterItem(id: $id, lat: $lat, lng: $lng, clusterId: $clusterId, isCorePoint: $isCorePoint)';
}


}

/// @nodoc
abstract mixin class _$ClusterItemCopyWith<$Res> implements $ClusterItemCopyWith<$Res> {
  factory _$ClusterItemCopyWith(_ClusterItem value, $Res Function(_ClusterItem) _then) = __$ClusterItemCopyWithImpl;
@override @useResult
$Res call({
 String id, double lat, double lng, int clusterId, bool isCorePoint
});




}
/// @nodoc
class __$ClusterItemCopyWithImpl<$Res>
    implements _$ClusterItemCopyWith<$Res> {
  __$ClusterItemCopyWithImpl(this._self, this._then);

  final _ClusterItem _self;
  final $Res Function(_ClusterItem) _then;

/// Create a copy of ClusterItem
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? lat = null,Object? lng = null,Object? clusterId = null,Object? isCorePoint = null,}) {
  return _then(_ClusterItem(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,lat: null == lat ? _self.lat : lat // ignore: cast_nullable_to_non_nullable
as double,lng: null == lng ? _self.lng : lng // ignore: cast_nullable_to_non_nullable
as double,clusterId: null == clusterId ? _self.clusterId : clusterId // ignore: cast_nullable_to_non_nullable
as int,isCorePoint: null == isCorePoint ? _self.isCorePoint : isCorePoint // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}


}

/// @nodoc
mixin _$ClusterHotspot {

/// ID của cluster hotspot
 int get clusterId;/// Tổng số sự cố trong cluster này
 int get incidentCount;/// Danh sách ID của các sự cố thuộc cluster
 List<int> get incidentObjectIds;/// Vĩ độ tâm của cluster
 double get centerLat;/// Kinh độ tâm của cluster
 double get centerLng;/// Bán kính hiển thị hình tròn trên bản đồ (đơn vị: mét)
/// Được tính từ khoảng cách xa nhất từ tâm đến các điểm
 double get displayRadiusM;/// Bán kính ảnh hưởng khuyến nghị (đơn vị: mét)
/// Chỉ dùng tham khảo, không dùng cho routing
 double get impactRadiusM;/// Bán kính trung bình từ tâm đến các điểm (đơn vị: mét)
/// Thể hiện độ phân tán của các sự cố trong cluster
 double get avgRadiusM;/// Mật độ sự cố (số sự cố / km²)
 double get density;/// Mức độ nguy hiểm: "high", "medium", "low"
 String get severity;/// Loại cluster: "dense", "spread", "isolated"
 String get clusterType;/// Hình chữ nhật bao quanh cluster
 ClusterBBox get bbox;/// Tọa độ polygon để hiển thị khi user tap vào hotspot
/// Mỗi phần tử là [lng, lat]
 List<List<double>> get polygon;/// Thông tin hình học polygon theo chuẩn ArcGIS
 ClusterGeometry get geometry;
/// Create a copy of ClusterHotspot
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ClusterHotspotCopyWith<ClusterHotspot> get copyWith => _$ClusterHotspotCopyWithImpl<ClusterHotspot>(this as ClusterHotspot, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ClusterHotspot&&(identical(other.clusterId, clusterId) || other.clusterId == clusterId)&&(identical(other.incidentCount, incidentCount) || other.incidentCount == incidentCount)&&const DeepCollectionEquality().equals(other.incidentObjectIds, incidentObjectIds)&&(identical(other.centerLat, centerLat) || other.centerLat == centerLat)&&(identical(other.centerLng, centerLng) || other.centerLng == centerLng)&&(identical(other.displayRadiusM, displayRadiusM) || other.displayRadiusM == displayRadiusM)&&(identical(other.impactRadiusM, impactRadiusM) || other.impactRadiusM == impactRadiusM)&&(identical(other.avgRadiusM, avgRadiusM) || other.avgRadiusM == avgRadiusM)&&(identical(other.density, density) || other.density == density)&&(identical(other.severity, severity) || other.severity == severity)&&(identical(other.clusterType, clusterType) || other.clusterType == clusterType)&&(identical(other.bbox, bbox) || other.bbox == bbox)&&const DeepCollectionEquality().equals(other.polygon, polygon)&&(identical(other.geometry, geometry) || other.geometry == geometry));
}


@override
int get hashCode => Object.hash(runtimeType,clusterId,incidentCount,const DeepCollectionEquality().hash(incidentObjectIds),centerLat,centerLng,displayRadiusM,impactRadiusM,avgRadiusM,density,severity,clusterType,bbox,const DeepCollectionEquality().hash(polygon),geometry);

@override
String toString() {
  return 'ClusterHotspot(clusterId: $clusterId, incidentCount: $incidentCount, incidentObjectIds: $incidentObjectIds, centerLat: $centerLat, centerLng: $centerLng, displayRadiusM: $displayRadiusM, impactRadiusM: $impactRadiusM, avgRadiusM: $avgRadiusM, density: $density, severity: $severity, clusterType: $clusterType, bbox: $bbox, polygon: $polygon, geometry: $geometry)';
}


}

/// @nodoc
abstract mixin class $ClusterHotspotCopyWith<$Res>  {
  factory $ClusterHotspotCopyWith(ClusterHotspot value, $Res Function(ClusterHotspot) _then) = _$ClusterHotspotCopyWithImpl;
@useResult
$Res call({
 int clusterId, int incidentCount, List<int> incidentObjectIds, double centerLat, double centerLng, double displayRadiusM, double impactRadiusM, double avgRadiusM, double density, String severity, String clusterType, ClusterBBox bbox, List<List<double>> polygon, ClusterGeometry geometry
});


$ClusterBBoxCopyWith<$Res> get bbox;$ClusterGeometryCopyWith<$Res> get geometry;

}
/// @nodoc
class _$ClusterHotspotCopyWithImpl<$Res>
    implements $ClusterHotspotCopyWith<$Res> {
  _$ClusterHotspotCopyWithImpl(this._self, this._then);

  final ClusterHotspot _self;
  final $Res Function(ClusterHotspot) _then;

/// Create a copy of ClusterHotspot
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? clusterId = null,Object? incidentCount = null,Object? incidentObjectIds = null,Object? centerLat = null,Object? centerLng = null,Object? displayRadiusM = null,Object? impactRadiusM = null,Object? avgRadiusM = null,Object? density = null,Object? severity = null,Object? clusterType = null,Object? bbox = null,Object? polygon = null,Object? geometry = null,}) {
  return _then(_self.copyWith(
clusterId: null == clusterId ? _self.clusterId : clusterId // ignore: cast_nullable_to_non_nullable
as int,incidentCount: null == incidentCount ? _self.incidentCount : incidentCount // ignore: cast_nullable_to_non_nullable
as int,incidentObjectIds: null == incidentObjectIds ? _self.incidentObjectIds : incidentObjectIds // ignore: cast_nullable_to_non_nullable
as List<int>,centerLat: null == centerLat ? _self.centerLat : centerLat // ignore: cast_nullable_to_non_nullable
as double,centerLng: null == centerLng ? _self.centerLng : centerLng // ignore: cast_nullable_to_non_nullable
as double,displayRadiusM: null == displayRadiusM ? _self.displayRadiusM : displayRadiusM // ignore: cast_nullable_to_non_nullable
as double,impactRadiusM: null == impactRadiusM ? _self.impactRadiusM : impactRadiusM // ignore: cast_nullable_to_non_nullable
as double,avgRadiusM: null == avgRadiusM ? _self.avgRadiusM : avgRadiusM // ignore: cast_nullable_to_non_nullable
as double,density: null == density ? _self.density : density // ignore: cast_nullable_to_non_nullable
as double,severity: null == severity ? _self.severity : severity // ignore: cast_nullable_to_non_nullable
as String,clusterType: null == clusterType ? _self.clusterType : clusterType // ignore: cast_nullable_to_non_nullable
as String,bbox: null == bbox ? _self.bbox : bbox // ignore: cast_nullable_to_non_nullable
as ClusterBBox,polygon: null == polygon ? _self.polygon : polygon // ignore: cast_nullable_to_non_nullable
as List<List<double>>,geometry: null == geometry ? _self.geometry : geometry // ignore: cast_nullable_to_non_nullable
as ClusterGeometry,
  ));
}
/// Create a copy of ClusterHotspot
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$ClusterBBoxCopyWith<$Res> get bbox {
  
  return $ClusterBBoxCopyWith<$Res>(_self.bbox, (value) {
    return _then(_self.copyWith(bbox: value));
  });
}/// Create a copy of ClusterHotspot
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$ClusterGeometryCopyWith<$Res> get geometry {
  
  return $ClusterGeometryCopyWith<$Res>(_self.geometry, (value) {
    return _then(_self.copyWith(geometry: value));
  });
}
}


/// Adds pattern-matching-related methods to [ClusterHotspot].
extension ClusterHotspotPatterns on ClusterHotspot {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _ClusterHotspot value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _ClusterHotspot() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _ClusterHotspot value)  $default,){
final _that = this;
switch (_that) {
case _ClusterHotspot():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _ClusterHotspot value)?  $default,){
final _that = this;
switch (_that) {
case _ClusterHotspot() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int clusterId,  int incidentCount,  List<int> incidentObjectIds,  double centerLat,  double centerLng,  double displayRadiusM,  double impactRadiusM,  double avgRadiusM,  double density,  String severity,  String clusterType,  ClusterBBox bbox,  List<List<double>> polygon,  ClusterGeometry geometry)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _ClusterHotspot() when $default != null:
return $default(_that.clusterId,_that.incidentCount,_that.incidentObjectIds,_that.centerLat,_that.centerLng,_that.displayRadiusM,_that.impactRadiusM,_that.avgRadiusM,_that.density,_that.severity,_that.clusterType,_that.bbox,_that.polygon,_that.geometry);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int clusterId,  int incidentCount,  List<int> incidentObjectIds,  double centerLat,  double centerLng,  double displayRadiusM,  double impactRadiusM,  double avgRadiusM,  double density,  String severity,  String clusterType,  ClusterBBox bbox,  List<List<double>> polygon,  ClusterGeometry geometry)  $default,) {final _that = this;
switch (_that) {
case _ClusterHotspot():
return $default(_that.clusterId,_that.incidentCount,_that.incidentObjectIds,_that.centerLat,_that.centerLng,_that.displayRadiusM,_that.impactRadiusM,_that.avgRadiusM,_that.density,_that.severity,_that.clusterType,_that.bbox,_that.polygon,_that.geometry);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int clusterId,  int incidentCount,  List<int> incidentObjectIds,  double centerLat,  double centerLng,  double displayRadiusM,  double impactRadiusM,  double avgRadiusM,  double density,  String severity,  String clusterType,  ClusterBBox bbox,  List<List<double>> polygon,  ClusterGeometry geometry)?  $default,) {final _that = this;
switch (_that) {
case _ClusterHotspot() when $default != null:
return $default(_that.clusterId,_that.incidentCount,_that.incidentObjectIds,_that.centerLat,_that.centerLng,_that.displayRadiusM,_that.impactRadiusM,_that.avgRadiusM,_that.density,_that.severity,_that.clusterType,_that.bbox,_that.polygon,_that.geometry);case _:
  return null;

}
}

}

/// @nodoc


class _ClusterHotspot implements ClusterHotspot {
  const _ClusterHotspot({required this.clusterId, required this.incidentCount, required final  List<int> incidentObjectIds, required this.centerLat, required this.centerLng, required this.displayRadiusM, required this.impactRadiusM, required this.avgRadiusM, required this.density, required this.severity, required this.clusterType, required this.bbox, required final  List<List<double>> polygon, required this.geometry}): _incidentObjectIds = incidentObjectIds,_polygon = polygon;
  

/// ID của cluster hotspot
@override final  int clusterId;
/// Tổng số sự cố trong cluster này
@override final  int incidentCount;
/// Danh sách ID của các sự cố thuộc cluster
 final  List<int> _incidentObjectIds;
/// Danh sách ID của các sự cố thuộc cluster
@override List<int> get incidentObjectIds {
  if (_incidentObjectIds is EqualUnmodifiableListView) return _incidentObjectIds;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_incidentObjectIds);
}

/// Vĩ độ tâm của cluster
@override final  double centerLat;
/// Kinh độ tâm của cluster
@override final  double centerLng;
/// Bán kính hiển thị hình tròn trên bản đồ (đơn vị: mét)
/// Được tính từ khoảng cách xa nhất từ tâm đến các điểm
@override final  double displayRadiusM;
/// Bán kính ảnh hưởng khuyến nghị (đơn vị: mét)
/// Chỉ dùng tham khảo, không dùng cho routing
@override final  double impactRadiusM;
/// Bán kính trung bình từ tâm đến các điểm (đơn vị: mét)
/// Thể hiện độ phân tán của các sự cố trong cluster
@override final  double avgRadiusM;
/// Mật độ sự cố (số sự cố / km²)
@override final  double density;
/// Mức độ nguy hiểm: "high", "medium", "low"
@override final  String severity;
/// Loại cluster: "dense", "spread", "isolated"
@override final  String clusterType;
/// Hình chữ nhật bao quanh cluster
@override final  ClusterBBox bbox;
/// Tọa độ polygon để hiển thị khi user tap vào hotspot
/// Mỗi phần tử là [lng, lat]
 final  List<List<double>> _polygon;
/// Tọa độ polygon để hiển thị khi user tap vào hotspot
/// Mỗi phần tử là [lng, lat]
@override List<List<double>> get polygon {
  if (_polygon is EqualUnmodifiableListView) return _polygon;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_polygon);
}

/// Thông tin hình học polygon theo chuẩn ArcGIS
@override final  ClusterGeometry geometry;

/// Create a copy of ClusterHotspot
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ClusterHotspotCopyWith<_ClusterHotspot> get copyWith => __$ClusterHotspotCopyWithImpl<_ClusterHotspot>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ClusterHotspot&&(identical(other.clusterId, clusterId) || other.clusterId == clusterId)&&(identical(other.incidentCount, incidentCount) || other.incidentCount == incidentCount)&&const DeepCollectionEquality().equals(other._incidentObjectIds, _incidentObjectIds)&&(identical(other.centerLat, centerLat) || other.centerLat == centerLat)&&(identical(other.centerLng, centerLng) || other.centerLng == centerLng)&&(identical(other.displayRadiusM, displayRadiusM) || other.displayRadiusM == displayRadiusM)&&(identical(other.impactRadiusM, impactRadiusM) || other.impactRadiusM == impactRadiusM)&&(identical(other.avgRadiusM, avgRadiusM) || other.avgRadiusM == avgRadiusM)&&(identical(other.density, density) || other.density == density)&&(identical(other.severity, severity) || other.severity == severity)&&(identical(other.clusterType, clusterType) || other.clusterType == clusterType)&&(identical(other.bbox, bbox) || other.bbox == bbox)&&const DeepCollectionEquality().equals(other._polygon, _polygon)&&(identical(other.geometry, geometry) || other.geometry == geometry));
}


@override
int get hashCode => Object.hash(runtimeType,clusterId,incidentCount,const DeepCollectionEquality().hash(_incidentObjectIds),centerLat,centerLng,displayRadiusM,impactRadiusM,avgRadiusM,density,severity,clusterType,bbox,const DeepCollectionEquality().hash(_polygon),geometry);

@override
String toString() {
  return 'ClusterHotspot(clusterId: $clusterId, incidentCount: $incidentCount, incidentObjectIds: $incidentObjectIds, centerLat: $centerLat, centerLng: $centerLng, displayRadiusM: $displayRadiusM, impactRadiusM: $impactRadiusM, avgRadiusM: $avgRadiusM, density: $density, severity: $severity, clusterType: $clusterType, bbox: $bbox, polygon: $polygon, geometry: $geometry)';
}


}

/// @nodoc
abstract mixin class _$ClusterHotspotCopyWith<$Res> implements $ClusterHotspotCopyWith<$Res> {
  factory _$ClusterHotspotCopyWith(_ClusterHotspot value, $Res Function(_ClusterHotspot) _then) = __$ClusterHotspotCopyWithImpl;
@override @useResult
$Res call({
 int clusterId, int incidentCount, List<int> incidentObjectIds, double centerLat, double centerLng, double displayRadiusM, double impactRadiusM, double avgRadiusM, double density, String severity, String clusterType, ClusterBBox bbox, List<List<double>> polygon, ClusterGeometry geometry
});


@override $ClusterBBoxCopyWith<$Res> get bbox;@override $ClusterGeometryCopyWith<$Res> get geometry;

}
/// @nodoc
class __$ClusterHotspotCopyWithImpl<$Res>
    implements _$ClusterHotspotCopyWith<$Res> {
  __$ClusterHotspotCopyWithImpl(this._self, this._then);

  final _ClusterHotspot _self;
  final $Res Function(_ClusterHotspot) _then;

/// Create a copy of ClusterHotspot
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? clusterId = null,Object? incidentCount = null,Object? incidentObjectIds = null,Object? centerLat = null,Object? centerLng = null,Object? displayRadiusM = null,Object? impactRadiusM = null,Object? avgRadiusM = null,Object? density = null,Object? severity = null,Object? clusterType = null,Object? bbox = null,Object? polygon = null,Object? geometry = null,}) {
  return _then(_ClusterHotspot(
clusterId: null == clusterId ? _self.clusterId : clusterId // ignore: cast_nullable_to_non_nullable
as int,incidentCount: null == incidentCount ? _self.incidentCount : incidentCount // ignore: cast_nullable_to_non_nullable
as int,incidentObjectIds: null == incidentObjectIds ? _self._incidentObjectIds : incidentObjectIds // ignore: cast_nullable_to_non_nullable
as List<int>,centerLat: null == centerLat ? _self.centerLat : centerLat // ignore: cast_nullable_to_non_nullable
as double,centerLng: null == centerLng ? _self.centerLng : centerLng // ignore: cast_nullable_to_non_nullable
as double,displayRadiusM: null == displayRadiusM ? _self.displayRadiusM : displayRadiusM // ignore: cast_nullable_to_non_nullable
as double,impactRadiusM: null == impactRadiusM ? _self.impactRadiusM : impactRadiusM // ignore: cast_nullable_to_non_nullable
as double,avgRadiusM: null == avgRadiusM ? _self.avgRadiusM : avgRadiusM // ignore: cast_nullable_to_non_nullable
as double,density: null == density ? _self.density : density // ignore: cast_nullable_to_non_nullable
as double,severity: null == severity ? _self.severity : severity // ignore: cast_nullable_to_non_nullable
as String,clusterType: null == clusterType ? _self.clusterType : clusterType // ignore: cast_nullable_to_non_nullable
as String,bbox: null == bbox ? _self.bbox : bbox // ignore: cast_nullable_to_non_nullable
as ClusterBBox,polygon: null == polygon ? _self._polygon : polygon // ignore: cast_nullable_to_non_nullable
as List<List<double>>,geometry: null == geometry ? _self.geometry : geometry // ignore: cast_nullable_to_non_nullable
as ClusterGeometry,
  ));
}

/// Create a copy of ClusterHotspot
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$ClusterBBoxCopyWith<$Res> get bbox {
  
  return $ClusterBBoxCopyWith<$Res>(_self.bbox, (value) {
    return _then(_self.copyWith(bbox: value));
  });
}/// Create a copy of ClusterHotspot
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$ClusterGeometryCopyWith<$Res> get geometry {
  
  return $ClusterGeometryCopyWith<$Res>(_self.geometry, (value) {
    return _then(_self.copyWith(geometry: value));
  });
}
}

/// @nodoc
mixin _$ClusterBBox {

/// Kinh độ nhỏ nhất (cạnh trái)
 double get xmin;/// Vĩ độ nhỏ nhất (cạnh dưới)
 double get ymin;/// Kinh độ lớn nhất (cạnh phải)
 double get xmax;/// Vĩ độ lớn nhất (cạnh trên)
 double get ymax;
/// Create a copy of ClusterBBox
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ClusterBBoxCopyWith<ClusterBBox> get copyWith => _$ClusterBBoxCopyWithImpl<ClusterBBox>(this as ClusterBBox, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ClusterBBox&&(identical(other.xmin, xmin) || other.xmin == xmin)&&(identical(other.ymin, ymin) || other.ymin == ymin)&&(identical(other.xmax, xmax) || other.xmax == xmax)&&(identical(other.ymax, ymax) || other.ymax == ymax));
}


@override
int get hashCode => Object.hash(runtimeType,xmin,ymin,xmax,ymax);

@override
String toString() {
  return 'ClusterBBox(xmin: $xmin, ymin: $ymin, xmax: $xmax, ymax: $ymax)';
}


}

/// @nodoc
abstract mixin class $ClusterBBoxCopyWith<$Res>  {
  factory $ClusterBBoxCopyWith(ClusterBBox value, $Res Function(ClusterBBox) _then) = _$ClusterBBoxCopyWithImpl;
@useResult
$Res call({
 double xmin, double ymin, double xmax, double ymax
});




}
/// @nodoc
class _$ClusterBBoxCopyWithImpl<$Res>
    implements $ClusterBBoxCopyWith<$Res> {
  _$ClusterBBoxCopyWithImpl(this._self, this._then);

  final ClusterBBox _self;
  final $Res Function(ClusterBBox) _then;

/// Create a copy of ClusterBBox
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? xmin = null,Object? ymin = null,Object? xmax = null,Object? ymax = null,}) {
  return _then(_self.copyWith(
xmin: null == xmin ? _self.xmin : xmin // ignore: cast_nullable_to_non_nullable
as double,ymin: null == ymin ? _self.ymin : ymin // ignore: cast_nullable_to_non_nullable
as double,xmax: null == xmax ? _self.xmax : xmax // ignore: cast_nullable_to_non_nullable
as double,ymax: null == ymax ? _self.ymax : ymax // ignore: cast_nullable_to_non_nullable
as double,
  ));
}

}


/// Adds pattern-matching-related methods to [ClusterBBox].
extension ClusterBBoxPatterns on ClusterBBox {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _ClusterBBox value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _ClusterBBox() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _ClusterBBox value)  $default,){
final _that = this;
switch (_that) {
case _ClusterBBox():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _ClusterBBox value)?  $default,){
final _that = this;
switch (_that) {
case _ClusterBBox() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( double xmin,  double ymin,  double xmax,  double ymax)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _ClusterBBox() when $default != null:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( double xmin,  double ymin,  double xmax,  double ymax)  $default,) {final _that = this;
switch (_that) {
case _ClusterBBox():
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( double xmin,  double ymin,  double xmax,  double ymax)?  $default,) {final _that = this;
switch (_that) {
case _ClusterBBox() when $default != null:
return $default(_that.xmin,_that.ymin,_that.xmax,_that.ymax);case _:
  return null;

}
}

}

/// @nodoc


class _ClusterBBox implements ClusterBBox {
  const _ClusterBBox({required this.xmin, required this.ymin, required this.xmax, required this.ymax});
  

/// Kinh độ nhỏ nhất (cạnh trái)
@override final  double xmin;
/// Vĩ độ nhỏ nhất (cạnh dưới)
@override final  double ymin;
/// Kinh độ lớn nhất (cạnh phải)
@override final  double xmax;
/// Vĩ độ lớn nhất (cạnh trên)
@override final  double ymax;

/// Create a copy of ClusterBBox
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ClusterBBoxCopyWith<_ClusterBBox> get copyWith => __$ClusterBBoxCopyWithImpl<_ClusterBBox>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ClusterBBox&&(identical(other.xmin, xmin) || other.xmin == xmin)&&(identical(other.ymin, ymin) || other.ymin == ymin)&&(identical(other.xmax, xmax) || other.xmax == xmax)&&(identical(other.ymax, ymax) || other.ymax == ymax));
}


@override
int get hashCode => Object.hash(runtimeType,xmin,ymin,xmax,ymax);

@override
String toString() {
  return 'ClusterBBox(xmin: $xmin, ymin: $ymin, xmax: $xmax, ymax: $ymax)';
}


}

/// @nodoc
abstract mixin class _$ClusterBBoxCopyWith<$Res> implements $ClusterBBoxCopyWith<$Res> {
  factory _$ClusterBBoxCopyWith(_ClusterBBox value, $Res Function(_ClusterBBox) _then) = __$ClusterBBoxCopyWithImpl;
@override @useResult
$Res call({
 double xmin, double ymin, double xmax, double ymax
});




}
/// @nodoc
class __$ClusterBBoxCopyWithImpl<$Res>
    implements _$ClusterBBoxCopyWith<$Res> {
  __$ClusterBBoxCopyWithImpl(this._self, this._then);

  final _ClusterBBox _self;
  final $Res Function(_ClusterBBox) _then;

/// Create a copy of ClusterBBox
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? xmin = null,Object? ymin = null,Object? xmax = null,Object? ymax = null,}) {
  return _then(_ClusterBBox(
xmin: null == xmin ? _self.xmin : xmin // ignore: cast_nullable_to_non_nullable
as double,ymin: null == ymin ? _self.ymin : ymin // ignore: cast_nullable_to_non_nullable
as double,xmax: null == xmax ? _self.xmax : xmax // ignore: cast_nullable_to_non_nullable
as double,ymax: null == ymax ? _self.ymax : ymax // ignore: cast_nullable_to_non_nullable
as double,
  ));
}


}

/// @nodoc
mixin _$ClusterGeometry {

/// Danh sách các rings tạo thành polygon
/// Mỗi ring là một mảng các tọa độ [lng, lat]
/// Ring đầu tiên là outer ring, các ring sau (nếu có) là holes
 List<List<List<double>>> get rings;/// Well-Known ID của hệ tọa độ không gian
/// Ví dụ: 4326 = WGS84, 3857 = Web Mercator
 int get wkid;
/// Create a copy of ClusterGeometry
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ClusterGeometryCopyWith<ClusterGeometry> get copyWith => _$ClusterGeometryCopyWithImpl<ClusterGeometry>(this as ClusterGeometry, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ClusterGeometry&&const DeepCollectionEquality().equals(other.rings, rings)&&(identical(other.wkid, wkid) || other.wkid == wkid));
}


@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(rings),wkid);

@override
String toString() {
  return 'ClusterGeometry(rings: $rings, wkid: $wkid)';
}


}

/// @nodoc
abstract mixin class $ClusterGeometryCopyWith<$Res>  {
  factory $ClusterGeometryCopyWith(ClusterGeometry value, $Res Function(ClusterGeometry) _then) = _$ClusterGeometryCopyWithImpl;
@useResult
$Res call({
 List<List<List<double>>> rings, int wkid
});




}
/// @nodoc
class _$ClusterGeometryCopyWithImpl<$Res>
    implements $ClusterGeometryCopyWith<$Res> {
  _$ClusterGeometryCopyWithImpl(this._self, this._then);

  final ClusterGeometry _self;
  final $Res Function(ClusterGeometry) _then;

/// Create a copy of ClusterGeometry
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? rings = null,Object? wkid = null,}) {
  return _then(_self.copyWith(
rings: null == rings ? _self.rings : rings // ignore: cast_nullable_to_non_nullable
as List<List<List<double>>>,wkid: null == wkid ? _self.wkid : wkid // ignore: cast_nullable_to_non_nullable
as int,
  ));
}

}


/// Adds pattern-matching-related methods to [ClusterGeometry].
extension ClusterGeometryPatterns on ClusterGeometry {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _ClusterGeometry value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _ClusterGeometry() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _ClusterGeometry value)  $default,){
final _that = this;
switch (_that) {
case _ClusterGeometry():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _ClusterGeometry value)?  $default,){
final _that = this;
switch (_that) {
case _ClusterGeometry() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( List<List<List<double>>> rings,  int wkid)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _ClusterGeometry() when $default != null:
return $default(_that.rings,_that.wkid);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( List<List<List<double>>> rings,  int wkid)  $default,) {final _that = this;
switch (_that) {
case _ClusterGeometry():
return $default(_that.rings,_that.wkid);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( List<List<List<double>>> rings,  int wkid)?  $default,) {final _that = this;
switch (_that) {
case _ClusterGeometry() when $default != null:
return $default(_that.rings,_that.wkid);case _:
  return null;

}
}

}

/// @nodoc


class _ClusterGeometry implements ClusterGeometry {
  const _ClusterGeometry({required final  List<List<List<double>>> rings, required this.wkid}): _rings = rings;
  

/// Danh sách các rings tạo thành polygon
/// Mỗi ring là một mảng các tọa độ [lng, lat]
/// Ring đầu tiên là outer ring, các ring sau (nếu có) là holes
 final  List<List<List<double>>> _rings;
/// Danh sách các rings tạo thành polygon
/// Mỗi ring là một mảng các tọa độ [lng, lat]
/// Ring đầu tiên là outer ring, các ring sau (nếu có) là holes
@override List<List<List<double>>> get rings {
  if (_rings is EqualUnmodifiableListView) return _rings;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_rings);
}

/// Well-Known ID của hệ tọa độ không gian
/// Ví dụ: 4326 = WGS84, 3857 = Web Mercator
@override final  int wkid;

/// Create a copy of ClusterGeometry
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ClusterGeometryCopyWith<_ClusterGeometry> get copyWith => __$ClusterGeometryCopyWithImpl<_ClusterGeometry>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ClusterGeometry&&const DeepCollectionEquality().equals(other._rings, _rings)&&(identical(other.wkid, wkid) || other.wkid == wkid));
}


@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(_rings),wkid);

@override
String toString() {
  return 'ClusterGeometry(rings: $rings, wkid: $wkid)';
}


}

/// @nodoc
abstract mixin class _$ClusterGeometryCopyWith<$Res> implements $ClusterGeometryCopyWith<$Res> {
  factory _$ClusterGeometryCopyWith(_ClusterGeometry value, $Res Function(_ClusterGeometry) _then) = __$ClusterGeometryCopyWithImpl;
@override @useResult
$Res call({
 List<List<List<double>>> rings, int wkid
});




}
/// @nodoc
class __$ClusterGeometryCopyWithImpl<$Res>
    implements _$ClusterGeometryCopyWith<$Res> {
  __$ClusterGeometryCopyWithImpl(this._self, this._then);

  final _ClusterGeometry _self;
  final $Res Function(_ClusterGeometry) _then;

/// Create a copy of ClusterGeometry
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? rings = null,Object? wkid = null,}) {
  return _then(_ClusterGeometry(
rings: null == rings ? _self._rings : rings // ignore: cast_nullable_to_non_nullable
as List<List<List<double>>>,wkid: null == wkid ? _self.wkid : wkid // ignore: cast_nullable_to_non_nullable
as int,
  ));
}


}

// dart format on
