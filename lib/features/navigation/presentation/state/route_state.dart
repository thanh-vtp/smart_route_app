import 'package:freezed_annotation/freezed_annotation.dart';
import '../../domain/entities/route_entity.dart';

part 'route_state.freezed.dart';

@freezed
class RouteState with _$RouteState {
  const factory RouteState({
    @Default(false) bool isCalculating,
    RouteResult? routeResult,
    String? errorMessage,
    // Alternative Routes
    @Default(false) bool isCalculatingAlternatives,
    AlternativeRoutesResult? alternativeRoutesResult,
    RouteStrategy? selectedStrategy, // Strategy người dùng đang chọn
  }) = _RouteState;
}
