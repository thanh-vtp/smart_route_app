import '../models/notification_model.dart';

abstract class NotificationRemoteDataSource {
  /// Lấy danh sách thông báo của người dùng
  Future<List<NotificationModel>> getNotifications(
    String userId,
    int page,
    int limit,
  );

  /// Đánh dấu một thông báo là đã đọc
  Future<void> markAsRead(String notificationId);

  /// Đánh dấu tất cả thông báo của người dùng là đã đọc
  Future<void> markAllAsRead(String userId);
}
