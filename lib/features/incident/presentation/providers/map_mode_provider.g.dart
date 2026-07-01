// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'map_mode_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning
/// Provider để quản lý chế độ hiển thị bản đồ (2D/3D)

@ProviderFor(MapModeProvider)
final mapModeProviderProvider = MapModeProviderProvider._();

/// Provider để quản lý chế độ hiển thị bản đồ (2D/3D)
final class MapModeProviderProvider
    extends $NotifierProvider<MapModeProvider, MapMode> {
  /// Provider để quản lý chế độ hiển thị bản đồ (2D/3D)
  MapModeProviderProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'mapModeProviderProvider',
        isAutoDispose: false,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$mapModeProviderHash();

  @$internal
  @override
  MapModeProvider create() => MapModeProvider();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(MapMode value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<MapMode>(value),
    );
  }
}

String _$mapModeProviderHash() => r'102cc9387c9ef0b3099940fd6aabcc645fb12fb1';

/// Provider để quản lý chế độ hiển thị bản đồ (2D/3D)

abstract class _$MapModeProvider extends $Notifier<MapMode> {
  MapMode build();
  @$mustCallSuper
  @override
  WhenComplete runBuild() {
    final ref = this.ref as $Ref<MapMode, MapMode>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<MapMode, MapMode>,
              MapMode,
              Object?,
              Object?
            >;
    return element.handleCreate(ref, build);
  }
}
