// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_location_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning
/// Provider lưu trữ vị trí GPS hiện tại của user
/// Được cập nhật từ LocationDisplay khi GPS bật

@ProviderFor(UserLocation)
final userLocationProvider = UserLocationProvider._();

/// Provider lưu trữ vị trí GPS hiện tại của user
/// Được cập nhật từ LocationDisplay khi GPS bật
final class UserLocationProvider
    extends $NotifierProvider<UserLocation, ArcGISPoint?> {
  /// Provider lưu trữ vị trí GPS hiện tại của user
  /// Được cập nhật từ LocationDisplay khi GPS bật
  UserLocationProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'userLocationProvider',
        isAutoDispose: false,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$userLocationHash();

  @$internal
  @override
  UserLocation create() => UserLocation();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(ArcGISPoint? value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<ArcGISPoint?>(value),
    );
  }
}

String _$userLocationHash() => r'7d4435243cf0aa6b4ff6f619161c066222f9dffe';

/// Provider lưu trữ vị trí GPS hiện tại của user
/// Được cập nhật từ LocationDisplay khi GPS bật

abstract class _$UserLocation extends $Notifier<ArcGISPoint?> {
  ArcGISPoint? build();
  @$mustCallSuper
  @override
  WhenComplete runBuild() {
    final ref = this.ref as $Ref<ArcGISPoint?, ArcGISPoint?>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<ArcGISPoint?, ArcGISPoint?>,
              ArcGISPoint?,
              Object?,
              Object?
            >;
    return element.handleCreate(ref, build);
  }
}
