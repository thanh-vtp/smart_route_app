import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:smart_route_app/core/errors/failures.dart';
import 'package:smart_route_app/features/map/domain/entities/nearby_place.dart';
import 'package:smart_route_app/features/map/presentation/providers/usecase/use_case_providers.dart';
part 'nearby_places_state.freezed.dart';
part 'nearby_places_state.g.dart';

@freezed
class NearbyPlacesState with _$NearbyPlacesState {
  const factory NearbyPlacesState.initial() = _Initial;

  const factory NearbyPlacesState.loading() = _Loading;

  const factory NearbyPlacesState.loaded({
    required List<NearbyPlace> places,
    required String selectedCategory,
    @Default(false) bool isSearchingMore, // Cho phân trang/load more
  }) = _Loaded;

  const factory NearbyPlacesState.error({
    required Failure failure,
    List<NearbyPlace>? places, // Giữ lại data cũ nếu lỗi khi đang update
  }) = _Error;
}

@riverpod
class NearbyPlacesNotifier extends _$NearbyPlacesNotifier {
  @override
  NearbyPlacesState build() => const NearbyPlacesState.initial();

  Future<void> findNearbyPlaces({
    required double latitude,
    required double longitude,
    String category = '',
    int maxLocations = 10,
    double searchRadius = 1000,
  }) async {
    // 1. Lưu lại data cũ nếu đang ở state loaded để dùng khi cần (ví dụ cho state refreshing)
    final previousPlaces = state.maybeWhen(
      loaded: (places, _, __) => places,
      error: (_, places) => places ?? <NearbyPlace>[],
      orElse: () => <NearbyPlace>[],
    );

    // 2. Chuyển sang loading (nếu chưa có data) hoặc giữ state cũ nhưng hiện hiệu ứng refresh
    if (previousPlaces.isEmpty) {
      state = const NearbyPlacesState.loading();
    }

    final useCase = ref.read(findNearbyPlacesUseCaseProvider);

    final result = await useCase(
      latitude,
      longitude,
      category: category,
      maxLocations: maxLocations,
      searchRadius: searchRadius,
    );

    // 3. Xử lý kết quả Either
    result.fold(
      (failure) {
        state = NearbyPlacesState.error(
          failure: failure,
          places: previousPlaces,
        );
      },
      (places) {
        if (places.isEmpty) {
          // Bạn có thể tạo thêm state .empty() nếu muốn UI hiển thị hình minh họa "Không tìm thấy"
          state = NearbyPlacesState.loaded(
            places: [],
            selectedCategory: category,
          );
        } else {
          state = NearbyPlacesState.loaded(
            places: places,
            selectedCategory: category,
          );
        }
      },
    );
  }

  // Ví dụ: Update category mà không làm mất list hiện tại ngay lập tức
  void updateCategory(String category) {
    state.maybeWhen(
      loaded: (places, _, isSearchingMore) {
        state = NearbyPlacesState.loaded(
          places: places,
          selectedCategory: category,
          isSearchingMore: isSearchingMore,
        );
      },
      orElse: () {},
    );
  }
}

// @riverpod
// class NearbyPlacesState extends _$NearbyPlacesState {
//   @override
//   AsyncValue<List<NearbyPlace>?> build() {
//     return const AsyncValue.data(null);
//   }

//   Future<void> findNearbyPlaces(
//     double latitude,
//     double longitude, {
//     String category = '',
//     int maxLocations = 10,
//     double searchRadius = 1000,
//   }) async {
//     state = const AsyncValue.loading();
//     final useCase = ref.read(findNearbyPlacesUseCaseProvider);

//     final result = await useCase(
//       latitude,
//       longitude,
//       category: category,
//       maxLocations: maxLocations,
//       searchRadius: searchRadius,
//     );

//     result.fold(
//       (error) => state = AsyncValue.error(error, StackTrace.current),
//       (places) => state = AsyncValue.data(places),
//     );
//   }
// }
