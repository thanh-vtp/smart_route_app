import 'package:smart_route_app/core/utils/app_logger.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import '../models/analytics_model.dart';
import 'analytics_remote_data_source.dart';

class AnalyticsRemoteDataSourceImpl implements AnalyticsRemoteDataSource {
  final SupabaseClient _supabase;

  AnalyticsRemoteDataSourceImpl(this._supabase);

  @override
  Future<AnalyticsModel> getUserAnalytics({
    required String userId,
    required String timeRange,
  }) async {
    try {
      // AppLogger.data('Fetching analytics for $userId, range: $timeRange', source: 'AnalyticsDataSource');

      // Gọi hàm RPC đã tạo trên Supabase
      final response = await _supabase.rpc(
        'get_user_analytics',
        params: {'p_user_id': userId, 'p_time_range': timeRange},
      );

      // Ép kiểu JSON trả về thành Map
      final jsonMap = response as Map<String, dynamic>;

      // AppLogger.data(
      //   '[DATA] analytics data: $jsonMap',
      //   source: 'AnalyticsDataSource',
      // );
      // Parse JSON thành AnalyticsModel (Freezed)
      return AnalyticsModel.fromJson(jsonMap);
    } catch (e, st) {
      AppLogger.error(
        '[LỖI] khi gọi RPC get_user_analytics',
        error: e,
        stackTrace: st,
      );

      // Ở tầng Data Source, chúng ta cứ ném thẳng Exception thô ra ngoài
      // Tầng Repository sẽ chịu trách nhiệm "bọc" nó lại sau.
      throw Exception('Không thể tải dữ liệu thống kê: $e');
    }
  }
}
