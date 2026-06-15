import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:smart_route_app/core/utils/app_logger.dart';
import 'package:smart_route_app/features/navigation/domain/entities/route_entity.dart';
import 'package:smart_route_app/features/navigation/presentation/providers/usecase/use_case_providers.dart';
import 'route_state.dart';

part 'route_notifier.g.dart';

@riverpod
class RouteNotifier extends _$RouteNotifier {
  @override
  RouteState build() {
    return const RouteState();
  }

  /// Hàm tính toán đường đi
  Future<void> calculateRoute({
    required double startLat,
    required double startLng,
    required double endLat,
    required double endLng,
    bool avoidIncidents = true, // Mặc định bật chế độ né sự cố
    String? impedanceAttribute,
  }) async {
    state = state.copyWith(
      isCalculating: true,
      errorMessage: null,
      routeResult: null,
    );

    final calculateRouteUsecase = ref.read(calculateRouteUseCaseProvider);

    // Gói 2 điểm thành mảng truyền cho UseCase
    final stops = [
      RoutePoint(lat: startLat, lng: startLng),
      RoutePoint(lat: endLat, lng: endLng),
    ];

    final result = await calculateRouteUsecase(
      stops: stops,
      avoidIncidents: avoidIncidents,
      impedanceAttribute: impedanceAttribute,
    );

    result.fold(
      (failure) {
        state = state.copyWith(
          isCalculating: false,
          errorMessage: failure.message,
        );
      },
      (routeResult) {
        state = state.copyWith(isCalculating: false, routeResult: routeResult);
      },
    );
  }

  /// Hàm tính toán nhiều lộ trình thay thế
  Future<void> calculateAlternativeRoutes({
    required double startLat,
    required double startLng,
    required double endLat,
    required double endLng,
  }) async {
    state = state.copyWith(
      isCalculatingAlternatives: true,
      errorMessage: null,
      alternativeRoutesResult: null,
      selectedStrategy: null,
    );

    final calculateAlternativeRoutesUsecase = ref.read(
      calculateAlternativeRoutesUseCaseProvider,
    );

    final stops = [
      RoutePoint(lat: startLat, lng: startLng),
      RoutePoint(lat: endLat, lng: endLng),
    ];

    final result = await calculateAlternativeRoutesUsecase(stops: stops);

    result.fold(
      (failure) {
        AppLogger.error(
          'Failed to calculate alternative routes: ${failure.message}',
          name: 'RouteNotifier',
        );

        state = state.copyWith(
          isCalculatingAlternatives: false,
          errorMessage: failure.message,
        );
      },
      (alternativeRoutesResult) {
        AppLogger.info(
          'Alternative routes calculated: ${alternativeRoutesResult.totalRoutes} routes',
          name: 'RouteNotifier',
        );

        state = state.copyWith(
          isCalculatingAlternatives: false,
          alternativeRoutesResult: alternativeRoutesResult,
          routeResult: alternativeRoutesResult.recommendedRoute,
          selectedStrategy: RouteStrategy.balanced,
        );
      },
    );
  }

  /// Chọn một route alternative
  void selectAlternativeRoute(RouteStrategy strategy) {
    final alternatives = state.alternativeRoutesResult;
    if (alternatives == null) return;

    RouteResult? selectedRoute;

    if (strategy == RouteStrategy.balanced) {
      selectedRoute = alternatives.recommendedRoute;
    } else {
      final alternative = alternatives.alternatives.firstWhere(
        (alt) => alt.strategy == strategy,
        orElse: () => alternatives.alternatives.first,
      );
      selectedRoute = alternative.route;
    }

    state = state.copyWith(
      routeResult: selectedRoute,
      selectedStrategy: strategy,
    );

    AppLogger.info(
      'Selected route strategy: ${strategy.name}',
      name: 'RouteNotifier',
    );
  }

  /// Cập nhật route sau khi re-routing (từ NavigationNotifier)
  /// Giữ nguyên các field khác, chỉ update routeResult mới
  void updateRouteForNavigation(RouteResult newRoute) {
    state = state.copyWith(
      routeResult: newRoute,
      isCalculating: false,
      errorMessage: null,
    );
  }

  /// Hàm xóa tuyến đường hiện tại
  void clearRoute() {
    state = const RouteState();
  }
}
