// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'local_datasource_providers.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$geocodingLocalDataSourceHash() =>
    r'f4e376826d83021681f17dffcc683fb49552b0a2';

/// dùng Ref hoặc tự định nghĩa Ref type
/// Quy tắc: name function + Ref
/// Provider cho ArcGIS Local Data Source
///
/// Copied from [geocodingLocalDataSource].
@ProviderFor(geocodingLocalDataSource)
final geocodingLocalDataSourceProvider =
    Provider<GeocodingLocalDataSource>.internal(
  geocodingLocalDataSource,
  name: r'geocodingLocalDataSourceProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$geocodingLocalDataSourceHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef GeocodingLocalDataSourceRef = ProviderRef<GeocodingLocalDataSource>;
String _$imageryLocalDataSourceHash() =>
    r'9765e333a38e34326eae6321494c6fe364bb439b';

/// Provider cho Imagery Local Data Source
///
/// Copied from [imageryLocalDataSource].
@ProviderFor(imageryLocalDataSource)
final imageryLocalDataSourceProvider =
    Provider<ImageryLocalDataSource>.internal(
  imageryLocalDataSource,
  name: r'imageryLocalDataSourceProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$imageryLocalDataSourceHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef ImageryLocalDataSourceRef = ProviderRef<ImageryLocalDataSource>;
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member
