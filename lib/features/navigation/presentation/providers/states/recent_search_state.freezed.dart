// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'recent_search_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$RecentSearchState {
  List<AddressResult> get history => throw _privateConstructorUsedError;
  bool get isLoading => throw _privateConstructorUsedError;
  String? get errorMessage => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $RecentSearchStateCopyWith<RecentSearchState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $RecentSearchStateCopyWith<$Res> {
  factory $RecentSearchStateCopyWith(
          RecentSearchState value, $Res Function(RecentSearchState) then) =
      _$RecentSearchStateCopyWithImpl<$Res, RecentSearchState>;
  @useResult
  $Res call(
      {List<AddressResult> history, bool isLoading, String? errorMessage});
}

/// @nodoc
class _$RecentSearchStateCopyWithImpl<$Res, $Val extends RecentSearchState>
    implements $RecentSearchStateCopyWith<$Res> {
  _$RecentSearchStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? history = null,
    Object? isLoading = null,
    Object? errorMessage = freezed,
  }) {
    return _then(_value.copyWith(
      history: null == history
          ? _value.history
          : history // ignore: cast_nullable_to_non_nullable
              as List<AddressResult>,
      isLoading: null == isLoading
          ? _value.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool,
      errorMessage: freezed == errorMessage
          ? _value.errorMessage
          : errorMessage // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$RecentSearchStateImplCopyWith<$Res>
    implements $RecentSearchStateCopyWith<$Res> {
  factory _$$RecentSearchStateImplCopyWith(_$RecentSearchStateImpl value,
          $Res Function(_$RecentSearchStateImpl) then) =
      __$$RecentSearchStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {List<AddressResult> history, bool isLoading, String? errorMessage});
}

/// @nodoc
class __$$RecentSearchStateImplCopyWithImpl<$Res>
    extends _$RecentSearchStateCopyWithImpl<$Res, _$RecentSearchStateImpl>
    implements _$$RecentSearchStateImplCopyWith<$Res> {
  __$$RecentSearchStateImplCopyWithImpl(_$RecentSearchStateImpl _value,
      $Res Function(_$RecentSearchStateImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? history = null,
    Object? isLoading = null,
    Object? errorMessage = freezed,
  }) {
    return _then(_$RecentSearchStateImpl(
      history: null == history
          ? _value._history
          : history // ignore: cast_nullable_to_non_nullable
              as List<AddressResult>,
      isLoading: null == isLoading
          ? _value.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool,
      errorMessage: freezed == errorMessage
          ? _value.errorMessage
          : errorMessage // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc

class _$RecentSearchStateImpl implements _RecentSearchState {
  const _$RecentSearchStateImpl(
      {final List<AddressResult> history = const [],
      this.isLoading = false,
      this.errorMessage})
      : _history = history;

  final List<AddressResult> _history;
  @override
  @JsonKey()
  List<AddressResult> get history {
    if (_history is EqualUnmodifiableListView) return _history;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_history);
  }

  @override
  @JsonKey()
  final bool isLoading;
  @override
  final String? errorMessage;

  @override
  String toString() {
    return 'RecentSearchState(history: $history, isLoading: $isLoading, errorMessage: $errorMessage)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$RecentSearchStateImpl &&
            const DeepCollectionEquality().equals(other._history, _history) &&
            (identical(other.isLoading, isLoading) ||
                other.isLoading == isLoading) &&
            (identical(other.errorMessage, errorMessage) ||
                other.errorMessage == errorMessage));
  }

  @override
  int get hashCode => Object.hash(runtimeType,
      const DeepCollectionEquality().hash(_history), isLoading, errorMessage);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$RecentSearchStateImplCopyWith<_$RecentSearchStateImpl> get copyWith =>
      __$$RecentSearchStateImplCopyWithImpl<_$RecentSearchStateImpl>(
          this, _$identity);
}

abstract class _RecentSearchState implements RecentSearchState {
  const factory _RecentSearchState(
      {final List<AddressResult> history,
      final bool isLoading,
      final String? errorMessage}) = _$RecentSearchStateImpl;

  @override
  List<AddressResult> get history;
  @override
  bool get isLoading;
  @override
  String? get errorMessage;
  @override
  @JsonKey(ignore: true)
  _$$RecentSearchStateImplCopyWith<_$RecentSearchStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
