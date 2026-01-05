import 'dart:typed_data';
import 'package:smart_route_app/features/navigation/data/models/geocoding_models.dart';

/// Abstract data source for ArcGIS Geocoding services
/// Defines the contract for all ArcGIS geocoding operations
abstract class ArcGISGeocodingRemoteDataSource {
  /// Calculate route between multiple stops
  Future<RouteResponse> calculateRoute(
    List<Map<String, double>> stops, {
    bool returnDirections = true,
    bool returnRoutes = true,
  });

  /// Get satellite imagery at specific location
  Future<Uint8List> getSatelliteImage(
    double latitude,
    double longitude, {
    int width = 400,
    int height = 400,
    int level = 15,
  });

  /// Get imagery metadata at location
  Future<ImageryMetadataResponse> getImageryMetadata(
    double latitude,
    double longitude,
  );

  /// Find nearby places around coordinates
  Future<GeocodeResponse> findNearbyPlaces(
    double latitude,
    double longitude, {
    String category = '',
    int maxLocations = 10,
    double searchRadius = 1000,
  });

  /// Test connection to ArcGIS services
  Future<bool> testConnection();

  // /// Clear all cached data
  // Future<void> clearCache();

  // /// Clear expired cache entries
  // Future<void> clearExpiredCache();

  // /// Get cache statistics
  // Future<Map<String, int>> getCacheStats();

  // /// Dispose resources
  // void dispose();
}
