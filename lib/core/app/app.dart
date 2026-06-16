import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:smart_route_app/app_theme.dart';
import 'package:smart_route_app/core/app/router.dart';
import 'package:smart_route_app/core/common/provider/theme_provider.dart';

class SmartRouteApp extends ConsumerWidget {
  const SmartRouteApp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final router = ref.watch(routerProvider);
    final themeMode = ref.watch(themeNotifierProvider);

    return MaterialApp.router(
      title: 'Smart Route App',
      theme: AppTheme.lightTheme,
      darkTheme: AppTheme.darkTheme,
      themeMode: themeMode, // Sử dụng theme mode từ provider
      debugShowCheckedModeBanner: false,
      // routeInformationParser: router.routeInformationParser,
      // routerDelegate: router.routerDelegate,
      // routeInformationProvider: router.routeInformationProvider,
      routerConfig: router, // Cấu hình router trực tiếp
    );
  }
}
