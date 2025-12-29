// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_location_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$userLocationHash() => r'86710741168413ac8c476676ae8ccc91d38d1399';

/// Provider lưu trữ vị trí GPS hiện tại của user
/// Được cập nhật từ LocationDisplay khi GPS bật
///
/// Copied from [UserLocation].
@ProviderFor(UserLocation)
final userLocationProvider =
    NotifierProvider<UserLocation, ArcGISPoint?>.internal(
  UserLocation.new,
  name: r'userLocationProvider',
  debugGetCreateSourceHash:
      const bool.fromEnvironment('dart.vm.product') ? null : _$userLocationHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$UserLocation = Notifier<ArcGISPoint?>;
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member
