// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'remote_datasource_providers.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(clusterRemoteDataSource)
final clusterRemoteDataSourceProvider = ClusterRemoteDataSourceProvider._();

final class ClusterRemoteDataSourceProvider
    extends
        $FunctionalProvider<
          ClusterRemoteDataSource,
          ClusterRemoteDataSource,
          ClusterRemoteDataSource
        >
    with $Provider<ClusterRemoteDataSource> {
  ClusterRemoteDataSourceProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'clusterRemoteDataSourceProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$clusterRemoteDataSourceHash();

  @$internal
  @override
  $ProviderElement<ClusterRemoteDataSource> $createElement(
    $ProviderPointer pointer,
  ) => $ProviderElement(pointer);

  @override
  ClusterRemoteDataSource create(Ref ref) {
    return clusterRemoteDataSource(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(ClusterRemoteDataSource value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<ClusterRemoteDataSource>(value),
    );
  }
}

String _$clusterRemoteDataSourceHash() =>
    r'c6d7f6499621329ff6945ef7b3ed1ddcdef2d957';
