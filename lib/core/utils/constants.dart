import 'package:flutter_dotenv/flutter_dotenv.dart';

abstract class Constants {
  static String supabaseUrl = dotenv.env['SUPABASE_URL'] ?? '';
  static String supabaseAnon = dotenv.env['SUPABASE_ANON_KEY'] ?? '';
  static String arcgisApiKey = dotenv.env['ARCGIS_API_KEY'] ?? '';
  static String googleClientIdWeb = dotenv.env['GOOGLE_CLIENT_ID_WEB'] ?? '';
  static String androidClientId = dotenv.env['GOOGLE_CLIENT_ID_ANDROID'] ?? '';
  static String iosClientId = dotenv.env['GOOGLE_CLIENT_ID_IOS'] ?? '';

  // ArcGIS Services URLs
  static const String arcgisBaseUrl = 'https://services.arcgis.com';
  static const String arcgisOnlinePortal = 'https://www.arcgis.com';

  // Default map configuration
  static const double defaultLatitude = 10.7769;
  static const double defaultLongitude = 106.7009;
  static const double defaultScale = 5000;

  // Layer IDs for common services
  static const String worldBuildingsLayerId =
      '0ec8512ad21e4bb987d7e848d14e7e24';
  static const String worldTransportationLayerId =
      'f42ecc08a3634182b8678514af35fac3';
}
