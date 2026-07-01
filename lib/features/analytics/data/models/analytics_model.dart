import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:smart_route_app/features/analytics/domain/entities/analytics_data.dart';

part 'analytics_model.freezed.dart';
part 'analytics_model.g.dart';

// ====================================================================
// 1. MODEL CHÍNH (ANALYTICS MODEL)
// ====================================================================
@freezed
abstract class AnalyticsModel with _$AnalyticsModel {
  const AnalyticsModel._();

  const factory AnalyticsModel({
    @JsonKey(name: 'reputation_score') @Default(0) int reputationScore,

    // Thống kê Báo cáo
    @JsonKey(name: 'total_reports') @Default(0) int totalReports,
    @JsonKey(name: 'reports_change_percent')
    @Default(0.0)
    double reportsChangePercent,
    @JsonKey(name: 'reports_direction')
    @Default('flat')
    String reportsDirection,

    // Thống kê Upvote
    @JsonKey(name: 'total_upvotes') @Default(0) int totalUpvotes,
    @JsonKey(name: 'upvotes_change_percent')
    @Default(0.0)
    double upvotesChangePercent,
    @JsonKey(name: 'upvotes_direction')
    @Default('flat')
    String upvotesDirection,

    // Thống kê Xác nhận (Tỷ lệ)
    @JsonKey(name: 'total_downvotes') @Default(0) int totalDownvotes,
    @JsonKey(name: 'confirmation_rate') @Default(0.0) double confirmationRate,

    // Mảng phân bổ sự cố
    @JsonKey(name: 'distribution_total') @Default(0) int distributionTotal,
    @Default([]) List<IncidentChartDataModel> distribution,

    // Mảng hoạt động gần đây
    @JsonKey(name: 'recent_activities')
    @Default([])
    List<ActivityItemModel> recentActivities,
  }) = _AnalyticsModel;

  factory AnalyticsModel.fromJson(Map<String, dynamic> json) =>
      _$AnalyticsModelFromJson(json);

  /// Chuyển đổi từ Data Model sang Domain Entity
  AnalyticsData toEntity() {
    return AnalyticsData(
      reputationScore: reputationScore,
      totalReports: totalReports,
      reportsChangePercent: reportsChangePercent,
      reportsDirection: reportsDirection,
      totalUpvotes: totalUpvotes,
      upvotesChangePercent: upvotesChangePercent,
      upvotesDirection: upvotesDirection,
      totalDownvotes: totalDownvotes,
      confirmationRate: confirmationRate,
      distributionTotal: distributionTotal,
      distribution: distribution.map((e) => e.toEntity()).toList(),
      recentActivities: recentActivities.map((e) => e.toEntity()).toList(),
    );
  }
}

// ====================================================================
// 2. MODEL PHÂN BỔ SỰ CỐ (CHART DATA)
// ====================================================================
@freezed
abstract class IncidentChartDataModel with _$IncidentChartDataModel {
  const IncidentChartDataModel._();

  const factory IncidentChartDataModel({
    required String type,
    @Default(0) int count,
  }) = _IncidentChartDataModel;

  factory IncidentChartDataModel.fromJson(Map<String, dynamic> json) =>
      _$IncidentChartDataModelFromJson(json);

  IncidentChartData toEntity() {
    return IncidentChartData(type: type, count: count);
  }
}

// ====================================================================
// 3. MODEL HOẠT ĐỘNG GẦN ĐÂY (ACTIVITY ITEM)
// ====================================================================
@freezed
abstract class ActivityItemModel with _$ActivityItemModel {
  const ActivityItemModel._();

  const factory ActivityItemModel({
    required String id,
    @JsonKey(name: 'action_type') required String actionType,
    @Default('low') String severity, // tô màu icon
    @JsonKey(name: 'created_at') DateTime? createdAt,
    @Default(0.0) double lat,
    @Default(0.0) double lng,
    @Default(0) int upvotes,
    @Default(0) int downvotes,
    @JsonKey(name: 'earned_points') @Default(0) int earnedPoints,
  }) = _ActivityItemModel;

  factory ActivityItemModel.fromJson(Map<String, dynamic> json) =>
      _$ActivityItemModelFromJson(json);

  ActivityItem toEntity() {
    return ActivityItem(
      id: id,
      actionType: actionType,
      severity: severity,
      // Nếu createdAt null, dùng ngày hiện tại. Đồng thời chuyển sang giờ Local (Việt Nam)
      createdAt: createdAt?.toLocal() ?? DateTime.now(),
      lat: lat,
      lng: lng,
      upvotes: upvotes,
      downvotes: downvotes,
      earnedPoints: earnedPoints,
      address: null,
    );
  }
}
