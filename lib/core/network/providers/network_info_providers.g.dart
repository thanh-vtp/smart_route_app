// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'network_info_providers.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(internetConnectionChecker)
final internetConnectionCheckerProvider = InternetConnectionCheckerProvider._();

final class InternetConnectionCheckerProvider
    extends
        $FunctionalProvider<
          InternetConnectionChecker,
          InternetConnectionChecker,
          InternetConnectionChecker
        >
    with $Provider<InternetConnectionChecker> {
  InternetConnectionCheckerProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'internetConnectionCheckerProvider',
        isAutoDispose: false,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$internetConnectionCheckerHash();

  @$internal
  @override
  $ProviderElement<InternetConnectionChecker> $createElement(
    $ProviderPointer pointer,
  ) => $ProviderElement(pointer);

  @override
  InternetConnectionChecker create(Ref ref) {
    return internetConnectionChecker(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(InternetConnectionChecker value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<InternetConnectionChecker>(value),
    );
  }
}

String _$internetConnectionCheckerHash() =>
    r'8afe34858d4f7303ae4886c28401921b1f651949';

@ProviderFor(networkInfo)
final networkInfoProvider = NetworkInfoProvider._();

final class NetworkInfoProvider
    extends $FunctionalProvider<NetworkInfo, NetworkInfo, NetworkInfo>
    with $Provider<NetworkInfo> {
  NetworkInfoProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'networkInfoProvider',
        isAutoDispose: false,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$networkInfoHash();

  @$internal
  @override
  $ProviderElement<NetworkInfo> $createElement($ProviderPointer pointer) =>
      $ProviderElement(pointer);

  @override
  NetworkInfo create(Ref ref) {
    return networkInfo(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(NetworkInfo value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<NetworkInfo>(value),
    );
  }
}

String _$networkInfoHash() => r'9cde9ad9ecb16e5f22fe75967834c716219b14a7';

@ProviderFor(internetConnectionStream)
final internetConnectionStreamProvider = InternetConnectionStreamProvider._();

final class InternetConnectionStreamProvider
    extends $FunctionalProvider<AsyncValue<bool>, bool, Stream<bool>>
    with $FutureModifier<bool>, $StreamProvider<bool> {
  InternetConnectionStreamProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'internetConnectionStreamProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$internetConnectionStreamHash();

  @$internal
  @override
  $StreamProviderElement<bool> $createElement($ProviderPointer pointer) =>
      $StreamProviderElement(pointer);

  @override
  Stream<bool> create(Ref ref) {
    return internetConnectionStream(ref);
  }
}

String _$internetConnectionStreamHash() =>
    r'faa484a228969e1abf2c1c2fd680e115f8c231a9';
