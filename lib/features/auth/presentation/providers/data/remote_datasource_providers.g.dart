// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'remote_datasource_providers.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$googleAuthDatasourceHash() =>
    r'9d3c1d013643ea1daf7604f63214be60d460e9f4';

/// dùng Ref hoặc tự định nghĩa Ref type
/// Quy tắc: name function + Ref
/// Provider cho Google Auth Data Source
///
/// Copied from [googleAuthDatasource].
@ProviderFor(googleAuthDatasource)
final googleAuthDatasourceProvider = Provider<GoogleAuthDatasource>.internal(
  googleAuthDatasource,
  name: r'googleAuthDatasourceProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$googleAuthDatasourceHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef GoogleAuthDatasourceRef = ProviderRef<GoogleAuthDatasource>;
String _$supabaseAuthDatasourceHash() =>
    r'773b3e2ce6c6850a0a1acf614678aa70789c1e51';

/// Provider cho Supabase Auth Data Source
///
/// Copied from [supabaseAuthDatasource].
@ProviderFor(supabaseAuthDatasource)
final supabaseAuthDatasourceProvider =
    Provider<SupabaseAuthDatasource>.internal(
  supabaseAuthDatasource,
  name: r'supabaseAuthDatasourceProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$supabaseAuthDatasourceHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef SupabaseAuthDatasourceRef = ProviderRef<SupabaseAuthDatasource>;
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member
