import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:smart_route_app/features/auth/domain/entities/app_user.dart';
import 'package:smart_route_app/features/notification/presentation/providers/usecases/use_case_providers.dart';
import '../../../../features/auth/presentation/providers/uscases/use_case_providers.dart';
import 'notification_state.dart';

part 'notification_notifier.g.dart';

@riverpod
class NotificationNotifier extends _$NotificationNotifier {
  final int _limit = 15;
  @override
  NotificationState build() {
    Future.microtask(() => fetchNotifications());
    return const NotificationState();
  }

  Future<void> fetchNotifications() async {
    state = state.copyWith(
      isLoading: true,
      errorMessage: null,
      hasReachedMax: false,
      currentPage: 1,
    );

    final currentUser = ref.read(getCurrentUserUsecaseProvider).call();
    if (currentUser.isEmpty) return;

    final usecase = ref.read(getNotificationsUseCaseProvider);
    final result = await usecase(currentUser.id, page: 1, limit: _limit);

    result.fold(
      (failure) => state = state.copyWith(
        isLoading: false,
        errorMessage: failure.message,
      ),
      (list) {
        state = state.copyWith(
          isLoading: false,
          notifications: list,
          hasReachedMax:
              list.length < _limit, // Nếu lấy về ít hơn 15 cái -> Đã hết data
        );
      },
    );
  }

  /// Tải trang tiếp theo (Dùng khi cuộn xuống đáy)
  Future<void> fetchMoreNotifications() async {
    // Chặn gọi API nếu đang load, đang lấy thêm, hoặc đã hết data
    if (state.isLoading || state.isFetchingMore || state.hasReachedMax) return;

    state = state.copyWith(isFetchingMore: true, errorMessage: null);

    final currentUser = ref.read(getCurrentUserUsecaseProvider).call();
    final nextPage = state.currentPage + 1;

    final usecase = ref.read(getNotificationsUseCaseProvider);
    final result = await usecase(currentUser.id, page: nextPage, limit: _limit);

    result.fold(
      (failure) => state = state.copyWith(
        isFetchingMore: false,
        errorMessage: failure.message,
      ),
      (newList) {
        state = state.copyWith(
          isFetchingMore: false,
          currentPage: nextPage,
          hasReachedMax: newList.length < _limit,
          // Nối dữ liệu mới vào đuôi danh sách cũ
          notifications: [...state.notifications, ...newList],
        );
      },
    );
  }

  Future<void> markAsRead(String id) async {
    // Optimistic UI Update: Đổi state thành đã đọc ngay lập tức cho mượt
    final updatedList = state.notifications.map((n) {
      return n.id == id ? n.copyWith(isRead: true) : n;
    }).toList();
    state = state.copyWith(notifications: updatedList);

    // Chạy ngầm API
    final usecase = ref.read(markNotificationReadUseCaseProvider);
    await usecase(id);
  }

  Future<void> markAllAsRead() async {
    final currentUser = ref.read(getCurrentUserUsecaseProvider).call();
    if (currentUser.isEmpty) return;

    // Optimistic UI Update
    final updatedList = state.notifications
        .map((n) => n.copyWith(isRead: true))
        .toList();
    state = state.copyWith(notifications: updatedList);

    final usecase = ref.read(markAllNotificationsReadUseCaseProvider);
    await usecase(currentUser.id);
  }
}
