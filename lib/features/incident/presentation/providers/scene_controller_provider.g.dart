// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'scene_controller_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(sceneController)
final sceneControllerProvider = SceneControllerProvider._();

final class SceneControllerProvider
    extends
        $FunctionalProvider<
          ArcGISSceneViewController,
          ArcGISSceneViewController,
          ArcGISSceneViewController
        >
    with $Provider<ArcGISSceneViewController> {
  SceneControllerProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'sceneControllerProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$sceneControllerHash();

  @$internal
  @override
  $ProviderElement<ArcGISSceneViewController> $createElement(
    $ProviderPointer pointer,
  ) => $ProviderElement(pointer);

  @override
  ArcGISSceneViewController create(Ref ref) {
    return sceneController(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(ArcGISSceneViewController value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<ArcGISSceneViewController>(value),
    );
  }
}

String _$sceneControllerHash() => r'8dd422eba996631294623909faa9d2d96e64f5b5';
