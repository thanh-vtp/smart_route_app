// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'route_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$RouteState {
  bool get isCalculating => throw _privateConstructorUsedError;
  RouteResult? get routeResult => throw _privateConstructorUsedError;
  String? get errorMessage =>
      throw _privateConstructorUsedError; // Alternative Routes
  bool get isCalculatingAlternatives => throw _privateConstructorUsedError;
  AlternativeRoutesResult? get alternativeRoutesResult =>
      throw _privateConstructorUsedError;
  RouteStrategy? get selectedStrategy => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $RouteStateCopyWith<RouteState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $RouteStateCopyWith<$Res> {
  factory $RouteStateCopyWith(
          RouteState value, $Res Function(RouteState) then) =
      _$RouteStateCopyWithImpl<$Res, RouteState>;
  @useResult
  $Res call(
      {bool isCalculating,
      RouteResult? routeResult,
      String? errorMessage,
      bool isCalculatingAlternatives,
      AlternativeRoutesResult? alternativeRoutesResult,
      RouteStrategy? selectedStrategy});

  $RouteResultCopyWith<$Res>? get routeResult;
  $AlternativeRoutesResultCopyWith<$Res>? get alternativeRoutesResult;
}

/// @nodoc
class _$RouteStateCopyWithImpl<$Res, $Val extends RouteState>
    implements $RouteStateCopyWith<$Res> {
  _$RouteStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isCalculating = null,
    Object? routeResult = freezed,
    Object? errorMessage = freezed,
    Object? isCalculatingAlternatives = null,
    Object? alternativeRoutesResult = freezed,
    Object? selectedStrategy = freezed,
  }) {
    return _then(_value.copyWith(
      isCalculating: null == isCalculating
          ? _value.isCalculating
          : isCalculating // ignore: cast_nullable_to_non_nullable
              as bool,
      routeResult: freezed == routeResult
          ? _value.routeResult
          : routeResult // ignore: cast_nullable_to_non_nullable
              as RouteResult?,
      errorMessage: freezed == errorMessage
          ? _value.errorMessage
          : errorMessage // ignore: cast_nullable_to_non_nullable
              as String?,
      isCalculatingAlternatives: null == isCalculatingAlternatives
          ? _value.isCalculatingAlternatives
          : isCalculatingAlternatives // ignore: cast_nullable_to_non_nullable
              as bool,
      alternativeRoutesResult: freezed == alternativeRoutesResult
          ? _value.alternativeRoutesResult
          : alternativeRoutesResult // ignore: cast_nullable_to_non_nullable
              as AlternativeRoutesResult?,
      selectedStrategy: freezed == selectedStrategy
          ? _value.selectedStrategy
          : selectedStrategy // ignore: cast_nullable_to_non_nullable
              as RouteStrategy?,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $RouteResultCopyWith<$Res>? get routeResult {
    if (_value.routeResult == null) {
      return null;
    }

    return $RouteResultCopyWith<$Res>(_value.routeResult!, (value) {
      return _then(_value.copyWith(routeResult: value) as $Val);
    });
  }

  @override
  @pragma('vm:prefer-inline')
  $AlternativeRoutesResultCopyWith<$Res>? get alternativeRoutesResult {
    if (_value.alternativeRoutesResult == null) {
      return null;
    }

    return $AlternativeRoutesResultCopyWith<$Res>(
        _value.alternativeRoutesResult!, (value) {
      return _then(_value.copyWith(alternativeRoutesResult: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$RouteStateImplCopyWith<$Res>
    implements $RouteStateCopyWith<$Res> {
  factory _$$RouteStateImplCopyWith(
          _$RouteStateImpl value, $Res Function(_$RouteStateImpl) then) =
      __$$RouteStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {bool isCalculating,
      RouteResult? routeResult,
      String? errorMessage,
      bool isCalculatingAlternatives,
      AlternativeRoutesResult? alternativeRoutesResult,
      RouteStrategy? selectedStrategy});

  @override
  $RouteResultCopyWith<$Res>? get routeResult;
  @override
  $AlternativeRoutesResultCopyWith<$Res>? get alternativeRoutesResult;
}

/// @nodoc
class __$$RouteStateImplCopyWithImpl<$Res>
    extends _$RouteStateCopyWithImpl<$Res, _$RouteStateImpl>
    implements _$$RouteStateImplCopyWith<$Res> {
  __$$RouteStateImplCopyWithImpl(
      _$RouteStateImpl _value, $Res Function(_$RouteStateImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isCalculating = null,
    Object? routeResult = freezed,
    Object? errorMessage = freezed,
    Object? isCalculatingAlternatives = null,
    Object? alternativeRoutesResult = freezed,
    Object? selectedStrategy = freezed,
  }) {
    return _then(_$RouteStateImpl(
      isCalculating: null == isCalculating
          ? _value.isCalculating
          : isCalculating // ignore: cast_nullable_to_non_nullable
              as bool,
      routeResult: freezed == routeResult
          ? _value.routeResult
          : routeResult // ignore: cast_nullable_to_non_nullable
              as RouteResult?,
      errorMessage: freezed == errorMessage
          ? _value.errorMessage
          : errorMessage // ignore: cast_nullable_to_non_nullable
              as String?,
      isCalculatingAlternatives: null == isCalculatingAlternatives
          ? _value.isCalculatingAlternatives
          : isCalculatingAlternatives // ignore: cast_nullable_to_non_nullable
              as bool,
      alternativeRoutesResult: freezed == alternativeRoutesResult
          ? _value.alternativeRoutesResult
          : alternativeRoutesResult // ignore: cast_nullable_to_non_nullable
              as AlternativeRoutesResult?,
      selectedStrategy: freezed == selectedStrategy
          ? _value.selectedStrategy
          : selectedStrategy // ignore: cast_nullable_to_non_nullable
              as RouteStrategy?,
    ));
  }
}

/// @nodoc

class _$RouteStateImpl implements _RouteState {
  const _$RouteStateImpl(
      {this.isCalculating = false,
      this.routeResult,
      this.errorMessage,
      this.isCalculatingAlternatives = false,
      this.alternativeRoutesResult,
      this.selectedStrategy});

  @override
  @JsonKey()
  final bool isCalculating;
  @override
  final RouteResult? routeResult;
  @override
  final String? errorMessage;
// Alternative Routes
  @override
  @JsonKey()
  final bool isCalculatingAlternatives;
  @override
  final AlternativeRoutesResult? alternativeRoutesResult;
  @override
  final RouteStrategy? selectedStrategy;

  @override
  String toString() {
    return 'RouteState(isCalculating: $isCalculating, routeResult: $routeResult, errorMessage: $errorMessage, isCalculatingAlternatives: $isCalculatingAlternatives, alternativeRoutesResult: $alternativeRoutesResult, selectedStrategy: $selectedStrategy)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$RouteStateImpl &&
            (identical(other.isCalculating, isCalculating) ||
                other.isCalculating == isCalculating) &&
            (identical(other.routeResult, routeResult) ||
                other.routeResult == routeResult) &&
            (identical(other.errorMessage, errorMessage) ||
                other.errorMessage == errorMessage) &&
            (identical(other.isCalculatingAlternatives,
                    isCalculatingAlternatives) ||
                other.isCalculatingAlternatives == isCalculatingAlternatives) &&
            (identical(
                    other.alternativeRoutesResult, alternativeRoutesResult) ||
                other.alternativeRoutesResult == alternativeRoutesResult) &&
            (identical(other.selectedStrategy, selectedStrategy) ||
                other.selectedStrategy == selectedStrategy));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      isCalculating,
      routeResult,
      errorMessage,
      isCalculatingAlternatives,
      alternativeRoutesResult,
      selectedStrategy);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$RouteStateImplCopyWith<_$RouteStateImpl> get copyWith =>
      __$$RouteStateImplCopyWithImpl<_$RouteStateImpl>(this, _$identity);
}

abstract class _RouteState implements RouteState {
  const factory _RouteState(
      {final bool isCalculating,
      final RouteResult? routeResult,
      final String? errorMessage,
      final bool isCalculatingAlternatives,
      final AlternativeRoutesResult? alternativeRoutesResult,
      final RouteStrategy? selectedStrategy}) = _$RouteStateImpl;

  @override
  bool get isCalculating;
  @override
  RouteResult? get routeResult;
  @override
  String? get errorMessage;
  @override // Alternative Routes
  bool get isCalculatingAlternatives;
  @override
  AlternativeRoutesResult? get alternativeRoutesResult;
  @override
  RouteStrategy? get selectedStrategy;
  @override
  @JsonKey(ignore: true)
  _$$RouteStateImplCopyWith<_$RouteStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
