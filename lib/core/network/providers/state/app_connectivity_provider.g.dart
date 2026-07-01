// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'app_connectivity_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(AppConnectivity)
final appConnectivityProvider = AppConnectivityProvider._();

final class AppConnectivityProvider
    extends $NotifierProvider<AppConnectivity, ConnectivityStatus> {
  AppConnectivityProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'appConnectivityProvider',
        isAutoDispose: false,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$appConnectivityHash();

  @$internal
  @override
  AppConnectivity create() => AppConnectivity();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(ConnectivityStatus value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<ConnectivityStatus>(value),
    );
  }
}

String _$appConnectivityHash() => r'017b9594fa140d1531b9d37ffaafd414971756e5';

abstract class _$AppConnectivity extends $Notifier<ConnectivityStatus> {
  ConnectivityStatus build();
  @$mustCallSuper
  @override
  WhenComplete runBuild() {
    final ref = this.ref as $Ref<ConnectivityStatus, ConnectivityStatus>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<ConnectivityStatus, ConnectivityStatus>,
              ConnectivityStatus,
              Object?,
              Object?
            >;
    return element.handleCreate(ref, build);
  }
}
