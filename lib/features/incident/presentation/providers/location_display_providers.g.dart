// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'location_display_providers.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$locationDisplayProviderHash() =>
    r'56851efae21a6227af04c5e405ada85501704ee3';

/// Provider để quản lý trạng thái LocationDisplay (GPS)
///
/// Copied from [LocationDisplayProvider].
@ProviderFor(LocationDisplayProvider)
final locationDisplayProviderProvider =
    NotifierProvider<LocationDisplayProvider, bool>.internal(
  LocationDisplayProvider.new,
  name: r'locationDisplayProviderProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$locationDisplayProviderHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$LocationDisplayProvider = Notifier<bool>;
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member
