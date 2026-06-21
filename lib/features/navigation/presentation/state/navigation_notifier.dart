import 'dart:async';
import 'dart:math' as math;

import 'package:arcgis_maps/arcgis_maps.dart' hide RouteResult;
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:smart_route_app/features/map_drawing/state/location_ui_notifier.dart';
import 'package:smart_route_app/common/app_logger.dart';
import 'package:smart_route_app/features/navigation/domain/entities/route_entity.dart';
import 'package:smart_route_app/features/navigation/presentation/providers/usecase/use_case_providers.dart';
import 'package:smart_route_app/features/navigation/presentation/state/route_notifier.dart';

import 'navigation_state.dart';

final navigationNotifierProvider =
    NotifierProvider<NavigationNotifier, NavigationState>(
      NavigationNotifier.new,
    );

/// ====================================================================
/// NavigationNotifier — điều phối toàn bộ logic Turn-by-Turn Navigation
///
/// Luồng:
///   GPS update (ArcGISLocation)
///     → projectedPoint lên polyline (GeometryEngine.nearestCoordinate)
///     → tính remaining distance (polyline còn lại)
///     → advance step khi gần maneuver (< 30m)
///     → detect off-route (distance > 50m)
///     → auto re-route từ vị trí hiện tại (gọi lại REST API)
/// ====================================================================
class NavigationNotifier extends Notifier<NavigationState> {
  // Khoảng cách (mét) để chuyển sang bước tiếp theo
  static const double _stepAdvanceThreshold = 30.0;

  // Khoảng cách (mét) để xác định lệch tuyến
  static const double _offRouteThreshold = 50.0;

  // Debounce re-routing: tránh gọi API liên tục
  static const Duration _rerouteDebounce = Duration(seconds: 5);

  DateTime? _lastRerouteTime;

  // Polyline hiện tại để tính nearestCoordinate
  Polyline? _routePolyline;

  // Subscription lắng nghe GPS từ locationUiProvider
  StreamSubscription<void>? _locationSubscription;

  @override
  NavigationState build() {
    ref.onDispose(_cleanup);
    return NavigationState.initial();
  }

  // ==========================================================================
  // PUBLIC API
  // ==========================================================================

  /// Bắt đầu phiên dẫn đường với route hiện tại
  void startNavigation({
    required RouteResult route,
    required RoutePoint destination,
  }) {
    _cleanup();

    // Xây dựng polyline từ route points (dùng để project GPS lên)
    _routePolyline = _buildPolyline(route.polylinePoints);

    final initialSession = NavigationSession(
      route: route,
      destination: destination,
      remainingDistanceMeters: route.totalDistanceMeters,
      remainingTimeMinutes: route.totalTimeMinutes,
    );

    state = NavigationState(session: initialSession, isNavigating: true);

    // Bắt đầu lắng nghe GPS qua locationUiProvider
    _startListeningToLocation();

    AppLogger.info(
      'Navigation started: ${route.directions.length} steps, '
      '${route.formattedDistance}',
      name: 'NavigationNotifier',
    );
  }

  /// Dừng dẫn đường
  void stopNavigation() {
    _cleanup();
    state = NavigationState.initial();
    AppLogger.info('Navigation stopped', name: 'NavigationNotifier');
  }

  // ==========================================================================
  // GPS TRACKING
  // ==========================================================================

  void _startListeningToLocation() {
    // Listen trực tiếp vào locationUiProvider qua ref.listen
    // Cần dùng periodic timer vì locationUiProvider không phải Stream
    // Thay vào đó, ta override và listen state changes
    _locationSubscription?.cancel();

    // Lắng nghe locationUiProvider bằng cách poll mỗi khi state thay đổi
    // Ta dùng ref.listen trong notifier
    ref.listen(locationUiProvider, (previous, next) {
      final location = next.location;
      if (location == null) return;
      if (!state.isNavigating) return;
      _onLocationUpdated(location);
    });
  }

  void _onLocationUpdated(ArcGISLocation location) {
    final session = state.session;
    if (session == null || _routePolyline == null) return;

    // Normalize về WGS84 2D để tránh lỗi "vertical coordinate systems not equivalent"
    // GPS từ SystemLocationDataSource có thể mang z-coordinate (3D SR)
    // Polyline được build với SpatialReference.wgs84 (2D) — phải cùng SR
    final rawPoint = location.position;
    final currentPoint = ArcGISPoint(
      x: rawPoint.x,
      y: rawPoint.y,
      spatialReference: SpatialReference.wgs84,
    );

    // 1. Project GPS lên polyline → tìm điểm gần nhất
    final nearestResult = GeometryEngine.nearestCoordinate(
      geometry: _routePolyline!,
      point: currentPoint,
    );

    if (nearestResult == null) return;

    final nearestPoint = nearestResult.coordinate;

    // 2. Khoảng cách từ GPS đến polyline (mét)
    final distanceToRoute = _haversineDistance(
      currentPoint.y,
      currentPoint.x,
      nearestPoint.y,
      nearestPoint.x,
    );

    // 3. Tính remaining distance = khoảng cách từ nearestPoint đến cuối route
    final remaining = _calculateRemainingDistance(
      session.route.polylinePoints,
      nearestResult.partIndex,
      nearestResult.pointIndex,
      nearestPoint,
    );

    // 4. Ước tính thời gian còn lại theo tỉ lệ remaining/total
    final totalDist = session.route.totalDistanceMeters;
    final progressRatio = totalDist > 0
        ? (1.0 - (remaining / totalDist)).clamp(0.0, 1.0)
        : 0.0;
    final remainingTime =
        session.route.totalTimeMinutes * (1.0 - progressRatio);

    // 5. Detect off-route
    final isOffRoute = distanceToRoute > _offRouteThreshold;

    // 6. Advance step nếu gần maneuver
    final newStepIndex = _computeCurrentStepIndex(
      session: session,
      currentPoint: currentPoint,
    );

    // 7. Cập nhật state
    final updatedSession = session.copyWith(
      currentDirectionIndex: newStepIndex,
      remainingDistanceMeters: remaining,
      remainingTimeMinutes: remainingTime,
      isOffRoute: isOffRoute,
    );

    state = state.copyWith(session: updatedSession, clearError: true);

    // 8. Kích hoạt re-routing nếu lệch tuyến
    if (isOffRoute && !session.isRerouting) {
      _triggerReroute(
        currentPoint: currentPoint,
        destination: session.destination,
      );
    }
  }

  // ==========================================================================
  // STEP TRACKING
  // ==========================================================================

  /// Xác định bước chỉ đường hiện tại dựa trên vị trí GPS
  int _computeCurrentStepIndex({
    required NavigationSession session,
    required ArcGISPoint currentPoint,
  }) {
    final directions = session.route.directions;
    if (directions.isEmpty) return 0;

    // Lấy các polyline points và map chúng theo accumulated distance
    final points = session.route.polylinePoints;
    if (points.isEmpty) return session.currentDirectionIndex;

    // Tính accumulated distance theo polyline
    final accumulatedDistances = _computeAccumulatedDistances(points);

    // Tìm điểm gần nhất trên polyline với GPS hiện tại
    final nearestResult = GeometryEngine.nearestCoordinate(
      geometry: _routePolyline!,
      point: currentPoint,
    );
    if (nearestResult == null) return session.currentDirectionIndex;

    // Tính khoảng cách đã đi (đến nearest point)
    final traveledDist = _distanceTraveledToPoint(
      points: points,
      accumulatedDistances: accumulatedDistances,
      partIndex: nearestResult.partIndex,
      pointIndex: nearestResult.pointIndex,
      nearestCoord: nearestResult.coordinate,
    );

    // Tính accumulated distance per direction step
    double stepAccum = 0;
    for (int i = 0; i < directions.length; i++) {
      stepAccum += directions[i].distanceMeters;
      // Tới điểm advance threshold trước điểm cuối step → chuyển step
      if (traveledDist < stepAccum - _stepAdvanceThreshold) {
        // Không nên đi lui các step đã qua
        return math.max(session.currentDirectionIndex, i);
      }
    }

    return directions.length - 1;
  }

  // ==========================================================================
  // AUTO RE-ROUTING
  // ==========================================================================

  void _triggerReroute({
    required ArcGISPoint currentPoint,
    required RoutePoint destination,
  }) {
    // Debounce: không re-route quá thường xuyên
    final now = DateTime.now();
    if (_lastRerouteTime != null &&
        now.difference(_lastRerouteTime!) < _rerouteDebounce) {
      return;
    }
    _lastRerouteTime = now;

    AppLogger.info(
      'Off-route detected — triggering re-route from current GPS',
      name: 'NavigationNotifier',
    );

    // Mark session as rerouting
    final session = state.session;
    if (session == null) return;
    state = state.copyWith(
      session: session.copyWith(isRerouting: true, isOffRoute: true),
    );

    // Gọi calculateAlternativeRoutes với start = vị trí GPS hiện tại
    _performReroute(
      currentLat: currentPoint.y,
      currentLng: currentPoint.x,
      destination: destination,
    );
  }

  Future<void> _performReroute({
    required double currentLat,
    required double currentLng,
    required RoutePoint destination,
  }) async {
    try {
      final useCase = ref.read(calculateRouteUseCaseProvider);

      final result = await useCase(
        stops: [
          RoutePoint(lat: currentLat, lng: currentLng),
          destination,
        ],
        avoidIncidents: true,
      );

      result.fold(
        (failure) {
          AppLogger.warning(
            'Re-routing failed: ${failure.message}',
            name: 'NavigationNotifier',
          );

          final session = state.session;
          if (session != null) {
            state = state.copyWith(
              session: session.copyWith(isRerouting: false),
              errorMessage: 'Không thể tính lại đường: ${failure.message}',
            );
          }
        },
        (newRoute) {
          AppLogger.info(
            'Re-routing success: ${newRoute.formattedDistance}, '
            '${newRoute.formattedTime}',
            name: 'NavigationNotifier',
          );

          // Cập nhật route mới vào routeNotifier để map vẽ lại
          ref
              .read(routeNotifierProvider.notifier)
              .updateRouteForNavigation(newRoute);

          // Cập nhật session với route mới
          _routePolyline = _buildPolyline(newRoute.polylinePoints);

          final session = state.session;
          if (session == null) return;

          final newSession = NavigationSession(
            route: newRoute,
            destination: session.destination,
            currentDirectionIndex: 0,
            remainingDistanceMeters: newRoute.totalDistanceMeters,
            remainingTimeMinutes: newRoute.totalTimeMinutes,
            isOffRoute: false,
            isRerouting: false,
          );

          state = state.copyWith(session: newSession, clearError: true);
        },
      );
    } catch (e) {
      AppLogger.error(
        'Re-routing exception: $e',
        name: 'NavigationNotifier',
        error: e,
      );

      final session = state.session;
      if (session != null) {
        state = state.copyWith(
          session: session.copyWith(isRerouting: false),
          errorMessage: 'Lỗi khi tính lại đường',
        );
      }
    }
  }

  // ==========================================================================
  // GEOMETRY HELPERS
  // ==========================================================================

  Polyline _buildPolyline(List<RoutePoint> points) {
    final builder = PolylineBuilder(spatialReference: SpatialReference.wgs84);
    for (final point in points) {
      builder.addPoint(ArcGISPoint(x: point.lng, y: point.lat));
    }
    return builder.toGeometry() as Polyline;
  }

  /// Tính khoảng cách còn lại từ nearestPoint đến cuối route (mét)
  double _calculateRemainingDistance(
    List<RoutePoint> points,
    int partIndex,
    int pointIndex,
    ArcGISPoint nearestCoord,
  ) {
    if (points.isEmpty) return 0;

    double remaining = 0;

    // Khoảng cách từ nearestCoord đến điểm tiếp theo
    if (pointIndex < points.length - 1) {
      final nextPoint = points[pointIndex + 1];
      remaining += _haversineDistance(
        nearestCoord.y,
        nearestCoord.x,
        nextPoint.lat,
        nextPoint.lng,
      );
    }

    // Cộng tất cả segments còn lại
    for (int i = pointIndex + 1; i < points.length - 1; i++) {
      remaining += _haversineDistance(
        points[i].lat,
        points[i].lng,
        points[i + 1].lat,
        points[i + 1].lng,
      );
    }

    return remaining;
  }

  /// Tính accumulated distances tại mỗi điểm của polyline
  List<double> _computeAccumulatedDistances(List<RoutePoint> points) {
    final result = <double>[0.0];
    for (int i = 1; i < points.length; i++) {
      final dist = _haversineDistance(
        points[i - 1].lat,
        points[i - 1].lng,
        points[i].lat,
        points[i].lng,
      );
      result.add(result.last + dist);
    }
    return result;
  }

  /// Tính khoảng cách đã đi đến nearestCoord
  double _distanceTraveledToPoint({
    required List<RoutePoint> points,
    required List<double> accumulatedDistances,
    required int partIndex,
    required int pointIndex,
    required ArcGISPoint nearestCoord,
  }) {
    if (pointIndex >= points.length) return accumulatedDistances.last;

    // Lấy accumulated distance tại pointIndex
    final baseDistance = accumulatedDistances[pointIndex];

    // Thêm khoảng cách từ điểm đó đến nearestCoord
    final extraDistance = _haversineDistance(
      points[pointIndex].lat,
      points[pointIndex].lng,
      nearestCoord.y,
      nearestCoord.x,
    );

    return baseDistance + extraDistance;
  }

  /// Haversine formula — tính khoảng cách giữa 2 tọa độ WGS84 (trả về mét)
  double _haversineDistance(
    double lat1,
    double lon1,
    double lat2,
    double lon2,
  ) {
    const earthRadius = 6371000.0; // mét
    final dLat = _toRad(lat2 - lat1);
    final dLon = _toRad(lon2 - lon1);
    final a =
        math.sin(dLat / 2) * math.sin(dLat / 2) +
        math.cos(_toRad(lat1)) *
            math.cos(_toRad(lat2)) *
            math.sin(dLon / 2) *
            math.sin(dLon / 2);
    final c = 2 * math.atan2(math.sqrt(a), math.sqrt(1 - a));
    return earthRadius * c;
  }

  double _toRad(double deg) => deg * math.pi / 180;

  // ==========================================================================
  // CLEANUP
  // ==========================================================================

  void _cleanup() {
    _locationSubscription?.cancel();
    _locationSubscription = null;
    _routePolyline = null;
    _lastRerouteTime = null;
  }
}
