import 'package:riverpod_annotation/riverpod_annotation.dart';
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

  /// Hàm xóa tuyến đường hiện tại
  void clearRoute() {
    state = const RouteState();
  }
}
