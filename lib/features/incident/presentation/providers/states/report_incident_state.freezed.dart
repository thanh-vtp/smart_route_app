// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'report_incident_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$ReportIncidentState {
// Trạng thái cho việc dịch địa chỉ
  bool get isLoadingAddress => throw _privateConstructorUsedError;
  String? get address =>
      throw _privateConstructorUsedError; // Trạng thái cho việc submit báo cáo
  bool get isSubmitting => throw _privateConstructorUsedError;
  bool get isSuccess => throw _privateConstructorUsedError;
  String? get errorMessage => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $ReportIncidentStateCopyWith<ReportIncidentState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ReportIncidentStateCopyWith<$Res> {
  factory $ReportIncidentStateCopyWith(
          ReportIncidentState value, $Res Function(ReportIncidentState) then) =
      _$ReportIncidentStateCopyWithImpl<$Res, ReportIncidentState>;
  @useResult
  $Res call(
      {bool isLoadingAddress,
      String? address,
      bool isSubmitting,
      bool isSuccess,
      String? errorMessage});
}

/// @nodoc
class _$ReportIncidentStateCopyWithImpl<$Res, $Val extends ReportIncidentState>
    implements $ReportIncidentStateCopyWith<$Res> {
  _$ReportIncidentStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isLoadingAddress = null,
    Object? address = freezed,
    Object? isSubmitting = null,
    Object? isSuccess = null,
    Object? errorMessage = freezed,
  }) {
    return _then(_value.copyWith(
      isLoadingAddress: null == isLoadingAddress
          ? _value.isLoadingAddress
          : isLoadingAddress // ignore: cast_nullable_to_non_nullable
              as bool,
      address: freezed == address
          ? _value.address
          : address // ignore: cast_nullable_to_non_nullable
              as String?,
      isSubmitting: null == isSubmitting
          ? _value.isSubmitting
          : isSubmitting // ignore: cast_nullable_to_non_nullable
              as bool,
      isSuccess: null == isSuccess
          ? _value.isSuccess
          : isSuccess // ignore: cast_nullable_to_non_nullable
              as bool,
      errorMessage: freezed == errorMessage
          ? _value.errorMessage
          : errorMessage // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ReportIncidentStateImplCopyWith<$Res>
    implements $ReportIncidentStateCopyWith<$Res> {
  factory _$$ReportIncidentStateImplCopyWith(_$ReportIncidentStateImpl value,
          $Res Function(_$ReportIncidentStateImpl) then) =
      __$$ReportIncidentStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {bool isLoadingAddress,
      String? address,
      bool isSubmitting,
      bool isSuccess,
      String? errorMessage});
}

/// @nodoc
class __$$ReportIncidentStateImplCopyWithImpl<$Res>
    extends _$ReportIncidentStateCopyWithImpl<$Res, _$ReportIncidentStateImpl>
    implements _$$ReportIncidentStateImplCopyWith<$Res> {
  __$$ReportIncidentStateImplCopyWithImpl(_$ReportIncidentStateImpl _value,
      $Res Function(_$ReportIncidentStateImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isLoadingAddress = null,
    Object? address = freezed,
    Object? isSubmitting = null,
    Object? isSuccess = null,
    Object? errorMessage = freezed,
  }) {
    return _then(_$ReportIncidentStateImpl(
      isLoadingAddress: null == isLoadingAddress
          ? _value.isLoadingAddress
          : isLoadingAddress // ignore: cast_nullable_to_non_nullable
              as bool,
      address: freezed == address
          ? _value.address
          : address // ignore: cast_nullable_to_non_nullable
              as String?,
      isSubmitting: null == isSubmitting
          ? _value.isSubmitting
          : isSubmitting // ignore: cast_nullable_to_non_nullable
              as bool,
      isSuccess: null == isSuccess
          ? _value.isSuccess
          : isSuccess // ignore: cast_nullable_to_non_nullable
              as bool,
      errorMessage: freezed == errorMessage
          ? _value.errorMessage
          : errorMessage // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc

class _$ReportIncidentStateImpl implements _ReportIncidentState {
  const _$ReportIncidentStateImpl(
      {this.isLoadingAddress = true,
      this.address,
      this.isSubmitting = false,
      this.isSuccess = false,
      this.errorMessage});

// Trạng thái cho việc dịch địa chỉ
  @override
  @JsonKey()
  final bool isLoadingAddress;
  @override
  final String? address;
// Trạng thái cho việc submit báo cáo
  @override
  @JsonKey()
  final bool isSubmitting;
  @override
  @JsonKey()
  final bool isSuccess;
  @override
  final String? errorMessage;

  @override
  String toString() {
    return 'ReportIncidentState(isLoadingAddress: $isLoadingAddress, address: $address, isSubmitting: $isSubmitting, isSuccess: $isSuccess, errorMessage: $errorMessage)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ReportIncidentStateImpl &&
            (identical(other.isLoadingAddress, isLoadingAddress) ||
                other.isLoadingAddress == isLoadingAddress) &&
            (identical(other.address, address) || other.address == address) &&
            (identical(other.isSubmitting, isSubmitting) ||
                other.isSubmitting == isSubmitting) &&
            (identical(other.isSuccess, isSuccess) ||
                other.isSuccess == isSuccess) &&
            (identical(other.errorMessage, errorMessage) ||
                other.errorMessage == errorMessage));
  }

  @override
  int get hashCode => Object.hash(runtimeType, isLoadingAddress, address,
      isSubmitting, isSuccess, errorMessage);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ReportIncidentStateImplCopyWith<_$ReportIncidentStateImpl> get copyWith =>
      __$$ReportIncidentStateImplCopyWithImpl<_$ReportIncidentStateImpl>(
          this, _$identity);
}

abstract class _ReportIncidentState implements ReportIncidentState {
  const factory _ReportIncidentState(
      {final bool isLoadingAddress,
      final String? address,
      final bool isSubmitting,
      final bool isSuccess,
      final String? errorMessage}) = _$ReportIncidentStateImpl;

  @override // Trạng thái cho việc dịch địa chỉ
  bool get isLoadingAddress;
  @override
  String? get address;
  @override // Trạng thái cho việc submit báo cáo
  bool get isSubmitting;
  @override
  bool get isSuccess;
  @override
  String? get errorMessage;
  @override
  @JsonKey(ignore: true)
  _$$ReportIncidentStateImplCopyWith<_$ReportIncidentStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
