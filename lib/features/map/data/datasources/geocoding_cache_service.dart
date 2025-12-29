// import 'dart:convert';
// import 'dart:typed_data';
// import 'package:shared_preferences/shared_preferences.dart';
// import '../models/geocoding_models.dart';

// class GeocodingCacheService {
//   static const String _geocodePrefix = 'geocode_';
//   static const String _reverseGeocodePrefix = 'reverse_geocode_';
//   static const String _routePrefix = 'route_';
//   static const String _nearbyPrefix = 'nearby_';
//   static const String _imagePrefix = 'image_';

//   // Cache expiry times
//   static const Duration _geocodeCacheExpiry = Duration(days: 7);
//   static const Duration _reverseGeocodeCacheExpiry = Duration(days: 3);
//   static const Duration _routeCacheExpiry = Duration(hours: 6);
//   static const Duration _nearbyCacheExpiry = Duration(hours: 2);
//   static const Duration _imageCacheExpiry = Duration(days: 1);

//   SharedPreferences? _prefs;

//   Future<SharedPreferences> get prefs async {
//     _prefs ??= await SharedPreferences.getInstance();
//     return _prefs!;
//   }

//   /// Generate cache key for geocoding
//   String _generateGeocodeKey(String address) {
//     return '$_geocodePrefix${address.toLowerCase().trim()}';
//   }

//   /// Generate cache key for reverse geocoding
//   String _generateReverseGeocodeKey(double lat, double lon) {
//     return '$_reverseGeocodePrefix${lat.toStringAsFixed(4)}_${lon.toStringAsFixed(4)}';
//   }

//   /// Generate cache key for route
//   String _generateRouteKey(List<Map<String, double>> stops) {
//     final stopsStr = stops
//         .map(
//           (stop) =>
//               '${stop['latitude']!.toStringAsFixed(4)},${stop['longitude']!.toStringAsFixed(4)}',
//         )
//         .join('|');
//     return '$_routePrefix${stopsStr.hashCode}';
//   }

//   /// Generate cache key for nearby places
//   String _generateNearbyKey(
//     double lat,
//     double lon,
//     String category,
//     double radius,
//   ) {
//     return '$_nearbyPrefix${lat.toStringAsFixed(4)}_${lon.toStringAsFixed(4)}_${category}_${radius.toInt()}';
//   }

//   /// Generate cache key for images
//   String _generateImageKey(
//     double lat,
//     double lon,
//     int width,
//     int height,
//     int level,
//   ) {
//     return '$_imagePrefix${lat.toStringAsFixed(4)}_${lon.toStringAsFixed(4)}_${width}x${height}_$level';
//   }

//   /// Cache geocoding result
//   Future<void> cacheGeocodeResult(
//     String address,
//     GeocodeResponse response,
//   ) async {
//     final preferences = await prefs;
//     final key = _generateGeocodeKey(address);
//     final data = {
//       'data': response.toJson(),
//       'timestamp': DateTime.now().millisecondsSinceEpoch,
//     };
//     await preferences.setString(key, json.encode(data));
//   }

//   /// Get cached geocoding result
//   Future<GeocodeResponse?> getCachedGeocodeResult(String address) async {
//     final preferences = await prefs;
//     final key = _generateGeocodeKey(address);
//     final cachedStr = preferences.getString(key);

//     if (cachedStr == null) return null;

//     try {
//       final cached = json.decode(cachedStr);
//       final timestamp = DateTime.fromMillisecondsSinceEpoch(
//         cached['timestamp'],
//       );

//       if (DateTime.now().difference(timestamp) > _geocodeCacheExpiry) {
//         await preferences.remove(key);
//         return null;
//       }

//       return GeocodeResponse.fromJson(cached['data']);
//     } catch (e) {
//       await preferences.remove(key);
//       return null;
//     }
//   }

//   /// Cache reverse geocoding result
//   Future<void> cacheReverseGeocodeResult(
//     double lat,
//     double lon,
//     ReverseGeocodeResponse response,
//   ) async {
//     final preferences = await prefs;
//     final key = _generateReverseGeocodeKey(lat, lon);
//     final data = {
//       'data': response.toJson(),
//       'timestamp': DateTime.now().millisecondsSinceEpoch,
//     };
//     await preferences.setString(key, json.encode(data));
//   }

//   /// Get cached reverse geocoding result
//   Future<ReverseGeocodeResponse?> getCachedReverseGeocodeResult(
//     double lat,
//     double lon,
//   ) async {
//     final preferences = await prefs;
//     final key = _generateReverseGeocodeKey(lat, lon);
//     final cachedStr = preferences.getString(key);

//     if (cachedStr == null) return null;

//     try {
//       final cached = json.decode(cachedStr);
//       final timestamp = DateTime.fromMillisecondsSinceEpoch(
//         cached['timestamp'],
//       );

//       if (DateTime.now().difference(timestamp) > _reverseGeocodeCacheExpiry) {
//         await preferences.remove(key);
//         return null;
//       }

//       return ReverseGeocodeResponse.fromJson(cached['data']);
//     } catch (e) {
//       await preferences.remove(key);
//       return null;
//     }
//   }

//   /// Cache route result
//   Future<void> cacheRouteResult(
//     List<Map<String, double>> stops,
//     RouteResponse response,
//   ) async {
//     final preferences = await prefs;
//     final key = _generateRouteKey(stops);
//     final data = {
//       'data': response.toJson(),
//       'timestamp': DateTime.now().millisecondsSinceEpoch,
//     };
//     await preferences.setString(key, json.encode(data));
//   }

//   /// Get cached route result
//   Future<RouteResponse?> getCachedRouteResult(
//     List<Map<String, double>> stops,
//   ) async {
//     final preferences = await prefs;
//     final key = _generateRouteKey(stops);
//     final cachedStr = preferences.getString(key);

//     if (cachedStr == null) return null;

//     try {
//       final cached = json.decode(cachedStr);
//       final timestamp = DateTime.fromMillisecondsSinceEpoch(
//         cached['timestamp'],
//       );

//       if (DateTime.now().difference(timestamp) > _routeCacheExpiry) {
//         await preferences.remove(key);
//         return null;
//       }

//       return RouteResponse.fromJson(cached['data']);
//     } catch (e) {
//       await preferences.remove(key);
//       return null;
//     }
//   }

//   /// Cache nearby places result
//   Future<void> cacheNearbyPlacesResult(
//     double lat,
//     double lon,
//     String category,
//     double radius,
//     GeocodeResponse response,
//   ) async {
//     final preferences = await prefs;
//     final key = _generateNearbyKey(lat, lon, category, radius);
//     final data = {
//       'data': response.toJson(),
//       'timestamp': DateTime.now().millisecondsSinceEpoch,
//     };
//     await preferences.setString(key, json.encode(data));
//   }

//   /// Get cached nearby places result
//   Future<GeocodeResponse?> getCachedNearbyPlacesResult(
//     double lat,
//     double lon,
//     String category,
//     double radius,
//   ) async {
//     final preferences = await prefs;
//     final key = _generateNearbyKey(lat, lon, category, radius);
//     final cachedStr = preferences.getString(key);

//     if (cachedStr == null) return null;

//     try {
//       final cached = json.decode(cachedStr);
//       final timestamp = DateTime.fromMillisecondsSinceEpoch(
//         cached['timestamp'],
//       );

//       if (DateTime.now().difference(timestamp) > _nearbyCacheExpiry) {
//         await preferences.remove(key);
//         return null;
//       }

//       return GeocodeResponse.fromJson(cached['data']);
//     } catch (e) {
//       await preferences.remove(key);
//       return null;
//     }
//   }

//   /// Cache image data (as base64 string due to SharedPreferences limitations)
//   Future<void> cacheImageData(
//     double lat,
//     double lon,
//     int width,
//     int height,
//     int level,
//     Uint8List imageData,
//   ) async {
//     final preferences = await prefs;
//     final key = _generateImageKey(lat, lon, width, height, level);

//     // Only cache small images to avoid SharedPreferences size limits
//     if (imageData.length > 500000) return; // Skip caching if > 500KB

//     final data = {
//       'data': base64Encode(imageData),
//       'timestamp': DateTime.now().millisecondsSinceEpoch,
//     };
//     await preferences.setString(key, json.encode(data));
//   }

//   /// Get cached image data
//   Future<Uint8List?> getCachedImageData(
//     double lat,
//     double lon,
//     int width,
//     int height,
//     int level,
//   ) async {
//     final preferences = await prefs;
//     final key = _generateImageKey(lat, lon, width, height, level);
//     final cachedStr = preferences.getString(key);

//     if (cachedStr == null) return null;

//     try {
//       final cached = json.decode(cachedStr);
//       final timestamp = DateTime.fromMillisecondsSinceEpoch(
//         cached['timestamp'],
//       );

//       if (DateTime.now().difference(timestamp) > _imageCacheExpiry) {
//         await preferences.remove(key);
//         return null;
//       }

//       return base64Decode(cached['data']);
//     } catch (e) {
//       await preferences.remove(key);
//       return null;
//     }
//   }

//   /// Clear all cache
//   Future<void> clearAllCache() async {
//     final preferences = await prefs;
//     final keys = preferences
//         .getKeys()
//         .where(
//           (key) =>
//               key.startsWith(_geocodePrefix) ||
//               key.startsWith(_reverseGeocodePrefix) ||
//               key.startsWith(_routePrefix) ||
//               key.startsWith(_nearbyPrefix) ||
//               key.startsWith(_imagePrefix),
//         )
//         .toList();

//     for (final key in keys) {
//       await preferences.remove(key);
//     }
//   }

//   /// Clear expired cache entries
//   Future<void> clearExpiredCache() async {
//     final preferences = await prefs;
//     final keys = preferences
//         .getKeys()
//         .where(
//           (key) =>
//               key.startsWith(_geocodePrefix) ||
//               key.startsWith(_reverseGeocodePrefix) ||
//               key.startsWith(_routePrefix) ||
//               key.startsWith(_nearbyPrefix) ||
//               key.startsWith(_imagePrefix),
//         )
//         .toList();

//     for (final key in keys) {
//       final cachedStr = preferences.getString(key);
//       if (cachedStr != null) {
//         try {
//           final cached = json.decode(cachedStr);
//           final timestamp = DateTime.fromMillisecondsSinceEpoch(
//             cached['timestamp'],
//           );

//           Duration expiry;
//           if (key.startsWith(_geocodePrefix)) {
//             expiry = _geocodeCacheExpiry;
//           } else if (key.startsWith(_reverseGeocodePrefix)) {
//             expiry = _reverseGeocodeCacheExpiry;
//           } else if (key.startsWith(_routePrefix)) {
//             expiry = _routeCacheExpiry;
//           } else if (key.startsWith(_nearbyPrefix)) {
//             expiry = _nearbyCacheExpiry;
//           } else {
//             expiry = _imageCacheExpiry;
//           }

//           if (DateTime.now().difference(timestamp) > expiry) {
//             await preferences.remove(key);
//           }
//         } catch (e) {
//           await preferences.remove(key);
//         }
//       }
//     }
//   }

//   /// Get cache statistics
//   Future<Map<String, int>> getCacheStats() async {
//     final preferences = await prefs;
//     final keys = preferences.getKeys();

//     return {
//       'geocode': keys.where((k) => k.startsWith(_geocodePrefix)).length,
//       'reverse_geocode': keys
//           .where((k) => k.startsWith(_reverseGeocodePrefix))
//           .length,
//       'route': keys.where((k) => k.startsWith(_routePrefix)).length,
//       'nearby': keys.where((k) => k.startsWith(_nearbyPrefix)).length,
//       'image': keys.where((k) => k.startsWith(_imagePrefix)).length,
//     };
//   }
// }
