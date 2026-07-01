// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'analytics_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_AnalyticsModel _$AnalyticsModelFromJson(Map<String, dynamic> json) =>
    _AnalyticsModel(
      reputationScore: (json['reputation_score'] as num?)?.toInt() ?? 0,
      totalReports: (json['total_reports'] as num?)?.toInt() ?? 0,
      reportsChangePercent:
          (json['reports_change_percent'] as num?)?.toDouble() ?? 0.0,
      reportsDirection: json['reports_direction'] as String? ?? 'flat',
      totalUpvotes: (json['total_upvotes'] as num?)?.toInt() ?? 0,
      upvotesChangePercent:
          (json['upvotes_change_percent'] as num?)?.toDouble() ?? 0.0,
      upvotesDirection: json['upvotes_direction'] as String? ?? 'flat',
      totalDownvotes: (json['total_downvotes'] as num?)?.toInt() ?? 0,
      confirmationRate: (json['confirmation_rate'] as num?)?.toDouble() ?? 0.0,
      distributionTotal: (json['distribution_total'] as num?)?.toInt() ?? 0,
      distribution:
          (json['distribution'] as List<dynamic>?)
              ?.map(
                (e) =>
                    IncidentChartDataModel.fromJson(e as Map<String, dynamic>),
              )
              .toList() ??
          const [],
      recentActivities:
          (json['recent_activities'] as List<dynamic>?)
              ?.map(
                (e) => ActivityItemModel.fromJson(e as Map<String, dynamic>),
              )
              .toList() ??
          const [],
    );

Map<String, dynamic> _$AnalyticsModelToJson(_AnalyticsModel instance) =>
    <String, dynamic>{
      'reputation_score': instance.reputationScore,
      'total_reports': instance.totalReports,
      'reports_change_percent': instance.reportsChangePercent,
      'reports_direction': instance.reportsDirection,
      'total_upvotes': instance.totalUpvotes,
      'upvotes_change_percent': instance.upvotesChangePercent,
      'upvotes_direction': instance.upvotesDirection,
      'total_downvotes': instance.totalDownvotes,
      'confirmation_rate': instance.confirmationRate,
      'distribution_total': instance.distributionTotal,
      'distribution': instance.distribution,
      'recent_activities': instance.recentActivities,
    };

_IncidentChartDataModel _$IncidentChartDataModelFromJson(
  Map<String, dynamic> json,
) => _IncidentChartDataModel(
  type: json['type'] as String,
  count: (json['count'] as num?)?.toInt() ?? 0,
);

Map<String, dynamic> _$IncidentChartDataModelToJson(
  _IncidentChartDataModel instance,
) => <String, dynamic>{'type': instance.type, 'count': instance.count};

_ActivityItemModel _$ActivityItemModelFromJson(Map<String, dynamic> json) =>
    _ActivityItemModel(
      id: json['id'] as String,
      actionType: json['action_type'] as String,
      severity: json['severity'] as String? ?? 'low',
      createdAt: json['created_at'] == null
          ? null
          : DateTime.parse(json['created_at'] as String),
      lat: (json['lat'] as num?)?.toDouble() ?? 0.0,
      lng: (json['lng'] as num?)?.toDouble() ?? 0.0,
      upvotes: (json['upvotes'] as num?)?.toInt() ?? 0,
      downvotes: (json['downvotes'] as num?)?.toInt() ?? 0,
      earnedPoints: (json['earned_points'] as num?)?.toInt() ?? 0,
    );

Map<String, dynamic> _$ActivityItemModelToJson(_ActivityItemModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'action_type': instance.actionType,
      'severity': instance.severity,
      'created_at': instance.createdAt?.toIso8601String(),
      'lat': instance.lat,
      'lng': instance.lng,
      'upvotes': instance.upvotes,
      'downvotes': instance.downvotes,
      'earned_points': instance.earnedPoints,
    };
