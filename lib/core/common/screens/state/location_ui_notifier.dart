import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:smart_route_app/core/common/map/location/location_state.dart';
import 'package:smart_route_app/core/common/screens/provider/map_facade_provider.dart';

import 'dart:async';

import 'package:arcgis_maps/arcgis_maps.dart';

final locationUiProvider = NotifierProvider<LocationUiNotifier, LocationState>(
  LocationUiNotifier.new,
);

class LocationUiNotifier extends Notifier<LocationState> {
  StreamSubscription<LocationDisplayAutoPanMode>? _autoPanModeSubscription;

  @override
  LocationState build() {
    ref.onDispose(() {
      _autoPanModeSubscription?.cancel();
    });

    return LocationState.initial();
  }

  Future<void> startLocation() async {
    final facade = ref.read(mapFacadeProvider);

    final result = await facade.startLocation(
      onLocationChanged: (location) {
        state = state.copyWith(location: location);
      },
    );

    _listenAutoPanMode();

    state = result;
  }

  Future<void> stopLocation() async {
    final facade = ref.read(mapFacadeProvider);

    final result = await facade.stopLocation();

    await _autoPanModeSubscription?.cancel();

    state = result;
  }

  void recenter() {
    final facade = ref.read(mapFacadeProvider);

    facade.recenterLocation();
  }

  void _listenAutoPanMode() {
    _autoPanModeSubscription?.cancel();

    final facade = ref.read(mapFacadeProvider);

    final display = facade.locationDisplay;

    _autoPanModeSubscription = display.onAutoPanModeChanged.listen((mode) {
      final isFollowing = mode != LocationDisplayAutoPanMode.off;

      state = state.copyWith(isFollowing: isFollowing);
    });
  }
}
