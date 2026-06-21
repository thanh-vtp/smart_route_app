// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'search_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$SearchState {
  String get query => throw _privateConstructorUsedError;
  bool get isLoading => throw _privateConstructorUsedError;
  List<AddressResult> get results =>
      throw _privateConstructorUsedError; // Kết quả đang tìm
  List<AddressResult> get historyResults =>
      throw _privateConstructorUsedError; // Lịch sử tìm kiếm
  String? get errorMessage => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $SearchStateCopyWith<SearchState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SearchStateCopyWith<$Res> {
  factory $SearchStateCopyWith(
          SearchState value, $Res Function(SearchState) then) =
      _$SearchStateCopyWithImpl<$Res, SearchState>;
  @useResult
  $Res call(
      {String query,
      bool isLoading,
      List<AddressResult> results,
      List<AddressResult> historyResults,
      String? errorMessage});
}

/// @nodoc
class _$SearchStateCopyWithImpl<$Res, $Val extends SearchState>
    implements $SearchStateCopyWith<$Res> {
  _$SearchStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? query = null,
    Object? isLoading = null,
    Object? results = null,
    Object? historyResults = null,
    Object? errorMessage = freezed,
  }) {
    return _then(_value.copyWith(
      query: null == query
          ? _value.query
          : query // ignore: cast_nullable_to_non_nullable
              as String,
      isLoading: null == isLoading
          ? _value.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool,
      results: null == results
          ? _value.results
          : results // ignore: cast_nullable_to_non_nullable
              as List<AddressResult>,
      historyResults: null == historyResults
          ? _value.historyResults
          : historyResults // ignore: cast_nullable_to_non_nullable
              as List<AddressResult>,
      errorMessage: freezed == errorMessage
          ? _value.errorMessage
          : errorMessage // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$SearchStateImplCopyWith<$Res>
    implements $SearchStateCopyWith<$Res> {
  factory _$$SearchStateImplCopyWith(
          _$SearchStateImpl value, $Res Function(_$SearchStateImpl) then) =
      __$$SearchStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String query,
      bool isLoading,
      List<AddressResult> results,
      List<AddressResult> historyResults,
      String? errorMessage});
}

/// @nodoc
class __$$SearchStateImplCopyWithImpl<$Res>
    extends _$SearchStateCopyWithImpl<$Res, _$SearchStateImpl>
    implements _$$SearchStateImplCopyWith<$Res> {
  __$$SearchStateImplCopyWithImpl(
      _$SearchStateImpl _value, $Res Function(_$SearchStateImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? query = null,
    Object? isLoading = null,
    Object? results = null,
    Object? historyResults = null,
    Object? errorMessage = freezed,
  }) {
    return _then(_$SearchStateImpl(
      query: null == query
          ? _value.query
          : query // ignore: cast_nullable_to_non_nullable
              as String,
      isLoading: null == isLoading
          ? _value.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool,
      results: null == results
          ? _value._results
          : results // ignore: cast_nullable_to_non_nullable
              as List<AddressResult>,
      historyResults: null == historyResults
          ? _value._historyResults
          : historyResults // ignore: cast_nullable_to_non_nullable
              as List<AddressResult>,
      errorMessage: freezed == errorMessage
          ? _value.errorMessage
          : errorMessage // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc

class _$SearchStateImpl implements _SearchState {
  const _$SearchStateImpl(
      {this.query = '',
      this.isLoading = false,
      final List<AddressResult> results = const [],
      final List<AddressResult> historyResults = const [],
      this.errorMessage})
      : _results = results,
        _historyResults = historyResults;

  @override
  @JsonKey()
  final String query;
  @override
  @JsonKey()
  final bool isLoading;
  final List<AddressResult> _results;
  @override
  @JsonKey()
  List<AddressResult> get results {
    if (_results is EqualUnmodifiableListView) return _results;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_results);
  }

// Kết quả đang tìm
  final List<AddressResult> _historyResults;
// Kết quả đang tìm
  @override
  @JsonKey()
  List<AddressResult> get historyResults {
    if (_historyResults is EqualUnmodifiableListView) return _historyResults;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_historyResults);
  }

// Lịch sử tìm kiếm
  @override
  final String? errorMessage;

  @override
  String toString() {
    return 'SearchState(query: $query, isLoading: $isLoading, results: $results, historyResults: $historyResults, errorMessage: $errorMessage)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SearchStateImpl &&
            (identical(other.query, query) || other.query == query) &&
            (identical(other.isLoading, isLoading) ||
                other.isLoading == isLoading) &&
            const DeepCollectionEquality().equals(other._results, _results) &&
            const DeepCollectionEquality()
                .equals(other._historyResults, _historyResults) &&
            (identical(other.errorMessage, errorMessage) ||
                other.errorMessage == errorMessage));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      query,
      isLoading,
      const DeepCollectionEquality().hash(_results),
      const DeepCollectionEquality().hash(_historyResults),
      errorMessage);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$SearchStateImplCopyWith<_$SearchStateImpl> get copyWith =>
      __$$SearchStateImplCopyWithImpl<_$SearchStateImpl>(this, _$identity);
}

abstract class _SearchState implements SearchState {
  const factory _SearchState(
      {final String query,
      final bool isLoading,
      final List<AddressResult> results,
      final List<AddressResult> historyResults,
      final String? errorMessage}) = _$SearchStateImpl;

  @override
  String get query;
  @override
  bool get isLoading;
  @override
  List<AddressResult> get results;
  @override // Kết quả đang tìm
  List<AddressResult> get historyResults;
  @override // Lịch sử tìm kiếm
  String? get errorMessage;
  @override
  @JsonKey(ignore: true)
  _$$SearchStateImplCopyWith<_$SearchStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
