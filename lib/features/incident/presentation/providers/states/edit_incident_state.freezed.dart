// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'edit_incident_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$EditIncidentState {
  bool get isUpdating => throw _privateConstructorUsedError;
  bool get isSuccess => throw _privateConstructorUsedError;
  bool get isDeleting => throw _privateConstructorUsedError;
  bool get isDeleteSuccess => throw _privateConstructorUsedError;
  String? get errorMessage => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $EditIncidentStateCopyWith<EditIncidentState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $EditIncidentStateCopyWith<$Res> {
  factory $EditIncidentStateCopyWith(
          EditIncidentState value, $Res Function(EditIncidentState) then) =
      _$EditIncidentStateCopyWithImpl<$Res, EditIncidentState>;
  @useResult
  $Res call(
      {bool isUpdating,
      bool isSuccess,
      bool isDeleting,
      bool isDeleteSuccess,
      String? errorMessage});
}

/// @nodoc
class _$EditIncidentStateCopyWithImpl<$Res, $Val extends EditIncidentState>
    implements $EditIncidentStateCopyWith<$Res> {
  _$EditIncidentStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isUpdating = null,
    Object? isSuccess = null,
    Object? isDeleting = null,
    Object? isDeleteSuccess = null,
    Object? errorMessage = freezed,
  }) {
    return _then(_value.copyWith(
      isUpdating: null == isUpdating
          ? _value.isUpdating
          : isUpdating // ignore: cast_nullable_to_non_nullable
              as bool,
      isSuccess: null == isSuccess
          ? _value.isSuccess
          : isSuccess // ignore: cast_nullable_to_non_nullable
              as bool,
      isDeleting: null == isDeleting
          ? _value.isDeleting
          : isDeleting // ignore: cast_nullable_to_non_nullable
              as bool,
      isDeleteSuccess: null == isDeleteSuccess
          ? _value.isDeleteSuccess
          : isDeleteSuccess // ignore: cast_nullable_to_non_nullable
              as bool,
      errorMessage: freezed == errorMessage
          ? _value.errorMessage
          : errorMessage // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$EditIncidentStateImplCopyWith<$Res>
    implements $EditIncidentStateCopyWith<$Res> {
  factory _$$EditIncidentStateImplCopyWith(_$EditIncidentStateImpl value,
          $Res Function(_$EditIncidentStateImpl) then) =
      __$$EditIncidentStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {bool isUpdating,
      bool isSuccess,
      bool isDeleting,
      bool isDeleteSuccess,
      String? errorMessage});
}

/// @nodoc
class __$$EditIncidentStateImplCopyWithImpl<$Res>
    extends _$EditIncidentStateCopyWithImpl<$Res, _$EditIncidentStateImpl>
    implements _$$EditIncidentStateImplCopyWith<$Res> {
  __$$EditIncidentStateImplCopyWithImpl(_$EditIncidentStateImpl _value,
      $Res Function(_$EditIncidentStateImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isUpdating = null,
    Object? isSuccess = null,
    Object? isDeleting = null,
    Object? isDeleteSuccess = null,
    Object? errorMessage = freezed,
  }) {
    return _then(_$EditIncidentStateImpl(
      isUpdating: null == isUpdating
          ? _value.isUpdating
          : isUpdating // ignore: cast_nullable_to_non_nullable
              as bool,
      isSuccess: null == isSuccess
          ? _value.isSuccess
          : isSuccess // ignore: cast_nullable_to_non_nullable
              as bool,
      isDeleting: null == isDeleting
          ? _value.isDeleting
          : isDeleting // ignore: cast_nullable_to_non_nullable
              as bool,
      isDeleteSuccess: null == isDeleteSuccess
          ? _value.isDeleteSuccess
          : isDeleteSuccess // ignore: cast_nullable_to_non_nullable
              as bool,
      errorMessage: freezed == errorMessage
          ? _value.errorMessage
          : errorMessage // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc

class _$EditIncidentStateImpl implements _EditIncidentState {
  const _$EditIncidentStateImpl(
      {this.isUpdating = false,
      this.isSuccess = false,
      this.isDeleting = false,
      this.isDeleteSuccess = false,
      this.errorMessage});

  @override
  @JsonKey()
  final bool isUpdating;
  @override
  @JsonKey()
  final bool isSuccess;
  @override
  @JsonKey()
  final bool isDeleting;
  @override
  @JsonKey()
  final bool isDeleteSuccess;
  @override
  final String? errorMessage;

  @override
  String toString() {
    return 'EditIncidentState(isUpdating: $isUpdating, isSuccess: $isSuccess, isDeleting: $isDeleting, isDeleteSuccess: $isDeleteSuccess, errorMessage: $errorMessage)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$EditIncidentStateImpl &&
            (identical(other.isUpdating, isUpdating) ||
                other.isUpdating == isUpdating) &&
            (identical(other.isSuccess, isSuccess) ||
                other.isSuccess == isSuccess) &&
            (identical(other.isDeleting, isDeleting) ||
                other.isDeleting == isDeleting) &&
            (identical(other.isDeleteSuccess, isDeleteSuccess) ||
                other.isDeleteSuccess == isDeleteSuccess) &&
            (identical(other.errorMessage, errorMessage) ||
                other.errorMessage == errorMessage));
  }

  @override
  int get hashCode => Object.hash(runtimeType, isUpdating, isSuccess,
      isDeleting, isDeleteSuccess, errorMessage);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$EditIncidentStateImplCopyWith<_$EditIncidentStateImpl> get copyWith =>
      __$$EditIncidentStateImplCopyWithImpl<_$EditIncidentStateImpl>(
          this, _$identity);
}

abstract class _EditIncidentState implements EditIncidentState {
  const factory _EditIncidentState(
      {final bool isUpdating,
      final bool isSuccess,
      final bool isDeleting,
      final bool isDeleteSuccess,
      final String? errorMessage}) = _$EditIncidentStateImpl;

  @override
  bool get isUpdating;
  @override
  bool get isSuccess;
  @override
  bool get isDeleting;
  @override
  bool get isDeleteSuccess;
  @override
  String? get errorMessage;
  @override
  @JsonKey(ignore: true)
  _$$EditIncidentStateImplCopyWith<_$EditIncidentStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
