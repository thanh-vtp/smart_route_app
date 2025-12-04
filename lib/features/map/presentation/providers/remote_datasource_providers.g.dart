// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'remote_datasource_providers.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$arcgisRemoteDataSourceHash() =>
    r'a9d21e27b30376883aa7fcf62e6670db7913b9fd';

/// Provider cho ArcGIS Data Source (chỉ GET)
///
/// Copied from [arcgisRemoteDataSource].
@ProviderFor(arcgisRemoteDataSource)
final arcgisRemoteDataSourceProvider =
    Provider<ArcGISRemoteDataSource>.internal(
  arcgisRemoteDataSource,
  name: r'arcgisRemoteDataSourceProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$arcgisRemoteDataSourceHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef ArcgisRemoteDataSourceRef = ProviderRef<ArcGISRemoteDataSource>;
String _$supabaseRemoteDataSourceHash() =>
    r'00b76418bfdd2d6023d25f17ac2961a60599d378';

/// Provider cho Supabase Data Source (ADD & DELETE)
///
/// Copied from [supabaseRemoteDataSource].
@ProviderFor(supabaseRemoteDataSource)
final supabaseRemoteDataSourceProvider =
    Provider<SupabaseRemoteDataSource>.internal(
  supabaseRemoteDataSource,
  name: r'supabaseRemoteDataSourceProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$supabaseRemoteDataSourceHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef SupabaseRemoteDataSourceRef = ProviderRef<SupabaseRemoteDataSource>;
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member
