// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'current_location_providers.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$currentLocationProviderHash() =>
    r'7138bba19fba5463fa15f1aac6657d4c1668ddd0';

/// Provider này CHỈ dùng để lưu trữ Object vị trí hiện tại (Tọa độ)
/// Nó được cập nhật bởi LocationDisplayManager khi GPS thay đổi
///
/// Copied from [CurrentLocationProvider].
@ProviderFor(CurrentLocationProvider)
final currentLocationProviderProvider =
    NotifierProvider<CurrentLocationProvider, ArcGISLocation?>.internal(
  CurrentLocationProvider.new,
  name: r'currentLocationProviderProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$currentLocationProviderHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$CurrentLocationProvider = Notifier<ArcGISLocation?>;
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member
