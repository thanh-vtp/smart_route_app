import 'dart:async';

import 'package:arcgis_maps/arcgis_maps.dart';

import 'location_constants.dart';
import 'location_error.dart';
import 'location_state.dart';
import 'location_status.dart' as loc_status;

class DeviceLocationController {
  final SystemLocationDataSource dataSource = SystemLocationDataSource();

  StreamSubscription<ArcGISLocation>? _locationSubscription;

  Future<LocationState> start({
    required LocationDisplay display,
    required void Function(ArcGISLocation location) onLocationChanged,
  }) async {
    try {
      display.dataSource = dataSource;

      display.autoPanMode = LocationConstants.defaultAutoPanMode;

      _locationSubscription?.cancel();

      _locationSubscription = display.onLocationChanged.listen(
        onLocationChanged,
      );

      await dataSource.start();

      return LocationState(
        status: loc_status.LocationStatus.running,
        isFollowing: true,
      );
    } on ArcGISException catch (e) {
      return LocationState(
        status: loc_status.LocationStatus.error,
        isFollowing: false,
        error: LocationError(e.message),
      );
    } catch (e) {
      return LocationState(
        status: loc_status.LocationStatus.error,
        isFollowing: false,
        error: LocationError(e.toString()),
      );
    }
  }

  Future<LocationState> stop({required LocationDisplay display}) async {
    display.autoPanMode = LocationDisplayAutoPanMode.off;

    await dataSource.stop();

    return const LocationState(
      status: loc_status.LocationStatus.stopped,
      isFollowing: false,
    );
  }

  void recenter(LocationDisplay display) {
    if (dataSource.status != LocationDataSourceStatus.started) {
      return;
    }

    display.autoPanMode = LocationDisplayAutoPanMode.recenter;
  }

  void dispose() {
    _locationSubscription?.cancel();

    dataSource.stop();
  }
}
