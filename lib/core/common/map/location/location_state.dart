import 'package:arcgis_maps/arcgis_maps.dart';
import 'package:smart_route_app/core/common/map/location/device_location_status.dart';

import 'location_error.dart';

class LocationState {
  final DeviceLocationStatus status;

  final ArcGISLocation? location;

  final bool isFollowing;

  final LocationError? error;

  const LocationState({
    required this.status,
    this.location,
    required this.isFollowing,
    this.error,
  });

  factory LocationState.initial() {
    return const LocationState(
      status: DeviceLocationStatus.idle,
      isFollowing: false,
    );
  }

  LocationState copyWith({
    DeviceLocationStatus? status,
    ArcGISLocation? location,
    bool? isFollowing,
    LocationError? error,
  }) {
    return LocationState(
      status: status ?? this.status,
      location: location ?? this.location,
      isFollowing: isFollowing ?? this.isFollowing,
      error: error,
    );
  }
}
