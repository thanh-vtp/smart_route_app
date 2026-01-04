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

  // --- Base URLs ---
  static const String arcgisGeocodeBaseUrl =
      'https://geocode-api.arcgis.com/arcgis/rest/services';

  static const String arcgisRouteBaseUrl =
      'https://route-api.arcgis.com/arcgis/rest/services';

  // --- Endpoints ---
  static const String findAddressCandidates =
      '/World/GeocodeServer/findAddressCandidates';
  static const String geocodeAddresses =
      '/World/GeocodeServer/geocodeAddresses';
  static const String reverseGeocode = '/World/GeocodeServer/reverseGeocode';
  static const String suggest = '/World/GeocodeServer/suggest';
}
