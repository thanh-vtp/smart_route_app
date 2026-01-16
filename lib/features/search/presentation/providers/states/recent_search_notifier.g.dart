// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'recent_search_notifier.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$recentSearchNotifierHash() =>
    r'45ea182576ef2ee774e1ee08439e3f735fe5ef43';

/// Notifier quản lý lịch sử tìm kiếm gần đây
/// Sử dụng GeocodingRepository để lấy data từ geocoding_cache và reverse_geocoding_cache
///
/// Copied from [RecentSearchNotifier].
@ProviderFor(RecentSearchNotifier)
final recentSearchNotifierProvider = AutoDisposeAsyncNotifierProvider<
    RecentSearchNotifier, RecentSearchState>.internal(
  RecentSearchNotifier.new,
  name: r'recentSearchNotifierProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$recentSearchNotifierHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$RecentSearchNotifier = AutoDisposeAsyncNotifier<RecentSearchState>;
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member
