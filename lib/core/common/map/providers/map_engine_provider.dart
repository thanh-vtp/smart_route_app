import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:smart_route_app/core/common/map/engine/map_engine.dart';
import 'package:smart_route_app/core/common/map/engine/map_engine_impl.dart';
import 'package:smart_route_app/core/common/map/providers/map_controller_bundle_provider.dart';

final mapEngineProvider = Provider<MapEngine>((ref) {
  return MapEngineImpl(ref.watch(mapControllerBundleProvider));
});
