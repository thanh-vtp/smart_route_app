import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:smart_route_app/features/navigation/presentation/providers/repositories/repository_providers.dart';
import 'package:smart_route_app/features/navigation/presentation/providers/states/recent_search_state.dart';

part 'recent_search_notifier.g.dart';

@riverpod
class RecentSearchNotifier extends _$RecentSearchNotifier {
  @override
  FutureOr<RecentSearchState> build() async {
    // Tự động load lịch sử khi provider được khởi tạo lần đầu
    return _fetchHistory();
  }

  /// Hàm nội bộ để lấy dữ liệu từ Repository
  Future<RecentSearchState> _fetchHistory() async {
    state = const AsyncValue.data(RecentSearchState(isLoading: true));

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

  /// Xóa toàn bộ lịch sử trong ROM
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
