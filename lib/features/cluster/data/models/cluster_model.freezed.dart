// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'cluster_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

ClusterResponseModel _$ClusterResponseModelFromJson(Map<String, dynamic> json) {
  return _ClusterResponseModel.fromJson(json);
}

/// @nodoc
mixin _$ClusterResponseModel {
  /// Trạng thái response: "success" hoặc "error"
  String get status => throw _privateConstructorUsedError;

  /// Thông báo mô tả kết quả
  String get message => throw _privateConstructorUsedError;

  /// Tổng số bản ghi sự cố được phân tích
  @JsonKey(name: 'total_records')
  int get totalRecords => throw _privateConstructorUsedError;

  /// Thông tin tổng quan về quá trình phân cụm
  @JsonKey(name: 'clustering_info')
  ClusteringInfoModel get clusteringInfo => throw _privateConstructorUsedError;

  /// Danh sách các cluster/hotspot đã được phân cụm
  @JsonKey(name: 'clusters')
  List<ClusterHotspotModel> get clusters => throw _privateConstructorUsedError;

  /// Danh sách các điểm sự cố gốc với thông tin cluster được gán
  @JsonKey(name: 'data')
  List<ClusterItemModel> get data => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ClusterResponseModelCopyWith<ClusterResponseModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ClusterResponseModelCopyWith<$Res> {
  factory $ClusterResponseModelCopyWith(ClusterResponseModel value,
          $Res Function(ClusterResponseModel) then) =
      _$ClusterResponseModelCopyWithImpl<$Res, ClusterResponseModel>;
  @useResult
  $Res call(
      {String status,
      String message,
      @JsonKey(name: 'total_records') int totalRecords,
      @JsonKey(name: 'clustering_info') ClusteringInfoModel clusteringInfo,
      @JsonKey(name: 'clusters') List<ClusterHotspotModel> clusters,
      @JsonKey(name: 'data') List<ClusterItemModel> data});

  $ClusteringInfoModelCopyWith<$Res> get clusteringInfo;
}

/// @nodoc
class _$ClusterResponseModelCopyWithImpl<$Res,
        $Val extends ClusterResponseModel>
    implements $ClusterResponseModelCopyWith<$Res> {
  _$ClusterResponseModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? status = null,
    Object? message = null,
    Object? totalRecords = null,
    Object? clusteringInfo = null,
    Object? clusters = null,
    Object? data = null,
  }) {
    return _then(_value.copyWith(
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as String,
      message: null == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
      totalRecords: null == totalRecords
          ? _value.totalRecords
          : totalRecords // ignore: cast_nullable_to_non_nullable
              as int,
      clusteringInfo: null == clusteringInfo
          ? _value.clusteringInfo
          : clusteringInfo // ignore: cast_nullable_to_non_nullable
              as ClusteringInfoModel,
      clusters: null == clusters
          ? _value.clusters
          : clusters // ignore: cast_nullable_to_non_nullable
              as List<ClusterHotspotModel>,
      data: null == data
          ? _value.data
          : data // ignore: cast_nullable_to_non_nullable
              as List<ClusterItemModel>,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $ClusteringInfoModelCopyWith<$Res> get clusteringInfo {
    return $ClusteringInfoModelCopyWith<$Res>(_value.clusteringInfo, (value) {
      return _then(_value.copyWith(clusteringInfo: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$ClusterResponseModelImplCopyWith<$Res>
    implements $ClusterResponseModelCopyWith<$Res> {
  factory _$$ClusterResponseModelImplCopyWith(_$ClusterResponseModelImpl value,
          $Res Function(_$ClusterResponseModelImpl) then) =
      __$$ClusterResponseModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String status,
      String message,
      @JsonKey(name: 'total_records') int totalRecords,
      @JsonKey(name: 'clustering_info') ClusteringInfoModel clusteringInfo,
      @JsonKey(name: 'clusters') List<ClusterHotspotModel> clusters,
      @JsonKey(name: 'data') List<ClusterItemModel> data});

  @override
  $ClusteringInfoModelCopyWith<$Res> get clusteringInfo;
}

/// @nodoc
class __$$ClusterResponseModelImplCopyWithImpl<$Res>
    extends _$ClusterResponseModelCopyWithImpl<$Res, _$ClusterResponseModelImpl>
    implements _$$ClusterResponseModelImplCopyWith<$Res> {
  __$$ClusterResponseModelImplCopyWithImpl(_$ClusterResponseModelImpl _value,
      $Res Function(_$ClusterResponseModelImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? status = null,
    Object? message = null,
    Object? totalRecords = null,
    Object? clusteringInfo = null,
    Object? clusters = null,
    Object? data = null,
  }) {
    return _then(_$ClusterResponseModelImpl(
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as String,
      message: null == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
      totalRecords: null == totalRecords
          ? _value.totalRecords
          : totalRecords // ignore: cast_nullable_to_non_nullable
              as int,
      clusteringInfo: null == clusteringInfo
          ? _value.clusteringInfo
          : clusteringInfo // ignore: cast_nullable_to_non_nullable
              as ClusteringInfoModel,
      clusters: null == clusters
          ? _value._clusters
          : clusters // ignore: cast_nullable_to_non_nullable
              as List<ClusterHotspotModel>,
      data: null == data
          ? _value._data
          : data // ignore: cast_nullable_to_non_nullable
              as List<ClusterItemModel>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$ClusterResponseModelImpl extends _ClusterResponseModel {
  const _$ClusterResponseModelImpl(
      {required this.status,
      required this.message,
      @JsonKey(name: 'total_records') required this.totalRecords,
      @JsonKey(name: 'clustering_info') required this.clusteringInfo,
      @JsonKey(name: 'clusters')
      required final List<ClusterHotspotModel> clusters,
      @JsonKey(name: 'data') required final List<ClusterItemModel> data})
      : _clusters = clusters,
        _data = data,
        super._();

  factory _$ClusterResponseModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$ClusterResponseModelImplFromJson(json);

  /// Trạng thái response: "success" hoặc "error"
  @override
  final String status;

  /// Thông báo mô tả kết quả
  @override
  final String message;

  /// Tổng số bản ghi sự cố được phân tích
  @override
  @JsonKey(name: 'total_records')
  final int totalRecords;

  /// Thông tin tổng quan về quá trình phân cụm
  @override
  @JsonKey(name: 'clustering_info')
  final ClusteringInfoModel clusteringInfo;

  /// Danh sách các cluster/hotspot đã được phân cụm
  final List<ClusterHotspotModel> _clusters;

  /// Danh sách các cluster/hotspot đã được phân cụm
  @override
  @JsonKey(name: 'clusters')
  List<ClusterHotspotModel> get clusters {
    if (_clusters is EqualUnmodifiableListView) return _clusters;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_clusters);
  }

  /// Danh sách các điểm sự cố gốc với thông tin cluster được gán
  final List<ClusterItemModel> _data;

  /// Danh sách các điểm sự cố gốc với thông tin cluster được gán
  @override
  @JsonKey(name: 'data')
  List<ClusterItemModel> get data {
    if (_data is EqualUnmodifiableListView) return _data;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_data);
  }

  @override
  String toString() {
    return 'ClusterResponseModel(status: $status, message: $message, totalRecords: $totalRecords, clusteringInfo: $clusteringInfo, clusters: $clusters, data: $data)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ClusterResponseModelImpl &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.message, message) || other.message == message) &&
            (identical(other.totalRecords, totalRecords) ||
                other.totalRecords == totalRecords) &&
            (identical(other.clusteringInfo, clusteringInfo) ||
                other.clusteringInfo == clusteringInfo) &&
            const DeepCollectionEquality().equals(other._clusters, _clusters) &&
            const DeepCollectionEquality().equals(other._data, _data));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      status,
      message,
      totalRecords,
      clusteringInfo,
      const DeepCollectionEquality().hash(_clusters),
      const DeepCollectionEquality().hash(_data));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ClusterResponseModelImplCopyWith<_$ClusterResponseModelImpl>
      get copyWith =>
          __$$ClusterResponseModelImplCopyWithImpl<_$ClusterResponseModelImpl>(
              this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ClusterResponseModelImplToJson(
      this,
    );
  }
}

abstract class _ClusterResponseModel extends ClusterResponseModel {
  const factory _ClusterResponseModel(
          {required final String status,
          required final String message,
          @JsonKey(name: 'total_records') required final int totalRecords,
          @JsonKey(name: 'clustering_info')
          required final ClusteringInfoModel clusteringInfo,
          @JsonKey(name: 'clusters')
          required final List<ClusterHotspotModel> clusters,
          @JsonKey(name: 'data') required final List<ClusterItemModel> data}) =
      _$ClusterResponseModelImpl;
  const _ClusterResponseModel._() : super._();

  factory _ClusterResponseModel.fromJson(Map<String, dynamic> json) =
      _$ClusterResponseModelImpl.fromJson;

  @override

  /// Trạng thái response: "success" hoặc "error"
  String get status;
  @override

  /// Thông báo mô tả kết quả
  String get message;
  @override

  /// Tổng số bản ghi sự cố được phân tích
  @JsonKey(name: 'total_records')
  int get totalRecords;
  @override

  /// Thông tin tổng quan về quá trình phân cụm
  @JsonKey(name: 'clustering_info')
  ClusteringInfoModel get clusteringInfo;
  @override

  /// Danh sách các cluster/hotspot đã được phân cụm
  @JsonKey(name: 'clusters')
  List<ClusterHotspotModel> get clusters;
  @override

  /// Danh sách các điểm sự cố gốc với thông tin cluster được gán
  @JsonKey(name: 'data')
  List<ClusterItemModel> get data;
  @override
  @JsonKey(ignore: true)
  _$$ClusterResponseModelImplCopyWith<_$ClusterResponseModelImpl>
      get copyWith => throw _privateConstructorUsedError;
}

ClusteringInfoModel _$ClusteringInfoModelFromJson(Map<String, dynamic> json) {
  return _ClusteringInfoModel.fromJson(json);
}

/// @nodoc
mixin _$ClusteringInfoModel {
  /// Thuật toán được sử dụng (ví dụ: "DBSCAN")
  String get algorithm => throw _privateConstructorUsedError;

  /// Bán kính epsilon của thuật toán DBSCAN (đơn vị: mét)
  /// Quyết định khoảng cách tối đa giữa 2 điểm để được coi là cùng cluster
  double get eps => throw _privateConstructorUsedError;

  /// Số lượng cluster tìm được (không tính noise)
  @JsonKey(name: 'n_clusters')
  int get nClusters => throw _privateConstructorUsedError;

  /// Số lượng điểm nhiễu (outliers không thuộc cluster nào)
  @JsonKey(name: 'n_noise')
  int get nNoise => throw _privateConstructorUsedError;

  /// Số lượng điểm lõi (core points) - điểm có đủ láng giềng trong bán kính eps
  @JsonKey(name: 'n_core_points')
  int get nCorePoints => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ClusteringInfoModelCopyWith<ClusteringInfoModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ClusteringInfoModelCopyWith<$Res> {
  factory $ClusteringInfoModelCopyWith(
          ClusteringInfoModel value, $Res Function(ClusteringInfoModel) then) =
      _$ClusteringInfoModelCopyWithImpl<$Res, ClusteringInfoModel>;
  @useResult
  $Res call(
      {String algorithm,
      double eps,
      @JsonKey(name: 'n_clusters') int nClusters,
      @JsonKey(name: 'n_noise') int nNoise,
      @JsonKey(name: 'n_core_points') int nCorePoints});
}

/// @nodoc
class _$ClusteringInfoModelCopyWithImpl<$Res, $Val extends ClusteringInfoModel>
    implements $ClusteringInfoModelCopyWith<$Res> {
  _$ClusteringInfoModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? algorithm = null,
    Object? eps = null,
    Object? nClusters = null,
    Object? nNoise = null,
    Object? nCorePoints = null,
  }) {
    return _then(_value.copyWith(
      algorithm: null == algorithm
          ? _value.algorithm
          : algorithm // ignore: cast_nullable_to_non_nullable
              as String,
      eps: null == eps
          ? _value.eps
          : eps // ignore: cast_nullable_to_non_nullable
              as double,
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
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ClusteringInfoModelImplCopyWith<$Res>
    implements $ClusteringInfoModelCopyWith<$Res> {
  factory _$$ClusteringInfoModelImplCopyWith(_$ClusteringInfoModelImpl value,
          $Res Function(_$ClusteringInfoModelImpl) then) =
      __$$ClusteringInfoModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String algorithm,
      double eps,
      @JsonKey(name: 'n_clusters') int nClusters,
      @JsonKey(name: 'n_noise') int nNoise,
      @JsonKey(name: 'n_core_points') int nCorePoints});
}

/// @nodoc
class __$$ClusteringInfoModelImplCopyWithImpl<$Res>
    extends _$ClusteringInfoModelCopyWithImpl<$Res, _$ClusteringInfoModelImpl>
    implements _$$ClusteringInfoModelImplCopyWith<$Res> {
  __$$ClusteringInfoModelImplCopyWithImpl(_$ClusteringInfoModelImpl _value,
      $Res Function(_$ClusteringInfoModelImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? algorithm = null,
    Object? eps = null,
    Object? nClusters = null,
    Object? nNoise = null,
    Object? nCorePoints = null,
  }) {
    return _then(_$ClusteringInfoModelImpl(
      algorithm: null == algorithm
          ? _value.algorithm
          : algorithm // ignore: cast_nullable_to_non_nullable
              as String,
      eps: null == eps
          ? _value.eps
          : eps // ignore: cast_nullable_to_non_nullable
              as double,
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
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$ClusteringInfoModelImpl implements _ClusteringInfoModel {
  const _$ClusteringInfoModelImpl(
      {required this.algorithm,
      required this.eps,
      @JsonKey(name: 'n_clusters') required this.nClusters,
      @JsonKey(name: 'n_noise') required this.nNoise,
      @JsonKey(name: 'n_core_points') required this.nCorePoints});

  factory _$ClusteringInfoModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$ClusteringInfoModelImplFromJson(json);

  /// Thuật toán được sử dụng (ví dụ: "DBSCAN")
  @override
  final String algorithm;

  /// Bán kính epsilon của thuật toán DBSCAN (đơn vị: mét)
  /// Quyết định khoảng cách tối đa giữa 2 điểm để được coi là cùng cluster
  @override
  final double eps;

  /// Số lượng cluster tìm được (không tính noise)
  @override
  @JsonKey(name: 'n_clusters')
  final int nClusters;

  /// Số lượng điểm nhiễu (outliers không thuộc cluster nào)
  @override
  @JsonKey(name: 'n_noise')
  final int nNoise;

  /// Số lượng điểm lõi (core points) - điểm có đủ láng giềng trong bán kính eps
  @override
  @JsonKey(name: 'n_core_points')
  final int nCorePoints;

  @override
  String toString() {
    return 'ClusteringInfoModel(algorithm: $algorithm, eps: $eps, nClusters: $nClusters, nNoise: $nNoise, nCorePoints: $nCorePoints)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ClusteringInfoModelImpl &&
            (identical(other.algorithm, algorithm) ||
                other.algorithm == algorithm) &&
            (identical(other.eps, eps) || other.eps == eps) &&
            (identical(other.nClusters, nClusters) ||
                other.nClusters == nClusters) &&
            (identical(other.nNoise, nNoise) || other.nNoise == nNoise) &&
            (identical(other.nCorePoints, nCorePoints) ||
                other.nCorePoints == nCorePoints));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode =>
      Object.hash(runtimeType, algorithm, eps, nClusters, nNoise, nCorePoints);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ClusteringInfoModelImplCopyWith<_$ClusteringInfoModelImpl> get copyWith =>
      __$$ClusteringInfoModelImplCopyWithImpl<_$ClusteringInfoModelImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ClusteringInfoModelImplToJson(
      this,
    );
  }
}

abstract class _ClusteringInfoModel implements ClusteringInfoModel {
  const factory _ClusteringInfoModel(
          {required final String algorithm,
          required final double eps,
          @JsonKey(name: 'n_clusters') required final int nClusters,
          @JsonKey(name: 'n_noise') required final int nNoise,
          @JsonKey(name: 'n_core_points') required final int nCorePoints}) =
      _$ClusteringInfoModelImpl;

  factory _ClusteringInfoModel.fromJson(Map<String, dynamic> json) =
      _$ClusteringInfoModelImpl.fromJson;

  @override

  /// Thuật toán được sử dụng (ví dụ: "DBSCAN")
  String get algorithm;
  @override

  /// Bán kính epsilon của thuật toán DBSCAN (đơn vị: mét)
  /// Quyết định khoảng cách tối đa giữa 2 điểm để được coi là cùng cluster
  double get eps;
  @override

  /// Số lượng cluster tìm được (không tính noise)
  @JsonKey(name: 'n_clusters')
  int get nClusters;
  @override

  /// Số lượng điểm nhiễu (outliers không thuộc cluster nào)
  @JsonKey(name: 'n_noise')
  int get nNoise;
  @override

  /// Số lượng điểm lõi (core points) - điểm có đủ láng giềng trong bán kính eps
  @JsonKey(name: 'n_core_points')
  int get nCorePoints;
  @override
  @JsonKey(ignore: true)
  _$$ClusteringInfoModelImplCopyWith<_$ClusteringInfoModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

ClusterItemModel _$ClusterItemModelFromJson(Map<String, dynamic> json) {
  return _ClusterItemModel.fromJson(json);
}

/// @nodoc
mixin _$ClusterItemModel {
  /// ID duy nhất của điểm sự cố từ ArcGIS
  @JsonKey(name: 'OBJECTID')
  int get objectId => throw _privateConstructorUsedError;

  /// Kinh độ của điểm sự cố
  double get longitude => throw _privateConstructorUsedError;

  /// Vĩ độ của điểm sự cố
  double get latitude => throw _privateConstructorUsedError;

  /// ID của cluster mà điểm này thuộc về
  /// Giá trị -1 nghĩa là điểm nhiễu (noise/outlier)
  @JsonKey(name: 'Cluster_ID')
  int get clusterId => throw _privateConstructorUsedError;

  /// Đánh dấu điểm có phải là core point hay không
  /// 1 = core point (có đủ láng giềng), 0 = border point hoặc noise
  @JsonKey(name: 'Is_Core_Point')
  int get isCorePoint => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ClusterItemModelCopyWith<ClusterItemModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ClusterItemModelCopyWith<$Res> {
  factory $ClusterItemModelCopyWith(
          ClusterItemModel value, $Res Function(ClusterItemModel) then) =
      _$ClusterItemModelCopyWithImpl<$Res, ClusterItemModel>;
  @useResult
  $Res call(
      {@JsonKey(name: 'OBJECTID') int objectId,
      double longitude,
      double latitude,
      @JsonKey(name: 'Cluster_ID') int clusterId,
      @JsonKey(name: 'Is_Core_Point') int isCorePoint});
}

/// @nodoc
class _$ClusterItemModelCopyWithImpl<$Res, $Val extends ClusterItemModel>
    implements $ClusterItemModelCopyWith<$Res> {
  _$ClusterItemModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? objectId = null,
    Object? longitude = null,
    Object? latitude = null,
    Object? clusterId = null,
    Object? isCorePoint = null,
  }) {
    return _then(_value.copyWith(
      objectId: null == objectId
          ? _value.objectId
          : objectId // ignore: cast_nullable_to_non_nullable
              as int,
      longitude: null == longitude
          ? _value.longitude
          : longitude // ignore: cast_nullable_to_non_nullable
              as double,
      latitude: null == latitude
          ? _value.latitude
          : latitude // ignore: cast_nullable_to_non_nullable
              as double,
      clusterId: null == clusterId
          ? _value.clusterId
          : clusterId // ignore: cast_nullable_to_non_nullable
              as int,
      isCorePoint: null == isCorePoint
          ? _value.isCorePoint
          : isCorePoint // ignore: cast_nullable_to_non_nullable
              as int,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ClusterItemModelImplCopyWith<$Res>
    implements $ClusterItemModelCopyWith<$Res> {
  factory _$$ClusterItemModelImplCopyWith(_$ClusterItemModelImpl value,
          $Res Function(_$ClusterItemModelImpl) then) =
      __$$ClusterItemModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'OBJECTID') int objectId,
      double longitude,
      double latitude,
      @JsonKey(name: 'Cluster_ID') int clusterId,
      @JsonKey(name: 'Is_Core_Point') int isCorePoint});
}

/// @nodoc
class __$$ClusterItemModelImplCopyWithImpl<$Res>
    extends _$ClusterItemModelCopyWithImpl<$Res, _$ClusterItemModelImpl>
    implements _$$ClusterItemModelImplCopyWith<$Res> {
  __$$ClusterItemModelImplCopyWithImpl(_$ClusterItemModelImpl _value,
      $Res Function(_$ClusterItemModelImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? objectId = null,
    Object? longitude = null,
    Object? latitude = null,
    Object? clusterId = null,
    Object? isCorePoint = null,
  }) {
    return _then(_$ClusterItemModelImpl(
      objectId: null == objectId
          ? _value.objectId
          : objectId // ignore: cast_nullable_to_non_nullable
              as int,
      longitude: null == longitude
          ? _value.longitude
          : longitude // ignore: cast_nullable_to_non_nullable
              as double,
      latitude: null == latitude
          ? _value.latitude
          : latitude // ignore: cast_nullable_to_non_nullable
              as double,
      clusterId: null == clusterId
          ? _value.clusterId
          : clusterId // ignore: cast_nullable_to_non_nullable
              as int,
      isCorePoint: null == isCorePoint
          ? _value.isCorePoint
          : isCorePoint // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$ClusterItemModelImpl extends _ClusterItemModel {
  const _$ClusterItemModelImpl(
      {@JsonKey(name: 'OBJECTID') required this.objectId,
      required this.longitude,
      required this.latitude,
      @JsonKey(name: 'Cluster_ID') required this.clusterId,
      @JsonKey(name: 'Is_Core_Point') required this.isCorePoint})
      : super._();

  factory _$ClusterItemModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$ClusterItemModelImplFromJson(json);

  /// ID duy nhất của điểm sự cố từ ArcGIS
  @override
  @JsonKey(name: 'OBJECTID')
  final int objectId;

  /// Kinh độ của điểm sự cố
  @override
  final double longitude;

  /// Vĩ độ của điểm sự cố
  @override
  final double latitude;

  /// ID của cluster mà điểm này thuộc về
  /// Giá trị -1 nghĩa là điểm nhiễu (noise/outlier)
  @override
  @JsonKey(name: 'Cluster_ID')
  final int clusterId;

  /// Đánh dấu điểm có phải là core point hay không
  /// 1 = core point (có đủ láng giềng), 0 = border point hoặc noise
  @override
  @JsonKey(name: 'Is_Core_Point')
  final int isCorePoint;

  @override
  String toString() {
    return 'ClusterItemModel(objectId: $objectId, longitude: $longitude, latitude: $latitude, clusterId: $clusterId, isCorePoint: $isCorePoint)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ClusterItemModelImpl &&
            (identical(other.objectId, objectId) ||
                other.objectId == objectId) &&
            (identical(other.longitude, longitude) ||
                other.longitude == longitude) &&
            (identical(other.latitude, latitude) ||
                other.latitude == latitude) &&
            (identical(other.clusterId, clusterId) ||
                other.clusterId == clusterId) &&
            (identical(other.isCorePoint, isCorePoint) ||
                other.isCorePoint == isCorePoint));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType, objectId, longitude, latitude, clusterId, isCorePoint);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ClusterItemModelImplCopyWith<_$ClusterItemModelImpl> get copyWith =>
      __$$ClusterItemModelImplCopyWithImpl<_$ClusterItemModelImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ClusterItemModelImplToJson(
      this,
    );
  }
}

abstract class _ClusterItemModel extends ClusterItemModel {
  const factory _ClusterItemModel(
          {@JsonKey(name: 'OBJECTID') required final int objectId,
          required final double longitude,
          required final double latitude,
          @JsonKey(name: 'Cluster_ID') required final int clusterId,
          @JsonKey(name: 'Is_Core_Point') required final int isCorePoint}) =
      _$ClusterItemModelImpl;
  const _ClusterItemModel._() : super._();

  factory _ClusterItemModel.fromJson(Map<String, dynamic> json) =
      _$ClusterItemModelImpl.fromJson;

  @override

  /// ID duy nhất của điểm sự cố từ ArcGIS
  @JsonKey(name: 'OBJECTID')
  int get objectId;
  @override

  /// Kinh độ của điểm sự cố
  double get longitude;
  @override

  /// Vĩ độ của điểm sự cố
  double get latitude;
  @override

  /// ID của cluster mà điểm này thuộc về
  /// Giá trị -1 nghĩa là điểm nhiễu (noise/outlier)
  @JsonKey(name: 'Cluster_ID')
  int get clusterId;
  @override

  /// Đánh dấu điểm có phải là core point hay không
  /// 1 = core point (có đủ láng giềng), 0 = border point hoặc noise
  @JsonKey(name: 'Is_Core_Point')
  int get isCorePoint;
  @override
  @JsonKey(ignore: true)
  _$$ClusterItemModelImplCopyWith<_$ClusterItemModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

ClusterBBoxModel _$ClusterBBoxModelFromJson(Map<String, dynamic> json) {
  return _ClusterBBoxModel.fromJson(json);
}

/// @nodoc
mixin _$ClusterBBoxModel {
  /// Kinh độ nhỏ nhất (cạnh trái)
  double get xmin => throw _privateConstructorUsedError;

  /// Vĩ độ nhỏ nhất (cạnh dưới)
  double get ymin => throw _privateConstructorUsedError;

  /// Kinh độ lớn nhất (cạnh phải)
  double get xmax => throw _privateConstructorUsedError;

  /// Vĩ độ lớn nhất (cạnh trên)
  double get ymax => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ClusterBBoxModelCopyWith<ClusterBBoxModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ClusterBBoxModelCopyWith<$Res> {
  factory $ClusterBBoxModelCopyWith(
          ClusterBBoxModel value, $Res Function(ClusterBBoxModel) then) =
      _$ClusterBBoxModelCopyWithImpl<$Res, ClusterBBoxModel>;
  @useResult
  $Res call({double xmin, double ymin, double xmax, double ymax});
}

/// @nodoc
class _$ClusterBBoxModelCopyWithImpl<$Res, $Val extends ClusterBBoxModel>
    implements $ClusterBBoxModelCopyWith<$Res> {
  _$ClusterBBoxModelCopyWithImpl(this._value, this._then);

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
abstract class _$$ClusterBBoxModelImplCopyWith<$Res>
    implements $ClusterBBoxModelCopyWith<$Res> {
  factory _$$ClusterBBoxModelImplCopyWith(_$ClusterBBoxModelImpl value,
          $Res Function(_$ClusterBBoxModelImpl) then) =
      __$$ClusterBBoxModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({double xmin, double ymin, double xmax, double ymax});
}

/// @nodoc
class __$$ClusterBBoxModelImplCopyWithImpl<$Res>
    extends _$ClusterBBoxModelCopyWithImpl<$Res, _$ClusterBBoxModelImpl>
    implements _$$ClusterBBoxModelImplCopyWith<$Res> {
  __$$ClusterBBoxModelImplCopyWithImpl(_$ClusterBBoxModelImpl _value,
      $Res Function(_$ClusterBBoxModelImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? xmin = null,
    Object? ymin = null,
    Object? xmax = null,
    Object? ymax = null,
  }) {
    return _then(_$ClusterBBoxModelImpl(
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
@JsonSerializable()
class _$ClusterBBoxModelImpl extends _ClusterBBoxModel {
  const _$ClusterBBoxModelImpl(
      {required this.xmin,
      required this.ymin,
      required this.xmax,
      required this.ymax})
      : super._();

  factory _$ClusterBBoxModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$ClusterBBoxModelImplFromJson(json);

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
    return 'ClusterBBoxModel(xmin: $xmin, ymin: $ymin, xmax: $xmax, ymax: $ymax)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ClusterBBoxModelImpl &&
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
  _$$ClusterBBoxModelImplCopyWith<_$ClusterBBoxModelImpl> get copyWith =>
      __$$ClusterBBoxModelImplCopyWithImpl<_$ClusterBBoxModelImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ClusterBBoxModelImplToJson(
      this,
    );
  }
}

abstract class _ClusterBBoxModel extends ClusterBBoxModel {
  const factory _ClusterBBoxModel(
      {required final double xmin,
      required final double ymin,
      required final double xmax,
      required final double ymax}) = _$ClusterBBoxModelImpl;
  const _ClusterBBoxModel._() : super._();

  factory _ClusterBBoxModel.fromJson(Map<String, dynamic> json) =
      _$ClusterBBoxModelImpl.fromJson;

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
  _$$ClusterBBoxModelImplCopyWith<_$ClusterBBoxModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

ClusterCentroidModel _$ClusterCentroidModelFromJson(Map<String, dynamic> json) {
  return _ClusterCentroidModel.fromJson(json);
}

/// @nodoc
mixin _$ClusterCentroidModel {
  /// Vĩ độ của tâm cluster
  double get lat => throw _privateConstructorUsedError;

  /// Kinh độ của tâm cluster
  double get lng => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ClusterCentroidModelCopyWith<ClusterCentroidModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ClusterCentroidModelCopyWith<$Res> {
  factory $ClusterCentroidModelCopyWith(ClusterCentroidModel value,
          $Res Function(ClusterCentroidModel) then) =
      _$ClusterCentroidModelCopyWithImpl<$Res, ClusterCentroidModel>;
  @useResult
  $Res call({double lat, double lng});
}

/// @nodoc
class _$ClusterCentroidModelCopyWithImpl<$Res,
        $Val extends ClusterCentroidModel>
    implements $ClusterCentroidModelCopyWith<$Res> {
  _$ClusterCentroidModelCopyWithImpl(this._value, this._then);

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
abstract class _$$ClusterCentroidModelImplCopyWith<$Res>
    implements $ClusterCentroidModelCopyWith<$Res> {
  factory _$$ClusterCentroidModelImplCopyWith(_$ClusterCentroidModelImpl value,
          $Res Function(_$ClusterCentroidModelImpl) then) =
      __$$ClusterCentroidModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({double lat, double lng});
}

/// @nodoc
class __$$ClusterCentroidModelImplCopyWithImpl<$Res>
    extends _$ClusterCentroidModelCopyWithImpl<$Res, _$ClusterCentroidModelImpl>
    implements _$$ClusterCentroidModelImplCopyWith<$Res> {
  __$$ClusterCentroidModelImplCopyWithImpl(_$ClusterCentroidModelImpl _value,
      $Res Function(_$ClusterCentroidModelImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? lat = null,
    Object? lng = null,
  }) {
    return _then(_$ClusterCentroidModelImpl(
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
@JsonSerializable()
class _$ClusterCentroidModelImpl implements _ClusterCentroidModel {
  const _$ClusterCentroidModelImpl({required this.lat, required this.lng});

  factory _$ClusterCentroidModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$ClusterCentroidModelImplFromJson(json);

  /// Vĩ độ của tâm cluster
  @override
  final double lat;

  /// Kinh độ của tâm cluster
  @override
  final double lng;

  @override
  String toString() {
    return 'ClusterCentroidModel(lat: $lat, lng: $lng)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ClusterCentroidModelImpl &&
            (identical(other.lat, lat) || other.lat == lat) &&
            (identical(other.lng, lng) || other.lng == lng));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, lat, lng);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ClusterCentroidModelImplCopyWith<_$ClusterCentroidModelImpl>
      get copyWith =>
          __$$ClusterCentroidModelImplCopyWithImpl<_$ClusterCentroidModelImpl>(
              this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ClusterCentroidModelImplToJson(
      this,
    );
  }
}

abstract class _ClusterCentroidModel implements ClusterCentroidModel {
  const factory _ClusterCentroidModel(
      {required final double lat,
      required final double lng}) = _$ClusterCentroidModelImpl;

  factory _ClusterCentroidModel.fromJson(Map<String, dynamic> json) =
      _$ClusterCentroidModelImpl.fromJson;

  @override

  /// Vĩ độ của tâm cluster
  double get lat;
  @override

  /// Kinh độ của tâm cluster
  double get lng;
  @override
  @JsonKey(ignore: true)
  _$$ClusterCentroidModelImplCopyWith<_$ClusterCentroidModelImpl>
      get copyWith => throw _privateConstructorUsedError;
}

ClusterHotspotModel _$ClusterHotspotModelFromJson(Map<String, dynamic> json) {
  return _ClusterHotspotModel.fromJson(json);
}

/// @nodoc
mixin _$ClusterHotspotModel {
  /// ID của cluster hotspot
  @JsonKey(name: 'cluster_id')
  int get clusterId => throw _privateConstructorUsedError;

  /// Tổng số sự cố trong cluster này
  @JsonKey(name: 'incident_count')
  int get incidentCount => throw _privateConstructorUsedError;

  /// Danh sách OBJECTID của các sự cố thuộc cluster
  @JsonKey(name: 'incident_object_ids')
  List<int> get incidentObjectIds => throw _privateConstructorUsedError;

  /// Tọa độ tâm của cluster
  ClusterCentroidModel get centroid => throw _privateConstructorUsedError;

  /// Bán kính hiển thị trên bản đồ (đơn vị: mét)
  /// Được tính từ khoảng cách xa nhất từ tâm đến các điểm trong cluster
  @JsonKey(name: 'display_radius_m')
  double get displayRadiusM => throw _privateConstructorUsedError;

  /// Bán kính ảnh hưởng khuyến nghị (đơn vị: mét)
  /// Dùng cho phân tích, không dùng cho routing
  @JsonKey(name: 'impact_radius_m')
  double get impactRadiusM => throw _privateConstructorUsedError;

  /// Bán kính trung bình từ tâm đến các điểm (đơn vị: mét)
  /// Thể hiện độ phân tán của các sự cố trong cluster
  @JsonKey(name: 'avg_radius_m')
  double get avgRadiusM => throw _privateConstructorUsedError;

  /// Thông tin hình học polygon của cluster (chuẩn ArcGIS)
  ClusterGeometryModel get geometry => throw _privateConstructorUsedError;

  /// Mật độ sự cố (số sự cố / km²)
  double get density => throw _privateConstructorUsedError;

  /// Mức độ nguy hiểm: "high", "medium", "low"
  String get severity => throw _privateConstructorUsedError;

  /// Loại cluster: "dense", "spread", "isolated"
  @JsonKey(name: 'cluster_type')
  String get clusterType => throw _privateConstructorUsedError;

  /// Hình chữ nhật bao quanh cluster
  ClusterBBoxModel get bbox => throw _privateConstructorUsedError;

  /// Tọa độ polygon đơn giản hóa để hiển thị trên map
  /// Mỗi phần tử là [lng, lat]
  List<List<double>> get polygon => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ClusterHotspotModelCopyWith<ClusterHotspotModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ClusterHotspotModelCopyWith<$Res> {
  factory $ClusterHotspotModelCopyWith(
          ClusterHotspotModel value, $Res Function(ClusterHotspotModel) then) =
      _$ClusterHotspotModelCopyWithImpl<$Res, ClusterHotspotModel>;
  @useResult
  $Res call(
      {@JsonKey(name: 'cluster_id') int clusterId,
      @JsonKey(name: 'incident_count') int incidentCount,
      @JsonKey(name: 'incident_object_ids') List<int> incidentObjectIds,
      ClusterCentroidModel centroid,
      @JsonKey(name: 'display_radius_m') double displayRadiusM,
      @JsonKey(name: 'impact_radius_m') double impactRadiusM,
      @JsonKey(name: 'avg_radius_m') double avgRadiusM,
      ClusterGeometryModel geometry,
      double density,
      String severity,
      @JsonKey(name: 'cluster_type') String clusterType,
      ClusterBBoxModel bbox,
      List<List<double>> polygon});

  $ClusterCentroidModelCopyWith<$Res> get centroid;
  $ClusterGeometryModelCopyWith<$Res> get geometry;
  $ClusterBBoxModelCopyWith<$Res> get bbox;
}

/// @nodoc
class _$ClusterHotspotModelCopyWithImpl<$Res, $Val extends ClusterHotspotModel>
    implements $ClusterHotspotModelCopyWith<$Res> {
  _$ClusterHotspotModelCopyWithImpl(this._value, this._then);

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
    Object? centroid = null,
    Object? displayRadiusM = null,
    Object? impactRadiusM = null,
    Object? avgRadiusM = null,
    Object? geometry = null,
    Object? density = null,
    Object? severity = null,
    Object? clusterType = null,
    Object? bbox = null,
    Object? polygon = null,
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
      centroid: null == centroid
          ? _value.centroid
          : centroid // ignore: cast_nullable_to_non_nullable
              as ClusterCentroidModel,
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
      geometry: null == geometry
          ? _value.geometry
          : geometry // ignore: cast_nullable_to_non_nullable
              as ClusterGeometryModel,
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
              as ClusterBBoxModel,
      polygon: null == polygon
          ? _value.polygon
          : polygon // ignore: cast_nullable_to_non_nullable
              as List<List<double>>,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $ClusterCentroidModelCopyWith<$Res> get centroid {
    return $ClusterCentroidModelCopyWith<$Res>(_value.centroid, (value) {
      return _then(_value.copyWith(centroid: value) as $Val);
    });
  }

  @override
  @pragma('vm:prefer-inline')
  $ClusterGeometryModelCopyWith<$Res> get geometry {
    return $ClusterGeometryModelCopyWith<$Res>(_value.geometry, (value) {
      return _then(_value.copyWith(geometry: value) as $Val);
    });
  }

  @override
  @pragma('vm:prefer-inline')
  $ClusterBBoxModelCopyWith<$Res> get bbox {
    return $ClusterBBoxModelCopyWith<$Res>(_value.bbox, (value) {
      return _then(_value.copyWith(bbox: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$ClusterHotspotModelImplCopyWith<$Res>
    implements $ClusterHotspotModelCopyWith<$Res> {
  factory _$$ClusterHotspotModelImplCopyWith(_$ClusterHotspotModelImpl value,
          $Res Function(_$ClusterHotspotModelImpl) then) =
      __$$ClusterHotspotModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'cluster_id') int clusterId,
      @JsonKey(name: 'incident_count') int incidentCount,
      @JsonKey(name: 'incident_object_ids') List<int> incidentObjectIds,
      ClusterCentroidModel centroid,
      @JsonKey(name: 'display_radius_m') double displayRadiusM,
      @JsonKey(name: 'impact_radius_m') double impactRadiusM,
      @JsonKey(name: 'avg_radius_m') double avgRadiusM,
      ClusterGeometryModel geometry,
      double density,
      String severity,
      @JsonKey(name: 'cluster_type') String clusterType,
      ClusterBBoxModel bbox,
      List<List<double>> polygon});

  @override
  $ClusterCentroidModelCopyWith<$Res> get centroid;
  @override
  $ClusterGeometryModelCopyWith<$Res> get geometry;
  @override
  $ClusterBBoxModelCopyWith<$Res> get bbox;
}

/// @nodoc
class __$$ClusterHotspotModelImplCopyWithImpl<$Res>
    extends _$ClusterHotspotModelCopyWithImpl<$Res, _$ClusterHotspotModelImpl>
    implements _$$ClusterHotspotModelImplCopyWith<$Res> {
  __$$ClusterHotspotModelImplCopyWithImpl(_$ClusterHotspotModelImpl _value,
      $Res Function(_$ClusterHotspotModelImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? clusterId = null,
    Object? incidentCount = null,
    Object? incidentObjectIds = null,
    Object? centroid = null,
    Object? displayRadiusM = null,
    Object? impactRadiusM = null,
    Object? avgRadiusM = null,
    Object? geometry = null,
    Object? density = null,
    Object? severity = null,
    Object? clusterType = null,
    Object? bbox = null,
    Object? polygon = null,
  }) {
    return _then(_$ClusterHotspotModelImpl(
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
      centroid: null == centroid
          ? _value.centroid
          : centroid // ignore: cast_nullable_to_non_nullable
              as ClusterCentroidModel,
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
      geometry: null == geometry
          ? _value.geometry
          : geometry // ignore: cast_nullable_to_non_nullable
              as ClusterGeometryModel,
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
              as ClusterBBoxModel,
      polygon: null == polygon
          ? _value._polygon
          : polygon // ignore: cast_nullable_to_non_nullable
              as List<List<double>>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$ClusterHotspotModelImpl extends _ClusterHotspotModel {
  const _$ClusterHotspotModelImpl(
      {@JsonKey(name: 'cluster_id') required this.clusterId,
      @JsonKey(name: 'incident_count') required this.incidentCount,
      @JsonKey(name: 'incident_object_ids')
      required final List<int> incidentObjectIds,
      required this.centroid,
      @JsonKey(name: 'display_radius_m') required this.displayRadiusM,
      @JsonKey(name: 'impact_radius_m') required this.impactRadiusM,
      @JsonKey(name: 'avg_radius_m') required this.avgRadiusM,
      required this.geometry,
      required this.density,
      required this.severity,
      @JsonKey(name: 'cluster_type') required this.clusterType,
      required this.bbox,
      required final List<List<double>> polygon})
      : _incidentObjectIds = incidentObjectIds,
        _polygon = polygon,
        super._();

  factory _$ClusterHotspotModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$ClusterHotspotModelImplFromJson(json);

  /// ID của cluster hotspot
  @override
  @JsonKey(name: 'cluster_id')
  final int clusterId;

  /// Tổng số sự cố trong cluster này
  @override
  @JsonKey(name: 'incident_count')
  final int incidentCount;

  /// Danh sách OBJECTID của các sự cố thuộc cluster
  final List<int> _incidentObjectIds;

  /// Danh sách OBJECTID của các sự cố thuộc cluster
  @override
  @JsonKey(name: 'incident_object_ids')
  List<int> get incidentObjectIds {
    if (_incidentObjectIds is EqualUnmodifiableListView)
      return _incidentObjectIds;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_incidentObjectIds);
  }

  /// Tọa độ tâm của cluster
  @override
  final ClusterCentroidModel centroid;

  /// Bán kính hiển thị trên bản đồ (đơn vị: mét)
  /// Được tính từ khoảng cách xa nhất từ tâm đến các điểm trong cluster
  @override
  @JsonKey(name: 'display_radius_m')
  final double displayRadiusM;

  /// Bán kính ảnh hưởng khuyến nghị (đơn vị: mét)
  /// Dùng cho phân tích, không dùng cho routing
  @override
  @JsonKey(name: 'impact_radius_m')
  final double impactRadiusM;

  /// Bán kính trung bình từ tâm đến các điểm (đơn vị: mét)
  /// Thể hiện độ phân tán của các sự cố trong cluster
  @override
  @JsonKey(name: 'avg_radius_m')
  final double avgRadiusM;

  /// Thông tin hình học polygon của cluster (chuẩn ArcGIS)
  @override
  final ClusterGeometryModel geometry;

  /// Mật độ sự cố (số sự cố / km²)
  @override
  final double density;

  /// Mức độ nguy hiểm: "high", "medium", "low"
  @override
  final String severity;

  /// Loại cluster: "dense", "spread", "isolated"
  @override
  @JsonKey(name: 'cluster_type')
  final String clusterType;

  /// Hình chữ nhật bao quanh cluster
  @override
  final ClusterBBoxModel bbox;

  /// Tọa độ polygon đơn giản hóa để hiển thị trên map
  /// Mỗi phần tử là [lng, lat]
  final List<List<double>> _polygon;

  /// Tọa độ polygon đơn giản hóa để hiển thị trên map
  /// Mỗi phần tử là [lng, lat]
  @override
  List<List<double>> get polygon {
    if (_polygon is EqualUnmodifiableListView) return _polygon;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_polygon);
  }

  @override
  String toString() {
    return 'ClusterHotspotModel(clusterId: $clusterId, incidentCount: $incidentCount, incidentObjectIds: $incidentObjectIds, centroid: $centroid, displayRadiusM: $displayRadiusM, impactRadiusM: $impactRadiusM, avgRadiusM: $avgRadiusM, geometry: $geometry, density: $density, severity: $severity, clusterType: $clusterType, bbox: $bbox, polygon: $polygon)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ClusterHotspotModelImpl &&
            (identical(other.clusterId, clusterId) ||
                other.clusterId == clusterId) &&
            (identical(other.incidentCount, incidentCount) ||
                other.incidentCount == incidentCount) &&
            const DeepCollectionEquality()
                .equals(other._incidentObjectIds, _incidentObjectIds) &&
            (identical(other.centroid, centroid) ||
                other.centroid == centroid) &&
            (identical(other.displayRadiusM, displayRadiusM) ||
                other.displayRadiusM == displayRadiusM) &&
            (identical(other.impactRadiusM, impactRadiusM) ||
                other.impactRadiusM == impactRadiusM) &&
            (identical(other.avgRadiusM, avgRadiusM) ||
                other.avgRadiusM == avgRadiusM) &&
            (identical(other.geometry, geometry) ||
                other.geometry == geometry) &&
            (identical(other.density, density) || other.density == density) &&
            (identical(other.severity, severity) ||
                other.severity == severity) &&
            (identical(other.clusterType, clusterType) ||
                other.clusterType == clusterType) &&
            (identical(other.bbox, bbox) || other.bbox == bbox) &&
            const DeepCollectionEquality().equals(other._polygon, _polygon));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      clusterId,
      incidentCount,
      const DeepCollectionEquality().hash(_incidentObjectIds),
      centroid,
      displayRadiusM,
      impactRadiusM,
      avgRadiusM,
      geometry,
      density,
      severity,
      clusterType,
      bbox,
      const DeepCollectionEquality().hash(_polygon));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ClusterHotspotModelImplCopyWith<_$ClusterHotspotModelImpl> get copyWith =>
      __$$ClusterHotspotModelImplCopyWithImpl<_$ClusterHotspotModelImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ClusterHotspotModelImplToJson(
      this,
    );
  }
}

abstract class _ClusterHotspotModel extends ClusterHotspotModel {
  const factory _ClusterHotspotModel(
      {@JsonKey(name: 'cluster_id') required final int clusterId,
      @JsonKey(name: 'incident_count') required final int incidentCount,
      @JsonKey(name: 'incident_object_ids')
      required final List<int> incidentObjectIds,
      required final ClusterCentroidModel centroid,
      @JsonKey(name: 'display_radius_m') required final double displayRadiusM,
      @JsonKey(name: 'impact_radius_m') required final double impactRadiusM,
      @JsonKey(name: 'avg_radius_m') required final double avgRadiusM,
      required final ClusterGeometryModel geometry,
      required final double density,
      required final String severity,
      @JsonKey(name: 'cluster_type') required final String clusterType,
      required final ClusterBBoxModel bbox,
      required final List<List<double>> polygon}) = _$ClusterHotspotModelImpl;
  const _ClusterHotspotModel._() : super._();

  factory _ClusterHotspotModel.fromJson(Map<String, dynamic> json) =
      _$ClusterHotspotModelImpl.fromJson;

  @override

  /// ID của cluster hotspot
  @JsonKey(name: 'cluster_id')
  int get clusterId;
  @override

  /// Tổng số sự cố trong cluster này
  @JsonKey(name: 'incident_count')
  int get incidentCount;
  @override

  /// Danh sách OBJECTID của các sự cố thuộc cluster
  @JsonKey(name: 'incident_object_ids')
  List<int> get incidentObjectIds;
  @override

  /// Tọa độ tâm của cluster
  ClusterCentroidModel get centroid;
  @override

  /// Bán kính hiển thị trên bản đồ (đơn vị: mét)
  /// Được tính từ khoảng cách xa nhất từ tâm đến các điểm trong cluster
  @JsonKey(name: 'display_radius_m')
  double get displayRadiusM;
  @override

  /// Bán kính ảnh hưởng khuyến nghị (đơn vị: mét)
  /// Dùng cho phân tích, không dùng cho routing
  @JsonKey(name: 'impact_radius_m')
  double get impactRadiusM;
  @override

  /// Bán kính trung bình từ tâm đến các điểm (đơn vị: mét)
  /// Thể hiện độ phân tán của các sự cố trong cluster
  @JsonKey(name: 'avg_radius_m')
  double get avgRadiusM;
  @override

  /// Thông tin hình học polygon của cluster (chuẩn ArcGIS)
  ClusterGeometryModel get geometry;
  @override

  /// Mật độ sự cố (số sự cố / km²)
  double get density;
  @override

  /// Mức độ nguy hiểm: "high", "medium", "low"
  String get severity;
  @override

  /// Loại cluster: "dense", "spread", "isolated"
  @JsonKey(name: 'cluster_type')
  String get clusterType;
  @override

  /// Hình chữ nhật bao quanh cluster
  ClusterBBoxModel get bbox;
  @override

  /// Tọa độ polygon đơn giản hóa để hiển thị trên map
  /// Mỗi phần tử là [lng, lat]
  List<List<double>> get polygon;
  @override
  @JsonKey(ignore: true)
  _$$ClusterHotspotModelImplCopyWith<_$ClusterHotspotModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

ClusterGeometryModel _$ClusterGeometryModelFromJson(Map<String, dynamic> json) {
  return _ClusterGeometryModel.fromJson(json);
}

/// @nodoc
mixin _$ClusterGeometryModel {
  /// Danh sách các rings tạo thành polygon
  /// Mỗi ring là một mảng các tọa độ [lng, lat]
  /// Ring đầu tiên là outer ring, các ring sau (nếu có) là holes
  List<List<List<double>>> get rings => throw _privateConstructorUsedError;

  /// Hệ tọa độ không gian sử dụng
  SpatialReferenceModel get spatialReference =>
      throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ClusterGeometryModelCopyWith<ClusterGeometryModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ClusterGeometryModelCopyWith<$Res> {
  factory $ClusterGeometryModelCopyWith(ClusterGeometryModel value,
          $Res Function(ClusterGeometryModel) then) =
      _$ClusterGeometryModelCopyWithImpl<$Res, ClusterGeometryModel>;
  @useResult
  $Res call(
      {List<List<List<double>>> rings, SpatialReferenceModel spatialReference});

  $SpatialReferenceModelCopyWith<$Res> get spatialReference;
}

/// @nodoc
class _$ClusterGeometryModelCopyWithImpl<$Res,
        $Val extends ClusterGeometryModel>
    implements $ClusterGeometryModelCopyWith<$Res> {
  _$ClusterGeometryModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? rings = null,
    Object? spatialReference = null,
  }) {
    return _then(_value.copyWith(
      rings: null == rings
          ? _value.rings
          : rings // ignore: cast_nullable_to_non_nullable
              as List<List<List<double>>>,
      spatialReference: null == spatialReference
          ? _value.spatialReference
          : spatialReference // ignore: cast_nullable_to_non_nullable
              as SpatialReferenceModel,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $SpatialReferenceModelCopyWith<$Res> get spatialReference {
    return $SpatialReferenceModelCopyWith<$Res>(_value.spatialReference,
        (value) {
      return _then(_value.copyWith(spatialReference: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$ClusterGeometryModelImplCopyWith<$Res>
    implements $ClusterGeometryModelCopyWith<$Res> {
  factory _$$ClusterGeometryModelImplCopyWith(_$ClusterGeometryModelImpl value,
          $Res Function(_$ClusterGeometryModelImpl) then) =
      __$$ClusterGeometryModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {List<List<List<double>>> rings, SpatialReferenceModel spatialReference});

  @override
  $SpatialReferenceModelCopyWith<$Res> get spatialReference;
}

/// @nodoc
class __$$ClusterGeometryModelImplCopyWithImpl<$Res>
    extends _$ClusterGeometryModelCopyWithImpl<$Res, _$ClusterGeometryModelImpl>
    implements _$$ClusterGeometryModelImplCopyWith<$Res> {
  __$$ClusterGeometryModelImplCopyWithImpl(_$ClusterGeometryModelImpl _value,
      $Res Function(_$ClusterGeometryModelImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? rings = null,
    Object? spatialReference = null,
  }) {
    return _then(_$ClusterGeometryModelImpl(
      rings: null == rings
          ? _value._rings
          : rings // ignore: cast_nullable_to_non_nullable
              as List<List<List<double>>>,
      spatialReference: null == spatialReference
          ? _value.spatialReference
          : spatialReference // ignore: cast_nullable_to_non_nullable
              as SpatialReferenceModel,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$ClusterGeometryModelImpl extends _ClusterGeometryModel {
  const _$ClusterGeometryModelImpl(
      {required final List<List<List<double>>> rings,
      required this.spatialReference})
      : _rings = rings,
        super._();

  factory _$ClusterGeometryModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$ClusterGeometryModelImplFromJson(json);

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

  /// Hệ tọa độ không gian sử dụng
  @override
  final SpatialReferenceModel spatialReference;

  @override
  String toString() {
    return 'ClusterGeometryModel(rings: $rings, spatialReference: $spatialReference)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ClusterGeometryModelImpl &&
            const DeepCollectionEquality().equals(other._rings, _rings) &&
            (identical(other.spatialReference, spatialReference) ||
                other.spatialReference == spatialReference));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType,
      const DeepCollectionEquality().hash(_rings), spatialReference);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ClusterGeometryModelImplCopyWith<_$ClusterGeometryModelImpl>
      get copyWith =>
          __$$ClusterGeometryModelImplCopyWithImpl<_$ClusterGeometryModelImpl>(
              this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ClusterGeometryModelImplToJson(
      this,
    );
  }
}

abstract class _ClusterGeometryModel extends ClusterGeometryModel {
  const factory _ClusterGeometryModel(
          {required final List<List<List<double>>> rings,
          required final SpatialReferenceModel spatialReference}) =
      _$ClusterGeometryModelImpl;
  const _ClusterGeometryModel._() : super._();

  factory _ClusterGeometryModel.fromJson(Map<String, dynamic> json) =
      _$ClusterGeometryModelImpl.fromJson;

  @override

  /// Danh sách các rings tạo thành polygon
  /// Mỗi ring là một mảng các tọa độ [lng, lat]
  /// Ring đầu tiên là outer ring, các ring sau (nếu có) là holes
  List<List<List<double>>> get rings;
  @override

  /// Hệ tọa độ không gian sử dụng
  SpatialReferenceModel get spatialReference;
  @override
  @JsonKey(ignore: true)
  _$$ClusterGeometryModelImplCopyWith<_$ClusterGeometryModelImpl>
      get copyWith => throw _privateConstructorUsedError;
}

SpatialReferenceModel _$SpatialReferenceModelFromJson(
    Map<String, dynamic> json) {
  return _SpatialReferenceModel.fromJson(json);
}

/// @nodoc
mixin _$SpatialReferenceModel {
  /// Well-Known ID của hệ tọa độ
  /// Ví dụ: 4326 = WGS84 (latitude/longitude), 3857 = Web Mercator
  int get wkid => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $SpatialReferenceModelCopyWith<SpatialReferenceModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SpatialReferenceModelCopyWith<$Res> {
  factory $SpatialReferenceModelCopyWith(SpatialReferenceModel value,
          $Res Function(SpatialReferenceModel) then) =
      _$SpatialReferenceModelCopyWithImpl<$Res, SpatialReferenceModel>;
  @useResult
  $Res call({int wkid});
}

/// @nodoc
class _$SpatialReferenceModelCopyWithImpl<$Res,
        $Val extends SpatialReferenceModel>
    implements $SpatialReferenceModelCopyWith<$Res> {
  _$SpatialReferenceModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? wkid = null,
  }) {
    return _then(_value.copyWith(
      wkid: null == wkid
          ? _value.wkid
          : wkid // ignore: cast_nullable_to_non_nullable
              as int,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$SpatialReferenceModelImplCopyWith<$Res>
    implements $SpatialReferenceModelCopyWith<$Res> {
  factory _$$SpatialReferenceModelImplCopyWith(
          _$SpatialReferenceModelImpl value,
          $Res Function(_$SpatialReferenceModelImpl) then) =
      __$$SpatialReferenceModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({int wkid});
}

/// @nodoc
class __$$SpatialReferenceModelImplCopyWithImpl<$Res>
    extends _$SpatialReferenceModelCopyWithImpl<$Res,
        _$SpatialReferenceModelImpl>
    implements _$$SpatialReferenceModelImplCopyWith<$Res> {
  __$$SpatialReferenceModelImplCopyWithImpl(_$SpatialReferenceModelImpl _value,
      $Res Function(_$SpatialReferenceModelImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? wkid = null,
  }) {
    return _then(_$SpatialReferenceModelImpl(
      wkid: null == wkid
          ? _value.wkid
          : wkid // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$SpatialReferenceModelImpl implements _SpatialReferenceModel {
  const _$SpatialReferenceModelImpl({required this.wkid});

  factory _$SpatialReferenceModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$SpatialReferenceModelImplFromJson(json);

  /// Well-Known ID của hệ tọa độ
  /// Ví dụ: 4326 = WGS84 (latitude/longitude), 3857 = Web Mercator
  @override
  final int wkid;

  @override
  String toString() {
    return 'SpatialReferenceModel(wkid: $wkid)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SpatialReferenceModelImpl &&
            (identical(other.wkid, wkid) || other.wkid == wkid));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, wkid);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$SpatialReferenceModelImplCopyWith<_$SpatialReferenceModelImpl>
      get copyWith => __$$SpatialReferenceModelImplCopyWithImpl<
          _$SpatialReferenceModelImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$SpatialReferenceModelImplToJson(
      this,
    );
  }
}

abstract class _SpatialReferenceModel implements SpatialReferenceModel {
  const factory _SpatialReferenceModel({required final int wkid}) =
      _$SpatialReferenceModelImpl;

  factory _SpatialReferenceModel.fromJson(Map<String, dynamic> json) =
      _$SpatialReferenceModelImpl.fromJson;

  @override

  /// Well-Known ID của hệ tọa độ
  /// Ví dụ: 4326 = WGS84 (latitude/longitude), 3857 = Web Mercator
  int get wkid;
  @override
  @JsonKey(ignore: true)
  _$$SpatialReferenceModelImplCopyWith<_$SpatialReferenceModelImpl>
      get copyWith => throw _privateConstructorUsedError;
}
