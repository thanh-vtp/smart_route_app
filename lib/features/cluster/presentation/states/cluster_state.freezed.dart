// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'cluster_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$ClusterState {
  bool get isLoading => throw _privateConstructorUsedError;
  ClusterResult? get clusterResult => throw _privateConstructorUsedError;
  String? get errorMessage => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $ClusterStateCopyWith<ClusterState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ClusterStateCopyWith<$Res> {
  factory $ClusterStateCopyWith(
          ClusterState value, $Res Function(ClusterState) then) =
      _$ClusterStateCopyWithImpl<$Res, ClusterState>;
  @useResult
  $Res call(
      {bool isLoading, ClusterResult? clusterResult, String? errorMessage});

  $ClusterResultCopyWith<$Res>? get clusterResult;
}

/// @nodoc
class _$ClusterStateCopyWithImpl<$Res, $Val extends ClusterState>
    implements $ClusterStateCopyWith<$Res> {
  _$ClusterStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isLoading = null,
    Object? clusterResult = freezed,
    Object? errorMessage = freezed,
  }) {
    return _then(_value.copyWith(
      isLoading: null == isLoading
          ? _value.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool,
      clusterResult: freezed == clusterResult
          ? _value.clusterResult
          : clusterResult // ignore: cast_nullable_to_non_nullable
              as ClusterResult?,
      errorMessage: freezed == errorMessage
          ? _value.errorMessage
          : errorMessage // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $ClusterResultCopyWith<$Res>? get clusterResult {
    if (_value.clusterResult == null) {
      return null;
    }

    return $ClusterResultCopyWith<$Res>(_value.clusterResult!, (value) {
      return _then(_value.copyWith(clusterResult: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$ClusterStateImplCopyWith<$Res>
    implements $ClusterStateCopyWith<$Res> {
  factory _$$ClusterStateImplCopyWith(
          _$ClusterStateImpl value, $Res Function(_$ClusterStateImpl) then) =
      __$$ClusterStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {bool isLoading, ClusterResult? clusterResult, String? errorMessage});

  @override
  $ClusterResultCopyWith<$Res>? get clusterResult;
}

/// @nodoc
class __$$ClusterStateImplCopyWithImpl<$Res>
    extends _$ClusterStateCopyWithImpl<$Res, _$ClusterStateImpl>
    implements _$$ClusterStateImplCopyWith<$Res> {
  __$$ClusterStateImplCopyWithImpl(
      _$ClusterStateImpl _value, $Res Function(_$ClusterStateImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isLoading = null,
    Object? clusterResult = freezed,
    Object? errorMessage = freezed,
  }) {
    return _then(_$ClusterStateImpl(
      isLoading: null == isLoading
          ? _value.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool,
      clusterResult: freezed == clusterResult
          ? _value.clusterResult
          : clusterResult // ignore: cast_nullable_to_non_nullable
              as ClusterResult?,
      errorMessage: freezed == errorMessage
          ? _value.errorMessage
          : errorMessage // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc

class _$ClusterStateImpl implements _ClusterState {
  const _$ClusterStateImpl(
      {this.isLoading = false, this.clusterResult, this.errorMessage});

  @override
  @JsonKey()
  final bool isLoading;
  @override
  final ClusterResult? clusterResult;
  @override
  final String? errorMessage;

  @override
  String toString() {
    return 'ClusterState(isLoading: $isLoading, clusterResult: $clusterResult, errorMessage: $errorMessage)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ClusterStateImpl &&
            (identical(other.isLoading, isLoading) ||
                other.isLoading == isLoading) &&
            (identical(other.clusterResult, clusterResult) ||
                other.clusterResult == clusterResult) &&
            (identical(other.errorMessage, errorMessage) ||
                other.errorMessage == errorMessage));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, isLoading, clusterResult, errorMessage);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ClusterStateImplCopyWith<_$ClusterStateImpl> get copyWith =>
      __$$ClusterStateImplCopyWithImpl<_$ClusterStateImpl>(this, _$identity);
}

abstract class _ClusterState implements ClusterState {
  const factory _ClusterState(
      {final bool isLoading,
      final ClusterResult? clusterResult,
      final String? errorMessage}) = _$ClusterStateImpl;

  @override
  bool get isLoading;
  @override
  ClusterResult? get clusterResult;
  @override
  String? get errorMessage;
  @override
  @JsonKey(ignore: true)
  _$$ClusterStateImplCopyWith<_$ClusterStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
