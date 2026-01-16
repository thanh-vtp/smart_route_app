import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:smart_route_app/features/search/presentation/providers/states/recent_search_state.dart';
import 'package:smart_route_app/features/search/presentation/providers/repositories/repository_providers.dart';

part 'recent_search_notifier.g.dart';

/// Notifier quản lý lịch sử tìm kiếm gần đây
/// Sử dụng GeocodingRepository để lấy data từ geocoding_cache và reverse_geocoding_cache
@riverpod
class RecentSearchNotifier extends _$RecentSearchNotifier {
  @override
  FutureOr<RecentSearchState> build() async {
    // Tự động load lịch sử khi provider được khởi tạo lần đầu
    return _fetchHistory();
  }

  /// Hàm nội bộ để lấy dữ liệu từ GeocodingRepository
  /// Data được lưu từ findAddressCandidates() và reverseGeocode()
  Future<RecentSearchState> _fetchHistory() async {
    state = const AsyncValue.data(RecentSearchState(isLoading: true));

    // Dùng geocodingRepositoryProvider vì search history được lưu qua
    // findAddressCandidates() -> geocoding_cache
    // reverseGeocode() -> reverse_geocoding_cache
    final repository = ref.read(geocodingRepositoryProvider);
    final result = await repository.getRecentSearchHistory();

    return result.fold(
      (failure) => RecentSearchState(
        history: [],
        isLoading: false,
        errorMessage: failure.toString(),
      ),
      (list) => RecentSearchState(history: list, isLoading: false),
    );
  }

  /// Làm mới danh sách (ví dụ sau khi người dùng thực hiện tìm kiếm mới)
  Future<void> refreshHistory() async {
    state = AsyncValue.data(await _fetchHistory());
  }

  /// Xóa toàn bộ lịch sử trong ROM (cả geocoding_cache và reverse_geocoding_cache)
  Future<void> clearAll() async {
    final repository = ref.read(geocodingRepositoryProvider);

    final result = await repository.clearHistory();
    result.fold(
      (failure) {
        // Xử lý lỗi nếu cần (hiển thị thông báo lỗi)
        state = AsyncValue.data(
          state.value!.copyWith(errorMessage: failure.toString()),
        );
      },
      (_) {
        // Xóa thành công, cập nhật lại state rỗng
        state = const AsyncValue.data(RecentSearchState(history: []));
      },
    );
  }
}
