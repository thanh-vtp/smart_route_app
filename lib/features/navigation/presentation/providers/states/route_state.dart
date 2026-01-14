import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:smart_route_app/core/utils/app_logger.dart';
import 'package:smart_route_app/features/navigation/presentation/providers/usecase/use_case_providers.dart';
import 'package:smart_route_app/features/navigation/domain/entities/route_result.dart';
part 'route_state.g.dart';

@Riverpod(keepAlive: true)
class RouteState extends _$RouteState {
  @override
  AsyncValue<RouteResult?> build() {
    return const AsyncValue.data(null);
  }

  Future<void> calculateRoute(List<Map<String, double>> stops) async {
    AppLogger.ui('RouteState: Starting route calculation');
    state = const AsyncValue.loading();
    final useCase = ref.read(calculateRouteUseCaseProvider);

    AppLogger.ui('RouteState: Calling use case');
    final result = await useCase(stops);

    result.fold(
      (error) {
        AppLogger.ui('RouteState: Error - $error');
        state = AsyncValue.error(error, StackTrace.current);
      },
      (route) {
        AppLogger.ui(
          'RouteState: Success - Route: ${route.routeName}, Distance: ${route.totalDistance}m, Time: ${route.totalTime}min',
        );
        state = AsyncValue.data(route);
      },
    );
  }

  void reset() {
    AppLogger.ui('RouteState: Resetting state');
    state = const AsyncValue.data(null);
  }
}
