import 'package:arcgis_maps/arcgis_maps.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:smart_route_app/core/core.dart';
import 'package:smart_route_app/features/map/presentation/models/incident_symbol_factory.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

Future<void> initApp() async {
  await dotenv.load(fileName: ".env");

  // Initialize ArcGIS
  ArcGISEnvironment.apiKey = Constants.arcgisApiKey;
  AppLogger.info(
    'Initialized ArcGIS: ${Constants.arcgisApiKey}',
    name: 'ARCGIS_API_KEY',
  );

  // Initialize Supabase
  await Supabase.initialize(
    url: Constants.supabaseUrl,
    anonKey: Constants.supabaseAnon,
  );

  // Pre-cache incident symbols trong background (không block UI)
  // Dùng Future.delayed để cho UI render trước
  Future.delayed(const Duration(milliseconds: 500), () {
    IncidentSymbolFactory().preCacheAllSymbols();
  });
}
