import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:smart_route_app/core/app/message.dart';
import 'package:smart_route_app/features/auth/presentation/pages/login_page.dart';
import 'package:smart_route_app/features/auth/presentation/providers/states/auth.dart';
import 'package:smart_route_app/features/home/presentation/pages/home_page.dart';
import 'package:smart_route_app/features/incident/presentation/widgets/map_bottom_sheet_container.dart';
import 'package:smart_route_app/features/map/presentation/pages/arcgis_demo_page.dart';
import 'package:smart_route_app/features/navigation/presentation/pages/direction_page.dart';
import 'package:smart_route_app/features/search/presentation/pages/search_map_page.dart';

part 'router.g.dart';

@riverpod
GoRouter router(RouterRef ref) {
  // Lắng nghe auth state để redirect
  final authState = ref.watch(authProvider);

  return GoRouter(
    initialLocation: '/',
    redirect: (context, state) {
      final isLoggedIn = authState.isNotEmpty;
      final isGoingToLogin = state.matchedLocation == '/login';

      // Nếu chưa đăng nhập và không đang đi tới login -> redirect đến login
      if (!isLoggedIn && !isGoingToLogin) {
        return '/login';
      }

      // Nếu đã đăng nhập và đang ở login -> redirect về home
      if (isLoggedIn && isGoingToLogin) {
        return '/';
      }

      // Không redirect
      return null;
    },
    errorBuilder: (context, state) => Scaffold(
      backgroundColor: const Color(0xFF121212),
      appBar: AppBar(
        backgroundColor: const Color(0xFF121212),
        title: const Text('Error', style: TextStyle(color: Colors.white)),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Icon(Icons.error_outline, color: Colors.red, size: 64),
            const SizedBox(height: 16),
            const Text(
              'Navigation Error',
              style: TextStyle(color: Colors.white, fontSize: 20),
            ),
            const SizedBox(height: 8),
            Text(
              state.error?.toString() ?? 'Unknown error occurred',
              style: const TextStyle(color: Colors.white70, fontSize: 14),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 24),
            ElevatedButton(
              onPressed: () => context.go('/'),
              child: const Text('Go Home'),
            ),
          ],
        ),
      ),
    ),
    routes: [
      // Login Page
      GoRoute(
        path: '/login',
        name: 'login',
        builder: (context, state) => const LoginPage(),
      ),
      // HomePage - chỉ truy cập được khi đã đăng nhập
      GoRoute(
        path: '/',
        name: HomePage.route,
        builder: (context, state) => const HomePage(),
        routes: [
          // //  Search Page - nested route (nằm dưới HomePage)
          // GoRoute(
          //   path: 'search',
          //   name: 'search',
          //   builder: (context, state) => const SearchMapPage(),
          // ),

          // // Direction Page - nested route (nằm dưới HomePage)
          // GoRoute(
          //   path: 'direction',
          //   name: 'direction',
          //   builder: (context, state) => const DirectionPage(),
          // ),
        ],
      ),

      // ArcGIS Demo Page - standalone route for easy testing (độc lập, không nằm dưới HomePage)
      GoRoute(
        path: '/arcgis-demo',
        name: 'arcgis-demo-standalone',
        builder: (context, state) => const ArcGISDemoPage(),
      ),

      // MapBottomSheetContainer - standalone route
      GoRoute(
        path: '/map-bottom-sheet',
        name: 'map-bottom-sheet-standalone',
        builder: (context, state) => const MapBottomSheetContainer(),
      ),

      //  Search Page - standalone route
      GoRoute(
        path: '/search',
        name: 'search-standalone',
        builder: (context, state) => const SearchMapPage(),
      ),

      // Direction Page - standalone route
      GoRoute(
        path: '/direction',
        name: 'direction-standalone',
        builder: (context, state) => const DirectionPage(),
      ),

      // Message Page
      GoRoute(
        path: '/message',
        name: 'message',
        builder: (context, state) {
          final args = state.extra as MessageArguments?;
          if (args == null) {
            return Scaffold(
              body: const Center(child: Text('Khong có dữ liệu message')),
            );
          }
          return MessageView(args: args);
        },
      ),
    ],
  );
}
