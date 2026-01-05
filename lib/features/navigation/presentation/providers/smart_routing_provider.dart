import 'dart:math' as math;
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:smart_route_app/core/utils/app_logger.dart';
import 'package:smart_route_app/features/incident/domain/entities/incident.dart';
import 'package:smart_route_app/features/navigation/domain/entities/route_result.dart';
import 'package:smart_route_app/features/navigation/presentation/providers/usecase/use_case_providers.dart';

part 'smart_routing_provider.g.dart';

/// Provider cho việc bật/tắt smart routing (tránh incidents)
@Riverpod(keepAlive: true)
class SmartRoutingEnabled extends _$SmartRoutingEnabled {
  @override
  bool build() => true; // Mặc định bật

  void toggle() {
    state = !state;
    AppLogger.ui('Smart routing ${state ? 'enabled' : 'disabled'}');
  }

  void enable() => state = true;
  void disable() => state = false;
}

/// ============================================================================
/// SMART ROUTING với Dynamic Weight Adjustment + A* inspired approach
/// ============================================================================
///
/// Chiến lược:
/// 1. Tính route gốc từ ArcGIS
/// 2. Kiểm tra incidents trong bán kính ảnh hưởng của route
/// 3. Nếu có incidents → đánh dấu route này có "penalty cao"
/// 4. Tìm alternative routes bằng cách thêm waypoints offset
/// 5. So sánh và chọn route có tổng cost thấp nhất (distance + time + penalty)
/// ============================================================================

@Riverpod(keepAlive: true)
class SmartRouteState extends _$SmartRouteState {
  /// Bán kính ảnh hưởng của incident (mét)
  static const double _incidentRadiusMeters = 100.0;

  /// Penalty weight cho mỗi incident (tương đương thêm bao nhiêu phút)
  static const double _incidentPenaltyMinutes = 10.0;

  @override
  AsyncValue<SmartRouteResult?> build() => const AsyncValue.data(null);

  /// Calculate smart route với incident avoidance
  Future<void> calculateSmartRoute({
    required List<Map<String, double>> stops,
    required List<Incident> incidents,
  }) async {
    if (stops.length < 2) return;

    state = const AsyncValue.loading();

    try {
      final routeUseCase = ref.read(calculateRouteUseCaseProvider);

      // 1. Tính route gốc
      final baseRouteResult = await routeUseCase(stops);

      final baseRoute = baseRouteResult.fold((failure) {
        state = AsyncValue.error(failure, StackTrace.current);
        return null;
      }, (route) => route);

      if (baseRoute == null) return;

      // 2. Phân tích incidents ảnh hưởng đến route gốc
      final affectedIncidents = _findAffectedIncidents(baseRoute, incidents);

      AppLogger.ui(
        'Base route analysis: ${affectedIncidents.length} incidents affect the route',
      );

      // 3. Nếu không có incidents ảnh hưởng → dùng route gốc
      if (affectedIncidents.isEmpty) {
        state = AsyncValue.data(
          SmartRouteResult(
            selectedRoute: baseRoute,
            originalRoute: baseRoute,
            alternativeRoutes: [],
            affectedIncidents: [],
            allIncidents: incidents,
            isOptimized: false,
            avoidedIncidentsCount: 0,
          ),
        );
        return;
      }

      // 4. Tìm alternative routes
      final alternatives = await _findAlternativeRoutes(
        stops: stops,
        baseRoute: baseRoute,
        incidentsToAvoid: affectedIncidents,
        allIncidents: incidents,
      );

      // 5. Chọn route tốt nhất dựa trên cost function
      final bestRoute = _selectBestRoute(
        baseRoute: baseRoute,
        alternatives: alternatives,
        baseRouteIncidents: affectedIncidents,
        allIncidents: incidents,
      );

      final avoidedCount =
          affectedIncidents.length -
          _findAffectedIncidents(bestRoute.route, incidents).length;

      state = AsyncValue.data(
        SmartRouteResult(
          selectedRoute: bestRoute.route,
          originalRoute: baseRoute,
          alternativeRoutes: alternatives,
          affectedIncidents: affectedIncidents,
          allIncidents: incidents,
          isOptimized: bestRoute.route != baseRoute,
          avoidedIncidentsCount: avoidedCount > 0 ? avoidedCount : 0,
        ),
      );
    } catch (e, st) {
      AppLogger.error(
        'Smart route calculation failed: $e',
        name: 'SmartRouteState',
        error: e,
        stackTrace: st,
      );
      state = AsyncValue.error(e, st);
    }
  }

  /// Tìm incidents nằm trong bán kính ảnh hưởng của route
  List<Incident> _findAffectedIncidents(
    RouteResult route,
    List<Incident> incidents,
  ) {
    final affected = <Incident>[];

    for (final incident in incidents) {
      final incidentLat = double.tryParse(incident.latitude) ?? 0;
      final incidentLon = double.tryParse(incident.longitude) ?? 0;

      if (incidentLat == 0 || incidentLon == 0) continue;

      // Kiểm tra incident có nằm trong bán kính ảnh hưởng của route không
      final isAffecting = _isIncidentAffectingRoute(
        route: route,
        incidentLat: incidentLat,
        incidentLon: incidentLon,
        radiusMeters: _incidentRadiusMeters,
      );

      if (isAffecting) {
        affected.add(incident);
        AppLogger.ui(
          'Incident "${incident.type}" at ($incidentLat, $incidentLon) affects route',
        );
      }
    }

    AppLogger.ui(
      'Total affected incidents: ${affected.length}/${incidents.length}',
    );

    return affected;
  }

  /// Kiểm tra incident có ảnh hưởng đến route không
  /// Sử dụng point-to-polyline distance
  bool _isIncidentAffectingRoute({
    required RouteResult route,
    required double incidentLat,
    required double incidentLon,
    required double radiusMeters,
  }) {
    if (route.routePoints.isEmpty) return false;

    // Duyệt qua từng segment của route
    for (int i = 0; i < route.routePoints.length - 1; i++) {
      final p1 = route.routePoints[i];
      final p2 = route.routePoints[i + 1];

      // Tính khoảng cách từ incident đến segment
      final distance = _pointToSegmentDistance(
        pointLat: incidentLat,
        pointLon: incidentLon,
        segStartLat: p1.latitude,
        segStartLon: p1.longitude,
        segEndLat: p2.latitude,
        segEndLon: p2.longitude,
      );

      if (distance <= radiusMeters) {
        return true;
      }
    }

    return false;
  }

  /// Tính khoảng cách từ điểm đến đoạn thẳng (mét)
  /// Sử dụng công thức Haversine cho độ chính xác
  double _pointToSegmentDistance({
    required double pointLat,
    required double pointLon,
    required double segStartLat,
    required double segStartLon,
    required double segEndLat,
    required double segEndLon,
  }) {
    // Tính khoảng cách đến 2 đầu segment
    final distToStart = _haversineDistance(
      pointLat,
      pointLon,
      segStartLat,
      segStartLon,
    );
    final distToEnd = _haversineDistance(
      pointLat,
      pointLon,
      segEndLat,
      segEndLon,
    );

    // Tính chiều dài segment
    final segmentLength = _haversineDistance(
      segStartLat,
      segStartLon,
      segEndLat,
      segEndLon,
    );

    // Nếu segment quá ngắn, trả về khoảng cách đến điểm gần nhất
    if (segmentLength < 1) {
      return math.min(distToStart, distToEnd);
    }

    // Tính projection của point lên segment
    // Sử dụng dot product để tìm điểm gần nhất trên segment
    final dx = segEndLon - segStartLon;
    final dy = segEndLat - segStartLat;
    final px = pointLon - segStartLon;
    final py = pointLat - segStartLat;

    final dot = px * dx + py * dy;
    final lenSq = dx * dx + dy * dy;
    var t = dot / lenSq;

    // Clamp t to [0, 1] để điểm nằm trên segment
    t = t.clamp(0.0, 1.0);

    // Tính điểm gần nhất trên segment
    final nearestLon = segStartLon + t * dx;
    final nearestLat = segStartLat + t * dy;

    // Trả về khoảng cách từ point đến điểm gần nhất
    return _haversineDistance(pointLat, pointLon, nearestLat, nearestLon);
  }

  /// Haversine formula - tính khoảng cách giữa 2 điểm (mét)
  double _haversineDistance(
    double lat1,
    double lon1,
    double lat2,
    double lon2,
  ) {
    const double earthRadius = 6371000; // mét

    final dLat = _toRadians(lat2 - lat1);
    final dLon = _toRadians(lon2 - lon1);

    final a =
        math.sin(dLat / 2) * math.sin(dLat / 2) +
        math.cos(_toRadians(lat1)) *
            math.cos(_toRadians(lat2)) *
            math.sin(dLon / 2) *
            math.sin(dLon / 2);

    final c = 2 * math.atan2(math.sqrt(a), math.sqrt(1 - a));

    return earthRadius * c;
  }

  double _toRadians(double degrees) => degrees * math.pi / 180;

  /// Tìm alternative routes bằng cách thêm waypoints offset
  /// Chiến lược: Tạo waypoint ở phía đối diện của incidents so với đường thẳng start-end
  Future<List<RouteResult>> _findAlternativeRoutes({
    required List<Map<String, double>> stops,
    required RouteResult baseRoute,
    required List<Incident> incidentsToAvoid,
    required List<Incident> allIncidents,
  }) async {
    final alternatives = <RouteResult>[];
    final routeUseCase = ref.read(calculateRouteUseCaseProvider);

    final startLat = stops.first['latitude']!;
    final startLon = stops.first['longitude']!;
    final endLat = stops.last['latitude']!;
    final endLon = stops.last['longitude']!;

    // Tính midpoint của route
    final midLat = (startLat + endLat) / 2;
    final midLon = (startLon + endLon) / 2;

    // Tính vector perpendicular (vuông góc với đường start-end)
    final routeDirLat = endLat - startLat;
    final routeDirLon = endLon - startLon;
    final routeLength = math.sqrt(
      routeDirLat * routeDirLat + routeDirLon * routeDirLon,
    );

    if (routeLength < 0.0001) return alternatives;

    // Normalize và tạo perpendicular vector
    final perpLat = -routeDirLon / routeLength;
    final perpLon = routeDirLat / routeLength;

    // Các offset distances (độ) - khoảng 300m, 500m, 800m
    final offsetDistances = [0.003, 0.005, 0.008];

    for (final offsetDist in offsetDistances) {
      // Thử cả 2 hướng perpendicular
      for (final direction in [1.0, -1.0]) {
        final waypointLat = midLat + perpLat * offsetDist * direction;
        final waypointLon = midLon + perpLon * offsetDist * direction;

        // Kiểm tra waypoint có xa incidents không
        bool waypointNearIncident = false;
        for (final incident in incidentsToAvoid) {
          final incLat = double.tryParse(incident.latitude) ?? 0;
          final incLon = double.tryParse(incident.longitude) ?? 0;
          final dist = _haversineDistance(
            waypointLat,
            waypointLon,
            incLat,
            incLon,
          );
          if (dist < 200) {
            // Waypoint phải cách incident ít nhất 200m
            waypointNearIncident = true;
            break;
          }
        }

        if (waypointNearIncident) continue;

        // Tạo stops mới với waypoint
        final modifiedStops = [
          stops.first,
          {'latitude': waypointLat, 'longitude': waypointLon},
          stops.last,
        ];

        try {
          final result = await routeUseCase(modifiedStops);

          result.fold(
            (failure) {
              // Bỏ qua route lỗi
            },
            (route) {
              // Kiểm tra route mới có ít incidents hơn không
              final newAffected = _findAffectedIncidents(route, allIncidents);

              AppLogger.ui(
                'Testing alternative: offset=$offsetDist, dir=$direction, '
                'incidents=${newAffected.length} (base=${incidentsToAvoid.length})',
              );

              if (newAffected.length < incidentsToAvoid.length) {
                alternatives.add(route);
                AppLogger.ui(
                  'Found better route: ${newAffected.length} incidents, '
                  '${route.totalDistance}m, ${route.totalTime}min',
                );
              }
            },
          );
        } catch (e) {
          AppLogger.ui('Alternative route failed: $e');
        }
      }

      // Nếu đã tìm được alternative tốt, dừng lại
      if (alternatives.isNotEmpty) break;
    }

    return alternatives;
  }

  /// Chọn route tốt nhất dựa trên cost function
  /// Cost = time + (incidents * penalty)
  _RouteWithCost _selectBestRoute({
    required RouteResult baseRoute,
    required List<RouteResult> alternatives,
    required List<Incident> baseRouteIncidents,
    required List<Incident> allIncidents,
  }) {
    // Tính cost cho base route
    final baseCost = _calculateRouteCost(
      route: baseRoute,
      incidentCount: baseRouteIncidents.length,
    );

    AppLogger.ui(
      'Base route: ${baseRoute.totalDistance}m, ${baseRoute.totalTime}min, '
      '${baseRouteIncidents.length} incidents, cost=$baseCost',
    );

    var bestRoute = baseRoute;
    var bestCost = baseCost;

    // So sánh với alternatives
    for (int i = 0; i < alternatives.length; i++) {
      final alt = alternatives[i];
      final altIncidents = _findAffectedIncidents(alt, allIncidents);
      final altCost = _calculateRouteCost(
        route: alt,
        incidentCount: altIncidents.length,
      );

      AppLogger.ui(
        'Alternative ${i + 1}: ${alt.totalDistance}m, ${alt.totalTime}min, '
        '${altIncidents.length} incidents, cost=$altCost',
      );

      if (altCost < bestCost) {
        bestRoute = alt;
        bestCost = altCost;
        AppLogger.ui('Selected alternative ${i + 1} as best route');
      }
    }

    return _RouteWithCost(route: bestRoute, cost: bestCost);
  }

  /// Tính cost của route
  /// Cost = thời gian thực + (số incidents * penalty)
  double _calculateRouteCost({
    required RouteResult route,
    required int incidentCount,
  }) {
    final timeMinutes = route.totalTime;
    final penalty = incidentCount * _incidentPenaltyMinutes;
    return timeMinutes + penalty;
  }

  void reset() {
    state = const AsyncValue.data(null);
  }
}

/// Helper class
class _RouteWithCost {
  final RouteResult route;
  final double cost;

  _RouteWithCost({required this.route, required this.cost});
}

/// Result class cho smart routing
class SmartRouteResult {
  final RouteResult selectedRoute;
  final RouteResult originalRoute;
  final List<RouteResult> alternativeRoutes;
  final List<Incident> affectedIncidents;
  final List<Incident> allIncidents;
  final bool isOptimized;
  final int avoidedIncidentsCount;

  const SmartRouteResult({
    required this.selectedRoute,
    required this.originalRoute,
    required this.alternativeRoutes,
    required this.affectedIncidents,
    required this.allIncidents,
    required this.isOptimized,
    required this.avoidedIncidentsCount,
  });

  /// Route được sử dụng
  RouteResult get activeRoute => selectedRoute;

  /// Có incidents ảnh hưởng không
  bool get hasAffectedIncidents => affectedIncidents.isNotEmpty;

  /// Thời gian tiết kiệm ước tính (phút)
  double get estimatedTimeSaved {
    if (!isOptimized) return 0;
    // Ước tính mỗi incident gây delay 10 phút
    return avoidedIncidentsCount * 10.0;
  }
}
