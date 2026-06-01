import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:smart_route_app/core/common/domain/entities/address_result.dart';

part 'search_state.freezed.dart';

@freezed
class SearchState with _$SearchState {
  const factory SearchState({
    @Default('') String query,
    @Default(false) bool isLoading,
    @Default([]) List<AddressResult> results, // Kết quả đang tìm
    @Default([]) List<AddressResult> historyResults, // Lịch sử tìm kiếm
    String? errorMessage,
  }) = _SearchState;
}
