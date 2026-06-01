// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'analytics_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$AnalyticsState {
  bool get isLoading => throw _privateConstructorUsedError;
  TimeRange get selectedRange => throw _privateConstructorUsedError;
  AnalyticsData? get data => throw _privateConstructorUsedError;
  String? get errorMessage => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $AnalyticsStateCopyWith<AnalyticsState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AnalyticsStateCopyWith<$Res> {
  factory $AnalyticsStateCopyWith(
          AnalyticsState value, $Res Function(AnalyticsState) then) =
      _$AnalyticsStateCopyWithImpl<$Res, AnalyticsState>;
  @useResult
  $Res call(
      {bool isLoading,
      TimeRange selectedRange,
      AnalyticsData? data,
      String? errorMessage});

  $AnalyticsDataCopyWith<$Res>? get data;
}

/// @nodoc
class _$AnalyticsStateCopyWithImpl<$Res, $Val extends AnalyticsState>
    implements $AnalyticsStateCopyWith<$Res> {
  _$AnalyticsStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isLoading = null,
    Object? selectedRange = null,
    Object? data = freezed,
    Object? errorMessage = freezed,
  }) {
    return _then(_value.copyWith(
      isLoading: null == isLoading
          ? _value.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool,
      selectedRange: null == selectedRange
          ? _value.selectedRange
          : selectedRange // ignore: cast_nullable_to_non_nullable
              as TimeRange,
      data: freezed == data
          ? _value.data
          : data // ignore: cast_nullable_to_non_nullable
              as AnalyticsData?,
      errorMessage: freezed == errorMessage
          ? _value.errorMessage
          : errorMessage // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $AnalyticsDataCopyWith<$Res>? get data {
    if (_value.data == null) {
      return null;
    }

    return $AnalyticsDataCopyWith<$Res>(_value.data!, (value) {
      return _then(_value.copyWith(data: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$AnalyticsStateImplCopyWith<$Res>
    implements $AnalyticsStateCopyWith<$Res> {
  factory _$$AnalyticsStateImplCopyWith(_$AnalyticsStateImpl value,
          $Res Function(_$AnalyticsStateImpl) then) =
      __$$AnalyticsStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {bool isLoading,
      TimeRange selectedRange,
      AnalyticsData? data,
      String? errorMessage});

  @override
  $AnalyticsDataCopyWith<$Res>? get data;
}

/// @nodoc
class __$$AnalyticsStateImplCopyWithImpl<$Res>
    extends _$AnalyticsStateCopyWithImpl<$Res, _$AnalyticsStateImpl>
    implements _$$AnalyticsStateImplCopyWith<$Res> {
  __$$AnalyticsStateImplCopyWithImpl(
      _$AnalyticsStateImpl _value, $Res Function(_$AnalyticsStateImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isLoading = null,
    Object? selectedRange = null,
    Object? data = freezed,
    Object? errorMessage = freezed,
  }) {
    return _then(_$AnalyticsStateImpl(
      isLoading: null == isLoading
          ? _value.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool,
      selectedRange: null == selectedRange
          ? _value.selectedRange
          : selectedRange // ignore: cast_nullable_to_non_nullable
              as TimeRange,
      data: freezed == data
          ? _value.data
          : data // ignore: cast_nullable_to_non_nullable
              as AnalyticsData?,
      errorMessage: freezed == errorMessage
          ? _value.errorMessage
          : errorMessage // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc

class _$AnalyticsStateImpl implements _AnalyticsState {
  const _$AnalyticsStateImpl(
      {this.isLoading = true,
      this.selectedRange = TimeRange.week,
      this.data,
      this.errorMessage});

  @override
  @JsonKey()
  final bool isLoading;
  @override
  @JsonKey()
  final TimeRange selectedRange;
  @override
  final AnalyticsData? data;
  @override
  final String? errorMessage;

  @override
  String toString() {
    return 'AnalyticsState(isLoading: $isLoading, selectedRange: $selectedRange, data: $data, errorMessage: $errorMessage)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AnalyticsStateImpl &&
            (identical(other.isLoading, isLoading) ||
                other.isLoading == isLoading) &&
            (identical(other.selectedRange, selectedRange) ||
                other.selectedRange == selectedRange) &&
            (identical(other.data, data) || other.data == data) &&
            (identical(other.errorMessage, errorMessage) ||
                other.errorMessage == errorMessage));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, isLoading, selectedRange, data, errorMessage);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$AnalyticsStateImplCopyWith<_$AnalyticsStateImpl> get copyWith =>
      __$$AnalyticsStateImplCopyWithImpl<_$AnalyticsStateImpl>(
          this, _$identity);
}

abstract class _AnalyticsState implements AnalyticsState {
  const factory _AnalyticsState(
      {final bool isLoading,
      final TimeRange selectedRange,
      final AnalyticsData? data,
      final String? errorMessage}) = _$AnalyticsStateImpl;

  @override
  bool get isLoading;
  @override
  TimeRange get selectedRange;
  @override
  AnalyticsData? get data;
  @override
  String? get errorMessage;
  @override
  @JsonKey(ignore: true)
  _$$AnalyticsStateImplCopyWith<_$AnalyticsStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
