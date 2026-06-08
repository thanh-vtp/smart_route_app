import 'package:freezed_annotation/freezed_annotation.dart';
import '../../domain/entities/notification_entity.dart';

part 'notification_state.freezed.dart';

@freezed
class NotificationState with _$NotificationState {
  const factory NotificationState({
    @Default(true) bool isLoading,
    @Default(false) bool isFetchingMore, // Trạng thái khi cuộn xuống đáy
    @Default(false) bool hasReachedMax, // Đánh dấu đã tải hết dữ liệu chưa
    @Default(1) int currentPage, // Trang hiện tại
    @Default([]) List<AppNotification> notifications,
    String? errorMessage,
  }) = _NotificationState;
}
