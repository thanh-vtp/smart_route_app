import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:smart_route_app/features/map/domain/entities/address_result.dart';

part 'recent_search_state.freezed.dart';

@freezed
class RecentSearchState with _$RecentSearchState {
  const factory RecentSearchState({
    @Default([]) List<AddressResult> history,
    @Default(false) bool isLoading,
    String? errorMessage,
  }) = _RecentSearchState;
}
