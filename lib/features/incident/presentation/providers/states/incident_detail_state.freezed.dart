// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'incident_detail_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$IncidentDetailState {

 bool get isLoading; Incident? get incident; bool get isOwner; String? get reporterName; String? get reporterAvatarUrl; String? get errorMessage; bool get isResolving; bool get isResolveSuccess; UserVoteType get currentVote; bool get isVoting; int get reporterReputationScore;
/// Create a copy of IncidentDetailState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$IncidentDetailStateCopyWith<IncidentDetailState> get copyWith => _$IncidentDetailStateCopyWithImpl<IncidentDetailState>(this as IncidentDetailState, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is IncidentDetailState&&(identical(other.isLoading, isLoading) || other.isLoading == isLoading)&&(identical(other.incident, incident) || other.incident == incident)&&(identical(other.isOwner, isOwner) || other.isOwner == isOwner)&&(identical(other.reporterName, reporterName) || other.reporterName == reporterName)&&(identical(other.reporterAvatarUrl, reporterAvatarUrl) || other.reporterAvatarUrl == reporterAvatarUrl)&&(identical(other.errorMessage, errorMessage) || other.errorMessage == errorMessage)&&(identical(other.isResolving, isResolving) || other.isResolving == isResolving)&&(identical(other.isResolveSuccess, isResolveSuccess) || other.isResolveSuccess == isResolveSuccess)&&(identical(other.currentVote, currentVote) || other.currentVote == currentVote)&&(identical(other.isVoting, isVoting) || other.isVoting == isVoting)&&(identical(other.reporterReputationScore, reporterReputationScore) || other.reporterReputationScore == reporterReputationScore));
}


@override
int get hashCode => Object.hash(runtimeType,isLoading,incident,isOwner,reporterName,reporterAvatarUrl,errorMessage,isResolving,isResolveSuccess,currentVote,isVoting,reporterReputationScore);

@override
String toString() {
  return 'IncidentDetailState(isLoading: $isLoading, incident: $incident, isOwner: $isOwner, reporterName: $reporterName, reporterAvatarUrl: $reporterAvatarUrl, errorMessage: $errorMessage, isResolving: $isResolving, isResolveSuccess: $isResolveSuccess, currentVote: $currentVote, isVoting: $isVoting, reporterReputationScore: $reporterReputationScore)';
}


}

/// @nodoc
abstract mixin class $IncidentDetailStateCopyWith<$Res>  {
  factory $IncidentDetailStateCopyWith(IncidentDetailState value, $Res Function(IncidentDetailState) _then) = _$IncidentDetailStateCopyWithImpl;
@useResult
$Res call({
 bool isLoading, Incident? incident, bool isOwner, String? reporterName, String? reporterAvatarUrl, String? errorMessage, bool isResolving, bool isResolveSuccess, UserVoteType currentVote, bool isVoting, int reporterReputationScore
});


$IncidentCopyWith<$Res>? get incident;

}
/// @nodoc
class _$IncidentDetailStateCopyWithImpl<$Res>
    implements $IncidentDetailStateCopyWith<$Res> {
  _$IncidentDetailStateCopyWithImpl(this._self, this._then);

  final IncidentDetailState _self;
  final $Res Function(IncidentDetailState) _then;

/// Create a copy of IncidentDetailState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? isLoading = null,Object? incident = freezed,Object? isOwner = null,Object? reporterName = freezed,Object? reporterAvatarUrl = freezed,Object? errorMessage = freezed,Object? isResolving = null,Object? isResolveSuccess = null,Object? currentVote = null,Object? isVoting = null,Object? reporterReputationScore = null,}) {
  return _then(_self.copyWith(
isLoading: null == isLoading ? _self.isLoading : isLoading // ignore: cast_nullable_to_non_nullable
as bool,incident: freezed == incident ? _self.incident : incident // ignore: cast_nullable_to_non_nullable
as Incident?,isOwner: null == isOwner ? _self.isOwner : isOwner // ignore: cast_nullable_to_non_nullable
as bool,reporterName: freezed == reporterName ? _self.reporterName : reporterName // ignore: cast_nullable_to_non_nullable
as String?,reporterAvatarUrl: freezed == reporterAvatarUrl ? _self.reporterAvatarUrl : reporterAvatarUrl // ignore: cast_nullable_to_non_nullable
as String?,errorMessage: freezed == errorMessage ? _self.errorMessage : errorMessage // ignore: cast_nullable_to_non_nullable
as String?,isResolving: null == isResolving ? _self.isResolving : isResolving // ignore: cast_nullable_to_non_nullable
as bool,isResolveSuccess: null == isResolveSuccess ? _self.isResolveSuccess : isResolveSuccess // ignore: cast_nullable_to_non_nullable
as bool,currentVote: null == currentVote ? _self.currentVote : currentVote // ignore: cast_nullable_to_non_nullable
as UserVoteType,isVoting: null == isVoting ? _self.isVoting : isVoting // ignore: cast_nullable_to_non_nullable
as bool,reporterReputationScore: null == reporterReputationScore ? _self.reporterReputationScore : reporterReputationScore // ignore: cast_nullable_to_non_nullable
as int,
  ));
}
/// Create a copy of IncidentDetailState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$IncidentCopyWith<$Res>? get incident {
    if (_self.incident == null) {
    return null;
  }

  return $IncidentCopyWith<$Res>(_self.incident!, (value) {
    return _then(_self.copyWith(incident: value));
  });
}
}


/// Adds pattern-matching-related methods to [IncidentDetailState].
extension IncidentDetailStatePatterns on IncidentDetailState {
/// A variant of `map` that fallback to returning `orElse`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _IncidentDetailState value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _IncidentDetailState() when $default != null:
return $default(_that);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// Callbacks receives the raw object, upcasted.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case final Subclass2 value:
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _IncidentDetailState value)  $default,){
final _that = this;
switch (_that) {
case _IncidentDetailState():
return $default(_that);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `map` that fallback to returning `null`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _IncidentDetailState value)?  $default,){
final _that = this;
switch (_that) {
case _IncidentDetailState() when $default != null:
return $default(_that);case _:
  return null;

}
}
/// A variant of `when` that fallback to an `orElse` callback.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( bool isLoading,  Incident? incident,  bool isOwner,  String? reporterName,  String? reporterAvatarUrl,  String? errorMessage,  bool isResolving,  bool isResolveSuccess,  UserVoteType currentVote,  bool isVoting,  int reporterReputationScore)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _IncidentDetailState() when $default != null:
return $default(_that.isLoading,_that.incident,_that.isOwner,_that.reporterName,_that.reporterAvatarUrl,_that.errorMessage,_that.isResolving,_that.isResolveSuccess,_that.currentVote,_that.isVoting,_that.reporterReputationScore);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// As opposed to `map`, this offers destructuring.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case Subclass2(:final field2):
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( bool isLoading,  Incident? incident,  bool isOwner,  String? reporterName,  String? reporterAvatarUrl,  String? errorMessage,  bool isResolving,  bool isResolveSuccess,  UserVoteType currentVote,  bool isVoting,  int reporterReputationScore)  $default,) {final _that = this;
switch (_that) {
case _IncidentDetailState():
return $default(_that.isLoading,_that.incident,_that.isOwner,_that.reporterName,_that.reporterAvatarUrl,_that.errorMessage,_that.isResolving,_that.isResolveSuccess,_that.currentVote,_that.isVoting,_that.reporterReputationScore);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `when` that fallback to returning `null`
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( bool isLoading,  Incident? incident,  bool isOwner,  String? reporterName,  String? reporterAvatarUrl,  String? errorMessage,  bool isResolving,  bool isResolveSuccess,  UserVoteType currentVote,  bool isVoting,  int reporterReputationScore)?  $default,) {final _that = this;
switch (_that) {
case _IncidentDetailState() when $default != null:
return $default(_that.isLoading,_that.incident,_that.isOwner,_that.reporterName,_that.reporterAvatarUrl,_that.errorMessage,_that.isResolving,_that.isResolveSuccess,_that.currentVote,_that.isVoting,_that.reporterReputationScore);case _:
  return null;

}
}

}

/// @nodoc


class _IncidentDetailState implements IncidentDetailState {
  const _IncidentDetailState({this.isLoading = true, this.incident, this.isOwner = false, this.reporterName, this.reporterAvatarUrl, this.errorMessage, this.isResolving = false, this.isResolveSuccess = false, this.currentVote = UserVoteType.none, this.isVoting = false, this.reporterReputationScore = 0});
  

@override@JsonKey() final  bool isLoading;
@override final  Incident? incident;
@override@JsonKey() final  bool isOwner;
@override final  String? reporterName;
@override final  String? reporterAvatarUrl;
@override final  String? errorMessage;
@override@JsonKey() final  bool isResolving;
@override@JsonKey() final  bool isResolveSuccess;
@override@JsonKey() final  UserVoteType currentVote;
@override@JsonKey() final  bool isVoting;
@override@JsonKey() final  int reporterReputationScore;

/// Create a copy of IncidentDetailState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$IncidentDetailStateCopyWith<_IncidentDetailState> get copyWith => __$IncidentDetailStateCopyWithImpl<_IncidentDetailState>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _IncidentDetailState&&(identical(other.isLoading, isLoading) || other.isLoading == isLoading)&&(identical(other.incident, incident) || other.incident == incident)&&(identical(other.isOwner, isOwner) || other.isOwner == isOwner)&&(identical(other.reporterName, reporterName) || other.reporterName == reporterName)&&(identical(other.reporterAvatarUrl, reporterAvatarUrl) || other.reporterAvatarUrl == reporterAvatarUrl)&&(identical(other.errorMessage, errorMessage) || other.errorMessage == errorMessage)&&(identical(other.isResolving, isResolving) || other.isResolving == isResolving)&&(identical(other.isResolveSuccess, isResolveSuccess) || other.isResolveSuccess == isResolveSuccess)&&(identical(other.currentVote, currentVote) || other.currentVote == currentVote)&&(identical(other.isVoting, isVoting) || other.isVoting == isVoting)&&(identical(other.reporterReputationScore, reporterReputationScore) || other.reporterReputationScore == reporterReputationScore));
}


@override
int get hashCode => Object.hash(runtimeType,isLoading,incident,isOwner,reporterName,reporterAvatarUrl,errorMessage,isResolving,isResolveSuccess,currentVote,isVoting,reporterReputationScore);

@override
String toString() {
  return 'IncidentDetailState(isLoading: $isLoading, incident: $incident, isOwner: $isOwner, reporterName: $reporterName, reporterAvatarUrl: $reporterAvatarUrl, errorMessage: $errorMessage, isResolving: $isResolving, isResolveSuccess: $isResolveSuccess, currentVote: $currentVote, isVoting: $isVoting, reporterReputationScore: $reporterReputationScore)';
}


}

/// @nodoc
abstract mixin class _$IncidentDetailStateCopyWith<$Res> implements $IncidentDetailStateCopyWith<$Res> {
  factory _$IncidentDetailStateCopyWith(_IncidentDetailState value, $Res Function(_IncidentDetailState) _then) = __$IncidentDetailStateCopyWithImpl;
@override @useResult
$Res call({
 bool isLoading, Incident? incident, bool isOwner, String? reporterName, String? reporterAvatarUrl, String? errorMessage, bool isResolving, bool isResolveSuccess, UserVoteType currentVote, bool isVoting, int reporterReputationScore
});


@override $IncidentCopyWith<$Res>? get incident;

}
/// @nodoc
class __$IncidentDetailStateCopyWithImpl<$Res>
    implements _$IncidentDetailStateCopyWith<$Res> {
  __$IncidentDetailStateCopyWithImpl(this._self, this._then);

  final _IncidentDetailState _self;
  final $Res Function(_IncidentDetailState) _then;

/// Create a copy of IncidentDetailState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? isLoading = null,Object? incident = freezed,Object? isOwner = null,Object? reporterName = freezed,Object? reporterAvatarUrl = freezed,Object? errorMessage = freezed,Object? isResolving = null,Object? isResolveSuccess = null,Object? currentVote = null,Object? isVoting = null,Object? reporterReputationScore = null,}) {
  return _then(_IncidentDetailState(
isLoading: null == isLoading ? _self.isLoading : isLoading // ignore: cast_nullable_to_non_nullable
as bool,incident: freezed == incident ? _self.incident : incident // ignore: cast_nullable_to_non_nullable
as Incident?,isOwner: null == isOwner ? _self.isOwner : isOwner // ignore: cast_nullable_to_non_nullable
as bool,reporterName: freezed == reporterName ? _self.reporterName : reporterName // ignore: cast_nullable_to_non_nullable
as String?,reporterAvatarUrl: freezed == reporterAvatarUrl ? _self.reporterAvatarUrl : reporterAvatarUrl // ignore: cast_nullable_to_non_nullable
as String?,errorMessage: freezed == errorMessage ? _self.errorMessage : errorMessage // ignore: cast_nullable_to_non_nullable
as String?,isResolving: null == isResolving ? _self.isResolving : isResolving // ignore: cast_nullable_to_non_nullable
as bool,isResolveSuccess: null == isResolveSuccess ? _self.isResolveSuccess : isResolveSuccess // ignore: cast_nullable_to_non_nullable
as bool,currentVote: null == currentVote ? _self.currentVote : currentVote // ignore: cast_nullable_to_non_nullable
as UserVoteType,isVoting: null == isVoting ? _self.isVoting : isVoting // ignore: cast_nullable_to_non_nullable
as bool,reporterReputationScore: null == reporterReputationScore ? _self.reporterReputationScore : reporterReputationScore // ignore: cast_nullable_to_non_nullable
as int,
  ));
}

/// Create a copy of IncidentDetailState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$IncidentCopyWith<$Res>? get incident {
    if (_self.incident == null) {
    return null;
  }

  return $IncidentCopyWith<$Res>(_self.incident!, (value) {
    return _then(_self.copyWith(incident: value));
  });
}
}

// dart format on
