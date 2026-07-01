// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'repository_providers.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(routingRepository)
final routingRepositoryProvider = RoutingRepositoryProvider._();

final class RoutingRepositoryProvider
    extends
        $FunctionalProvider<
          RoutingRepository,
          RoutingRepository,
          RoutingRepository
        >
    with $Provider<RoutingRepository> {
  RoutingRepositoryProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'routingRepositoryProvider',
        isAutoDispose: false,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$routingRepositoryHash();

  @$internal
  @override
  $ProviderElement<RoutingRepository> $createElement(
    $ProviderPointer pointer,
  ) => $ProviderElement(pointer);

  @override
  RoutingRepository create(Ref ref) {
    return routingRepository(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(RoutingRepository value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<RoutingRepository>(value),
    );
  }
}

String _$routingRepositoryHash() => r'376e59a93d495e06c29fdb7e440c631e6b149f4f';
