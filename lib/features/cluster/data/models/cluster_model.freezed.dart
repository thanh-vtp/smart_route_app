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
  String get status => throw _privateConstructorUsedError;
  String get message => throw _privateConstructorUsedError;
  @JsonKey(name: 'total_records')
  int get totalRecords => throw _privateConstructorUsedError;
  @JsonKey(name: 'clustering_info')
  ClusteringInfoModel get clusteringInfo => throw _privateConstructorUsedError;
  @JsonKey(name: 'clusters')
  List<ClusterHotspotModel> get clusters => throw _privateConstructorUsedError;
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

  @override
  final String status;
  @override
  final String message;
  @override
  @JsonKey(name: 'total_records')
  final int totalRecords;
  @override
  @JsonKey(name: 'clustering_info')
  final ClusteringInfoModel clusteringInfo;
  final List<ClusterHotspotModel> _clusters;
  @override
  @JsonKey(name: 'clusters')
  List<ClusterHotspotModel> get clusters {
    if (_clusters is EqualUnmodifiableListView) return _clusters;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_clusters);
  }

  final List<ClusterItemModel> _data;
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
  String get status;
  @override
  String get message;
  @override
  @JsonKey(name: 'total_records')
  int get totalRecords;
  @override
  @JsonKey(name: 'clustering_info')
  ClusteringInfoModel get clusteringInfo;
  @override
  @JsonKey(name: 'clusters')
  List<ClusterHotspotModel> get clusters;
  @override
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
  @JsonKey(name: 'n_clusters')
  int get nClusters => throw _privateConstructorUsedError;
  @JsonKey(name: 'n_noise')
  int get nNoise => throw _privateConstructorUsedError;
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
      {@JsonKey(name: 'n_clusters') int nClusters,
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
    Object? nClusters = null,
    Object? nNoise = null,
    Object? nCorePoints = null,
  }) {
    return _then(_value.copyWith(
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
      {@JsonKey(name: 'n_clusters') int nClusters,
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
    Object? nClusters = null,
    Object? nNoise = null,
    Object? nCorePoints = null,
  }) {
    return _then(_$ClusteringInfoModelImpl(
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
      {@JsonKey(name: 'n_clusters') required this.nClusters,
      @JsonKey(name: 'n_noise') required this.nNoise,
      @JsonKey(name: 'n_core_points') required this.nCorePoints});

  factory _$ClusteringInfoModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$ClusteringInfoModelImplFromJson(json);

  @override
  @JsonKey(name: 'n_clusters')
  final int nClusters;
  @override
  @JsonKey(name: 'n_noise')
  final int nNoise;
  @override
  @JsonKey(name: 'n_core_points')
  final int nCorePoints;

  @override
  String toString() {
    return 'ClusteringInfoModel(nClusters: $nClusters, nNoise: $nNoise, nCorePoints: $nCorePoints)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ClusteringInfoModelImpl &&
            (identical(other.nClusters, nClusters) ||
                other.nClusters == nClusters) &&
            (identical(other.nNoise, nNoise) || other.nNoise == nNoise) &&
            (identical(other.nCorePoints, nCorePoints) ||
                other.nCorePoints == nCorePoints));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, nClusters, nNoise, nCorePoints);

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
          {@JsonKey(name: 'n_clusters') required final int nClusters,
          @JsonKey(name: 'n_noise') required final int nNoise,
          @JsonKey(name: 'n_core_points') required final int nCorePoints}) =
      _$ClusteringInfoModelImpl;

  factory _ClusteringInfoModel.fromJson(Map<String, dynamic> json) =
      _$ClusteringInfoModelImpl.fromJson;

  @override
  @JsonKey(name: 'n_clusters')
  int get nClusters;
  @override
  @JsonKey(name: 'n_noise')
  int get nNoise;
  @override
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
  @JsonKey(name: 'OBJECTID')
  int get objectId => throw _privateConstructorUsedError;
  double get longitude => throw _privateConstructorUsedError;
  double get latitude => throw _privateConstructorUsedError;
  @JsonKey(name: 'Cluster_ID')
  int get clusterId => throw _privateConstructorUsedError;
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

  @override
  @JsonKey(name: 'OBJECTID')
  final int objectId;
  @override
  final double longitude;
  @override
  final double latitude;
  @override
  @JsonKey(name: 'Cluster_ID')
  final int clusterId;
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
  @JsonKey(name: 'OBJECTID')
  int get objectId;
  @override
  double get longitude;
  @override
  double get latitude;
  @override
  @JsonKey(name: 'Cluster_ID')
  int get clusterId;
  @override
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
  double get xmin => throw _privateConstructorUsedError;
  double get ymin => throw _privateConstructorUsedError;
  double get xmax => throw _privateConstructorUsedError;
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

  @override
  final double xmin;
  @override
  final double ymin;
  @override
  final double xmax;
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
  double get xmin;
  @override
  double get ymin;
  @override
  double get xmax;
  @override
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
  double get lat => throw _privateConstructorUsedError;
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

  @override
  final double lat;
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
  double get lat;
  @override
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
  @JsonKey(name: 'cluster_id')
  int get clusterId => throw _privateConstructorUsedError;
  @JsonKey(name: 'incident_count')
  int get incidentCount => throw _privateConstructorUsedError;
  @JsonKey(name: 'incident_object_ids')
  List<int> get incidentObjectIds => throw _privateConstructorUsedError;
  ClusterCentroidModel get centroid => throw _privateConstructorUsedError;
  @JsonKey(name: 'radius_m')
  double get radiusM => throw _privateConstructorUsedError;
  double get density => throw _privateConstructorUsedError;
  String get severity => throw _privateConstructorUsedError;
  @JsonKey(name: 'cluster_type')
  String get clusterType => throw _privateConstructorUsedError;
  ClusterBBoxModel get bbox => throw _privateConstructorUsedError;
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
      @JsonKey(name: 'radius_m') double radiusM,
      double density,
      String severity,
      @JsonKey(name: 'cluster_type') String clusterType,
      ClusterBBoxModel bbox,
      List<List<double>> polygon});

  $ClusterCentroidModelCopyWith<$Res> get centroid;
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
    Object? radiusM = null,
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
      radiusM: null == radiusM
          ? _value.radiusM
          : radiusM // ignore: cast_nullable_to_non_nullable
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
      @JsonKey(name: 'radius_m') double radiusM,
      double density,
      String severity,
      @JsonKey(name: 'cluster_type') String clusterType,
      ClusterBBoxModel bbox,
      List<List<double>> polygon});

  @override
  $ClusterCentroidModelCopyWith<$Res> get centroid;
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
    Object? radiusM = null,
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
      radiusM: null == radiusM
          ? _value.radiusM
          : radiusM // ignore: cast_nullable_to_non_nullable
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
      @JsonKey(name: 'radius_m') required this.radiusM,
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

  @override
  @JsonKey(name: 'cluster_id')
  final int clusterId;
  @override
  @JsonKey(name: 'incident_count')
  final int incidentCount;
  final List<int> _incidentObjectIds;
  @override
  @JsonKey(name: 'incident_object_ids')
  List<int> get incidentObjectIds {
    if (_incidentObjectIds is EqualUnmodifiableListView)
      return _incidentObjectIds;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_incidentObjectIds);
  }

  @override
  final ClusterCentroidModel centroid;
  @override
  @JsonKey(name: 'radius_m')
  final double radiusM;
  @override
  final double density;
  @override
  final String severity;
  @override
  @JsonKey(name: 'cluster_type')
  final String clusterType;
  @override
  final ClusterBBoxModel bbox;
  final List<List<double>> _polygon;
  @override
  List<List<double>> get polygon {
    if (_polygon is EqualUnmodifiableListView) return _polygon;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_polygon);
  }

  @override
  String toString() {
    return 'ClusterHotspotModel(clusterId: $clusterId, incidentCount: $incidentCount, incidentObjectIds: $incidentObjectIds, centroid: $centroid, radiusM: $radiusM, density: $density, severity: $severity, clusterType: $clusterType, bbox: $bbox, polygon: $polygon)';
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
            (identical(other.radiusM, radiusM) || other.radiusM == radiusM) &&
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
      radiusM,
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
      @JsonKey(name: 'radius_m') required final double radiusM,
      required final double density,
      required final String severity,
      @JsonKey(name: 'cluster_type') required final String clusterType,
      required final ClusterBBoxModel bbox,
      required final List<List<double>> polygon}) = _$ClusterHotspotModelImpl;
  const _ClusterHotspotModel._() : super._();

  factory _ClusterHotspotModel.fromJson(Map<String, dynamic> json) =
      _$ClusterHotspotModelImpl.fromJson;

  @override
  @JsonKey(name: 'cluster_id')
  int get clusterId;
  @override
  @JsonKey(name: 'incident_count')
  int get incidentCount;
  @override
  @JsonKey(name: 'incident_object_ids')
  List<int> get incidentObjectIds;
  @override
  ClusterCentroidModel get centroid;
  @override
  @JsonKey(name: 'radius_m')
  double get radiusM;
  @override
  double get density;
  @override
  String get severity;
  @override
  @JsonKey(name: 'cluster_type')
  String get clusterType;
  @override
  ClusterBBoxModel get bbox;
  @override
  List<List<double>> get polygon;
  @override
  @JsonKey(ignore: true)
  _$$ClusterHotspotModelImplCopyWith<_$ClusterHotspotModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
