import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:smart_route_app/features/analytics/domain/entities/analytics_data.dart';

part 'analytics_state.freezed.dart';

enum TimeRange { week, month, year }

@freezed
abstract class AnalyticsState with _$AnalyticsState {
  const factory AnalyticsState({
    @Default(true) bool isLoading,
    @Default(TimeRange.week) TimeRange selectedRange,
    AnalyticsData? data,
    String? errorMessage,
  }) = _AnalyticsState;
}
