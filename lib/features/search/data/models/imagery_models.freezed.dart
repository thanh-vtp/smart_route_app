// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'imagery_models.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

ImageryMetadataResponse _$ImageryMetadataResponseFromJson(
    Map<String, dynamic> json) {
  return _ImageryMetadataResponse.fromJson(json);
}

/// @nodoc
mixin _$ImageryMetadataResponse {
  @JsonKey(name: 'name')
  String? get name => throw _privateConstructorUsedError;
  @JsonKey(name: 'description')
  String? get description => throw _privateConstructorUsedError;
  @JsonKey(name: 'extent')
  ImageryExtent? get extent => throw _privateConstructorUsedError;
  @JsonKey(name: 'pixelSizeX')
  double? get pixelSizeX => throw _privateConstructorUsedError;
  @JsonKey(name: 'pixelSizeY')
  double? get pixelSizeY => throw _privateConstructorUsedError;
  @JsonKey(name: 'bandCount')
  int? get bandCount => throw _privateConstructorUsedError;
  @JsonKey(name: 'pixelType')
  String? get pixelType => throw _privateConstructorUsedError;
  @JsonKey(name: 'minPixelSize')
  double? get minPixelSize => throw _privateConstructorUsedError;
  @JsonKey(name: 'maxPixelSize')
  double? get maxPixelSize => throw _privateConstructorUsedError;
  @JsonKey(name: 'copyrightText')
  String? get copyrightText => throw _privateConstructorUsedError;
  @JsonKey(name: 'serviceDataType')
  String? get serviceDataType => throw _privateConstructorUsedError;
  @JsonKey(name: 'minValues')
  List<double>? get minValues => throw _privateConstructorUsedError;
  @JsonKey(name: 'maxValues')
  List<double>? get maxValues => throw _privateConstructorUsedError;
  @JsonKey(name: 'meanValues')
  List<double>? get meanValues => throw _privateConstructorUsedError;
  @JsonKey(name: 'stdvValues')
  List<double>? get stdvValues => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ImageryMetadataResponseCopyWith<ImageryMetadataResponse> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ImageryMetadataResponseCopyWith<$Res> {
  factory $ImageryMetadataResponseCopyWith(ImageryMetadataResponse value,
          $Res Function(ImageryMetadataResponse) then) =
      _$ImageryMetadataResponseCopyWithImpl<$Res, ImageryMetadataResponse>;
  @useResult
  $Res call(
      {@JsonKey(name: 'name') String? name,
      @JsonKey(name: 'description') String? description,
      @JsonKey(name: 'extent') ImageryExtent? extent,
      @JsonKey(name: 'pixelSizeX') double? pixelSizeX,
      @JsonKey(name: 'pixelSizeY') double? pixelSizeY,
      @JsonKey(name: 'bandCount') int? bandCount,
      @JsonKey(name: 'pixelType') String? pixelType,
      @JsonKey(name: 'minPixelSize') double? minPixelSize,
      @JsonKey(name: 'maxPixelSize') double? maxPixelSize,
      @JsonKey(name: 'copyrightText') String? copyrightText,
      @JsonKey(name: 'serviceDataType') String? serviceDataType,
      @JsonKey(name: 'minValues') List<double>? minValues,
      @JsonKey(name: 'maxValues') List<double>? maxValues,
      @JsonKey(name: 'meanValues') List<double>? meanValues,
      @JsonKey(name: 'stdvValues') List<double>? stdvValues});

  $ImageryExtentCopyWith<$Res>? get extent;
}

/// @nodoc
class _$ImageryMetadataResponseCopyWithImpl<$Res,
        $Val extends ImageryMetadataResponse>
    implements $ImageryMetadataResponseCopyWith<$Res> {
  _$ImageryMetadataResponseCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = freezed,
    Object? description = freezed,
    Object? extent = freezed,
    Object? pixelSizeX = freezed,
    Object? pixelSizeY = freezed,
    Object? bandCount = freezed,
    Object? pixelType = freezed,
    Object? minPixelSize = freezed,
    Object? maxPixelSize = freezed,
    Object? copyrightText = freezed,
    Object? serviceDataType = freezed,
    Object? minValues = freezed,
    Object? maxValues = freezed,
    Object? meanValues = freezed,
    Object? stdvValues = freezed,
  }) {
    return _then(_value.copyWith(
      name: freezed == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String?,
      description: freezed == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String?,
      extent: freezed == extent
          ? _value.extent
          : extent // ignore: cast_nullable_to_non_nullable
              as ImageryExtent?,
      pixelSizeX: freezed == pixelSizeX
          ? _value.pixelSizeX
          : pixelSizeX // ignore: cast_nullable_to_non_nullable
              as double?,
      pixelSizeY: freezed == pixelSizeY
          ? _value.pixelSizeY
          : pixelSizeY // ignore: cast_nullable_to_non_nullable
              as double?,
      bandCount: freezed == bandCount
          ? _value.bandCount
          : bandCount // ignore: cast_nullable_to_non_nullable
              as int?,
      pixelType: freezed == pixelType
          ? _value.pixelType
          : pixelType // ignore: cast_nullable_to_non_nullable
              as String?,
      minPixelSize: freezed == minPixelSize
          ? _value.minPixelSize
          : minPixelSize // ignore: cast_nullable_to_non_nullable
              as double?,
      maxPixelSize: freezed == maxPixelSize
          ? _value.maxPixelSize
          : maxPixelSize // ignore: cast_nullable_to_non_nullable
              as double?,
      copyrightText: freezed == copyrightText
          ? _value.copyrightText
          : copyrightText // ignore: cast_nullable_to_non_nullable
              as String?,
      serviceDataType: freezed == serviceDataType
          ? _value.serviceDataType
          : serviceDataType // ignore: cast_nullable_to_non_nullable
              as String?,
      minValues: freezed == minValues
          ? _value.minValues
          : minValues // ignore: cast_nullable_to_non_nullable
              as List<double>?,
      maxValues: freezed == maxValues
          ? _value.maxValues
          : maxValues // ignore: cast_nullable_to_non_nullable
              as List<double>?,
      meanValues: freezed == meanValues
          ? _value.meanValues
          : meanValues // ignore: cast_nullable_to_non_nullable
              as List<double>?,
      stdvValues: freezed == stdvValues
          ? _value.stdvValues
          : stdvValues // ignore: cast_nullable_to_non_nullable
              as List<double>?,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $ImageryExtentCopyWith<$Res>? get extent {
    if (_value.extent == null) {
      return null;
    }

    return $ImageryExtentCopyWith<$Res>(_value.extent!, (value) {
      return _then(_value.copyWith(extent: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$ImageryMetadataResponseImplCopyWith<$Res>
    implements $ImageryMetadataResponseCopyWith<$Res> {
  factory _$$ImageryMetadataResponseImplCopyWith(
          _$ImageryMetadataResponseImpl value,
          $Res Function(_$ImageryMetadataResponseImpl) then) =
      __$$ImageryMetadataResponseImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'name') String? name,
      @JsonKey(name: 'description') String? description,
      @JsonKey(name: 'extent') ImageryExtent? extent,
      @JsonKey(name: 'pixelSizeX') double? pixelSizeX,
      @JsonKey(name: 'pixelSizeY') double? pixelSizeY,
      @JsonKey(name: 'bandCount') int? bandCount,
      @JsonKey(name: 'pixelType') String? pixelType,
      @JsonKey(name: 'minPixelSize') double? minPixelSize,
      @JsonKey(name: 'maxPixelSize') double? maxPixelSize,
      @JsonKey(name: 'copyrightText') String? copyrightText,
      @JsonKey(name: 'serviceDataType') String? serviceDataType,
      @JsonKey(name: 'minValues') List<double>? minValues,
      @JsonKey(name: 'maxValues') List<double>? maxValues,
      @JsonKey(name: 'meanValues') List<double>? meanValues,
      @JsonKey(name: 'stdvValues') List<double>? stdvValues});

  @override
  $ImageryExtentCopyWith<$Res>? get extent;
}

/// @nodoc
class __$$ImageryMetadataResponseImplCopyWithImpl<$Res>
    extends _$ImageryMetadataResponseCopyWithImpl<$Res,
        _$ImageryMetadataResponseImpl>
    implements _$$ImageryMetadataResponseImplCopyWith<$Res> {
  __$$ImageryMetadataResponseImplCopyWithImpl(
      _$ImageryMetadataResponseImpl _value,
      $Res Function(_$ImageryMetadataResponseImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = freezed,
    Object? description = freezed,
    Object? extent = freezed,
    Object? pixelSizeX = freezed,
    Object? pixelSizeY = freezed,
    Object? bandCount = freezed,
    Object? pixelType = freezed,
    Object? minPixelSize = freezed,
    Object? maxPixelSize = freezed,
    Object? copyrightText = freezed,
    Object? serviceDataType = freezed,
    Object? minValues = freezed,
    Object? maxValues = freezed,
    Object? meanValues = freezed,
    Object? stdvValues = freezed,
  }) {
    return _then(_$ImageryMetadataResponseImpl(
      name: freezed == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String?,
      description: freezed == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String?,
      extent: freezed == extent
          ? _value.extent
          : extent // ignore: cast_nullable_to_non_nullable
              as ImageryExtent?,
      pixelSizeX: freezed == pixelSizeX
          ? _value.pixelSizeX
          : pixelSizeX // ignore: cast_nullable_to_non_nullable
              as double?,
      pixelSizeY: freezed == pixelSizeY
          ? _value.pixelSizeY
          : pixelSizeY // ignore: cast_nullable_to_non_nullable
              as double?,
      bandCount: freezed == bandCount
          ? _value.bandCount
          : bandCount // ignore: cast_nullable_to_non_nullable
              as int?,
      pixelType: freezed == pixelType
          ? _value.pixelType
          : pixelType // ignore: cast_nullable_to_non_nullable
              as String?,
      minPixelSize: freezed == minPixelSize
          ? _value.minPixelSize
          : minPixelSize // ignore: cast_nullable_to_non_nullable
              as double?,
      maxPixelSize: freezed == maxPixelSize
          ? _value.maxPixelSize
          : maxPixelSize // ignore: cast_nullable_to_non_nullable
              as double?,
      copyrightText: freezed == copyrightText
          ? _value.copyrightText
          : copyrightText // ignore: cast_nullable_to_non_nullable
              as String?,
      serviceDataType: freezed == serviceDataType
          ? _value.serviceDataType
          : serviceDataType // ignore: cast_nullable_to_non_nullable
              as String?,
      minValues: freezed == minValues
          ? _value._minValues
          : minValues // ignore: cast_nullable_to_non_nullable
              as List<double>?,
      maxValues: freezed == maxValues
          ? _value._maxValues
          : maxValues // ignore: cast_nullable_to_non_nullable
              as List<double>?,
      meanValues: freezed == meanValues
          ? _value._meanValues
          : meanValues // ignore: cast_nullable_to_non_nullable
              as List<double>?,
      stdvValues: freezed == stdvValues
          ? _value._stdvValues
          : stdvValues // ignore: cast_nullable_to_non_nullable
              as List<double>?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$ImageryMetadataResponseImpl implements _ImageryMetadataResponse {
  const _$ImageryMetadataResponseImpl(
      {@JsonKey(name: 'name') this.name,
      @JsonKey(name: 'description') this.description,
      @JsonKey(name: 'extent') this.extent,
      @JsonKey(name: 'pixelSizeX') this.pixelSizeX,
      @JsonKey(name: 'pixelSizeY') this.pixelSizeY,
      @JsonKey(name: 'bandCount') this.bandCount,
      @JsonKey(name: 'pixelType') this.pixelType,
      @JsonKey(name: 'minPixelSize') this.minPixelSize,
      @JsonKey(name: 'maxPixelSize') this.maxPixelSize,
      @JsonKey(name: 'copyrightText') this.copyrightText,
      @JsonKey(name: 'serviceDataType') this.serviceDataType,
      @JsonKey(name: 'minValues') final List<double>? minValues,
      @JsonKey(name: 'maxValues') final List<double>? maxValues,
      @JsonKey(name: 'meanValues') final List<double>? meanValues,
      @JsonKey(name: 'stdvValues') final List<double>? stdvValues})
      : _minValues = minValues,
        _maxValues = maxValues,
        _meanValues = meanValues,
        _stdvValues = stdvValues;

  factory _$ImageryMetadataResponseImpl.fromJson(Map<String, dynamic> json) =>
      _$$ImageryMetadataResponseImplFromJson(json);

  @override
  @JsonKey(name: 'name')
  final String? name;
  @override
  @JsonKey(name: 'description')
  final String? description;
  @override
  @JsonKey(name: 'extent')
  final ImageryExtent? extent;
  @override
  @JsonKey(name: 'pixelSizeX')
  final double? pixelSizeX;
  @override
  @JsonKey(name: 'pixelSizeY')
  final double? pixelSizeY;
  @override
  @JsonKey(name: 'bandCount')
  final int? bandCount;
  @override
  @JsonKey(name: 'pixelType')
  final String? pixelType;
  @override
  @JsonKey(name: 'minPixelSize')
  final double? minPixelSize;
  @override
  @JsonKey(name: 'maxPixelSize')
  final double? maxPixelSize;
  @override
  @JsonKey(name: 'copyrightText')
  final String? copyrightText;
  @override
  @JsonKey(name: 'serviceDataType')
  final String? serviceDataType;
  final List<double>? _minValues;
  @override
  @JsonKey(name: 'minValues')
  List<double>? get minValues {
    final value = _minValues;
    if (value == null) return null;
    if (_minValues is EqualUnmodifiableListView) return _minValues;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  final List<double>? _maxValues;
  @override
  @JsonKey(name: 'maxValues')
  List<double>? get maxValues {
    final value = _maxValues;
    if (value == null) return null;
    if (_maxValues is EqualUnmodifiableListView) return _maxValues;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  final List<double>? _meanValues;
  @override
  @JsonKey(name: 'meanValues')
  List<double>? get meanValues {
    final value = _meanValues;
    if (value == null) return null;
    if (_meanValues is EqualUnmodifiableListView) return _meanValues;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  final List<double>? _stdvValues;
  @override
  @JsonKey(name: 'stdvValues')
  List<double>? get stdvValues {
    final value = _stdvValues;
    if (value == null) return null;
    if (_stdvValues is EqualUnmodifiableListView) return _stdvValues;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  String toString() {
    return 'ImageryMetadataResponse(name: $name, description: $description, extent: $extent, pixelSizeX: $pixelSizeX, pixelSizeY: $pixelSizeY, bandCount: $bandCount, pixelType: $pixelType, minPixelSize: $minPixelSize, maxPixelSize: $maxPixelSize, copyrightText: $copyrightText, serviceDataType: $serviceDataType, minValues: $minValues, maxValues: $maxValues, meanValues: $meanValues, stdvValues: $stdvValues)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ImageryMetadataResponseImpl &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.description, description) ||
                other.description == description) &&
            (identical(other.extent, extent) || other.extent == extent) &&
            (identical(other.pixelSizeX, pixelSizeX) ||
                other.pixelSizeX == pixelSizeX) &&
            (identical(other.pixelSizeY, pixelSizeY) ||
                other.pixelSizeY == pixelSizeY) &&
            (identical(other.bandCount, bandCount) ||
                other.bandCount == bandCount) &&
            (identical(other.pixelType, pixelType) ||
                other.pixelType == pixelType) &&
            (identical(other.minPixelSize, minPixelSize) ||
                other.minPixelSize == minPixelSize) &&
            (identical(other.maxPixelSize, maxPixelSize) ||
                other.maxPixelSize == maxPixelSize) &&
            (identical(other.copyrightText, copyrightText) ||
                other.copyrightText == copyrightText) &&
            (identical(other.serviceDataType, serviceDataType) ||
                other.serviceDataType == serviceDataType) &&
            const DeepCollectionEquality()
                .equals(other._minValues, _minValues) &&
            const DeepCollectionEquality()
                .equals(other._maxValues, _maxValues) &&
            const DeepCollectionEquality()
                .equals(other._meanValues, _meanValues) &&
            const DeepCollectionEquality()
                .equals(other._stdvValues, _stdvValues));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      name,
      description,
      extent,
      pixelSizeX,
      pixelSizeY,
      bandCount,
      pixelType,
      minPixelSize,
      maxPixelSize,
      copyrightText,
      serviceDataType,
      const DeepCollectionEquality().hash(_minValues),
      const DeepCollectionEquality().hash(_maxValues),
      const DeepCollectionEquality().hash(_meanValues),
      const DeepCollectionEquality().hash(_stdvValues));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ImageryMetadataResponseImplCopyWith<_$ImageryMetadataResponseImpl>
      get copyWith => __$$ImageryMetadataResponseImplCopyWithImpl<
          _$ImageryMetadataResponseImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ImageryMetadataResponseImplToJson(
      this,
    );
  }
}

abstract class _ImageryMetadataResponse implements ImageryMetadataResponse {
  const factory _ImageryMetadataResponse(
          {@JsonKey(name: 'name') final String? name,
          @JsonKey(name: 'description') final String? description,
          @JsonKey(name: 'extent') final ImageryExtent? extent,
          @JsonKey(name: 'pixelSizeX') final double? pixelSizeX,
          @JsonKey(name: 'pixelSizeY') final double? pixelSizeY,
          @JsonKey(name: 'bandCount') final int? bandCount,
          @JsonKey(name: 'pixelType') final String? pixelType,
          @JsonKey(name: 'minPixelSize') final double? minPixelSize,
          @JsonKey(name: 'maxPixelSize') final double? maxPixelSize,
          @JsonKey(name: 'copyrightText') final String? copyrightText,
          @JsonKey(name: 'serviceDataType') final String? serviceDataType,
          @JsonKey(name: 'minValues') final List<double>? minValues,
          @JsonKey(name: 'maxValues') final List<double>? maxValues,
          @JsonKey(name: 'meanValues') final List<double>? meanValues,
          @JsonKey(name: 'stdvValues') final List<double>? stdvValues}) =
      _$ImageryMetadataResponseImpl;

  factory _ImageryMetadataResponse.fromJson(Map<String, dynamic> json) =
      _$ImageryMetadataResponseImpl.fromJson;

  @override
  @JsonKey(name: 'name')
  String? get name;
  @override
  @JsonKey(name: 'description')
  String? get description;
  @override
  @JsonKey(name: 'extent')
  ImageryExtent? get extent;
  @override
  @JsonKey(name: 'pixelSizeX')
  double? get pixelSizeX;
  @override
  @JsonKey(name: 'pixelSizeY')
  double? get pixelSizeY;
  @override
  @JsonKey(name: 'bandCount')
  int? get bandCount;
  @override
  @JsonKey(name: 'pixelType')
  String? get pixelType;
  @override
  @JsonKey(name: 'minPixelSize')
  double? get minPixelSize;
  @override
  @JsonKey(name: 'maxPixelSize')
  double? get maxPixelSize;
  @override
  @JsonKey(name: 'copyrightText')
  String? get copyrightText;
  @override
  @JsonKey(name: 'serviceDataType')
  String? get serviceDataType;
  @override
  @JsonKey(name: 'minValues')
  List<double>? get minValues;
  @override
  @JsonKey(name: 'maxValues')
  List<double>? get maxValues;
  @override
  @JsonKey(name: 'meanValues')
  List<double>? get meanValues;
  @override
  @JsonKey(name: 'stdvValues')
  List<double>? get stdvValues;
  @override
  @JsonKey(ignore: true)
  _$$ImageryMetadataResponseImplCopyWith<_$ImageryMetadataResponseImpl>
      get copyWith => throw _privateConstructorUsedError;
}

ImageryExtent _$ImageryExtentFromJson(Map<String, dynamic> json) {
  return _ImageryExtent.fromJson(json);
}

/// @nodoc
mixin _$ImageryExtent {
  @JsonKey(name: 'xmin')
  double get xmin => throw _privateConstructorUsedError;
  @JsonKey(name: 'ymin')
  double get ymin => throw _privateConstructorUsedError;
  @JsonKey(name: 'xmax')
  double get xmax => throw _privateConstructorUsedError;
  @JsonKey(name: 'ymax')
  double get ymax => throw _privateConstructorUsedError;
  @JsonKey(name: 'spatialReference')
  Map<String, dynamic>? get spatialReference =>
      throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ImageryExtentCopyWith<ImageryExtent> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ImageryExtentCopyWith<$Res> {
  factory $ImageryExtentCopyWith(
          ImageryExtent value, $Res Function(ImageryExtent) then) =
      _$ImageryExtentCopyWithImpl<$Res, ImageryExtent>;
  @useResult
  $Res call(
      {@JsonKey(name: 'xmin') double xmin,
      @JsonKey(name: 'ymin') double ymin,
      @JsonKey(name: 'xmax') double xmax,
      @JsonKey(name: 'ymax') double ymax,
      @JsonKey(name: 'spatialReference')
      Map<String, dynamic>? spatialReference});
}

/// @nodoc
class _$ImageryExtentCopyWithImpl<$Res, $Val extends ImageryExtent>
    implements $ImageryExtentCopyWith<$Res> {
  _$ImageryExtentCopyWithImpl(this._value, this._then);

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
    Object? spatialReference = freezed,
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
      spatialReference: freezed == spatialReference
          ? _value.spatialReference
          : spatialReference // ignore: cast_nullable_to_non_nullable
              as Map<String, dynamic>?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ImageryExtentImplCopyWith<$Res>
    implements $ImageryExtentCopyWith<$Res> {
  factory _$$ImageryExtentImplCopyWith(
          _$ImageryExtentImpl value, $Res Function(_$ImageryExtentImpl) then) =
      __$$ImageryExtentImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'xmin') double xmin,
      @JsonKey(name: 'ymin') double ymin,
      @JsonKey(name: 'xmax') double xmax,
      @JsonKey(name: 'ymax') double ymax,
      @JsonKey(name: 'spatialReference')
      Map<String, dynamic>? spatialReference});
}

/// @nodoc
class __$$ImageryExtentImplCopyWithImpl<$Res>
    extends _$ImageryExtentCopyWithImpl<$Res, _$ImageryExtentImpl>
    implements _$$ImageryExtentImplCopyWith<$Res> {
  __$$ImageryExtentImplCopyWithImpl(
      _$ImageryExtentImpl _value, $Res Function(_$ImageryExtentImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? xmin = null,
    Object? ymin = null,
    Object? xmax = null,
    Object? ymax = null,
    Object? spatialReference = freezed,
  }) {
    return _then(_$ImageryExtentImpl(
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
      spatialReference: freezed == spatialReference
          ? _value._spatialReference
          : spatialReference // ignore: cast_nullable_to_non_nullable
              as Map<String, dynamic>?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$ImageryExtentImpl implements _ImageryExtent {
  const _$ImageryExtentImpl(
      {@JsonKey(name: 'xmin') required this.xmin,
      @JsonKey(name: 'ymin') required this.ymin,
      @JsonKey(name: 'xmax') required this.xmax,
      @JsonKey(name: 'ymax') required this.ymax,
      @JsonKey(name: 'spatialReference')
      final Map<String, dynamic>? spatialReference})
      : _spatialReference = spatialReference;

  factory _$ImageryExtentImpl.fromJson(Map<String, dynamic> json) =>
      _$$ImageryExtentImplFromJson(json);

  @override
  @JsonKey(name: 'xmin')
  final double xmin;
  @override
  @JsonKey(name: 'ymin')
  final double ymin;
  @override
  @JsonKey(name: 'xmax')
  final double xmax;
  @override
  @JsonKey(name: 'ymax')
  final double ymax;
  final Map<String, dynamic>? _spatialReference;
  @override
  @JsonKey(name: 'spatialReference')
  Map<String, dynamic>? get spatialReference {
    final value = _spatialReference;
    if (value == null) return null;
    if (_spatialReference is EqualUnmodifiableMapView) return _spatialReference;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableMapView(value);
  }

  @override
  String toString() {
    return 'ImageryExtent(xmin: $xmin, ymin: $ymin, xmax: $xmax, ymax: $ymax, spatialReference: $spatialReference)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ImageryExtentImpl &&
            (identical(other.xmin, xmin) || other.xmin == xmin) &&
            (identical(other.ymin, ymin) || other.ymin == ymin) &&
            (identical(other.xmax, xmax) || other.xmax == xmax) &&
            (identical(other.ymax, ymax) || other.ymax == ymax) &&
            const DeepCollectionEquality()
                .equals(other._spatialReference, _spatialReference));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, xmin, ymin, xmax, ymax,
      const DeepCollectionEquality().hash(_spatialReference));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ImageryExtentImplCopyWith<_$ImageryExtentImpl> get copyWith =>
      __$$ImageryExtentImplCopyWithImpl<_$ImageryExtentImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ImageryExtentImplToJson(
      this,
    );
  }
}

abstract class _ImageryExtent implements ImageryExtent {
  const factory _ImageryExtent(
      {@JsonKey(name: 'xmin') required final double xmin,
      @JsonKey(name: 'ymin') required final double ymin,
      @JsonKey(name: 'xmax') required final double xmax,
      @JsonKey(name: 'ymax') required final double ymax,
      @JsonKey(name: 'spatialReference')
      final Map<String, dynamic>? spatialReference}) = _$ImageryExtentImpl;

  factory _ImageryExtent.fromJson(Map<String, dynamic> json) =
      _$ImageryExtentImpl.fromJson;

  @override
  @JsonKey(name: 'xmin')
  double get xmin;
  @override
  @JsonKey(name: 'ymin')
  double get ymin;
  @override
  @JsonKey(name: 'xmax')
  double get xmax;
  @override
  @JsonKey(name: 'ymax')
  double get ymax;
  @override
  @JsonKey(name: 'spatialReference')
  Map<String, dynamic>? get spatialReference;
  @override
  @JsonKey(ignore: true)
  _$$ImageryExtentImplCopyWith<_$ImageryExtentImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
