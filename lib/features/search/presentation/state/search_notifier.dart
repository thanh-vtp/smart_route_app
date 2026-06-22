import 'dart:async';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:smart_route_app/features/search/presentation/providers/usecases/use_case_providers.dart';
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
    // TODO: Implement history loading from local storage
    // final geocodingRepo = ref.read(geocodingRepositoryProvider);
    // final result = await geocodingRepo.getRecentSearchHistory();
    // result.fold(
    //   (fail) => null,
    //   (history) => state = state.copyWith(historyResults: history),
    // );
  }

  /// Chuyển đổi mode tìm kiếm
  void toggleSearchMode() {
    final newMode = state.searchMode == SearchMode.simple
        ? SearchMode.structured
        : SearchMode.simple;

    state = state.copyWith(
      searchMode: newMode,
      query: '',
      results: [],
      errorMessage: null,
      // Reset structured fields
      houseNumber: '',
      street: '',
      ward: '',
      district: '',
      city: '',
      province: '',
      postalCode: '',
    );
  }

  /// Hàm này được gọi mỗi khi User gõ một ký tự vào TextField (Simple Search)
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

    // 3. Đặt hẹn giờ mới: Chỉ gọi API nếu user DỪNG GÕ quá 600 mili-giây
    _debounceTimer = Timer(const Duration(milliseconds: 600), () {
      _performSimpleSearch(query);
    });
  }

  /// Hàm gọi API tìm kiếm đơn giản
  Future<void> _performSimpleSearch(String query) async {
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

  /// Update structured search fields
  void updateHouseNumber(String value) {
    state = state.copyWith(houseNumber: value);
    _debouncedStructuredSearch();
  }

  void updateStreet(String value) {
    state = state.copyWith(street: value);
    _debouncedStructuredSearch();
  }

  void updateWard(String value) {
    state = state.copyWith(ward: value);
    _debouncedStructuredSearch();
  }

  void updateDistrict(String value) {
    state = state.copyWith(district: value);
    _debouncedStructuredSearch();
  }

  void updateCity(String value) {
    state = state.copyWith(city: value);
    _debouncedStructuredSearch();
  }

  void updateProvince(String value) {
    state = state.copyWith(province: value);
    _debouncedStructuredSearch();
  }

  void updatePostalCode(String value) {
    state = state.copyWith(postalCode: value);
    _debouncedStructuredSearch();
  }

  /// Debounced structured search
  void _debouncedStructuredSearch() {
    // Cancel previous timer
    if (_debounceTimer?.isActive ?? false) {
      _debounceTimer!.cancel();
    }

    // Check if at least one field has value
    final hasAnyValue =
        state.houseNumber.isNotEmpty ||
        state.street.isNotEmpty ||
        state.ward.isNotEmpty ||
        state.district.isNotEmpty ||
        state.city.isNotEmpty ||
        state.province.isNotEmpty ||
        state.postalCode.isNotEmpty;

    if (!hasAnyValue) {
      state = state.copyWith(isLoading: false, results: [], errorMessage: null);
      return;
    }

    state = state.copyWith(isLoading: true, errorMessage: null);

    // Set new timer
    _debounceTimer = Timer(const Duration(milliseconds: 600), () {
      _performStructuredSearch();
    });
  }

  /// Hàm gọi API tìm kiếm structured
  Future<void> _performStructuredSearch() async {
    final geocodeStructuredUseCase = ref.read(
      geocodeAddressStructuredUseCaseProvider,
    );

    final result = await geocodeStructuredUseCase(
      houseNumber: state.houseNumber.isEmpty ? null : state.houseNumber,
      street: state.street.isEmpty ? null : state.street,
      ward: state.ward.isEmpty ? null : state.ward,
      district: state.district.isEmpty ? null : state.district,
      city: state.city.isEmpty ? null : state.city,
      province: state.province.isEmpty ? null : state.province,
      postalCode: state.postalCode.isEmpty ? null : state.postalCode,
    );

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
              ? 'Không tìm thấy địa điểm phù hợp'
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
      houseNumber: '',
      street: '',
      ward: '',
      district: '',
      city: '',
      province: '',
      postalCode: '',
    );
  }
}
