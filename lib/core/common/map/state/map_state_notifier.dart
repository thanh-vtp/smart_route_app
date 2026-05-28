import 'package:arcgis_maps/arcgis_maps.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:smart_route_app/core/common/map/engine/map_engine_impl.dart';
import 'package:smart_route_app/core/common/map/providers/map_controller_bundle_provider.dart';

import 'map_state.dart';
import 'map_view_state.dart';

final mapStateNotifierProvider = NotifierProvider<MapStateNotifier, MapState>(
  MapStateNotifier.new,
);

/// orchestration layer
class MapStateNotifier extends Notifier<MapState> {
  late final MapEngineImpl _engine;

  @override
  MapState build() {
    final controllers = ref.watch(mapControllerBundleProvider);

    _engine = MapEngineImpl(controllers);

    ref.onDispose(_engine.dispose);

    return MapState.initial();
  }

  Future<void> initializeMap() async {
    try {
      state = state.copyWith(view: MapViewState.loading());

      await _engine.initialize2D(basemapStyle: BasemapStyle.arcGISNavigation);

      await _engine.setInitialViewpoint(
        Viewpoint.withLatLongScale(
          latitude: 10.8231,
          longitude: 106.6297,
          scale: 50000,
        ),
      );

      state = state.copyWith(view: MapViewState.ready());
    } catch (e) {
      state = state.copyWith(view: MapViewState.error(e.toString()));
    }
  }

  Future<void> switchTo3D() async {
    await _engine.switchTo3D();

    state = state.copyWith(runtime: state.runtime.copyWith(is3DMode: true));
  }

  Future<void> switchTo2D() async {
    await _engine.switchTo2D();

    state = state.copyWith(runtime: state.runtime.copyWith(is3DMode: false));
  }
}
