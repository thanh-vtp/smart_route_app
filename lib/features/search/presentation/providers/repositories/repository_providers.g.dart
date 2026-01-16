// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'repository_providers.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$geocodingRepositoryHash() =>
    r'f003fb57e7dbdfdb2dcb728ed1f401691744737c';

/// Provider cho Geocoding Repository
/// Sử dụng ArcGIS Geocoding Data Source
/// Được dùng cho các use case liên quan đến geocoding
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
String _$imageryRepositoryHash() => r'e4e23dc690a8dfca3c65898c0afadb13bcf1a6bf';

/// See also [imageryRepository].
@ProviderFor(imageryRepository)
final imageryRepositoryProvider = Provider<ImageryRepository>.internal(
  imageryRepository,
  name: r'imageryRepositoryProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$imageryRepositoryHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef ImageryRepositoryRef = ProviderRef<ImageryRepository>;
String _$nearbyPlaceRepositoryHash() =>
    r'4256212322e9402affe315ccbab1f29dcb4fc5e7';

/// See also [nearbyPlaceRepository].
@ProviderFor(nearbyPlaceRepository)
final nearbyPlaceRepositoryProvider = Provider<NearbyPlaceRepository>.internal(
  nearbyPlaceRepository,
  name: r'nearbyPlaceRepositoryProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$nearbyPlaceRepositoryHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef NearbyPlaceRepositoryRef = ProviderRef<NearbyPlaceRepository>;
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member
