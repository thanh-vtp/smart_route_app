import 'dart:async';

import 'package:arcgis_maps/arcgis_maps.dart';
import 'package:firebase_crashlytics/firebase_crashlytics.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:smart_route_app/core/core.dart';
import 'package:smart_route_app/core/database/cache/map_database.dart';
import 'package:smart_route_app/features/incident/presentation/logics/incident_symbol_factory.dart';
import 'package:smart_route_app/firebase_options.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:firebase_core/firebase_core.dart';

Future<void> initApp() async {
  // Load env file first (required for other initializations)
  await dotenv.load(fileName: ".env");

  // Initialize SQLite database
  try {
    await MapDatabase.instance.database;
    if (kDebugMode) {
      AppLogger.info('SQLite Database initialized', name: 'DATABASE');
    }
  } catch (e) {
    AppLogger.error('Failed to init SQLite', name: 'DATABASE', error: e);
  }

  // Defer ArcGIS initialization to avoid blocking UI thread
  // ArcGIS native libraries are heavy, init after first frame
  _initArcGISDeferred();

  // Initialize Supabase (Auth)
  await Supabase.initialize(
    url: Constants.supabaseUrl,
    anonKey: Constants.supabaseAnon,
  );

  // Initialize Firebase (Crashlytics)
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);

  // Pass all uncaught "fatal" errors from the framework to Crashlytics
  FlutterError.onError = (errorDetails) {
    FirebaseCrashlytics.instance.recordFlutterFatalError(errorDetails);
  };

  // Pass all uncaught asynchronous errors that aren't handled by the Flutter framework to Crashlytics
  // Handle isolate, background errors (for package use native)
  PlatformDispatcher.instance.onError = (error, stack) {
    catchUnhandledExceptions(error, stack);
    return true;
  };
}

/// Initialize ArcGIS after UI is ready to avoid blocking main thread
void _initArcGISDeferred() {
  // Use addPostFrameCallback to ensure UI renders first
  WidgetsBinding.instance.addPostFrameCallback((_) {
    // ArcGISEnvironment.apiKey = Constants.arcgisApiKey;
    if (kDebugMode) {
      AppLogger.info('Initialized ArcGIS API Key', name: 'ARCGIS_API_KEY');
    }

    // Chạy trong tác vụ nhỏ để không chặn quá trình hiển thị khung hình
    // microtask để ưu tiên vẽ xong Frame UI đầu tiên
    Future.microtask(() {
      // Pre-cache Symbols (Vẽ icon từ Asset vào RAM)
      // Chúng ta không await ở đây để App có thể vào Home ngay lập tức
      // Việc vẽ này diễn ra trong background
      IncidentSymbolFactory().preCacheAllSymbols().catchError((e) {
        AppLogger.error('Symbol Pre-cache failed', error: e);
      });
    });
  });
}

void catchUnhandledExceptions(Object error, StackTrace? stack) {
  FirebaseCrashlytics.instance.recordError(error, stack, fatal: true);
  debugPrintStack(stackTrace: stack, label: error.toString());
}
