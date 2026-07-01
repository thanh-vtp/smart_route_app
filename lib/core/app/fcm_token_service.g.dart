// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'fcm_token_service.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning
/// Provider cho FCM Token Service

@ProviderFor(fcmTokenService)
final fcmTokenServiceProvider = FcmTokenServiceProvider._();

/// Provider cho FCM Token Service

final class FcmTokenServiceProvider
    extends
        $FunctionalProvider<FCMTokenService, FCMTokenService, FCMTokenService>
    with $Provider<FCMTokenService> {
  /// Provider cho FCM Token Service
  FcmTokenServiceProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'fcmTokenServiceProvider',
        isAutoDispose: false,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$fcmTokenServiceHash();

  @$internal
  @override
  $ProviderElement<FCMTokenService> $createElement($ProviderPointer pointer) =>
      $ProviderElement(pointer);

  @override
  FCMTokenService create(Ref ref) {
    return fcmTokenService(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(FCMTokenService value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<FCMTokenService>(value),
    );
  }
}

String _$fcmTokenServiceHash() => r'c95e95ea333a65e978432dca05cb634a199f24ec';
