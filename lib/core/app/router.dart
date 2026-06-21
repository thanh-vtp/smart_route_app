import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:smart_route_app/features/search/domain/entities/address_result.dart';
import 'package:smart_route_app/features/analytics/presentation/screens/analytics_screen.dart';
import 'package:smart_route_app/features/auth/presentation/screens/auth_screen.dart';
import 'package:smart_route_app/features/auth/domain/entities/app_user.dart';
import 'package:smart_route_app/features/auth/presentation/auth_session_provider.dart';
import 'package:smart_route_app/features/profile/presentation/screens/account_management_screen.dart';
import 'package:smart_route_app/main_map_view.dart';
import 'package:smart_route_app/main_scaffold.dart';
import 'package:smart_route_app/notification_screen.dart';
import 'package:smart_route_app/route_setup_screen.dart';
import 'package:smart_route_app/search_screen.dart';
import 'package:smart_route_app/splash_screen.dart';

part 'router.g.dart';

class AppRoutes {
  static const String splash = '/splash';
  static const String login = '/login';
  static const String explore = '/explore';
  static const String search = 'search';
  static const String notifications = '/notifications';
  static const String reports = '/reports';
  static const String savedPlaces = '/saved-places';
  static const String account = 'account';
}

final _rootNavigatorKey = GlobalKey<NavigatorState>(debugLabel: 'root');

@riverpod
GoRouter router(Ref ref) {
  // Dùng ValueNotifier + refreshListenable thay vì ref.watch để tránh
  // GoRouter bị recreate mỗi khi Riverpod rebuild (keyboard insets,
  // MediaQuery, v.v.). GoRouter chỉ re-evaluate redirect khi login status
  // thực sự thay đổi.
  final authStateListener = ValueNotifier<AsyncValue<AppUser>>(
    ref.read(authSessionProvider),
  );

  // Guard: chỉ notify GoRouter khi login/loading status thực sự thay đổi,
  // không notify mỗi lần Supabase stream emit heartbeat/session refresh.
  ref.listen<AsyncValue<AppUser>>(authSessionProvider, (previous, next) {
    final prevUserId = previous?.asData?.value.id ?? '';
    final nextUserId = next.asData?.value.id ?? '';
    final prevLoading = previous?.isLoading ?? true;
    final nextLoading = next.isLoading;
    final prevHasError = previous?.hasError ?? false;
    final nextHasError = next.hasError;

    // Chỉ notify khi user id, loading, hoặc error state thực sự thay đổi
    if (prevUserId != nextUserId ||
        prevLoading != nextLoading ||
        prevHasError != nextHasError) {
      authStateListener.value = next;
    }
  });

  ref.onDispose(authStateListener.dispose);

  return GoRouter(
    debugLogDiagnostics: true,
    initialLocation: AppRoutes.explore,
    navigatorKey: _rootNavigatorKey,
    refreshListenable: authStateListener,
    redirect: (context, state) {
      final authState = authStateListener.value;

      if (authState.isLoading) {
        return AppRoutes.splash;
      }

      if (authState.hasError) {
        return AppRoutes.login;
      }

      final user = authState.asData?.value ?? AppUser.empty();
      final isLoggedIn = user.isNotEmpty;

      final isGoingToLogin = state.matchedLocation == AppRoutes.login;
      final isGoingToSplash = state.matchedLocation == AppRoutes.splash;

      if (!isLoggedIn) {
        if (isGoingToLogin) return null;
        return AppRoutes.login;
      }

      if (isLoggedIn && (isGoingToLogin || isGoingToSplash)) {
        return AppRoutes.explore;
      }

      return null;
    },
    errorBuilder: (context, state) {
      debugPrint('========== GoRouter Error ==========');
      debugPrint('Location: ${state.uri}');
      debugPrint('Error: ${state.error}');
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
                onPressed: () => context.go(AppRoutes.explore),
                child: const Text('Go Home'),
              ),
            ],
          ),
        ),
      );
    },
    routes: [
      GoRoute(
        path: AppRoutes.splash,
        builder: (context, state) => const SplashScreen(),
      ),

      GoRoute(
        path: AppRoutes.login,
        builder: (context, state) => const AuthScreen(),
      ),

      // StatefulShellRoute giữ state của từng branch khi chuyển tab.
      // Search và route-setup là modal sheet — không push route nữa,
      // nên các route này chỉ là fallback (vd: deep link).
      StatefulShellRoute.indexedStack(
        builder: (context, state, navigationShell) {
          return MainScaffold(navigationShell: navigationShell);
        },
        branches: [
          StatefulShellBranch(
            routes: [
              GoRoute(
                path: AppRoutes.explore,
                builder: (context, state) => const MainMapView(),
                routes: [
                  // Không dùng parentNavigatorKey: _rootNavigatorKey —
                  // giữ PlatformView (ArcGIS map) sống trong background.
                  GoRoute(
                    path: 'search',
                    builder: (context, state) => const SearchScreen(),
                  ),
                  GoRoute(
                    path: 'route-setup',
                    name: 'go',
                    builder: (context, state) {
                      final destination = state.extra as AddressResult?;
                      return RouteSetupScreen(initialDestination: destination);
                    },
                  ),
                ],
              ),
            ],
          ),

          StatefulShellBranch(
            routes: [
              GoRoute(
                path: AppRoutes.reports,
                builder: (context, state) => const AnalyticsScreen(),
                routes: [
                  GoRoute(
                    path: AppRoutes.account,
                    parentNavigatorKey: _rootNavigatorKey,
                    builder: (context, state) =>
                        const AccountManagementScreen(),
                  ),
                ],
              ),
            ],
          ),

          StatefulShellBranch(
            routes: [
              GoRoute(
                path: '/notifications',
                builder: (context, state) => const NotificationScreen(),
              ),
            ],
          ),
        ],
      ),
    ],
  );
}
