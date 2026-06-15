import 'package:arcgis_maps/arcgis_maps.dart';
import 'package:smart_route_app/core/common/map/location/device_location_status.dart';

import 'location_error.dart';

/// Chế độ theo dõi vị trí — điều khiển LocationDisplayAutoPanMode
/// OFF       → AutoPanMode.off       (user đang kéo bản đồ tự do)
/// FOLLOW    → AutoPanMode.recenter  (map bám theo vị trí, không xoay)
/// NAVIGATION→ AutoPanMode.navigation (map bám + xoay theo hướng di chuyển)
enum LocationTrackingMode { off, follow, navigation }

extension LocationTrackingModeX on LocationTrackingMode {
  /// Chuyển sang mode tiếp theo theo vòng: off→follow→navigation→off
  LocationTrackingMode get next {
    switch (this) {
      case LocationTrackingMode.off:
        return LocationTrackingMode.follow;
      case LocationTrackingMode.follow:
        return LocationTrackingMode.navigation;
      case LocationTrackingMode.navigation:
        return LocationTrackingMode.off;
    }
  }

  /// Map sang ArcGIS AutoPanMode
  LocationDisplayAutoPanMode get autoPanMode {
    switch (this) {
      case LocationTrackingMode.off:
        return LocationDisplayAutoPanMode.off;
      case LocationTrackingMode.follow:
        return LocationDisplayAutoPanMode.recenter;
      case LocationTrackingMode.navigation:
        return LocationDisplayAutoPanMode.navigation;
    }
  }
}

class LocationState {
  final DeviceLocationStatus status;

  final ArcGISLocation? location;

  final bool isFollowing;

  /// Chế độ tracking hiện tại — dùng để điều khiển Location Button UI
  final LocationTrackingMode trackingMode;

  final LocationError? error;

  const LocationState({
    required this.status,
    this.location,
    required this.isFollowing,
    this.trackingMode = LocationTrackingMode.off,
    this.error,
  });

  factory LocationState.initial() {
    return const LocationState(
      status: DeviceLocationStatus.idle,
      isFollowing: false,
      trackingMode: LocationTrackingMode.off,
    );
  }

  LocationState copyWith({
    DeviceLocationStatus? status,
    ArcGISLocation? location,
    bool? isFollowing,
    LocationTrackingMode? trackingMode,
    LocationError? error,
  }) {
    return LocationState(
      status: status ?? this.status,
      location: location ?? this.location,
      isFollowing: isFollowing ?? this.isFollowing,
      trackingMode: trackingMode ?? this.trackingMode,
      error: error,
    );
  }
}
