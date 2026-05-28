import 'package:arcgis_maps/arcgis_maps.dart';

import 'location_error.dart';
import 'location_status.dart' as loc_status;

class LocationState {
  final loc_status.LocationStatus status;

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
      status: loc_status.LocationStatus.idle,
      isFollowing: false,
    );
  }

  LocationState copyWith({
    loc_status.LocationStatus? status,
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
