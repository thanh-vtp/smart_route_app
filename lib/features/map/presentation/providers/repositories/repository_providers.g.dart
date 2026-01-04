// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'repository_providers.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$geocodingRepositoryHash() =>
    r'0272fbbb8d396b40b00717fe444ea4f93bfdc809';

/// Provider cho Geocoding Repository
/// Sử dụng ArcGIS Geocoding Data Source
/// Được dùng cho các use case liên quan đến geocoding, routing, nearby places
///
/// Copied from [geocodingRepository].
@ProviderFor(geocodingRepository)
final geocodingRepositoryProvider = Provider<GeocodingRepository>.internal(
  geocodingRepository,
  name: r'geocodingRepositoryProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$geocodingRepositoryHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef GeocodingRepositoryRef = ProviderRef<GeocodingRepository>;
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member
