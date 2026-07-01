// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'cluster_notifier.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(ClusterNotifier)
final clusterProvider = ClusterNotifierProvider._();

final class ClusterNotifierProvider
    extends $NotifierProvider<ClusterNotifier, ClusterState> {
  ClusterNotifierProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'clusterProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$clusterNotifierHash();

  @$internal
  @override
  ClusterNotifier create() => ClusterNotifier();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(ClusterState value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<ClusterState>(value),
    );
  }
}

String _$clusterNotifierHash() => r'9605df66198a16381c6e98a50b0d2ff6f791fe2a';

abstract class _$ClusterNotifier extends $Notifier<ClusterState> {
  ClusterState build();
  @$mustCallSuper
  @override
  WhenComplete runBuild() {
    final ref = this.ref as $Ref<ClusterState, ClusterState>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<ClusterState, ClusterState>,
              ClusterState,
              Object?,
              Object?
            >;
    return element.handleCreate(ref, build);
  }
}
