import 'package:flutter_dotenv/flutter_dotenv.dart';

abstract class Constants {
  // ---Secret Keys---
  static String get supabaseUrl => dotenv.env['SUPABASE_URL'] ?? '';
  static String get supabaseAnon => dotenv.env['SUPABASE_ANON_KEY'] ?? '';
  static String get arcgisApiKey => dotenv.env['ARCGIS_API_KEY'] ?? '';
  static String get googleClientIdWeb =>
      dotenv.env['GOOGLE_CLIENT_ID_WEB'] ?? '';
  static String get androidClientId =>
      dotenv.env['GOOGLE_CLIENT_ID_ANDROID'] ?? '';
  static String get iosClientId => dotenv.env['GOOGLE_CLIENT_ID_IOS'] ?? '';

  // --- Feature Table URLs ---
  static const String serviceTFeatureTableUrl =
      'https://services7.arcgis.com/a062mjV7UpVWoyjr/arcgis/rest/services/smart_route_finder/FeatureServer/0';

  // --- Base URLs ---
  static const String arcgisGeocodeBaseUrl =
      'https://geocode-api.arcgis.com/arcgis/rest/services/World/GeocodeServer';

  static const String arcgisRouteBaseUrl =
      'https://route-api.arcgis.com/arcgis/rest/services/World';

  // --- Endpoints ---
  // --- ArcGIS Geocoding service ---
  static const String findAddressCandidates = '/findAddressCandidates';
  static const String geocodeAddresses = '/geocodeAddresses';
  static const String reverseGeocode = '/reverseGeocode';
  static const String suggest = '/suggest';

  // --- ArcGIS Routing service ---
  static const String routeAndDirections = '/Route/NAServer/Route_World/solve';
}
