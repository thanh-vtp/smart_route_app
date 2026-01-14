import 'dart:async';
import 'dart:convert';
import 'dart:io';
import 'dart:typed_data';
import 'package:http/http.dart' as http;
import 'package:smart_route_app/core/utils/app_logger.dart';
import 'package:smart_route_app/core/errors/failures.dart';
import 'package:smart_route_app/core/utils/constants.dart';
import 'package:smart_route_app/features/navigation/data/datasources/arcgis_geocoding_remote_data_source.dart';
import 'package:smart_route_app/features/navigation/data/models/geocoding_models.dart';

// class ArcGISGeocodingRemoteDataSourceImpl
//     implements ArcGISGeocodingRemoteDataSource {
//   static const String _baseUrl =
//       'https://geocode-api.arcgis.com/arcgis/rest/services';
  // static const String _routeBaseUrl =
  //     'https://route-api.arcgis.com/arcgis/rest/services';
  // static const String _imageryBaseUrl =
  //     'https://services.arcgisonline.com/arcgis/rest/services';

  // final http.Client _client;
  // final String _apiKey;

  // // Timeout configurations
  // static const Duration _receiveTimeout = Duration(seconds: 30);
  // static const int _maxRetries = 3;

  // ArcGISGeocodingRemoteDataSourceImpl({http.Client? client, String? apiKey})
  //   : _client = client ?? http.Client(),
  //     _apiKey = apiKey ?? Constants.arcgisApiKey {
  //   // Validate key ngay khi khởi tạo
  //   if (_apiKey.isEmpty) {
  //     throw ArcGISFailure.missingApiKey();
  //   }
  // }

  // /// Helper method to parse and validate JSON response
  // Map<String, dynamic> _parseAndValidateResponse(http.Response response) {
  //   if (response.statusCode != 200) {
  //     throw ArcGISFailure.httpError(response.statusCode, response.reasonPhrase);
  //   }

  //   try {
  //     final data = json.decode(response.body) as Map<String, dynamic>;

  //     // Check for API errors in response
  //     if (data['error'] != null) {
  //       final errorData = data['error'] as Map<String, dynamic>;
  //       final errorCode = errorData['code'];
  //       final errorMessage = errorData['message'] ?? 'Unknown error';
  //       final errorDetails = errorData['details'];

  //       AppLogger.error(
  //         'ArcGIS API Error - Code: $errorCode, Message: $errorMessage, Details: $errorDetails',
  //         name: 'ArcGISGeocodingDataSource',
  //       );

  //       throw ArcGISFailure.apiError('$errorMessage (Code: $errorCode)');
  //     }

  //     return data;
  //   } catch (e) {
  //     if (e is ArcGISFailure) rethrow;
  //     throw ArcGISFailure.parseError(e.toString());
  //   }
  // }

  /// Helper method to make HTTP requests with retry logic
  // Future<http.Response> _makeRequest(Uri uri) async {
  //   int retryCount = 0;
  //   while (retryCount <= _maxRetries) {
  //     try {
  //       final response = await _client.get(uri).timeout(_receiveTimeout);

  //       // Nếu status code 5xx (Server Error), có thể retry
  //       if (response.statusCode >= 500 && response.statusCode < 600) {
  //         throw HttpException('Server Error: ${response.statusCode}');
  //       }
  //       return response;
  //     } on SocketException catch (_) {
  //       if (retryCount > _maxRetries) {
  //         throw ArcGISFailure.connectionFailed(); // Mất mạng hoặc không kết nối được server
  //       }
  //     } on TimeoutException catch (_) {
  //       if (retryCount > _maxRetries) {
  //         throw ArcGISFailure.timeout(); // Quá thời gian chờ
  //       }
  //     } on http.ClientException catch (_) {
  //       if (retryCount > _maxRetries) {
  //         throw ArcGISFailure.connectionFailed(); // Lỗi client bị đóng hoặc lỗi giao thức
  //       }
  //     } catch (e) {
  //       throw ArcGISFailure.apiError(e.toString());
  //     }

  //     // Logic Backoff: Chờ 2s, 4s, 6s... trước khi thử lại
  //     await Future.delayed(Duration(seconds: retryCount * 2));
  //   }

  //   throw ArcGISFailure.unknown();
  // }

  // /// Tính toán đường đi giữa các điểm
  // @override
  // Future<RouteResponse> calculateRoute(
  //   List<Map<String, double>> stops, {
  //   bool returnDirections = true,
  //   bool returnRoutes = true,
  // }) async {
  //   try {
  //     if (stops.length < 2) {
  //       throw ArcGISFailure.insufficientStops();
  //     }

  //     // Check cache first
  //     // final cachedResult = await _cacheService.getCachedRouteResult(stops);
  //     // if (cachedResult != null) {
  //     //   AppLogger.data(
  //     //     'Using cached route result',
  //     //     source: 'ArcGISGeocodingDataSource',
  //     //   );
  //     //   return cachedResult;
  //     // }

  //     // Tạo stops string
  //     final stopsString = stops
  //         .map((stop) => '${stop['longitude']},${stop['latitude']}')
  //         .join(';');

  //     AppLogger.data(
  //       'Calculating route with stops: $stopsString',
  //       source: 'ArcGISGeocodingDataSource',
  //     );

  //     final uri =
  //         Uri.parse(
  //           '$_routeBaseUrl/World/Route/NAServer/Route_World/solve',
  //         ).replace(
  //           queryParameters: {
  //             'stops': stopsString,
  //             'f': 'json',
  //             'token': _apiKey,
  //             'returnDirections': returnDirections.toString(),
  //             'returnRoutes': returnRoutes.toString(),
  //             'directionsLanguage': 'vi',
  //             'outputLines': 'esriNAOutputLineTrueShapeWithMeasure',
  //             'outSR': '4326',
  //           },
  //         );

  //     AppLogger.data(
  //       'Route request URI: $uri',
  //       source: 'ArcGISGeocodingDataSource',
  //     );

  //     final response = await _makeRequest(uri);

  //     AppLogger.data(
  //       'Route response status: ${response.statusCode}',
  //       source: 'ArcGISGeocodingDataSource',
  //     );

  //     final data = _parseAndValidateResponse(response);

  //     // Log JSON directions chi tiết
  //     AppLogger.data(
  //       'Route directions JSON: ${json.encode(data['directions'])}',
  //       source: 'ArcGISGeocodingDataSource',
  //     );

  //     final result = RouteResponse.fromJson(data);

  //     try {
  //       // Cache the result
  //       // await _cacheService.cacheRouteResult(stops, result);
  //     } catch (cacheError) {
  //       AppLogger.error(
  //         'Failed to cache route result: $cacheError',
  //         name: 'ArcGISGeocodingDataSource',
  //       );
  //       // Continue without caching
  //     }
  //     return result;
  //   } catch (e, st) {
  //     AppLogger.error(
  //       'Error in calculateRoute: $e',
  //       name: 'ArcGISGeocodingDataSource',
  //       error: e,
  //       stackTrace: st,
  //     );
  //     // Re-throw ArcGIS failures as-is, convert others
  //     if (e is ArcGISFailure) {
  //       rethrow;
  //     }
  //     throw ArcGISFailure.routingFailed();
  //   }
  // }

  // /// Lấy hình ảnh vệ tinh tại vị trí cụ thể
  // @override
  // Future<Uint8List> getSatelliteImage(
  //   double latitude,
  //   double longitude, {
  //   int width = 400,
  //   int height = 400,
  //   int level = 15, // Zoom level
  // }) async {
  //   try {
  //     AppLogger.data(
  //       'DataSource.getSatelliteImage called with lat: $latitude, lon: $longitude, size: ${width}x$height, level: $level',
  //       source: 'ArcGISGeocodingDataSource',
  //     );

  //     // Check cache first
  //     AppLogger.data('Checking cache...', source: 'ArcGISGeocodingDataSource');

  //     // try {
  //     //   final cachedImage = await _cacheService.getCachedImageData(
  //     //     latitude,
  //     //     longitude,
  //     //     width,
  //     //     height,
  //     //     level,
  //     //   );
  //     //   if (cachedImage != null) {
  //     //     AppLogger.data(
  //     //       'Found cached image: ${cachedImage.length} bytes',
  //     //       source: 'ArcGISGeocodingDataSource',
  //     //     );
  //     //     return cachedImage;
  //     //   }
  //     //   AppLogger.data(
  //     //     'No cached image found',
  //     //     source: 'ArcGISGeocodingDataSource',
  //     //   );
  //     // } catch (cacheError) {
  //     //   AppLogger.error(
  //     //     'Cache error (continuing without cache): $cacheError',
  //     //     name: 'ArcGISGeocodingDataSource',
  //     //   );
  //     // }

  //     // Sử dụng World Imagery service
  //     final bbox = _calculateBoundingBox(latitude, longitude, level);
  //     AppLogger.data(
  //       'Calculated bbox: $bbox',
  //       source: 'ArcGISGeocodingDataSource',
  //     );

  //     final uri = Uri.parse('$_imageryBaseUrl/World_Imagery/MapServer/export')
  //         .replace(
  //           queryParameters: {
  //             'bbox': bbox,
  //             'size': '$width,$height',
  //             'f': 'image',
  //             'format': 'png',
  //             'token': _apiKey,
  //             'bboxSR': '4326',
  //             'imageSR': '4326',
  //           },
  //         );

  //     AppLogger.data('Request URI: $uri', source: 'ArcGISGeocodingDataSource');

  //     AppLogger.data(
  //       'Making HTTP request...',
  //       source: 'ArcGISGeocodingDataSource',
  //     );
  //     final response = await _makeRequest(uri);
  //     AppLogger.data(
  //       'Response status: ${response.statusCode}',
  //       source: 'ArcGISGeocodingDataSource',
  //     );

  //     if (response.statusCode == 200) {
  //       final imageData = response.bodyBytes;
  //       AppLogger.data(
  //         'Got image data: ${imageData.length} bytes',
  //         source: 'ArcGISGeocodingDataSource',
  //       );

  //       // Cache the image (only if not too large)
  //       AppLogger.data('Caching image...', source: 'ArcGISGeocodingDataSource');

  //       // try {
  //       //   await _cacheService.cacheImageData(
  //       //     latitude,
  //       //     longitude,
  //       //     width,
  //       //     height,
  //       //     level,
  //       //     imageData,
  //       //   );
  //       // } catch (cacheError) {
  //       //   AppLogger.error(
  //       //     'Failed to cache image: $cacheError',
  //       //     name: 'ArcGISGeocodingDataSource',
  //       //   );
  //       //   // Continue without caching
  //       // }

  //       return imageData;
  //     } else {
  //       AppLogger.data(
  //         'HTTP error: ${response.statusCode} - ${response.reasonPhrase}',
  //         source: 'ArcGISGeocodingDataSource',
  //       );
  //       throw ArcGISFailure.imageryFailed();
  //     }
  //   } catch (e, st) {
  //     AppLogger.error(
  //       'Error in getSatelliteImage: $e',
  //       name: 'ArcGISGeocodingDataSource',
  //       error: e,
  //       stackTrace: st,
  //     );
  //     // Re-throw ArcGIS failures as-is, convert others
  //     if (e is ArcGISFailure) {
  //       rethrow;
  //     }
  //     throw ArcGISFailure.imageryFailed();
  //   }
  // }

  // /// Lấy metadata của hình ảnh tại vị trí
  // @override
  // Future<ImageryMetadataResponse> getImageryMetadata(
  //   double latitude,
  //   double longitude,
  // ) async {
  //   // Calculate map extent around the point
  //   const double delta = 0.01; // ~1km buffer
  //   final double minX = longitude - delta;
  //   final double minY = latitude - delta;
  //   final double maxX = longitude + delta;
  //   final double maxY = latitude + delta;
  //   final String mapExtent = '$minX,$minY,$maxX,$maxY';

  //   final uri = Uri.parse('$_imageryBaseUrl/World_Imagery/MapServer/identify')
  //       .replace(
  //         queryParameters: {
  //           'geometry': '$longitude,$latitude',
  //           'geometryType': 'esriGeometryPoint',
  //           'sr': '4326',
  //           'mapExtent': mapExtent,
  //           'imageDisplay': '400,400,96',
  //           'layers': 'visible',
  //           'tolerance': '3',
  //           'returnGeometry': 'false',
  //           'f': 'json',
  //           'token': _apiKey,
  //         },
  //       );

  //   final response = await _makeRequest(uri);
  //   final data = _parseAndValidateResponse(response);

  //   try {
  //     if (data['results'] != null && data['results'].isNotEmpty) {
  //       final result = data['results'][0];
  //       return ImageryMetadataResponse.fromJson(result['attributes'] ?? {});
  //     } else {
  //       // Return empty metadata if no results
  //       return const ImageryMetadataResponse();
  //     }
  //   } catch (e) {
  //     if (e is ArcGISFailure) rethrow;
  //     throw ArcGISFailure.imageryFailed();
  //   }
  // }

  // /// Tính toán bounding box cho hình ảnh
  // String _calculateBoundingBox(double lat, double lon, int zoomLevel) {
  //   // Tính toán độ rộng của bounding box dựa trên zoom level
  //   final double delta = 0.01 / (zoomLevel / 10.0);

  //   final double minLon = lon - delta;
  //   final double minLat = lat - delta;
  //   final double maxLon = lon + delta;
  //   final double maxLat = lat + delta;

  //   return '$minLon,$minLat,$maxLon,$maxLat';
  // }

  // /// Tìm kiếm địa điểm gần đó
  // @override
  // Future<GeocodeResponse> findNearbyPlaces(
  //   double latitude,
  //   double longitude, {
  //   String category = '',
  //   int maxLocations = 10,
  //   double searchRadius = 1000, // meters
  // }) async {
  //   try {
  //     // Check cache first
  //     // final cachedResult = await _cacheService.getCachedNearbyPlacesResult(
  //     //   latitude,
  //     //   longitude,
  //     //   category,
  //     //   searchRadius,
  //     // );
  //     // if (cachedResult != null) {
  //     //   return cachedResult;
  //     // }

  //     final uri =
  //         Uri.parse(
  //           '$_baseUrl/World/GeocodeServer/findAddressCandidates',
  //         ).replace(
  //           queryParameters: {
  //             'location': '$longitude,$latitude',
  //             'category': category,
  //             'f': 'json',
  //             'token': _apiKey,
  //             'outFields': '*',
  //             'maxLocations': maxLocations.toString(),
  //             'searchExtent': _calculateSearchExtent(
  //               latitude,
  //               longitude,
  //               searchRadius,
  //             ),
  //           },
  //         );

  //     final response = await _makeRequest(uri);
  //     final data = _parseAndValidateResponse(response);
  //     final result = GeocodeResponse.fromJson(data);

  //     try {
  //       // Cache the result
  //       // await _cacheService.cacheNearbyPlacesResult(
  //       //   latitude,
  //       //   longitude,
  //       //   category,
  //       //   searchRadius,
  //       //   result,
  //       // );
  //     } catch (e) {
  //       AppLogger.error(
  //         'Failed to cache nearby places result: $e',
  //         name: 'ArcGISGeocodingDataSource',
  //       );
  //       // Continue without caching
  //     }

  //     return result;
  //   } catch (e, st) {
  //     AppLogger.error(
  //       'Error in findNearbyPlaces: $e',
  //       error: e,
  //       stackTrace: st,
  //       name: 'ArcGISGeocodingDataSource',
  //     );
  //     if (e is ArcGISFailure) rethrow;
  //     throw ArcGISFailure.nearbySearchFailed();
  //   }
  // }

  // /// Tính toán search extent cho tìm kiếm gần đó
  // String _calculateSearchExtent(double lat, double lon, double radiusMeters) {
  //   // Chuyển đổi radius từ meters sang degrees (xấp xỉ)
  //   final double radiusDegrees =
  //       radiusMeters / 111320.0; // 1 degree ≈ 111.32 km

  //   final double minLon = lon - radiusDegrees;
  //   final double minLat = lat - radiusDegrees;
  //   final double maxLon = lon + radiusDegrees;
  //   final double maxLat = lat + radiusDegrees;

  //   return '$minLon,$minLat,$maxLon,$maxLat';
  // }

  // /// Test connection to ArcGIS services
  // @override
  // Future<bool> testConnection() async {
  //   try {
  //     final uri = Uri.parse(
  //       '$_baseUrl/World/GeocodeServer',
  //     ).replace(queryParameters: {'f': 'json', 'token': _apiKey});

  //     final response = await _makeRequest(uri);
  //     return response.statusCode == 200;
  //   } catch (e) {
  //     return false;
  //   }
  // }

  /// Clear all cache
  // @override
  // Future<void> clearCache() async {
  //   await _cacheService.clearAllCache();
  // }

  /// Clear expired cache entries
  // @override
  // Future<void> clearExpiredCache() async {
  //   await _cacheService.clearExpiredCache();
  // }

  /// Get cache statistics
  // @override
  // Future<Map<String, int>> getCacheStats() async {
  //   return await _cacheService.getCacheStats();
  // }

  // @override
  // void dispose() {
  //   // No need to dispose anything since we create new clients for each request
  // }
// }
