// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'repository_providers.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(clusterRepository)
final clusterRepositoryProvider = ClusterRepositoryProvider._();

final class ClusterRepositoryProvider
    extends
        $FunctionalProvider<
          ClusterRepository,
          ClusterRepository,
          ClusterRepository
        >
    with $Provider<ClusterRepository> {
  ClusterRepositoryProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'clusterRepositoryProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$clusterRepositoryHash();

  @$internal
  @override
  $ProviderElement<ClusterRepository> $createElement(
    $ProviderPointer pointer,
  ) => $ProviderElement(pointer);

  @override
  ClusterRepository create(Ref ref) {
    return clusterRepository(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(ClusterRepository value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<ClusterRepository>(value),
    );
  }
}

String _$clusterRepositoryHash() => r'1a1a43f2f07ebc322865632cf5aca569649dd0c1';
