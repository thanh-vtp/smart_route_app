import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:smart_route_app/core/errors/failures.dart';
import 'package:smart_route_app/features/navigation/domain/entities/route_result.dart';
import 'package:smart_route_app/features/navigation/presentation/models/smart_route_result.dart';

part 'route_comparison_state.freezed.dart';

@freezed
class RouteComparisonState with _$RouteComparisonState {
  const factory RouteComparisonState.initial() = _Initial;
  const factory RouteComparisonState.loading() = _Loading;

  const factory RouteComparisonState.loaded({
    required RouteResult
    normalRoute, // Route đi thẳng (nhanh nhất theo lý thuyết)
    required SmartRouteResult smartRoute, // Route né sự cố (an toàn nhất)
    @Default(true) bool isSmartMode, // Trạng thái Toggle hiện tại
  }) = _Loaded;

  const factory RouteComparisonState.error(Failure failure) = _Error;
}
