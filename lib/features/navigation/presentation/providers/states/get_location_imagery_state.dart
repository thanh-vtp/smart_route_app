import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:smart_route_app/core/utils/app_logger.dart';
import 'package:smart_route_app/features/navigation/domain/entities/location_imagery.dart';
import 'package:smart_route_app/features/navigation/presentation/providers/usecase/use_case_providers.dart';

part 'get_location_imagery_state.g.dart';

@riverpod
class LocationImageryState extends _$LocationImageryState {
  @override
  AsyncValue<LocationImagery?> build() {
    return const AsyncValue.data(null);
  }

  Future<void> getLocationImagery(
    double latitude,
    double longitude, {
    int width = 400,
    int height = 400,
    int zoomLevel = 15,
  }) async {
    AppLogger.ui(
      'LocationImageryState.getLocationImagery called with lat: $latitude, lon: $longitude',
    );
    state = const AsyncValue.loading();

    try {
      final useCase = ref.read(getLocationImageryUseCaseProvider);
      // AppLogger.ui('Got useCase: $useCase');

      final result = await useCase(
        latitude,
        longitude,
        width: width,
        height: height,
        zoomLevel: zoomLevel,
      );
      // AppLogger.ui('UseCase result: $result');

      result.fold(
        (error) {
          AppLogger.ui('Error: $error');
          state = AsyncValue.error(error, StackTrace.current);
        },
        (imagery) {
          AppLogger.ui(
            'Success: imagery size ${imagery.imageData.length} bytes',
          );
          state = AsyncValue.data(imagery);
        },
      );
    } catch (e, stackTrace) {
      AppLogger.ui('Exception: $e');
      AppLogger.ui('StackTrace: $stackTrace');
      state = AsyncValue.error(e, stackTrace);
    }
  }
}
