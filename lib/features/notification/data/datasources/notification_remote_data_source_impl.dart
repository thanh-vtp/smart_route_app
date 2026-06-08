import 'package:smart_route_app/core/resources/lib/supabase.dart';
import '../../../../core/utils/app_logger.dart';
import '../models/notification_model.dart';
import 'notification_remote_data_source.dart';

class NotificationRemoteDataSourceImpl implements NotificationRemoteDataSource {
  static const String _tableName = 'notifications';

  @override
  Future<List<NotificationModel>> getNotifications(
    String userId,
    int page,
    int limit,
  ) async {
    try {
      // Tính toán khoảng (range) cho Supabase
      // Ví dụ: Page 1, limit 15 -> range(0, 14)
      //        Page 2, limit 15 -> range(15, 29)
      final int from = (page - 1) * limit;
      final int to = from + limit - 1;

      final response = await supabase
          .from(_tableName)
          .select()
          .eq('user_id', userId)
          .order('created_at', ascending: false) // Mới nhất xếp trên cùng
          .range(from, to); // Lọc phân trang

      return response.map((json) => NotificationModel.fromJson(json)).toList();
    } catch (e, st) {
      AppLogger.error(
        'Lỗi khi tải thông báo từ Supabase',
        error: e,
        stackTrace: st,
      );
      throw Exception('Không thể tải danh sách thông báo.');
    }
  }

  @override
  Future<void> markAsRead(String notificationId) async {
    try {
      await supabase
          .from(_tableName)
          .update({'is_read': true})
          .eq('id', notificationId);
    } catch (e, st) {
      AppLogger.error('Lỗi khi đánh dấu đã đọc', error: e, stackTrace: st);
      throw Exception('Không thể cập nhật trạng thái thông báo.');
    }
  }

  @override
  Future<void> markAllAsRead(String userId) async {
    try {
      await supabase
          .from(_tableName)
          .update({'is_read': true})
          .eq('user_id', userId)
          .eq('is_read', false); // Chỉ update những cái chưa đọc để tối ưu DB
    } catch (e, st) {
      AppLogger.error('Lỗi khi đánh dấu đọc tất cả', error: e, stackTrace: st);
      throw Exception('Không thể cập nhật trạng thái toàn bộ thông báo.');
    }
  }
}
