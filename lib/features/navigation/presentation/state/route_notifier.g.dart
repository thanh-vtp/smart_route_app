// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'route_notifier.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(RouteNotifier)
final routeProvider = RouteNotifierProvider._();

final class RouteNotifierProvider
    extends $NotifierProvider<RouteNotifier, RouteState> {
  RouteNotifierProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'routeProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$routeNotifierHash();

  @$internal
  @override
  RouteNotifier create() => RouteNotifier();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(RouteState value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<RouteState>(value),
    );
  }
}

String _$routeNotifierHash() => r'c7bde29035c526458c25797ff991a4bd89e6eff2';

abstract class _$RouteNotifier extends $Notifier<RouteState> {
  RouteState build();
  @$mustCallSuper
  @override
  WhenComplete runBuild() {
    final ref = this.ref as $Ref<RouteState, RouteState>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<RouteState, RouteState>,
              RouteState,
              Object?,
              Object?
            >;
    return element.handleCreate(ref, build);
  }
}
