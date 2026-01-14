// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'repository_providers.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$routingRepositoryHash() => r'ab99b1cef8f6cace39ca0201801a3086c2d397ff';

/// Provider cho Geocoding Repository
/// Sử dụng ArcGIS Geocoding Data Source
/// Được dùng cho các use case liên quan đến geocoding, routing, nearby places
///
/// Copied from [routingRepository].
@ProviderFor(routingRepository)
final routingRepositoryProvider = Provider<RoutingRepository>.internal(
  routingRepository,
  name: r'routingRepositoryProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$routingRepositoryHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef RoutingRepositoryRef = ProviderRef<RoutingRepository>;
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member
