import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../overlays/route_overlay_controller.dart';
import 'navigation_overlay_provider.dart';
import 'route_overlay_provider.dart';

final routeOverlayControllerProvider = Provider<RouteOverlayController>((ref) {
  return RouteOverlayController(
    routeOverlay: ref.watch(routeOverlayProvider),
    navigationOverlay: ref.watch(navigationOverlayProvider),
  );
});
