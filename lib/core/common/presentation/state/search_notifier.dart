import 'dart:async';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:smart_route_app/core/common/presentation/providers/repositories/repository_providers.dart';
import 'package:smart_route_app/core/common/presentation/providers/usecases/use_case_providers.dart';
import 'search_state.dart';

part 'search_notifier.g.dart';

@riverpod
class SearchNotifier extends _$SearchNotifier {
  Timer? _debounceTimer;

  @override
  SearchState build() {
    // Hủy timer khi Notifier bị dispose để tránh rò rỉ bộ nhớ
    ref.onDispose(() {
      _debounceTimer?.cancel();
    });

    // Tự động load lịch sử ngay khi mở màn hình
    Future.microtask(() => _loadHistory());

    return const SearchState();
  }

  Future<void> _loadHistory() async {
    final geocodingRepo = ref.read(geocodingRepositoryProvider);
    // final result = await geocodingRepo.getRecentSearchHistory();

    // result.fold(
    //   (fail) => null, // Lỗi lịch sử thì bỏ qua
    //   (history) => state = state.copyWith(historyResults: history),
    // );
  }

  /// Hàm này được gọi mỗi khi User gõ một ký tự vào TextField
  void onSearchQueryChanged(String query) {
    // 1. Nếu text rỗng, xóa kết quả ngay lập tức
    if (query.trim().isEmpty) {
      _debounceTimer?.cancel();
      state = state.copyWith(
        query: '',
        isLoading: false,
        results: [],
        errorMessage: null,
      );
      return;
    }

    // Cập nhật text đang gõ và bật loading (nhưng chưa gọi API)
    state = state.copyWith(query: query, isLoading: true, errorMessage: null);

    // 2. Hủy cái hẹn giờ cũ (nếu user gõ chữ tiếp theo quá nhanh)
    if (_debounceTimer?.isActive ?? false) {
      _debounceTimer!.cancel();
    }

    // 3. Đặt hẹn giờ mới: Chỉ gọi API nếu user DỪNG GÕ quá 500 mili-giây
    _debounceTimer = Timer(const Duration(milliseconds: 600), () {
      _performSearch(query);
    });
  }

  /// Hàm gọi API
  Future<void> _performSearch(String query) async {
    final geocodeUseCase = ref.read(geocodeAddressUseCaseProvider);

    final result = await geocodeUseCase(query);

    result.fold(
      (failure) {
        state = state.copyWith(
          isLoading: false,
          errorMessage: failure.message,
          results: [],
        );
      },
      (addressList) {
        state = state.copyWith(
          isLoading: false,
          results: addressList,
          errorMessage: addressList.isEmpty
              ? 'Không tìm thấy địa điểm nào'
              : null,
        );
      },
    );
  }

  /// Hàm xóa trắng kết quả (khi user bấm nút x trên thanh tìm kiếm)
  void clearSearch() {
    _debounceTimer?.cancel();
    state = state.copyWith(
      query: '',
      isLoading: false,
      results: [],
      errorMessage: null,
    );
  }
}
