import 'package:arcgis_maps/arcgis_maps.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:smart_route_app/core/core.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

Future<void> initApp() async {
  await dotenv.load(fileName: ".env");

  // Initialize ArcGIS
  ArcGISEnvironment.apiKey = Constants.arcgisApiKey;
  AppLogger.info(
    'Initialized ArcGIS: ${Constants.arcgisApiKey}',
    name: 'ARCGIS_API_KEY',
  );
  await Supabase.initialize(
    url: Constants.supabaseUrl,
    anonKey: Constants.supabaseAnon,
  );
}
