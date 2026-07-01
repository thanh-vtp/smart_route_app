// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'incident_feature_layer_providers.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(incidentFeatureLayer)
final incidentFeatureLayerProvider = IncidentFeatureLayerProvider._();

final class IncidentFeatureLayerProvider
    extends $FunctionalProvider<FeatureLayer, FeatureLayer, FeatureLayer>
    with $Provider<FeatureLayer> {
  IncidentFeatureLayerProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'incidentFeatureLayerProvider',
        isAutoDispose: false,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$incidentFeatureLayerHash();

  @$internal
  @override
  $ProviderElement<FeatureLayer> $createElement($ProviderPointer pointer) =>
      $ProviderElement(pointer);

  @override
  FeatureLayer create(Ref ref) {
    return incidentFeatureLayer(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(FeatureLayer value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<FeatureLayer>(value),
    );
  }
}

String _$incidentFeatureLayerHash() =>
    r'b22ef4479f1fb499909fb925bd1495c10b196405';
