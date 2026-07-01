import 'package:device_preview/device_preview.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:smart_route_app/core/app/app.dart';
import 'package:smart_route_app/core/app/init.dart';
import 'package:smart_route_app/common/theme/theme_repository.dart';
import 'package:smart_route_app/common/theme/theme_provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  // Initialize SharedPreferences for theme
  final prefs = await SharedPreferences.getInstance();

  final container = ProviderContainer(
    overrides: [
      // Override themeRepositoryProvider với instance thực
      themeRepositoryProvider.overrideWithValue(ThemeRepository(prefs)),
    ],
  );

  await initApp(container);

  runApp(
    UncontrolledProviderScope(
      container: container,
      child: DevicePreview(
        enabled: false,
        builder: (context) => SmartRouteApp(),
      ),
    ),
  );
}
