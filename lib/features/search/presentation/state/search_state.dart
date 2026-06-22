import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:smart_route_app/features/search/domain/entities/address_result.dart';

part 'search_state.freezed.dart';

/// Mode tìm kiếm
enum SearchMode {
  simple, // Tìm kiếm đơn giản (single line)
  structured, // Tìm kiếm theo cấu trúc (từng trường)
}

@freezed
abstract class SearchState with _$SearchState {
  const factory SearchState({
    @Default('') String query,
    @Default(SearchMode.simple) SearchMode searchMode,
    @Default(false) bool isLoading,
    @Default([]) List<AddressResult> results, // Kết quả đang tìm
    @Default([]) List<AddressResult> historyResults, // Lịch sử tìm kiếm
    String? errorMessage,

    // Các trường cho tìm kiếm structured
    @Default('') String houseNumber,
    @Default('') String street,
    @Default('') String ward,
    @Default('') String district,
    @Default('') String city,
    @Default('') String province,
    @Default('') String postalCode,
  }) = _SearchState;
}
