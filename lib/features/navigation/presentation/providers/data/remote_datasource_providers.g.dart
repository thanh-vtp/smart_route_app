// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'remote_datasource_providers.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(routingRemoteDataSource)
final routingRemoteDataSourceProvider = RoutingRemoteDataSourceProvider._();

final class RoutingRemoteDataSourceProvider
    extends
        $FunctionalProvider<
          RoutingRemoteDataSource,
          RoutingRemoteDataSource,
          RoutingRemoteDataSource
        >
    with $Provider<RoutingRemoteDataSource> {
  RoutingRemoteDataSourceProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'routingRemoteDataSourceProvider',
        isAutoDispose: false,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$routingRemoteDataSourceHash();

  @$internal
  @override
  $ProviderElement<RoutingRemoteDataSource> $createElement(
    $ProviderPointer pointer,
  ) => $ProviderElement(pointer);

  @override
  RoutingRemoteDataSource create(Ref ref) {
    return routingRemoteDataSource(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(RoutingRemoteDataSource value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<RoutingRemoteDataSource>(value),
    );
  }
}

String _$routingRemoteDataSourceHash() =>
    r'5fae67d01baa848e36df3bdac2538bc9dac65db7';
