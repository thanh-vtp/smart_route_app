import 'dart:async';

import 'package:arcgis_maps/arcgis_maps.dart';
import 'package:smart_route_app/core/common/map/location/device_location_status.dart';

import 'location_constants.dart';
import 'location_error.dart';
import 'location_state.dart';

class DeviceLocationController {
  final SystemLocationDataSource dataSource = SystemLocationDataSource();

  StreamSubscription<ArcGISLocation>? _locationSubscription;

  Future<LocationState> start({
    required LocationDisplay display,
    required void Function(ArcGISLocation location) onLocationChanged,
  }) async {
    try {
      display.dataSource = dataSource;

      enableFollow(display);

      display.autoPanMode = LocationConstants.defaultAutoPanMode;

      _locationSubscription?.cancel();

      _locationSubscription = display.onLocationChanged.listen(
        onLocationChanged,
      );

      await dataSource.start();

      return LocationState(
        status: DeviceLocationStatus.running,
        isFollowing: true,
      );
    } on ArcGISException catch (e) {
      return LocationState(
        status: DeviceLocationStatus.error,
        isFollowing: false,
        error: LocationError(e.message),
      );
    } catch (e) {
      return LocationState(
        status: DeviceLocationStatus.error,
        isFollowing: false,
        error: LocationError(e.toString()),
      );
    }
  }

  Future<LocationState> stop({required LocationDisplay display}) async {
    disableFollow(display);

    display.autoPanMode = LocationDisplayAutoPanMode.off;

    await dataSource.stop();

    return LocationState(
      status: DeviceLocationStatus.stopped,
      isFollowing: false,
    );
  }

  void enableFollow(LocationDisplay display) {
    display.autoPanMode = LocationDisplayAutoPanMode.recenter;
  }

  void disableFollow(LocationDisplay display) {
    display.autoPanMode = LocationDisplayAutoPanMode.off;
  }

  void recenter(LocationDisplay display) {
    if (dataSource.status != LocationDataSourceStatus.started) {
      return;
    }

    enableFollow(display);
  }

  bool isFollowing(LocationDisplay display) {
    return display.autoPanMode != LocationDisplayAutoPanMode.off;
  }

  void dispose() {
    _locationSubscription?.cancel();

    dataSource.stop();
  }
}
