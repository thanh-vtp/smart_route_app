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

      // Đăng ký lắng nghe location (cancel cái cũ nếu có)
      _locationSubscription?.cancel();
      _locationSubscription = display.onLocationChanged.listen(
        onLocationChanged,
      );

      // Chỉ start nếu chưa chạy — tránh gọi start() 2 lần
      if (dataSource.status != LocationDataSourceStatus.started &&
          dataSource.status != LocationDataSourceStatus.starting) {
        await dataSource.start();
      }

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

  /// Dừng hiển thị location trên map.
  /// [stopDataSource] = true: dừng hẳn GPS stream (dùng khi thoát app hoặc
  ///   người dùng tắt GPS hoàn toàn).
  /// [stopDataSource] = false (mặc định): chỉ tắt autopan, GPS vẫn chạy nền
  ///   (dùng khi thoát navigation mode về explore mode).
  Future<LocationState> stop({
    required LocationDisplay display,
    bool stopDataSource = true,
  }) async {
    disableFollow(display);
    display.autoPanMode = LocationDisplayAutoPanMode.off;

    if (stopDataSource &&
        dataSource.status != LocationDataSourceStatus.stopped &&
        dataSource.status != LocationDataSourceStatus.stopping) {
      await dataSource.stop();
    }

    return LocationState(
      status: stopDataSource
          ? DeviceLocationStatus.stopped
          : DeviceLocationStatus.running,
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
    if (dataSource.status != LocationDataSourceStatus.stopped) {
      dataSource.stop();
    }
  }
}
