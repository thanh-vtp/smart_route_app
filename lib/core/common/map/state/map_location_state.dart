import 'package:arcgis_maps/arcgis_maps.dart';

class MapLocationState {
  final bool isLocationEnabled;

  final bool isFollowingUser;

  final ArcGISPoint? currentLocation;

  final double? heading;

  final String? error;

  const MapLocationState({
    required this.isLocationEnabled,
    required this.isFollowingUser,
    required this.currentLocation,
    required this.heading,
    required this.error,
  });

  factory MapLocationState.initial() {
    return const MapLocationState(
      isLocationEnabled: false,
      isFollowingUser: false,
      currentLocation: null,
      heading: null,
      error: null,
    );
  }

  MapLocationState copyWith({
    bool? isLocationEnabled,
    bool? isFollowingUser,
    ArcGISPoint? currentLocation,
    double? heading,
    String? error,
  }) {
    return MapLocationState(
      isLocationEnabled: isLocationEnabled ?? this.isLocationEnabled,
      isFollowingUser: isFollowingUser ?? this.isFollowingUser,
      currentLocation: currentLocation ?? this.currentLocation,
      heading: heading ?? this.heading,
      error: error ?? this.error,
    );
  }
}
