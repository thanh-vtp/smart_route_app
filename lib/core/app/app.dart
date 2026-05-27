import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:smart_route_app/app_theme.dart';
import 'package:smart_route_app/core/app/router.dart';

class SmartRouteApp extends ConsumerWidget {
  const SmartRouteApp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final router = ref.watch(routerProvider);

    return MaterialApp.router(
      title: 'Smart Route App',
      theme: AppTheme.lightTheme,
      debugShowCheckedModeBanner: false,
      // routeInformationParser: router.routeInformationParser,
      // routerDelegate: router.routerDelegate,
      // routeInformationProvider: router.routeInformationProvider,
      routerConfig: router, // Cấu hình router trực tiếp
    );
  }
}
