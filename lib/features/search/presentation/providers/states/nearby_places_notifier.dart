import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:smart_route_app/features/search/domain/entities/emergency_category.dart';
import 'package:smart_route_app/features/search/domain/usecases/find_near_by_places_usecase.dart';
import 'package:smart_route_app/features/search/presentation/providers/states/nearby_places_state.dart';
import 'package:smart_route_app/features/search/presentation/providers/usecases/use_case_providers.dart';

part 'nearby_places_notifier.g.dart';

@riverpod
class NearbyPlacesNotifier extends _$NearbyPlacesNotifier {
  @override
  NearbyPlacesState build() => const NearbyPlacesState.initial();

  Future<void> findNearbyPlaces({
    required double latitude,
    required double longitude,
  }) async {
    state = const NearbyPlacesState.loading();

    final result = await ref
        .read(findNearbyPlacesUseCaseProvider)
        .call(FindNearbyParams(latitude: latitude, longitude: longitude));

    // 3. Xử lý kết quả Either
    result.fold(
      (failure) {
        state = NearbyPlacesState.error(failure: failure);
      },
      (places) {
        state = NearbyPlacesState.loaded(
          places: places,
          filteredPlaces: places,
          selectedCategory: null,
        );
      },
    );
  }

  void filterByCategory(EmergencyCategory category) {
    state.maybeWhen(
      loaded: (allPlaces, _, __) {
        // Logic lọc: So sánh type của Place với value của Category
        final filtered = allPlaces.where((place) {
          // place.emergencyCategory lấy từ getter bạn đã viết ở bước trước
          return place.emergencyCategory.value == category.value;
        }).toList();

        state = NearbyPlacesState.loaded(
          places: allPlaces,
          filteredPlaces: filtered, // Cập nhật list hiển thị
          selectedCategory: category,
        );
      },
      orElse: () {},
    );
  }

  void clearFilter() {
    state.maybeWhen(
      loaded: (allPlaces, _, __) {
        state = NearbyPlacesState.loaded(
          filteredPlaces: allPlaces,
          selectedCategory: null,
          places: [],
        );
      },
      orElse: () {},
    );
  }
}
