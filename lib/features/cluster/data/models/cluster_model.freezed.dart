// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'cluster_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$ClusterResponseModel {

/// Trạng thái response: "success" hoặc "error"
 String get status;/// Thông báo mô tả kết quả
 String get message;/// Tổng số bản ghi sự cố được phân tích
@JsonKey(name: 'total_records') int get totalRecords;/// Thông tin tổng quan về quá trình phân cụm
@JsonKey(name: 'clustering_info') ClusteringInfoModel get clusteringInfo;/// Danh sách các cluster/hotspot đã được phân cụm
@JsonKey(name: 'clusters') List<ClusterHotspotModel> get clusters;/// Danh sách các điểm sự cố gốc với thông tin cluster được gán
@JsonKey(name: 'data') List<ClusterItemModel> get data;
/// Create a copy of ClusterResponseModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ClusterResponseModelCopyWith<ClusterResponseModel> get copyWith => _$ClusterResponseModelCopyWithImpl<ClusterResponseModel>(this as ClusterResponseModel, _$identity);

  /// Serializes this ClusterResponseModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ClusterResponseModel&&(identical(other.status, status) || other.status == status)&&(identical(other.message, message) || other.message == message)&&(identical(other.totalRecords, totalRecords) || other.totalRecords == totalRecords)&&(identical(other.clusteringInfo, clusteringInfo) || other.clusteringInfo == clusteringInfo)&&const DeepCollectionEquality().equals(other.clusters, clusters)&&const DeepCollectionEquality().equals(other.data, data));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,status,message,totalRecords,clusteringInfo,const DeepCollectionEquality().hash(clusters),const DeepCollectionEquality().hash(data));

@override
String toString() {
  return 'ClusterResponseModel(status: $status, message: $message, totalRecords: $totalRecords, clusteringInfo: $clusteringInfo, clusters: $clusters, data: $data)';
}


}

/// @nodoc
abstract mixin class $ClusterResponseModelCopyWith<$Res>  {
  factory $ClusterResponseModelCopyWith(ClusterResponseModel value, $Res Function(ClusterResponseModel) _then) = _$ClusterResponseModelCopyWithImpl;
@useResult
$Res call({
 String status, String message,@JsonKey(name: 'total_records') int totalRecords,@JsonKey(name: 'clustering_info') ClusteringInfoModel clusteringInfo,@JsonKey(name: 'clusters') List<ClusterHotspotModel> clusters,@JsonKey(name: 'data') List<ClusterItemModel> data
});


$ClusteringInfoModelCopyWith<$Res> get clusteringInfo;

}
/// @nodoc
class _$ClusterResponseModelCopyWithImpl<$Res>
    implements $ClusterResponseModelCopyWith<$Res> {
  _$ClusterResponseModelCopyWithImpl(this._self, this._then);

  final ClusterResponseModel _self;
  final $Res Function(ClusterResponseModel) _then;

/// Create a copy of ClusterResponseModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? status = null,Object? message = null,Object? totalRecords = null,Object? clusteringInfo = null,Object? clusters = null,Object? data = null,}) {
  return _then(_self.copyWith(
status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as String,message: null == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String,totalRecords: null == totalRecords ? _self.totalRecords : totalRecords // ignore: cast_nullable_to_non_nullable
as int,clusteringInfo: null == clusteringInfo ? _self.clusteringInfo : clusteringInfo // ignore: cast_nullable_to_non_nullable
as ClusteringInfoModel,clusters: null == clusters ? _self.clusters : clusters // ignore: cast_nullable_to_non_nullable
as List<ClusterHotspotModel>,data: null == data ? _self.data : data // ignore: cast_nullable_to_non_nullable
as List<ClusterItemModel>,
  ));
}
/// Create a copy of ClusterResponseModel
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$ClusteringInfoModelCopyWith<$Res> get clusteringInfo {
  
  return $ClusteringInfoModelCopyWith<$Res>(_self.clusteringInfo, (value) {
    return _then(_self.copyWith(clusteringInfo: value));
  });
}
}


/// Adds pattern-matching-related methods to [ClusterResponseModel].
extension ClusterResponseModelPatterns on ClusterResponseModel {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _ClusterResponseModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _ClusterResponseModel() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _ClusterResponseModel value)  $default,){
final _that = this;
switch (_that) {
case _ClusterResponseModel():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _ClusterResponseModel value)?  $default,){
final _that = this;
switch (_that) {
case _ClusterResponseModel() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String status,  String message, @JsonKey(name: 'total_records')  int totalRecords, @JsonKey(name: 'clustering_info')  ClusteringInfoModel clusteringInfo, @JsonKey(name: 'clusters')  List<ClusterHotspotModel> clusters, @JsonKey(name: 'data')  List<ClusterItemModel> data)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _ClusterResponseModel() when $default != null:
return $default(_that.status,_that.message,_that.totalRecords,_that.clusteringInfo,_that.clusters,_that.data);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String status,  String message, @JsonKey(name: 'total_records')  int totalRecords, @JsonKey(name: 'clustering_info')  ClusteringInfoModel clusteringInfo, @JsonKey(name: 'clusters')  List<ClusterHotspotModel> clusters, @JsonKey(name: 'data')  List<ClusterItemModel> data)  $default,) {final _that = this;
switch (_that) {
case _ClusterResponseModel():
return $default(_that.status,_that.message,_that.totalRecords,_that.clusteringInfo,_that.clusters,_that.data);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String status,  String message, @JsonKey(name: 'total_records')  int totalRecords, @JsonKey(name: 'clustering_info')  ClusteringInfoModel clusteringInfo, @JsonKey(name: 'clusters')  List<ClusterHotspotModel> clusters, @JsonKey(name: 'data')  List<ClusterItemModel> data)?  $default,) {final _that = this;
switch (_that) {
case _ClusterResponseModel() when $default != null:
return $default(_that.status,_that.message,_that.totalRecords,_that.clusteringInfo,_that.clusters,_that.data);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _ClusterResponseModel extends ClusterResponseModel {
  const _ClusterResponseModel({required this.status, required this.message, @JsonKey(name: 'total_records') required this.totalRecords, @JsonKey(name: 'clustering_info') required this.clusteringInfo, @JsonKey(name: 'clusters') required final  List<ClusterHotspotModel> clusters, @JsonKey(name: 'data') required final  List<ClusterItemModel> data}): _clusters = clusters,_data = data,super._();
  factory _ClusterResponseModel.fromJson(Map<String, dynamic> json) => _$ClusterResponseModelFromJson(json);

/// Trạng thái response: "success" hoặc "error"
@override final  String status;
/// Thông báo mô tả kết quả
@override final  String message;
/// Tổng số bản ghi sự cố được phân tích
@override@JsonKey(name: 'total_records') final  int totalRecords;
/// Thông tin tổng quan về quá trình phân cụm
@override@JsonKey(name: 'clustering_info') final  ClusteringInfoModel clusteringInfo;
/// Danh sách các cluster/hotspot đã được phân cụm
 final  List<ClusterHotspotModel> _clusters;
/// Danh sách các cluster/hotspot đã được phân cụm
@override@JsonKey(name: 'clusters') List<ClusterHotspotModel> get clusters {
  if (_clusters is EqualUnmodifiableListView) return _clusters;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_clusters);
}

/// Danh sách các điểm sự cố gốc với thông tin cluster được gán
 final  List<ClusterItemModel> _data;
/// Danh sách các điểm sự cố gốc với thông tin cluster được gán
@override@JsonKey(name: 'data') List<ClusterItemModel> get data {
  if (_data is EqualUnmodifiableListView) return _data;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_data);
}


/// Create a copy of ClusterResponseModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ClusterResponseModelCopyWith<_ClusterResponseModel> get copyWith => __$ClusterResponseModelCopyWithImpl<_ClusterResponseModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$ClusterResponseModelToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ClusterResponseModel&&(identical(other.status, status) || other.status == status)&&(identical(other.message, message) || other.message == message)&&(identical(other.totalRecords, totalRecords) || other.totalRecords == totalRecords)&&(identical(other.clusteringInfo, clusteringInfo) || other.clusteringInfo == clusteringInfo)&&const DeepCollectionEquality().equals(other._clusters, _clusters)&&const DeepCollectionEquality().equals(other._data, _data));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,status,message,totalRecords,clusteringInfo,const DeepCollectionEquality().hash(_clusters),const DeepCollectionEquality().hash(_data));

@override
String toString() {
  return 'ClusterResponseModel(status: $status, message: $message, totalRecords: $totalRecords, clusteringInfo: $clusteringInfo, clusters: $clusters, data: $data)';
}


}

/// @nodoc
abstract mixin class _$ClusterResponseModelCopyWith<$Res> implements $ClusterResponseModelCopyWith<$Res> {
  factory _$ClusterResponseModelCopyWith(_ClusterResponseModel value, $Res Function(_ClusterResponseModel) _then) = __$ClusterResponseModelCopyWithImpl;
@override @useResult
$Res call({
 String status, String message,@JsonKey(name: 'total_records') int totalRecords,@JsonKey(name: 'clustering_info') ClusteringInfoModel clusteringInfo,@JsonKey(name: 'clusters') List<ClusterHotspotModel> clusters,@JsonKey(name: 'data') List<ClusterItemModel> data
});


@override $ClusteringInfoModelCopyWith<$Res> get clusteringInfo;

}
/// @nodoc
class __$ClusterResponseModelCopyWithImpl<$Res>
    implements _$ClusterResponseModelCopyWith<$Res> {
  __$ClusterResponseModelCopyWithImpl(this._self, this._then);

  final _ClusterResponseModel _self;
  final $Res Function(_ClusterResponseModel) _then;

/// Create a copy of ClusterResponseModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? status = null,Object? message = null,Object? totalRecords = null,Object? clusteringInfo = null,Object? clusters = null,Object? data = null,}) {
  return _then(_ClusterResponseModel(
status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as String,message: null == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String,totalRecords: null == totalRecords ? _self.totalRecords : totalRecords // ignore: cast_nullable_to_non_nullable
as int,clusteringInfo: null == clusteringInfo ? _self.clusteringInfo : clusteringInfo // ignore: cast_nullable_to_non_nullable
as ClusteringInfoModel,clusters: null == clusters ? _self._clusters : clusters // ignore: cast_nullable_to_non_nullable
as List<ClusterHotspotModel>,data: null == data ? _self._data : data // ignore: cast_nullable_to_non_nullable
as List<ClusterItemModel>,
  ));
}

/// Create a copy of ClusterResponseModel
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$ClusteringInfoModelCopyWith<$Res> get clusteringInfo {
  
  return $ClusteringInfoModelCopyWith<$Res>(_self.clusteringInfo, (value) {
    return _then(_self.copyWith(clusteringInfo: value));
  });
}
}


/// @nodoc
mixin _$ClusteringInfoModel {

/// Thuật toán được sử dụng (ví dụ: "DBSCAN")
 String get algorithm;/// Bán kính epsilon của thuật toán DBSCAN (đơn vị: mét)
/// Quyết định khoảng cách tối đa giữa 2 điểm để được coi là cùng cluster
 double get eps;/// Số lượng cluster tìm được (không tính noise)
@JsonKey(name: 'n_clusters') int get nClusters;/// Số lượng điểm nhiễu (outliers không thuộc cluster nào)
@JsonKey(name: 'n_noise') int get nNoise;/// Số lượng điểm lõi (core points) - điểm có đủ láng giềng trong bán kính eps
@JsonKey(name: 'n_core_points') int get nCorePoints;
/// Create a copy of ClusteringInfoModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ClusteringInfoModelCopyWith<ClusteringInfoModel> get copyWith => _$ClusteringInfoModelCopyWithImpl<ClusteringInfoModel>(this as ClusteringInfoModel, _$identity);

  /// Serializes this ClusteringInfoModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ClusteringInfoModel&&(identical(other.algorithm, algorithm) || other.algorithm == algorithm)&&(identical(other.eps, eps) || other.eps == eps)&&(identical(other.nClusters, nClusters) || other.nClusters == nClusters)&&(identical(other.nNoise, nNoise) || other.nNoise == nNoise)&&(identical(other.nCorePoints, nCorePoints) || other.nCorePoints == nCorePoints));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,algorithm,eps,nClusters,nNoise,nCorePoints);

@override
String toString() {
  return 'ClusteringInfoModel(algorithm: $algorithm, eps: $eps, nClusters: $nClusters, nNoise: $nNoise, nCorePoints: $nCorePoints)';
}


}

/// @nodoc
abstract mixin class $ClusteringInfoModelCopyWith<$Res>  {
  factory $ClusteringInfoModelCopyWith(ClusteringInfoModel value, $Res Function(ClusteringInfoModel) _then) = _$ClusteringInfoModelCopyWithImpl;
@useResult
$Res call({
 String algorithm, double eps,@JsonKey(name: 'n_clusters') int nClusters,@JsonKey(name: 'n_noise') int nNoise,@JsonKey(name: 'n_core_points') int nCorePoints
});




}
/// @nodoc
class _$ClusteringInfoModelCopyWithImpl<$Res>
    implements $ClusteringInfoModelCopyWith<$Res> {
  _$ClusteringInfoModelCopyWithImpl(this._self, this._then);

  final ClusteringInfoModel _self;
  final $Res Function(ClusteringInfoModel) _then;

/// Create a copy of ClusteringInfoModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? algorithm = null,Object? eps = null,Object? nClusters = null,Object? nNoise = null,Object? nCorePoints = null,}) {
  return _then(_self.copyWith(
algorithm: null == algorithm ? _self.algorithm : algorithm // ignore: cast_nullable_to_non_nullable
as String,eps: null == eps ? _self.eps : eps // ignore: cast_nullable_to_non_nullable
as double,nClusters: null == nClusters ? _self.nClusters : nClusters // ignore: cast_nullable_to_non_nullable
as int,nNoise: null == nNoise ? _self.nNoise : nNoise // ignore: cast_nullable_to_non_nullable
as int,nCorePoints: null == nCorePoints ? _self.nCorePoints : nCorePoints // ignore: cast_nullable_to_non_nullable
as int,
  ));
}

}


/// Adds pattern-matching-related methods to [ClusteringInfoModel].
extension ClusteringInfoModelPatterns on ClusteringInfoModel {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _ClusteringInfoModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _ClusteringInfoModel() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _ClusteringInfoModel value)  $default,){
final _that = this;
switch (_that) {
case _ClusteringInfoModel():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _ClusteringInfoModel value)?  $default,){
final _that = this;
switch (_that) {
case _ClusteringInfoModel() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String algorithm,  double eps, @JsonKey(name: 'n_clusters')  int nClusters, @JsonKey(name: 'n_noise')  int nNoise, @JsonKey(name: 'n_core_points')  int nCorePoints)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _ClusteringInfoModel() when $default != null:
return $default(_that.algorithm,_that.eps,_that.nClusters,_that.nNoise,_that.nCorePoints);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String algorithm,  double eps, @JsonKey(name: 'n_clusters')  int nClusters, @JsonKey(name: 'n_noise')  int nNoise, @JsonKey(name: 'n_core_points')  int nCorePoints)  $default,) {final _that = this;
switch (_that) {
case _ClusteringInfoModel():
return $default(_that.algorithm,_that.eps,_that.nClusters,_that.nNoise,_that.nCorePoints);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String algorithm,  double eps, @JsonKey(name: 'n_clusters')  int nClusters, @JsonKey(name: 'n_noise')  int nNoise, @JsonKey(name: 'n_core_points')  int nCorePoints)?  $default,) {final _that = this;
switch (_that) {
case _ClusteringInfoModel() when $default != null:
return $default(_that.algorithm,_that.eps,_that.nClusters,_that.nNoise,_that.nCorePoints);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _ClusteringInfoModel implements ClusteringInfoModel {
  const _ClusteringInfoModel({required this.algorithm, required this.eps, @JsonKey(name: 'n_clusters') required this.nClusters, @JsonKey(name: 'n_noise') required this.nNoise, @JsonKey(name: 'n_core_points') required this.nCorePoints});
  factory _ClusteringInfoModel.fromJson(Map<String, dynamic> json) => _$ClusteringInfoModelFromJson(json);

/// Thuật toán được sử dụng (ví dụ: "DBSCAN")
@override final  String algorithm;
/// Bán kính epsilon của thuật toán DBSCAN (đơn vị: mét)
/// Quyết định khoảng cách tối đa giữa 2 điểm để được coi là cùng cluster
@override final  double eps;
/// Số lượng cluster tìm được (không tính noise)
@override@JsonKey(name: 'n_clusters') final  int nClusters;
/// Số lượng điểm nhiễu (outliers không thuộc cluster nào)
@override@JsonKey(name: 'n_noise') final  int nNoise;
/// Số lượng điểm lõi (core points) - điểm có đủ láng giềng trong bán kính eps
@override@JsonKey(name: 'n_core_points') final  int nCorePoints;

/// Create a copy of ClusteringInfoModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ClusteringInfoModelCopyWith<_ClusteringInfoModel> get copyWith => __$ClusteringInfoModelCopyWithImpl<_ClusteringInfoModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$ClusteringInfoModelToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ClusteringInfoModel&&(identical(other.algorithm, algorithm) || other.algorithm == algorithm)&&(identical(other.eps, eps) || other.eps == eps)&&(identical(other.nClusters, nClusters) || other.nClusters == nClusters)&&(identical(other.nNoise, nNoise) || other.nNoise == nNoise)&&(identical(other.nCorePoints, nCorePoints) || other.nCorePoints == nCorePoints));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,algorithm,eps,nClusters,nNoise,nCorePoints);

@override
String toString() {
  return 'ClusteringInfoModel(algorithm: $algorithm, eps: $eps, nClusters: $nClusters, nNoise: $nNoise, nCorePoints: $nCorePoints)';
}


}

/// @nodoc
abstract mixin class _$ClusteringInfoModelCopyWith<$Res> implements $ClusteringInfoModelCopyWith<$Res> {
  factory _$ClusteringInfoModelCopyWith(_ClusteringInfoModel value, $Res Function(_ClusteringInfoModel) _then) = __$ClusteringInfoModelCopyWithImpl;
@override @useResult
$Res call({
 String algorithm, double eps,@JsonKey(name: 'n_clusters') int nClusters,@JsonKey(name: 'n_noise') int nNoise,@JsonKey(name: 'n_core_points') int nCorePoints
});




}
/// @nodoc
class __$ClusteringInfoModelCopyWithImpl<$Res>
    implements _$ClusteringInfoModelCopyWith<$Res> {
  __$ClusteringInfoModelCopyWithImpl(this._self, this._then);

  final _ClusteringInfoModel _self;
  final $Res Function(_ClusteringInfoModel) _then;

/// Create a copy of ClusteringInfoModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? algorithm = null,Object? eps = null,Object? nClusters = null,Object? nNoise = null,Object? nCorePoints = null,}) {
  return _then(_ClusteringInfoModel(
algorithm: null == algorithm ? _self.algorithm : algorithm // ignore: cast_nullable_to_non_nullable
as String,eps: null == eps ? _self.eps : eps // ignore: cast_nullable_to_non_nullable
as double,nClusters: null == nClusters ? _self.nClusters : nClusters // ignore: cast_nullable_to_non_nullable
as int,nNoise: null == nNoise ? _self.nNoise : nNoise // ignore: cast_nullable_to_non_nullable
as int,nCorePoints: null == nCorePoints ? _self.nCorePoints : nCorePoints // ignore: cast_nullable_to_non_nullable
as int,
  ));
}


}


/// @nodoc
mixin _$ClusterItemModel {

/// ID duy nhất của điểm sự cố từ ArcGIS
@JsonKey(name: 'OBJECTID') int get objectId;/// Kinh độ của điểm sự cố
 double get longitude;/// Vĩ độ của điểm sự cố
 double get latitude;/// ID của cluster mà điểm này thuộc về
/// Giá trị -1 nghĩa là điểm nhiễu (noise/outlier)
@JsonKey(name: 'Cluster_ID') int get clusterId;/// Đánh dấu điểm có phải là core point hay không
/// 1 = core point (có đủ láng giềng), 0 = border point hoặc noise
@JsonKey(name: 'Is_Core_Point') int get isCorePoint;
/// Create a copy of ClusterItemModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ClusterItemModelCopyWith<ClusterItemModel> get copyWith => _$ClusterItemModelCopyWithImpl<ClusterItemModel>(this as ClusterItemModel, _$identity);

  /// Serializes this ClusterItemModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ClusterItemModel&&(identical(other.objectId, objectId) || other.objectId == objectId)&&(identical(other.longitude, longitude) || other.longitude == longitude)&&(identical(other.latitude, latitude) || other.latitude == latitude)&&(identical(other.clusterId, clusterId) || other.clusterId == clusterId)&&(identical(other.isCorePoint, isCorePoint) || other.isCorePoint == isCorePoint));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,objectId,longitude,latitude,clusterId,isCorePoint);

@override
String toString() {
  return 'ClusterItemModel(objectId: $objectId, longitude: $longitude, latitude: $latitude, clusterId: $clusterId, isCorePoint: $isCorePoint)';
}


}

/// @nodoc
abstract mixin class $ClusterItemModelCopyWith<$Res>  {
  factory $ClusterItemModelCopyWith(ClusterItemModel value, $Res Function(ClusterItemModel) _then) = _$ClusterItemModelCopyWithImpl;
@useResult
$Res call({
@JsonKey(name: 'OBJECTID') int objectId, double longitude, double latitude,@JsonKey(name: 'Cluster_ID') int clusterId,@JsonKey(name: 'Is_Core_Point') int isCorePoint
});




}
/// @nodoc
class _$ClusterItemModelCopyWithImpl<$Res>
    implements $ClusterItemModelCopyWith<$Res> {
  _$ClusterItemModelCopyWithImpl(this._self, this._then);

  final ClusterItemModel _self;
  final $Res Function(ClusterItemModel) _then;

/// Create a copy of ClusterItemModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? objectId = null,Object? longitude = null,Object? latitude = null,Object? clusterId = null,Object? isCorePoint = null,}) {
  return _then(_self.copyWith(
objectId: null == objectId ? _self.objectId : objectId // ignore: cast_nullable_to_non_nullable
as int,longitude: null == longitude ? _self.longitude : longitude // ignore: cast_nullable_to_non_nullable
as double,latitude: null == latitude ? _self.latitude : latitude // ignore: cast_nullable_to_non_nullable
as double,clusterId: null == clusterId ? _self.clusterId : clusterId // ignore: cast_nullable_to_non_nullable
as int,isCorePoint: null == isCorePoint ? _self.isCorePoint : isCorePoint // ignore: cast_nullable_to_non_nullable
as int,
  ));
}

}


/// Adds pattern-matching-related methods to [ClusterItemModel].
extension ClusterItemModelPatterns on ClusterItemModel {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _ClusterItemModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _ClusterItemModel() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _ClusterItemModel value)  $default,){
final _that = this;
switch (_that) {
case _ClusterItemModel():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _ClusterItemModel value)?  $default,){
final _that = this;
switch (_that) {
case _ClusterItemModel() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function(@JsonKey(name: 'OBJECTID')  int objectId,  double longitude,  double latitude, @JsonKey(name: 'Cluster_ID')  int clusterId, @JsonKey(name: 'Is_Core_Point')  int isCorePoint)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _ClusterItemModel() when $default != null:
return $default(_that.objectId,_that.longitude,_that.latitude,_that.clusterId,_that.isCorePoint);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function(@JsonKey(name: 'OBJECTID')  int objectId,  double longitude,  double latitude, @JsonKey(name: 'Cluster_ID')  int clusterId, @JsonKey(name: 'Is_Core_Point')  int isCorePoint)  $default,) {final _that = this;
switch (_that) {
case _ClusterItemModel():
return $default(_that.objectId,_that.longitude,_that.latitude,_that.clusterId,_that.isCorePoint);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function(@JsonKey(name: 'OBJECTID')  int objectId,  double longitude,  double latitude, @JsonKey(name: 'Cluster_ID')  int clusterId, @JsonKey(name: 'Is_Core_Point')  int isCorePoint)?  $default,) {final _that = this;
switch (_that) {
case _ClusterItemModel() when $default != null:
return $default(_that.objectId,_that.longitude,_that.latitude,_that.clusterId,_that.isCorePoint);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _ClusterItemModel extends ClusterItemModel {
  const _ClusterItemModel({@JsonKey(name: 'OBJECTID') required this.objectId, required this.longitude, required this.latitude, @JsonKey(name: 'Cluster_ID') required this.clusterId, @JsonKey(name: 'Is_Core_Point') required this.isCorePoint}): super._();
  factory _ClusterItemModel.fromJson(Map<String, dynamic> json) => _$ClusterItemModelFromJson(json);

/// ID duy nhất của điểm sự cố từ ArcGIS
@override@JsonKey(name: 'OBJECTID') final  int objectId;
/// Kinh độ của điểm sự cố
@override final  double longitude;
/// Vĩ độ của điểm sự cố
@override final  double latitude;
/// ID của cluster mà điểm này thuộc về
/// Giá trị -1 nghĩa là điểm nhiễu (noise/outlier)
@override@JsonKey(name: 'Cluster_ID') final  int clusterId;
/// Đánh dấu điểm có phải là core point hay không
/// 1 = core point (có đủ láng giềng), 0 = border point hoặc noise
@override@JsonKey(name: 'Is_Core_Point') final  int isCorePoint;

/// Create a copy of ClusterItemModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ClusterItemModelCopyWith<_ClusterItemModel> get copyWith => __$ClusterItemModelCopyWithImpl<_ClusterItemModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$ClusterItemModelToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ClusterItemModel&&(identical(other.objectId, objectId) || other.objectId == objectId)&&(identical(other.longitude, longitude) || other.longitude == longitude)&&(identical(other.latitude, latitude) || other.latitude == latitude)&&(identical(other.clusterId, clusterId) || other.clusterId == clusterId)&&(identical(other.isCorePoint, isCorePoint) || other.isCorePoint == isCorePoint));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,objectId,longitude,latitude,clusterId,isCorePoint);

@override
String toString() {
  return 'ClusterItemModel(objectId: $objectId, longitude: $longitude, latitude: $latitude, clusterId: $clusterId, isCorePoint: $isCorePoint)';
}


}

/// @nodoc
abstract mixin class _$ClusterItemModelCopyWith<$Res> implements $ClusterItemModelCopyWith<$Res> {
  factory _$ClusterItemModelCopyWith(_ClusterItemModel value, $Res Function(_ClusterItemModel) _then) = __$ClusterItemModelCopyWithImpl;
@override @useResult
$Res call({
@JsonKey(name: 'OBJECTID') int objectId, double longitude, double latitude,@JsonKey(name: 'Cluster_ID') int clusterId,@JsonKey(name: 'Is_Core_Point') int isCorePoint
});




}
/// @nodoc
class __$ClusterItemModelCopyWithImpl<$Res>
    implements _$ClusterItemModelCopyWith<$Res> {
  __$ClusterItemModelCopyWithImpl(this._self, this._then);

  final _ClusterItemModel _self;
  final $Res Function(_ClusterItemModel) _then;

/// Create a copy of ClusterItemModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? objectId = null,Object? longitude = null,Object? latitude = null,Object? clusterId = null,Object? isCorePoint = null,}) {
  return _then(_ClusterItemModel(
objectId: null == objectId ? _self.objectId : objectId // ignore: cast_nullable_to_non_nullable
as int,longitude: null == longitude ? _self.longitude : longitude // ignore: cast_nullable_to_non_nullable
as double,latitude: null == latitude ? _self.latitude : latitude // ignore: cast_nullable_to_non_nullable
as double,clusterId: null == clusterId ? _self.clusterId : clusterId // ignore: cast_nullable_to_non_nullable
as int,isCorePoint: null == isCorePoint ? _self.isCorePoint : isCorePoint // ignore: cast_nullable_to_non_nullable
as int,
  ));
}


}


/// @nodoc
mixin _$ClusterBBoxModel {

/// Kinh độ nhỏ nhất (cạnh trái)
 double get xmin;/// Vĩ độ nhỏ nhất (cạnh dưới)
 double get ymin;/// Kinh độ lớn nhất (cạnh phải)
 double get xmax;/// Vĩ độ lớn nhất (cạnh trên)
 double get ymax;
/// Create a copy of ClusterBBoxModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ClusterBBoxModelCopyWith<ClusterBBoxModel> get copyWith => _$ClusterBBoxModelCopyWithImpl<ClusterBBoxModel>(this as ClusterBBoxModel, _$identity);

  /// Serializes this ClusterBBoxModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ClusterBBoxModel&&(identical(other.xmin, xmin) || other.xmin == xmin)&&(identical(other.ymin, ymin) || other.ymin == ymin)&&(identical(other.xmax, xmax) || other.xmax == xmax)&&(identical(other.ymax, ymax) || other.ymax == ymax));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,xmin,ymin,xmax,ymax);

@override
String toString() {
  return 'ClusterBBoxModel(xmin: $xmin, ymin: $ymin, xmax: $xmax, ymax: $ymax)';
}


}

/// @nodoc
abstract mixin class $ClusterBBoxModelCopyWith<$Res>  {
  factory $ClusterBBoxModelCopyWith(ClusterBBoxModel value, $Res Function(ClusterBBoxModel) _then) = _$ClusterBBoxModelCopyWithImpl;
@useResult
$Res call({
 double xmin, double ymin, double xmax, double ymax
});




}
/// @nodoc
class _$ClusterBBoxModelCopyWithImpl<$Res>
    implements $ClusterBBoxModelCopyWith<$Res> {
  _$ClusterBBoxModelCopyWithImpl(this._self, this._then);

  final ClusterBBoxModel _self;
  final $Res Function(ClusterBBoxModel) _then;

/// Create a copy of ClusterBBoxModel
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


/// Adds pattern-matching-related methods to [ClusterBBoxModel].
extension ClusterBBoxModelPatterns on ClusterBBoxModel {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _ClusterBBoxModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _ClusterBBoxModel() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _ClusterBBoxModel value)  $default,){
final _that = this;
switch (_that) {
case _ClusterBBoxModel():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _ClusterBBoxModel value)?  $default,){
final _that = this;
switch (_that) {
case _ClusterBBoxModel() when $default != null:
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
case _ClusterBBoxModel() when $default != null:
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
case _ClusterBBoxModel():
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
case _ClusterBBoxModel() when $default != null:
return $default(_that.xmin,_that.ymin,_that.xmax,_that.ymax);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _ClusterBBoxModel extends ClusterBBoxModel {
  const _ClusterBBoxModel({required this.xmin, required this.ymin, required this.xmax, required this.ymax}): super._();
  factory _ClusterBBoxModel.fromJson(Map<String, dynamic> json) => _$ClusterBBoxModelFromJson(json);

/// Kinh độ nhỏ nhất (cạnh trái)
@override final  double xmin;
/// Vĩ độ nhỏ nhất (cạnh dưới)
@override final  double ymin;
/// Kinh độ lớn nhất (cạnh phải)
@override final  double xmax;
/// Vĩ độ lớn nhất (cạnh trên)
@override final  double ymax;

/// Create a copy of ClusterBBoxModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ClusterBBoxModelCopyWith<_ClusterBBoxModel> get copyWith => __$ClusterBBoxModelCopyWithImpl<_ClusterBBoxModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$ClusterBBoxModelToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ClusterBBoxModel&&(identical(other.xmin, xmin) || other.xmin == xmin)&&(identical(other.ymin, ymin) || other.ymin == ymin)&&(identical(other.xmax, xmax) || other.xmax == xmax)&&(identical(other.ymax, ymax) || other.ymax == ymax));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,xmin,ymin,xmax,ymax);

@override
String toString() {
  return 'ClusterBBoxModel(xmin: $xmin, ymin: $ymin, xmax: $xmax, ymax: $ymax)';
}


}

/// @nodoc
abstract mixin class _$ClusterBBoxModelCopyWith<$Res> implements $ClusterBBoxModelCopyWith<$Res> {
  factory _$ClusterBBoxModelCopyWith(_ClusterBBoxModel value, $Res Function(_ClusterBBoxModel) _then) = __$ClusterBBoxModelCopyWithImpl;
@override @useResult
$Res call({
 double xmin, double ymin, double xmax, double ymax
});




}
/// @nodoc
class __$ClusterBBoxModelCopyWithImpl<$Res>
    implements _$ClusterBBoxModelCopyWith<$Res> {
  __$ClusterBBoxModelCopyWithImpl(this._self, this._then);

  final _ClusterBBoxModel _self;
  final $Res Function(_ClusterBBoxModel) _then;

/// Create a copy of ClusterBBoxModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? xmin = null,Object? ymin = null,Object? xmax = null,Object? ymax = null,}) {
  return _then(_ClusterBBoxModel(
xmin: null == xmin ? _self.xmin : xmin // ignore: cast_nullable_to_non_nullable
as double,ymin: null == ymin ? _self.ymin : ymin // ignore: cast_nullable_to_non_nullable
as double,xmax: null == xmax ? _self.xmax : xmax // ignore: cast_nullable_to_non_nullable
as double,ymax: null == ymax ? _self.ymax : ymax // ignore: cast_nullable_to_non_nullable
as double,
  ));
}


}


/// @nodoc
mixin _$ClusterCentroidModel {

/// Vĩ độ của tâm cluster
 double get lat;/// Kinh độ của tâm cluster
 double get lng;
/// Create a copy of ClusterCentroidModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ClusterCentroidModelCopyWith<ClusterCentroidModel> get copyWith => _$ClusterCentroidModelCopyWithImpl<ClusterCentroidModel>(this as ClusterCentroidModel, _$identity);

  /// Serializes this ClusterCentroidModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ClusterCentroidModel&&(identical(other.lat, lat) || other.lat == lat)&&(identical(other.lng, lng) || other.lng == lng));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,lat,lng);

@override
String toString() {
  return 'ClusterCentroidModel(lat: $lat, lng: $lng)';
}


}

/// @nodoc
abstract mixin class $ClusterCentroidModelCopyWith<$Res>  {
  factory $ClusterCentroidModelCopyWith(ClusterCentroidModel value, $Res Function(ClusterCentroidModel) _then) = _$ClusterCentroidModelCopyWithImpl;
@useResult
$Res call({
 double lat, double lng
});




}
/// @nodoc
class _$ClusterCentroidModelCopyWithImpl<$Res>
    implements $ClusterCentroidModelCopyWith<$Res> {
  _$ClusterCentroidModelCopyWithImpl(this._self, this._then);

  final ClusterCentroidModel _self;
  final $Res Function(ClusterCentroidModel) _then;

/// Create a copy of ClusterCentroidModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? lat = null,Object? lng = null,}) {
  return _then(_self.copyWith(
lat: null == lat ? _self.lat : lat // ignore: cast_nullable_to_non_nullable
as double,lng: null == lng ? _self.lng : lng // ignore: cast_nullable_to_non_nullable
as double,
  ));
}

}


/// Adds pattern-matching-related methods to [ClusterCentroidModel].
extension ClusterCentroidModelPatterns on ClusterCentroidModel {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _ClusterCentroidModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _ClusterCentroidModel() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _ClusterCentroidModel value)  $default,){
final _that = this;
switch (_that) {
case _ClusterCentroidModel():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _ClusterCentroidModel value)?  $default,){
final _that = this;
switch (_that) {
case _ClusterCentroidModel() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( double lat,  double lng)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _ClusterCentroidModel() when $default != null:
return $default(_that.lat,_that.lng);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( double lat,  double lng)  $default,) {final _that = this;
switch (_that) {
case _ClusterCentroidModel():
return $default(_that.lat,_that.lng);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( double lat,  double lng)?  $default,) {final _that = this;
switch (_that) {
case _ClusterCentroidModel() when $default != null:
return $default(_that.lat,_that.lng);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _ClusterCentroidModel implements ClusterCentroidModel {
  const _ClusterCentroidModel({required this.lat, required this.lng});
  factory _ClusterCentroidModel.fromJson(Map<String, dynamic> json) => _$ClusterCentroidModelFromJson(json);

/// Vĩ độ của tâm cluster
@override final  double lat;
/// Kinh độ của tâm cluster
@override final  double lng;

/// Create a copy of ClusterCentroidModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ClusterCentroidModelCopyWith<_ClusterCentroidModel> get copyWith => __$ClusterCentroidModelCopyWithImpl<_ClusterCentroidModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$ClusterCentroidModelToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ClusterCentroidModel&&(identical(other.lat, lat) || other.lat == lat)&&(identical(other.lng, lng) || other.lng == lng));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,lat,lng);

@override
String toString() {
  return 'ClusterCentroidModel(lat: $lat, lng: $lng)';
}


}

/// @nodoc
abstract mixin class _$ClusterCentroidModelCopyWith<$Res> implements $ClusterCentroidModelCopyWith<$Res> {
  factory _$ClusterCentroidModelCopyWith(_ClusterCentroidModel value, $Res Function(_ClusterCentroidModel) _then) = __$ClusterCentroidModelCopyWithImpl;
@override @useResult
$Res call({
 double lat, double lng
});




}
/// @nodoc
class __$ClusterCentroidModelCopyWithImpl<$Res>
    implements _$ClusterCentroidModelCopyWith<$Res> {
  __$ClusterCentroidModelCopyWithImpl(this._self, this._then);

  final _ClusterCentroidModel _self;
  final $Res Function(_ClusterCentroidModel) _then;

/// Create a copy of ClusterCentroidModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? lat = null,Object? lng = null,}) {
  return _then(_ClusterCentroidModel(
lat: null == lat ? _self.lat : lat // ignore: cast_nullable_to_non_nullable
as double,lng: null == lng ? _self.lng : lng // ignore: cast_nullable_to_non_nullable
as double,
  ));
}


}


/// @nodoc
mixin _$ClusterHotspotModel {

/// ID của cluster hotspot
@JsonKey(name: 'cluster_id') int get clusterId;/// Tổng số sự cố trong cluster này
@JsonKey(name: 'incident_count') int get incidentCount;/// Danh sách OBJECTID của các sự cố thuộc cluster
@JsonKey(name: 'incident_object_ids') List<int> get incidentObjectIds;/// Tọa độ tâm của cluster
 ClusterCentroidModel get centroid;/// Bán kính hiển thị trên bản đồ (đơn vị: mét)
/// Được tính từ khoảng cách xa nhất từ tâm đến các điểm trong cluster
@JsonKey(name: 'display_radius_m') double get displayRadiusM;/// Bán kính ảnh hưởng khuyến nghị (đơn vị: mét)
/// Dùng cho phân tích, không dùng cho routing
@JsonKey(name: 'impact_radius_m') double get impactRadiusM;/// Bán kính trung bình từ tâm đến các điểm (đơn vị: mét)
/// Thể hiện độ phân tán của các sự cố trong cluster
@JsonKey(name: 'avg_radius_m') double get avgRadiusM;/// Thông tin hình học polygon của cluster (chuẩn ArcGIS)
 ClusterGeometryModel get geometry;/// Mật độ sự cố (số sự cố / km²)
 double get density;/// Mức độ nguy hiểm: "high", "medium", "low"
 String get severity;/// Loại cluster: "dense", "spread", "isolated"
@JsonKey(name: 'cluster_type') String get clusterType;/// Hình chữ nhật bao quanh cluster
 ClusterBBoxModel get bbox;/// Tọa độ polygon đơn giản hóa để hiển thị trên map
/// Mỗi phần tử là [lng, lat]
 List<List<double>> get polygon;
/// Create a copy of ClusterHotspotModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ClusterHotspotModelCopyWith<ClusterHotspotModel> get copyWith => _$ClusterHotspotModelCopyWithImpl<ClusterHotspotModel>(this as ClusterHotspotModel, _$identity);

  /// Serializes this ClusterHotspotModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ClusterHotspotModel&&(identical(other.clusterId, clusterId) || other.clusterId == clusterId)&&(identical(other.incidentCount, incidentCount) || other.incidentCount == incidentCount)&&const DeepCollectionEquality().equals(other.incidentObjectIds, incidentObjectIds)&&(identical(other.centroid, centroid) || other.centroid == centroid)&&(identical(other.displayRadiusM, displayRadiusM) || other.displayRadiusM == displayRadiusM)&&(identical(other.impactRadiusM, impactRadiusM) || other.impactRadiusM == impactRadiusM)&&(identical(other.avgRadiusM, avgRadiusM) || other.avgRadiusM == avgRadiusM)&&(identical(other.geometry, geometry) || other.geometry == geometry)&&(identical(other.density, density) || other.density == density)&&(identical(other.severity, severity) || other.severity == severity)&&(identical(other.clusterType, clusterType) || other.clusterType == clusterType)&&(identical(other.bbox, bbox) || other.bbox == bbox)&&const DeepCollectionEquality().equals(other.polygon, polygon));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,clusterId,incidentCount,const DeepCollectionEquality().hash(incidentObjectIds),centroid,displayRadiusM,impactRadiusM,avgRadiusM,geometry,density,severity,clusterType,bbox,const DeepCollectionEquality().hash(polygon));

@override
String toString() {
  return 'ClusterHotspotModel(clusterId: $clusterId, incidentCount: $incidentCount, incidentObjectIds: $incidentObjectIds, centroid: $centroid, displayRadiusM: $displayRadiusM, impactRadiusM: $impactRadiusM, avgRadiusM: $avgRadiusM, geometry: $geometry, density: $density, severity: $severity, clusterType: $clusterType, bbox: $bbox, polygon: $polygon)';
}


}

/// @nodoc
abstract mixin class $ClusterHotspotModelCopyWith<$Res>  {
  factory $ClusterHotspotModelCopyWith(ClusterHotspotModel value, $Res Function(ClusterHotspotModel) _then) = _$ClusterHotspotModelCopyWithImpl;
@useResult
$Res call({
@JsonKey(name: 'cluster_id') int clusterId,@JsonKey(name: 'incident_count') int incidentCount,@JsonKey(name: 'incident_object_ids') List<int> incidentObjectIds, ClusterCentroidModel centroid,@JsonKey(name: 'display_radius_m') double displayRadiusM,@JsonKey(name: 'impact_radius_m') double impactRadiusM,@JsonKey(name: 'avg_radius_m') double avgRadiusM, ClusterGeometryModel geometry, double density, String severity,@JsonKey(name: 'cluster_type') String clusterType, ClusterBBoxModel bbox, List<List<double>> polygon
});


$ClusterCentroidModelCopyWith<$Res> get centroid;$ClusterGeometryModelCopyWith<$Res> get geometry;$ClusterBBoxModelCopyWith<$Res> get bbox;

}
/// @nodoc
class _$ClusterHotspotModelCopyWithImpl<$Res>
    implements $ClusterHotspotModelCopyWith<$Res> {
  _$ClusterHotspotModelCopyWithImpl(this._self, this._then);

  final ClusterHotspotModel _self;
  final $Res Function(ClusterHotspotModel) _then;

/// Create a copy of ClusterHotspotModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? clusterId = null,Object? incidentCount = null,Object? incidentObjectIds = null,Object? centroid = null,Object? displayRadiusM = null,Object? impactRadiusM = null,Object? avgRadiusM = null,Object? geometry = null,Object? density = null,Object? severity = null,Object? clusterType = null,Object? bbox = null,Object? polygon = null,}) {
  return _then(_self.copyWith(
clusterId: null == clusterId ? _self.clusterId : clusterId // ignore: cast_nullable_to_non_nullable
as int,incidentCount: null == incidentCount ? _self.incidentCount : incidentCount // ignore: cast_nullable_to_non_nullable
as int,incidentObjectIds: null == incidentObjectIds ? _self.incidentObjectIds : incidentObjectIds // ignore: cast_nullable_to_non_nullable
as List<int>,centroid: null == centroid ? _self.centroid : centroid // ignore: cast_nullable_to_non_nullable
as ClusterCentroidModel,displayRadiusM: null == displayRadiusM ? _self.displayRadiusM : displayRadiusM // ignore: cast_nullable_to_non_nullable
as double,impactRadiusM: null == impactRadiusM ? _self.impactRadiusM : impactRadiusM // ignore: cast_nullable_to_non_nullable
as double,avgRadiusM: null == avgRadiusM ? _self.avgRadiusM : avgRadiusM // ignore: cast_nullable_to_non_nullable
as double,geometry: null == geometry ? _self.geometry : geometry // ignore: cast_nullable_to_non_nullable
as ClusterGeometryModel,density: null == density ? _self.density : density // ignore: cast_nullable_to_non_nullable
as double,severity: null == severity ? _self.severity : severity // ignore: cast_nullable_to_non_nullable
as String,clusterType: null == clusterType ? _self.clusterType : clusterType // ignore: cast_nullable_to_non_nullable
as String,bbox: null == bbox ? _self.bbox : bbox // ignore: cast_nullable_to_non_nullable
as ClusterBBoxModel,polygon: null == polygon ? _self.polygon : polygon // ignore: cast_nullable_to_non_nullable
as List<List<double>>,
  ));
}
/// Create a copy of ClusterHotspotModel
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$ClusterCentroidModelCopyWith<$Res> get centroid {
  
  return $ClusterCentroidModelCopyWith<$Res>(_self.centroid, (value) {
    return _then(_self.copyWith(centroid: value));
  });
}/// Create a copy of ClusterHotspotModel
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$ClusterGeometryModelCopyWith<$Res> get geometry {
  
  return $ClusterGeometryModelCopyWith<$Res>(_self.geometry, (value) {
    return _then(_self.copyWith(geometry: value));
  });
}/// Create a copy of ClusterHotspotModel
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$ClusterBBoxModelCopyWith<$Res> get bbox {
  
  return $ClusterBBoxModelCopyWith<$Res>(_self.bbox, (value) {
    return _then(_self.copyWith(bbox: value));
  });
}
}


/// Adds pattern-matching-related methods to [ClusterHotspotModel].
extension ClusterHotspotModelPatterns on ClusterHotspotModel {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _ClusterHotspotModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _ClusterHotspotModel() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _ClusterHotspotModel value)  $default,){
final _that = this;
switch (_that) {
case _ClusterHotspotModel():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _ClusterHotspotModel value)?  $default,){
final _that = this;
switch (_that) {
case _ClusterHotspotModel() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function(@JsonKey(name: 'cluster_id')  int clusterId, @JsonKey(name: 'incident_count')  int incidentCount, @JsonKey(name: 'incident_object_ids')  List<int> incidentObjectIds,  ClusterCentroidModel centroid, @JsonKey(name: 'display_radius_m')  double displayRadiusM, @JsonKey(name: 'impact_radius_m')  double impactRadiusM, @JsonKey(name: 'avg_radius_m')  double avgRadiusM,  ClusterGeometryModel geometry,  double density,  String severity, @JsonKey(name: 'cluster_type')  String clusterType,  ClusterBBoxModel bbox,  List<List<double>> polygon)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _ClusterHotspotModel() when $default != null:
return $default(_that.clusterId,_that.incidentCount,_that.incidentObjectIds,_that.centroid,_that.displayRadiusM,_that.impactRadiusM,_that.avgRadiusM,_that.geometry,_that.density,_that.severity,_that.clusterType,_that.bbox,_that.polygon);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function(@JsonKey(name: 'cluster_id')  int clusterId, @JsonKey(name: 'incident_count')  int incidentCount, @JsonKey(name: 'incident_object_ids')  List<int> incidentObjectIds,  ClusterCentroidModel centroid, @JsonKey(name: 'display_radius_m')  double displayRadiusM, @JsonKey(name: 'impact_radius_m')  double impactRadiusM, @JsonKey(name: 'avg_radius_m')  double avgRadiusM,  ClusterGeometryModel geometry,  double density,  String severity, @JsonKey(name: 'cluster_type')  String clusterType,  ClusterBBoxModel bbox,  List<List<double>> polygon)  $default,) {final _that = this;
switch (_that) {
case _ClusterHotspotModel():
return $default(_that.clusterId,_that.incidentCount,_that.incidentObjectIds,_that.centroid,_that.displayRadiusM,_that.impactRadiusM,_that.avgRadiusM,_that.geometry,_that.density,_that.severity,_that.clusterType,_that.bbox,_that.polygon);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function(@JsonKey(name: 'cluster_id')  int clusterId, @JsonKey(name: 'incident_count')  int incidentCount, @JsonKey(name: 'incident_object_ids')  List<int> incidentObjectIds,  ClusterCentroidModel centroid, @JsonKey(name: 'display_radius_m')  double displayRadiusM, @JsonKey(name: 'impact_radius_m')  double impactRadiusM, @JsonKey(name: 'avg_radius_m')  double avgRadiusM,  ClusterGeometryModel geometry,  double density,  String severity, @JsonKey(name: 'cluster_type')  String clusterType,  ClusterBBoxModel bbox,  List<List<double>> polygon)?  $default,) {final _that = this;
switch (_that) {
case _ClusterHotspotModel() when $default != null:
return $default(_that.clusterId,_that.incidentCount,_that.incidentObjectIds,_that.centroid,_that.displayRadiusM,_that.impactRadiusM,_that.avgRadiusM,_that.geometry,_that.density,_that.severity,_that.clusterType,_that.bbox,_that.polygon);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _ClusterHotspotModel extends ClusterHotspotModel {
  const _ClusterHotspotModel({@JsonKey(name: 'cluster_id') required this.clusterId, @JsonKey(name: 'incident_count') required this.incidentCount, @JsonKey(name: 'incident_object_ids') required final  List<int> incidentObjectIds, required this.centroid, @JsonKey(name: 'display_radius_m') required this.displayRadiusM, @JsonKey(name: 'impact_radius_m') required this.impactRadiusM, @JsonKey(name: 'avg_radius_m') required this.avgRadiusM, required this.geometry, required this.density, required this.severity, @JsonKey(name: 'cluster_type') required this.clusterType, required this.bbox, required final  List<List<double>> polygon}): _incidentObjectIds = incidentObjectIds,_polygon = polygon,super._();
  factory _ClusterHotspotModel.fromJson(Map<String, dynamic> json) => _$ClusterHotspotModelFromJson(json);

/// ID của cluster hotspot
@override@JsonKey(name: 'cluster_id') final  int clusterId;
/// Tổng số sự cố trong cluster này
@override@JsonKey(name: 'incident_count') final  int incidentCount;
/// Danh sách OBJECTID của các sự cố thuộc cluster
 final  List<int> _incidentObjectIds;
/// Danh sách OBJECTID của các sự cố thuộc cluster
@override@JsonKey(name: 'incident_object_ids') List<int> get incidentObjectIds {
  if (_incidentObjectIds is EqualUnmodifiableListView) return _incidentObjectIds;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_incidentObjectIds);
}

/// Tọa độ tâm của cluster
@override final  ClusterCentroidModel centroid;
/// Bán kính hiển thị trên bản đồ (đơn vị: mét)
/// Được tính từ khoảng cách xa nhất từ tâm đến các điểm trong cluster
@override@JsonKey(name: 'display_radius_m') final  double displayRadiusM;
/// Bán kính ảnh hưởng khuyến nghị (đơn vị: mét)
/// Dùng cho phân tích, không dùng cho routing
@override@JsonKey(name: 'impact_radius_m') final  double impactRadiusM;
/// Bán kính trung bình từ tâm đến các điểm (đơn vị: mét)
/// Thể hiện độ phân tán của các sự cố trong cluster
@override@JsonKey(name: 'avg_radius_m') final  double avgRadiusM;
/// Thông tin hình học polygon của cluster (chuẩn ArcGIS)
@override final  ClusterGeometryModel geometry;
/// Mật độ sự cố (số sự cố / km²)
@override final  double density;
/// Mức độ nguy hiểm: "high", "medium", "low"
@override final  String severity;
/// Loại cluster: "dense", "spread", "isolated"
@override@JsonKey(name: 'cluster_type') final  String clusterType;
/// Hình chữ nhật bao quanh cluster
@override final  ClusterBBoxModel bbox;
/// Tọa độ polygon đơn giản hóa để hiển thị trên map
/// Mỗi phần tử là [lng, lat]
 final  List<List<double>> _polygon;
/// Tọa độ polygon đơn giản hóa để hiển thị trên map
/// Mỗi phần tử là [lng, lat]
@override List<List<double>> get polygon {
  if (_polygon is EqualUnmodifiableListView) return _polygon;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_polygon);
}


/// Create a copy of ClusterHotspotModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ClusterHotspotModelCopyWith<_ClusterHotspotModel> get copyWith => __$ClusterHotspotModelCopyWithImpl<_ClusterHotspotModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$ClusterHotspotModelToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ClusterHotspotModel&&(identical(other.clusterId, clusterId) || other.clusterId == clusterId)&&(identical(other.incidentCount, incidentCount) || other.incidentCount == incidentCount)&&const DeepCollectionEquality().equals(other._incidentObjectIds, _incidentObjectIds)&&(identical(other.centroid, centroid) || other.centroid == centroid)&&(identical(other.displayRadiusM, displayRadiusM) || other.displayRadiusM == displayRadiusM)&&(identical(other.impactRadiusM, impactRadiusM) || other.impactRadiusM == impactRadiusM)&&(identical(other.avgRadiusM, avgRadiusM) || other.avgRadiusM == avgRadiusM)&&(identical(other.geometry, geometry) || other.geometry == geometry)&&(identical(other.density, density) || other.density == density)&&(identical(other.severity, severity) || other.severity == severity)&&(identical(other.clusterType, clusterType) || other.clusterType == clusterType)&&(identical(other.bbox, bbox) || other.bbox == bbox)&&const DeepCollectionEquality().equals(other._polygon, _polygon));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,clusterId,incidentCount,const DeepCollectionEquality().hash(_incidentObjectIds),centroid,displayRadiusM,impactRadiusM,avgRadiusM,geometry,density,severity,clusterType,bbox,const DeepCollectionEquality().hash(_polygon));

@override
String toString() {
  return 'ClusterHotspotModel(clusterId: $clusterId, incidentCount: $incidentCount, incidentObjectIds: $incidentObjectIds, centroid: $centroid, displayRadiusM: $displayRadiusM, impactRadiusM: $impactRadiusM, avgRadiusM: $avgRadiusM, geometry: $geometry, density: $density, severity: $severity, clusterType: $clusterType, bbox: $bbox, polygon: $polygon)';
}


}

/// @nodoc
abstract mixin class _$ClusterHotspotModelCopyWith<$Res> implements $ClusterHotspotModelCopyWith<$Res> {
  factory _$ClusterHotspotModelCopyWith(_ClusterHotspotModel value, $Res Function(_ClusterHotspotModel) _then) = __$ClusterHotspotModelCopyWithImpl;
@override @useResult
$Res call({
@JsonKey(name: 'cluster_id') int clusterId,@JsonKey(name: 'incident_count') int incidentCount,@JsonKey(name: 'incident_object_ids') List<int> incidentObjectIds, ClusterCentroidModel centroid,@JsonKey(name: 'display_radius_m') double displayRadiusM,@JsonKey(name: 'impact_radius_m') double impactRadiusM,@JsonKey(name: 'avg_radius_m') double avgRadiusM, ClusterGeometryModel geometry, double density, String severity,@JsonKey(name: 'cluster_type') String clusterType, ClusterBBoxModel bbox, List<List<double>> polygon
});


@override $ClusterCentroidModelCopyWith<$Res> get centroid;@override $ClusterGeometryModelCopyWith<$Res> get geometry;@override $ClusterBBoxModelCopyWith<$Res> get bbox;

}
/// @nodoc
class __$ClusterHotspotModelCopyWithImpl<$Res>
    implements _$ClusterHotspotModelCopyWith<$Res> {
  __$ClusterHotspotModelCopyWithImpl(this._self, this._then);

  final _ClusterHotspotModel _self;
  final $Res Function(_ClusterHotspotModel) _then;

/// Create a copy of ClusterHotspotModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? clusterId = null,Object? incidentCount = null,Object? incidentObjectIds = null,Object? centroid = null,Object? displayRadiusM = null,Object? impactRadiusM = null,Object? avgRadiusM = null,Object? geometry = null,Object? density = null,Object? severity = null,Object? clusterType = null,Object? bbox = null,Object? polygon = null,}) {
  return _then(_ClusterHotspotModel(
clusterId: null == clusterId ? _self.clusterId : clusterId // ignore: cast_nullable_to_non_nullable
as int,incidentCount: null == incidentCount ? _self.incidentCount : incidentCount // ignore: cast_nullable_to_non_nullable
as int,incidentObjectIds: null == incidentObjectIds ? _self._incidentObjectIds : incidentObjectIds // ignore: cast_nullable_to_non_nullable
as List<int>,centroid: null == centroid ? _self.centroid : centroid // ignore: cast_nullable_to_non_nullable
as ClusterCentroidModel,displayRadiusM: null == displayRadiusM ? _self.displayRadiusM : displayRadiusM // ignore: cast_nullable_to_non_nullable
as double,impactRadiusM: null == impactRadiusM ? _self.impactRadiusM : impactRadiusM // ignore: cast_nullable_to_non_nullable
as double,avgRadiusM: null == avgRadiusM ? _self.avgRadiusM : avgRadiusM // ignore: cast_nullable_to_non_nullable
as double,geometry: null == geometry ? _self.geometry : geometry // ignore: cast_nullable_to_non_nullable
as ClusterGeometryModel,density: null == density ? _self.density : density // ignore: cast_nullable_to_non_nullable
as double,severity: null == severity ? _self.severity : severity // ignore: cast_nullable_to_non_nullable
as String,clusterType: null == clusterType ? _self.clusterType : clusterType // ignore: cast_nullable_to_non_nullable
as String,bbox: null == bbox ? _self.bbox : bbox // ignore: cast_nullable_to_non_nullable
as ClusterBBoxModel,polygon: null == polygon ? _self._polygon : polygon // ignore: cast_nullable_to_non_nullable
as List<List<double>>,
  ));
}

/// Create a copy of ClusterHotspotModel
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$ClusterCentroidModelCopyWith<$Res> get centroid {
  
  return $ClusterCentroidModelCopyWith<$Res>(_self.centroid, (value) {
    return _then(_self.copyWith(centroid: value));
  });
}/// Create a copy of ClusterHotspotModel
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$ClusterGeometryModelCopyWith<$Res> get geometry {
  
  return $ClusterGeometryModelCopyWith<$Res>(_self.geometry, (value) {
    return _then(_self.copyWith(geometry: value));
  });
}/// Create a copy of ClusterHotspotModel
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$ClusterBBoxModelCopyWith<$Res> get bbox {
  
  return $ClusterBBoxModelCopyWith<$Res>(_self.bbox, (value) {
    return _then(_self.copyWith(bbox: value));
  });
}
}


/// @nodoc
mixin _$ClusterGeometryModel {

/// Danh sách các rings tạo thành polygon
/// Mỗi ring là một mảng các tọa độ [lng, lat]
/// Ring đầu tiên là outer ring, các ring sau (nếu có) là holes
 List<List<List<double>>> get rings;/// Hệ tọa độ không gian sử dụng
 SpatialReferenceModel get spatialReference;
/// Create a copy of ClusterGeometryModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ClusterGeometryModelCopyWith<ClusterGeometryModel> get copyWith => _$ClusterGeometryModelCopyWithImpl<ClusterGeometryModel>(this as ClusterGeometryModel, _$identity);

  /// Serializes this ClusterGeometryModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ClusterGeometryModel&&const DeepCollectionEquality().equals(other.rings, rings)&&(identical(other.spatialReference, spatialReference) || other.spatialReference == spatialReference));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(rings),spatialReference);

@override
String toString() {
  return 'ClusterGeometryModel(rings: $rings, spatialReference: $spatialReference)';
}


}

/// @nodoc
abstract mixin class $ClusterGeometryModelCopyWith<$Res>  {
  factory $ClusterGeometryModelCopyWith(ClusterGeometryModel value, $Res Function(ClusterGeometryModel) _then) = _$ClusterGeometryModelCopyWithImpl;
@useResult
$Res call({
 List<List<List<double>>> rings, SpatialReferenceModel spatialReference
});


$SpatialReferenceModelCopyWith<$Res> get spatialReference;

}
/// @nodoc
class _$ClusterGeometryModelCopyWithImpl<$Res>
    implements $ClusterGeometryModelCopyWith<$Res> {
  _$ClusterGeometryModelCopyWithImpl(this._self, this._then);

  final ClusterGeometryModel _self;
  final $Res Function(ClusterGeometryModel) _then;

/// Create a copy of ClusterGeometryModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? rings = null,Object? spatialReference = null,}) {
  return _then(_self.copyWith(
rings: null == rings ? _self.rings : rings // ignore: cast_nullable_to_non_nullable
as List<List<List<double>>>,spatialReference: null == spatialReference ? _self.spatialReference : spatialReference // ignore: cast_nullable_to_non_nullable
as SpatialReferenceModel,
  ));
}
/// Create a copy of ClusterGeometryModel
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$SpatialReferenceModelCopyWith<$Res> get spatialReference {
  
  return $SpatialReferenceModelCopyWith<$Res>(_self.spatialReference, (value) {
    return _then(_self.copyWith(spatialReference: value));
  });
}
}


/// Adds pattern-matching-related methods to [ClusterGeometryModel].
extension ClusterGeometryModelPatterns on ClusterGeometryModel {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _ClusterGeometryModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _ClusterGeometryModel() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _ClusterGeometryModel value)  $default,){
final _that = this;
switch (_that) {
case _ClusterGeometryModel():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _ClusterGeometryModel value)?  $default,){
final _that = this;
switch (_that) {
case _ClusterGeometryModel() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( List<List<List<double>>> rings,  SpatialReferenceModel spatialReference)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _ClusterGeometryModel() when $default != null:
return $default(_that.rings,_that.spatialReference);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( List<List<List<double>>> rings,  SpatialReferenceModel spatialReference)  $default,) {final _that = this;
switch (_that) {
case _ClusterGeometryModel():
return $default(_that.rings,_that.spatialReference);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( List<List<List<double>>> rings,  SpatialReferenceModel spatialReference)?  $default,) {final _that = this;
switch (_that) {
case _ClusterGeometryModel() when $default != null:
return $default(_that.rings,_that.spatialReference);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _ClusterGeometryModel extends ClusterGeometryModel {
  const _ClusterGeometryModel({required final  List<List<List<double>>> rings, required this.spatialReference}): _rings = rings,super._();
  factory _ClusterGeometryModel.fromJson(Map<String, dynamic> json) => _$ClusterGeometryModelFromJson(json);

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

/// Hệ tọa độ không gian sử dụng
@override final  SpatialReferenceModel spatialReference;

/// Create a copy of ClusterGeometryModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ClusterGeometryModelCopyWith<_ClusterGeometryModel> get copyWith => __$ClusterGeometryModelCopyWithImpl<_ClusterGeometryModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$ClusterGeometryModelToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ClusterGeometryModel&&const DeepCollectionEquality().equals(other._rings, _rings)&&(identical(other.spatialReference, spatialReference) || other.spatialReference == spatialReference));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(_rings),spatialReference);

@override
String toString() {
  return 'ClusterGeometryModel(rings: $rings, spatialReference: $spatialReference)';
}


}

/// @nodoc
abstract mixin class _$ClusterGeometryModelCopyWith<$Res> implements $ClusterGeometryModelCopyWith<$Res> {
  factory _$ClusterGeometryModelCopyWith(_ClusterGeometryModel value, $Res Function(_ClusterGeometryModel) _then) = __$ClusterGeometryModelCopyWithImpl;
@override @useResult
$Res call({
 List<List<List<double>>> rings, SpatialReferenceModel spatialReference
});


@override $SpatialReferenceModelCopyWith<$Res> get spatialReference;

}
/// @nodoc
class __$ClusterGeometryModelCopyWithImpl<$Res>
    implements _$ClusterGeometryModelCopyWith<$Res> {
  __$ClusterGeometryModelCopyWithImpl(this._self, this._then);

  final _ClusterGeometryModel _self;
  final $Res Function(_ClusterGeometryModel) _then;

/// Create a copy of ClusterGeometryModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? rings = null,Object? spatialReference = null,}) {
  return _then(_ClusterGeometryModel(
rings: null == rings ? _self._rings : rings // ignore: cast_nullable_to_non_nullable
as List<List<List<double>>>,spatialReference: null == spatialReference ? _self.spatialReference : spatialReference // ignore: cast_nullable_to_non_nullable
as SpatialReferenceModel,
  ));
}

/// Create a copy of ClusterGeometryModel
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$SpatialReferenceModelCopyWith<$Res> get spatialReference {
  
  return $SpatialReferenceModelCopyWith<$Res>(_self.spatialReference, (value) {
    return _then(_self.copyWith(spatialReference: value));
  });
}
}


/// @nodoc
mixin _$SpatialReferenceModel {

/// Well-Known ID của hệ tọa độ
/// Ví dụ: 4326 = WGS84 (latitude/longitude), 3857 = Web Mercator
 int get wkid;
/// Create a copy of SpatialReferenceModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$SpatialReferenceModelCopyWith<SpatialReferenceModel> get copyWith => _$SpatialReferenceModelCopyWithImpl<SpatialReferenceModel>(this as SpatialReferenceModel, _$identity);

  /// Serializes this SpatialReferenceModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is SpatialReferenceModel&&(identical(other.wkid, wkid) || other.wkid == wkid));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,wkid);

@override
String toString() {
  return 'SpatialReferenceModel(wkid: $wkid)';
}


}

/// @nodoc
abstract mixin class $SpatialReferenceModelCopyWith<$Res>  {
  factory $SpatialReferenceModelCopyWith(SpatialReferenceModel value, $Res Function(SpatialReferenceModel) _then) = _$SpatialReferenceModelCopyWithImpl;
@useResult
$Res call({
 int wkid
});




}
/// @nodoc
class _$SpatialReferenceModelCopyWithImpl<$Res>
    implements $SpatialReferenceModelCopyWith<$Res> {
  _$SpatialReferenceModelCopyWithImpl(this._self, this._then);

  final SpatialReferenceModel _self;
  final $Res Function(SpatialReferenceModel) _then;

/// Create a copy of SpatialReferenceModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? wkid = null,}) {
  return _then(_self.copyWith(
wkid: null == wkid ? _self.wkid : wkid // ignore: cast_nullable_to_non_nullable
as int,
  ));
}

}


/// Adds pattern-matching-related methods to [SpatialReferenceModel].
extension SpatialReferenceModelPatterns on SpatialReferenceModel {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _SpatialReferenceModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _SpatialReferenceModel() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _SpatialReferenceModel value)  $default,){
final _that = this;
switch (_that) {
case _SpatialReferenceModel():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _SpatialReferenceModel value)?  $default,){
final _that = this;
switch (_that) {
case _SpatialReferenceModel() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int wkid)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _SpatialReferenceModel() when $default != null:
return $default(_that.wkid);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int wkid)  $default,) {final _that = this;
switch (_that) {
case _SpatialReferenceModel():
return $default(_that.wkid);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int wkid)?  $default,) {final _that = this;
switch (_that) {
case _SpatialReferenceModel() when $default != null:
return $default(_that.wkid);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _SpatialReferenceModel implements SpatialReferenceModel {
  const _SpatialReferenceModel({required this.wkid});
  factory _SpatialReferenceModel.fromJson(Map<String, dynamic> json) => _$SpatialReferenceModelFromJson(json);

/// Well-Known ID của hệ tọa độ
/// Ví dụ: 4326 = WGS84 (latitude/longitude), 3857 = Web Mercator
@override final  int wkid;

/// Create a copy of SpatialReferenceModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$SpatialReferenceModelCopyWith<_SpatialReferenceModel> get copyWith => __$SpatialReferenceModelCopyWithImpl<_SpatialReferenceModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$SpatialReferenceModelToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _SpatialReferenceModel&&(identical(other.wkid, wkid) || other.wkid == wkid));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,wkid);

@override
String toString() {
  return 'SpatialReferenceModel(wkid: $wkid)';
}


}

/// @nodoc
abstract mixin class _$SpatialReferenceModelCopyWith<$Res> implements $SpatialReferenceModelCopyWith<$Res> {
  factory _$SpatialReferenceModelCopyWith(_SpatialReferenceModel value, $Res Function(_SpatialReferenceModel) _then) = __$SpatialReferenceModelCopyWithImpl;
@override @useResult
$Res call({
 int wkid
});




}
/// @nodoc
class __$SpatialReferenceModelCopyWithImpl<$Res>
    implements _$SpatialReferenceModelCopyWith<$Res> {
  __$SpatialReferenceModelCopyWithImpl(this._self, this._then);

  final _SpatialReferenceModel _self;
  final $Res Function(_SpatialReferenceModel) _then;

/// Create a copy of SpatialReferenceModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? wkid = null,}) {
  return _then(_SpatialReferenceModel(
wkid: null == wkid ? _self.wkid : wkid // ignore: cast_nullable_to_non_nullable
as int,
  ));
}


}

// dart format on
