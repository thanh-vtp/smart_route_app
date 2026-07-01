// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'map_controller_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(mapController)
final mapControllerProvider = MapControllerProvider._();

final class MapControllerProvider
    extends
        $FunctionalProvider<
          ArcGISMapViewController,
          ArcGISMapViewController,
          ArcGISMapViewController
        >
    with $Provider<ArcGISMapViewController> {
  MapControllerProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'mapControllerProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$mapControllerHash();

  @$internal
  @override
  $ProviderElement<ArcGISMapViewController> $createElement(
    $ProviderPointer pointer,
  ) => $ProviderElement(pointer);

  @override
  ArcGISMapViewController create(Ref ref) {
    return mapController(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(ArcGISMapViewController value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<ArcGISMapViewController>(value),
    );
  }
}

String _$mapControllerHash() => r'3ca0981f1b393af68f88b120c1e58947b455ee24';
