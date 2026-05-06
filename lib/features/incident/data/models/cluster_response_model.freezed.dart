// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'cluster_response_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

ClusterItemModel _$ClusterItemModelFromJson(Map<String, dynamic> json) {
  return _ClusterItemModel.fromJson(json);
}

/// @nodoc
mixin _$ClusterItemModel {
  @JsonKey(name: 'OBJECTID')
  int get objectId => throw _privateConstructorUsedError;
  double get latitude => throw _privateConstructorUsedError; // vĩ độ
  double get longitude => throw _privateConstructorUsedError; // kinh độ
  @JsonKey(name: 'Cluster_ID')
  int get clusterId =>
      throw _privateConstructorUsedError; // ID của cluster mà incident này thuộc về
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
      double latitude,
      double longitude,
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
    Object? latitude = null,
    Object? longitude = null,
    Object? clusterId = null,
    Object? isCorePoint = null,
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
      double latitude,
      double longitude,
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
    Object? latitude = null,
    Object? longitude = null,
    Object? clusterId = null,
    Object? isCorePoint = null,
  }) {
    return _then(_$ClusterItemModelImpl(
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
      required this.latitude,
      required this.longitude,
      @JsonKey(name: 'Cluster_ID') required this.clusterId,
      @JsonKey(name: 'Is_Core_Point') required this.isCorePoint})
      : super._();

  factory _$ClusterItemModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$ClusterItemModelImplFromJson(json);

  @override
  @JsonKey(name: 'OBJECTID')
  final int objectId;
  @override
  final double latitude;
// vĩ độ
  @override
  final double longitude;
// kinh độ
  @override
  @JsonKey(name: 'Cluster_ID')
  final int clusterId;
// ID của cluster mà incident này thuộc về
  @override
  @JsonKey(name: 'Is_Core_Point')
  final int isCorePoint;

  @override
  String toString() {
    return 'ClusterItemModel(objectId: $objectId, latitude: $latitude, longitude: $longitude, clusterId: $clusterId, isCorePoint: $isCorePoint)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ClusterItemModelImpl &&
            (identical(other.objectId, objectId) ||
                other.objectId == objectId) &&
            (identical(other.latitude, latitude) ||
                other.latitude == latitude) &&
            (identical(other.longitude, longitude) ||
                other.longitude == longitude) &&
            (identical(other.clusterId, clusterId) ||
                other.clusterId == clusterId) &&
            (identical(other.isCorePoint, isCorePoint) ||
                other.isCorePoint == isCorePoint));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType, objectId, latitude, longitude, clusterId, isCorePoint);

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
          required final double latitude,
          required final double longitude,
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
  double get latitude;
  @override // vĩ độ
  double get longitude;
  @override // kinh độ
  @JsonKey(name: 'Cluster_ID')
  int get clusterId;
  @override // ID của cluster mà incident này thuộc về
  @JsonKey(name: 'Is_Core_Point')
  int get isCorePoint;
  @override
  @JsonKey(ignore: true)
  _$$ClusterItemModelImplCopyWith<_$ClusterItemModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

ClusterResponseModel _$ClusterResponseModelFromJson(Map<String, dynamic> json) {
  return _ClusterResponseModel.fromJson(json);
}

/// @nodoc
mixin _$ClusterResponseModel {
  String get status => throw _privateConstructorUsedError;
  String get message => throw _privateConstructorUsedError;
  @JsonKey(name: 'total_records')
  int get totalRecords => throw _privateConstructorUsedError;
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
      List<ClusterItemModel> data});
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
      data: null == data
          ? _value.data
          : data // ignore: cast_nullable_to_non_nullable
              as List<ClusterItemModel>,
    ) as $Val);
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
      List<ClusterItemModel> data});
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
  _$ClusterResponseModelImpl(
      {required this.status,
      required this.message,
      @JsonKey(name: 'total_records') required this.totalRecords,
      required final List<ClusterItemModel> data})
      : _data = data,
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
  final List<ClusterItemModel> _data;
  @override
  List<ClusterItemModel> get data {
    if (_data is EqualUnmodifiableListView) return _data;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_data);
  }

  @override
  String toString() {
    return 'ClusterResponseModel(status: $status, message: $message, totalRecords: $totalRecords, data: $data)';
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
            const DeepCollectionEquality().equals(other._data, _data));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, status, message, totalRecords,
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
  factory _ClusterResponseModel(
      {required final String status,
      required final String message,
      @JsonKey(name: 'total_records') required final int totalRecords,
      required final List<ClusterItemModel> data}) = _$ClusterResponseModelImpl;
  _ClusterResponseModel._() : super._();

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
  List<ClusterItemModel> get data;
  @override
  @JsonKey(ignore: true)
  _$$ClusterResponseModelImplCopyWith<_$ClusterResponseModelImpl>
      get copyWith => throw _privateConstructorUsedError;
}
