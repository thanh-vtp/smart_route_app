import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:smart_route_app/active_navigation_screen.dart';
import 'package:smart_route_app/core/common/domain/entities/address_result.dart';
import 'package:smart_route_app/features/analytics/presentation/screens/analytics_screen.dart';
import 'package:smart_route_app/features/auth/presentation/screens/auth_screen.dart';
import 'package:smart_route_app/core/app/message.dart';
import 'package:smart_route_app/features/auth/domain/entities/app_user.dart';
import 'package:smart_route_app/features/auth/presentation/auth_session_provider.dart';
import 'package:smart_route_app/main_map_view.dart';
import 'package:smart_route_app/main_scaffold.dart';
import 'package:smart_route_app/notification_screen.dart';
import 'package:smart_route_app/route_setup_screen.dart';
import 'package:smart_route_app/saved_places_screen.dart';
import 'package:smart_route_app/search_screen.dart';
import 'package:smart_route_app/splash_screen.dart';

part 'router.g.dart';

class AppRoutes {
  static const String splash = '/splash';
  static const String login = '/login';
  static const String explore = '/explore';
  static const String search = 'search';
  static const String notifications = 'notifications';
  static const String reports = '/reports';
  static const String savedPlaces = '/saved-places';
}

final _rootNavigatorKey = GlobalKey<NavigatorState>(debugLabel: 'root');

@riverpod
GoRouter router(Ref ref) {
  // Lắng nghe auth state để redirect
  final authState = ref.watch(authSessionProvider);

  return GoRouter(
    debugLogDiagnostics: true,
    initialLocation: AppRoutes.explore, // '/explore',
    navigatorKey: _rootNavigatorKey,
    redirect: (context, state) {
      if (authState.isLoading) {
        return AppRoutes.splash; // '/splash';
      }

      if (authState.hasError) {
        return AppRoutes.login; // '/login';
      }

      final user = authState.asData?.value ?? AppUser.empty();

      final isLoggedIn = user.isNotEmpty;

      // Current Route
      final isGoingToLogin =
          state.matchedLocation == AppRoutes.login; // '/login';

      final isGoingToSplash =
          state.matchedLocation == AppRoutes.splash; // '/splash';

      // Nếu chưa đăng nhập và không đang đi tới login -> redirect đến login
      if (!isLoggedIn) {
        // cho phép vào login
        if (isGoingToLogin) {
          return null;
        }
        return AppRoutes.login; // '/login';
      }

      // Nếu đã đăng nhập và đang ở login -> redirect về main
      if (isLoggedIn && (isGoingToLogin || isGoingToSplash)) {
        return AppRoutes.explore; // '/explore';
      }

      // Không redirect
      return null;
    },
    errorBuilder: (context, state) {
      debugPrint('========== GoRouter Error ==========');
      debugPrint('Location: ${state.uri}');
      debugPrint('Matched Location: ${state.matchedLocation}');
      debugPrint('Full Path: ${state.fullPath}');
      debugPrint('Name: ${state.name}');
      debugPrint('Path Parameters: ${state.pathParameters}');
      debugPrint('Extra: ${state.extra}');
      debugPrint('Error: ${state.error}');
      debugPrint(
        'StackTrace: ${state.error is Error ? (state.error as Error).stackTrace : 'No stack trace'}',
      );
      debugPrint('====================================');
      return Scaffold(
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
                state.error?.toString() ??
                    '[LỖI] Không xác định trong điều hướng',
                style: const TextStyle(color: Colors.white70, fontSize: 14),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 24),
              ElevatedButton(
                onPressed: () => context.go(AppRoutes.explore), // '/explore',
                child: const Text('Go Home'),
              ),
            ],
          ),
        ),
      );
    },

    routes: [
      GoRoute(
        path: AppRoutes.splash, // '/splash',
        builder: (context, state) {
          return const SplashScreen();
        },
      ),

      GoRoute(
        path: AppRoutes.login, // '/login',
        builder: (context, state) => const AuthScreen(),
      ),

      // Sử dụng StatefulShellRoute để giữ trạng thái của MainMapView khi điều hướng đến SearchScreen hoặc NotificationScreen
      StatefulShellRoute.indexedStack(
        builder: (context, state, navigationShell) {
          return MainScaffold(navigationShell: navigationShell);
        },
        branches: [
          StatefulShellBranch(
            routes: [
              GoRoute(
                path: AppRoutes.explore, // '/explore',
                builder: (context, state) => const MainMapView(),
                routes: [
                  // TODO: Trong GoRouter, route con (routes: []) KHÔNG được dùng full path.
                  GoRoute(
                    path: 'search',
                    parentNavigatorKey: _rootNavigatorKey,
                    builder: (context, state) => const SearchScreen(),
                  ),

                  GoRoute(
                    path: 'notifications',
                    parentNavigatorKey: _rootNavigatorKey,
                    builder: (context, state) => const NotificationScreen(),
                  ),

                  GoRoute(
                    path: 'route-setup',
                    parentNavigatorKey: _rootNavigatorKey,
                    name: 'go',
                    builder: (context, state) {
                      final destination = state.extra as AddressResult?;
                      return RouteSetupScreen(initialDestination: destination);
                    },
                  ),

                  GoRoute(
                    path: 'active-navigation',
                    parentNavigatorKey: _rootNavigatorKey,
                    builder: (context, state) => const ActiveNavigationScreen(),
                  ),
                ],
              ),
            ],
          ),

          StatefulShellBranch(
            routes: [
              GoRoute(
                path: AppRoutes.reports, // '/reports',
                builder: (context, state) => const AnalyticsScreen(),
              ),
            ],
          ),

          StatefulShellBranch(
            routes: [
              GoRoute(
                path: AppRoutes.savedPlaces, // '/saved-places',
                builder: (context, state) => const SavedPlacesScreen(),
              ),
            ],
          ),
        ],
      ),

      // Message Page
      GoRoute(
        path: '/message',
        name: 'message',
        parentNavigatorKey: _rootNavigatorKey,
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
