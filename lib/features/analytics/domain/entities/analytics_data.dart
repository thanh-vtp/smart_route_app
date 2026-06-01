import 'package:freezed_annotation/freezed_annotation.dart';

part 'analytics_data.freezed.dart';

@freezed
class AnalyticsData with _$AnalyticsData {
  const factory AnalyticsData({
    @Default(0) int reputationScore,

    @Default(0) int totalReports,
    @Default(0.0) double reportsChangePercent,
    @Default('flat') String reportsDirection,

    @Default(0) int totalUpvotes,
    @Default(0.0) double upvotesChangePercent,
    @Default('flat') String upvotesDirection,

    @Default(0) int totalDownvotes,
    @Default(0.0) double confirmationRate,
    @Default(0) int distributionTotal,

    @Default([]) List<IncidentChartData> distribution,
    @Default([]) List<ActivityItem> recentActivities,
  }) = _AnalyticsData;
}

@freezed
class IncidentChartData with _$IncidentChartData {
  const factory IncidentChartData({required String type, required int count}) =
      _IncidentChartData;
}

@freezed
class ActivityItem with _$ActivityItem {
  const factory ActivityItem({
    required String id,
    required String actionType,
    required String severity,
    required DateTime createdAt,
    required double lat,
    required double lng,
    @Default(0) int upvotes,
    @Default(0) int downvotes,
    @Default(0) int earnedPoints,
    String? address,
  }) = _ActivityItem;
}
