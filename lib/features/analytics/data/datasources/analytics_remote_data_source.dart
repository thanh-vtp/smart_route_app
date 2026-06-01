// Nơi chứa AnalyticsModel của bạn

import 'package:smart_route_app/features/analytics/data/models/analytics_model.dart';

abstract class AnalyticsRemoteDataSource {
  /// Gọi hàm RPC trên Supabase để lấy tổng hợp dữ liệu thống kê của User
  /// [userId] là ID của người dùng (UUID)
  /// [timeRange] là khoảng thời gian: 'week', 'month', 'year'
  Future<AnalyticsModel> getUserAnalytics({
    required String userId,
    required String timeRange,
  });
}
