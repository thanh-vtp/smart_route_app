// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'incident_detail_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$IncidentDetailState {
  bool get isLoading => throw _privateConstructorUsedError;
  Incident? get incident => throw _privateConstructorUsedError;
  bool get isOwner =>
      throw _privateConstructorUsedError; // Có phải người tạo báo cáo không
  String? get reporterName => throw _privateConstructorUsedError;
  String? get reporterAvatarUrl => throw _privateConstructorUsedError;
  String? get errorMessage =>
      throw _privateConstructorUsedError; // Trạng thái khi bấm nút "Đã giải quyết"
  bool get isResolving => throw _privateConstructorUsedError;
  bool get isResolveSuccess =>
      throw _privateConstructorUsedError; // Trạng thái khi bấm nút Upvote/Downvote
  UserVoteType get currentVote => throw _privateConstructorUsedError;
  bool get isVoting => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $IncidentDetailStateCopyWith<IncidentDetailState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $IncidentDetailStateCopyWith<$Res> {
  factory $IncidentDetailStateCopyWith(
          IncidentDetailState value, $Res Function(IncidentDetailState) then) =
      _$IncidentDetailStateCopyWithImpl<$Res, IncidentDetailState>;
  @useResult
  $Res call(
      {bool isLoading,
      Incident? incident,
      bool isOwner,
      String? reporterName,
      String? reporterAvatarUrl,
      String? errorMessage,
      bool isResolving,
      bool isResolveSuccess,
      UserVoteType currentVote,
      bool isVoting});

  $IncidentCopyWith<$Res>? get incident;
}

/// @nodoc
class _$IncidentDetailStateCopyWithImpl<$Res, $Val extends IncidentDetailState>
    implements $IncidentDetailStateCopyWith<$Res> {
  _$IncidentDetailStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isLoading = null,
    Object? incident = freezed,
    Object? isOwner = null,
    Object? reporterName = freezed,
    Object? reporterAvatarUrl = freezed,
    Object? errorMessage = freezed,
    Object? isResolving = null,
    Object? isResolveSuccess = null,
    Object? currentVote = null,
    Object? isVoting = null,
  }) {
    return _then(_value.copyWith(
      isLoading: null == isLoading
          ? _value.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool,
      incident: freezed == incident
          ? _value.incident
          : incident // ignore: cast_nullable_to_non_nullable
              as Incident?,
      isOwner: null == isOwner
          ? _value.isOwner
          : isOwner // ignore: cast_nullable_to_non_nullable
              as bool,
      reporterName: freezed == reporterName
          ? _value.reporterName
          : reporterName // ignore: cast_nullable_to_non_nullable
              as String?,
      reporterAvatarUrl: freezed == reporterAvatarUrl
          ? _value.reporterAvatarUrl
          : reporterAvatarUrl // ignore: cast_nullable_to_non_nullable
              as String?,
      errorMessage: freezed == errorMessage
          ? _value.errorMessage
          : errorMessage // ignore: cast_nullable_to_non_nullable
              as String?,
      isResolving: null == isResolving
          ? _value.isResolving
          : isResolving // ignore: cast_nullable_to_non_nullable
              as bool,
      isResolveSuccess: null == isResolveSuccess
          ? _value.isResolveSuccess
          : isResolveSuccess // ignore: cast_nullable_to_non_nullable
              as bool,
      currentVote: null == currentVote
          ? _value.currentVote
          : currentVote // ignore: cast_nullable_to_non_nullable
              as UserVoteType,
      isVoting: null == isVoting
          ? _value.isVoting
          : isVoting // ignore: cast_nullable_to_non_nullable
              as bool,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $IncidentCopyWith<$Res>? get incident {
    if (_value.incident == null) {
      return null;
    }

    return $IncidentCopyWith<$Res>(_value.incident!, (value) {
      return _then(_value.copyWith(incident: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$IncidentDetailStateImplCopyWith<$Res>
    implements $IncidentDetailStateCopyWith<$Res> {
  factory _$$IncidentDetailStateImplCopyWith(_$IncidentDetailStateImpl value,
          $Res Function(_$IncidentDetailStateImpl) then) =
      __$$IncidentDetailStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {bool isLoading,
      Incident? incident,
      bool isOwner,
      String? reporterName,
      String? reporterAvatarUrl,
      String? errorMessage,
      bool isResolving,
      bool isResolveSuccess,
      UserVoteType currentVote,
      bool isVoting});

  @override
  $IncidentCopyWith<$Res>? get incident;
}

/// @nodoc
class __$$IncidentDetailStateImplCopyWithImpl<$Res>
    extends _$IncidentDetailStateCopyWithImpl<$Res, _$IncidentDetailStateImpl>
    implements _$$IncidentDetailStateImplCopyWith<$Res> {
  __$$IncidentDetailStateImplCopyWithImpl(_$IncidentDetailStateImpl _value,
      $Res Function(_$IncidentDetailStateImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isLoading = null,
    Object? incident = freezed,
    Object? isOwner = null,
    Object? reporterName = freezed,
    Object? reporterAvatarUrl = freezed,
    Object? errorMessage = freezed,
    Object? isResolving = null,
    Object? isResolveSuccess = null,
    Object? currentVote = null,
    Object? isVoting = null,
  }) {
    return _then(_$IncidentDetailStateImpl(
      isLoading: null == isLoading
          ? _value.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool,
      incident: freezed == incident
          ? _value.incident
          : incident // ignore: cast_nullable_to_non_nullable
              as Incident?,
      isOwner: null == isOwner
          ? _value.isOwner
          : isOwner // ignore: cast_nullable_to_non_nullable
              as bool,
      reporterName: freezed == reporterName
          ? _value.reporterName
          : reporterName // ignore: cast_nullable_to_non_nullable
              as String?,
      reporterAvatarUrl: freezed == reporterAvatarUrl
          ? _value.reporterAvatarUrl
          : reporterAvatarUrl // ignore: cast_nullable_to_non_nullable
              as String?,
      errorMessage: freezed == errorMessage
          ? _value.errorMessage
          : errorMessage // ignore: cast_nullable_to_non_nullable
              as String?,
      isResolving: null == isResolving
          ? _value.isResolving
          : isResolving // ignore: cast_nullable_to_non_nullable
              as bool,
      isResolveSuccess: null == isResolveSuccess
          ? _value.isResolveSuccess
          : isResolveSuccess // ignore: cast_nullable_to_non_nullable
              as bool,
      currentVote: null == currentVote
          ? _value.currentVote
          : currentVote // ignore: cast_nullable_to_non_nullable
              as UserVoteType,
      isVoting: null == isVoting
          ? _value.isVoting
          : isVoting // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc

class _$IncidentDetailStateImpl implements _IncidentDetailState {
  const _$IncidentDetailStateImpl(
      {this.isLoading = true,
      this.incident,
      this.isOwner = false,
      this.reporterName,
      this.reporterAvatarUrl,
      this.errorMessage,
      this.isResolving = false,
      this.isResolveSuccess = false,
      this.currentVote = UserVoteType.none,
      this.isVoting = false});

  @override
  @JsonKey()
  final bool isLoading;
  @override
  final Incident? incident;
  @override
  @JsonKey()
  final bool isOwner;
// Có phải người tạo báo cáo không
  @override
  final String? reporterName;
  @override
  final String? reporterAvatarUrl;
  @override
  final String? errorMessage;
// Trạng thái khi bấm nút "Đã giải quyết"
  @override
  @JsonKey()
  final bool isResolving;
  @override
  @JsonKey()
  final bool isResolveSuccess;
// Trạng thái khi bấm nút Upvote/Downvote
  @override
  @JsonKey()
  final UserVoteType currentVote;
  @override
  @JsonKey()
  final bool isVoting;

  @override
  String toString() {
    return 'IncidentDetailState(isLoading: $isLoading, incident: $incident, isOwner: $isOwner, reporterName: $reporterName, reporterAvatarUrl: $reporterAvatarUrl, errorMessage: $errorMessage, isResolving: $isResolving, isResolveSuccess: $isResolveSuccess, currentVote: $currentVote, isVoting: $isVoting)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$IncidentDetailStateImpl &&
            (identical(other.isLoading, isLoading) ||
                other.isLoading == isLoading) &&
            (identical(other.incident, incident) ||
                other.incident == incident) &&
            (identical(other.isOwner, isOwner) || other.isOwner == isOwner) &&
            (identical(other.reporterName, reporterName) ||
                other.reporterName == reporterName) &&
            (identical(other.reporterAvatarUrl, reporterAvatarUrl) ||
                other.reporterAvatarUrl == reporterAvatarUrl) &&
            (identical(other.errorMessage, errorMessage) ||
                other.errorMessage == errorMessage) &&
            (identical(other.isResolving, isResolving) ||
                other.isResolving == isResolving) &&
            (identical(other.isResolveSuccess, isResolveSuccess) ||
                other.isResolveSuccess == isResolveSuccess) &&
            (identical(other.currentVote, currentVote) ||
                other.currentVote == currentVote) &&
            (identical(other.isVoting, isVoting) ||
                other.isVoting == isVoting));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      isLoading,
      incident,
      isOwner,
      reporterName,
      reporterAvatarUrl,
      errorMessage,
      isResolving,
      isResolveSuccess,
      currentVote,
      isVoting);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$IncidentDetailStateImplCopyWith<_$IncidentDetailStateImpl> get copyWith =>
      __$$IncidentDetailStateImplCopyWithImpl<_$IncidentDetailStateImpl>(
          this, _$identity);
}

abstract class _IncidentDetailState implements IncidentDetailState {
  const factory _IncidentDetailState(
      {final bool isLoading,
      final Incident? incident,
      final bool isOwner,
      final String? reporterName,
      final String? reporterAvatarUrl,
      final String? errorMessage,
      final bool isResolving,
      final bool isResolveSuccess,
      final UserVoteType currentVote,
      final bool isVoting}) = _$IncidentDetailStateImpl;

  @override
  bool get isLoading;
  @override
  Incident? get incident;
  @override
  bool get isOwner;
  @override // Có phải người tạo báo cáo không
  String? get reporterName;
  @override
  String? get reporterAvatarUrl;
  @override
  String? get errorMessage;
  @override // Trạng thái khi bấm nút "Đã giải quyết"
  bool get isResolving;
  @override
  bool get isResolveSuccess;
  @override // Trạng thái khi bấm nút Upvote/Downvote
  UserVoteType get currentVote;
  @override
  bool get isVoting;
  @override
  @JsonKey(ignore: true)
  _$$IncidentDetailStateImplCopyWith<_$IncidentDetailStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
