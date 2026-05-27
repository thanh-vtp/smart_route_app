import 'package:device_preview/device_preview.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:smart_route_app/core/app/app.dart';
import 'package:smart_route_app/core/app/init.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final container = ProviderContainer();
  await initApp(container);
  runApp(
    UncontrolledProviderScope(
      container: container,
      child: DevicePreview(
        enabled: !kReleaseMode,
        builder: (context) => SmartRouteApp(),
      ),
    ),
  );
}
