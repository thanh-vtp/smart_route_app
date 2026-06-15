import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:smart_route_app/core/common/map/location/device_location_status.dart';
import 'package:smart_route_app/core/common/map/location/location_state.dart';
import 'package:smart_route_app/core/common/map/providers/map_facade_provider.dart';

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

  /// Khởi động GPS stream và lắng nghe autopan changes.
  /// Gọi 1 lần khi map ready — idempotent (guard trong DeviceLocationController).
  Future<void> startLocation() async {
    final facade = ref.read(mapFacadeProvider);

    final result = await facade.startLocation(
      onLocationChanged: (location) {
        state = state.copyWith(location: location);
      },
    );

    _listenAutoPanMode();

    state = result.copyWith(trackingMode: LocationTrackingMode.follow);
  }

  /// Toggle Location Button: OFF → FOLLOW → NAVIGATION → OFF
  ///
  /// - FOLLOW    : map recenter theo vị trí, không xoay
  /// - NAVIGATION: map recenter + xoay theo hướng di chuyển (la bàn GPS)
  /// - OFF       : tắt follow, user kéo map tự do
  Future<void> cycleLocationMode() async {
    final facade = ref.read(mapFacadeProvider);
    final display = facade.locationDisplay;

    // Nếu GPS chưa chạy thì khởi động trước
    if (state.status != DeviceLocationStatus.running) {
      await startLocation();
      return;
    }

    final nextMode = state.trackingMode.next;

    // Áp dụng autopan mode tương ứng
    display.autoPanMode = nextMode.autoPanMode;

    state = state.copyWith(
      trackingMode: nextMode,
      isFollowing: nextMode != LocationTrackingMode.off,
    );
  }

  /// Dừng location tracking hoàn toàn (dừng GPS stream).
  /// Thường chỉ gọi khi user chủ động tắt, không gọi khi thoát navigation.
  Future<void> stopLocation({bool stopDataSource = true}) async {
    final facade = ref.read(mapFacadeProvider);

    final result = await facade.stopLocation(stopDataSource: stopDataSource);

    await _autoPanModeSubscription?.cancel();

    state = result.copyWith(
      trackingMode: stopDataSource
          ? LocationTrackingMode.off
          : state.trackingMode,
    );
  }

  /// Gọi khi bắt đầu Navigation — bật navigation autopan và cập nhật mode
  void setNavigationMode() {
    state = state.copyWith(
      trackingMode: LocationTrackingMode.navigation,
      isFollowing: true,
    );
  }

  /// Gọi khi thoát Navigation — về follow mode bình thường
  void setFollowMode() {
    final facade = ref.read(mapFacadeProvider);
    facade.locationDisplay.autoPanMode = LocationDisplayAutoPanMode.recenter;

    state = state.copyWith(
      trackingMode: LocationTrackingMode.follow,
      isFollowing: true,
    );
  }

  void recenter() {
    final facade = ref.read(mapFacadeProvider);
    facade.recenterLocation();
  }

  /// Lắng nghe khi ArcGIS tự đổi autopan (vd: user kéo map → OFF tự động)
  void _listenAutoPanMode() {
    _autoPanModeSubscription?.cancel();

    final facade = ref.read(mapFacadeProvider);
    final display = facade.locationDisplay;

    _autoPanModeSubscription = display.onAutoPanModeChanged.listen((mode) {
      final isFollowing = mode != LocationDisplayAutoPanMode.off;

      // Sync trackingMode từ ArcGIS autopan (khi SDK tự đổi, vd: user pan map)
      final trackingMode = switch (mode) {
        LocationDisplayAutoPanMode.off => LocationTrackingMode.off,
        LocationDisplayAutoPanMode.recenter => LocationTrackingMode.follow,
        LocationDisplayAutoPanMode.navigation =>
          LocationTrackingMode.navigation,
        _ => LocationTrackingMode.off,
      };

      state = state.copyWith(
        isFollowing: isFollowing,
        trackingMode: trackingMode,
      );
    });
  }
}
