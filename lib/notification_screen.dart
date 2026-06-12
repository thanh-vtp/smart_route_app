import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:smart_route_app/core/app/notification_provider.dart';
import 'package:smart_route_app/features/notification/domain/entities/notification_entity.dart';
import 'package:smart_route_app/features/notification/presentation/states/notification_notifier.dart';
import 'package:smart_route_app/features/notification/presentation/states/notification_state.dart';

class NotificationScreen extends ConsumerStatefulWidget {
  const NotificationScreen({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _NotificationScreenState();
}

class _NotificationScreenState extends ConsumerState<NotificationScreen> {
  final ScrollController _scrollController = ScrollController();

  @override
  void initState() {
    super.initState();

    // Lắng nghe sự kiện cuộn
    _scrollController.addListener(() {
      // Nếu cuộn gần tới đáy (cách đáy 200 pixel), tự động gọi API tải thêm
      if (_scrollController.position.pixels >=
          _scrollController.position.maxScrollExtent - 200) {
        ref
            .read(notificationNotifierProvider.notifier)
            .fetchMoreNotifications();
      }
    });
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final cs = theme.colorScheme;
    final textTheme = theme.textTheme;

    final state = ref.watch(notificationNotifierProvider);

    // Kiểm tra nếu có thông báo chưa đọc nào
    final hasUnread = state.notifications.any((n) => !n.isRead);

    return Scaffold(
      backgroundColor: cs.surface,
      appBar: AppBar(
        title: Text(
          'Thông báo',
          style: textTheme.titleLarge?.copyWith(fontWeight: FontWeight.bold),
        ),
        backgroundColor: cs.surface,
        surfaceTintColor: Colors.transparent,
        actions: [
          if (hasUnread)
            TextButton(
              onPressed: () => ref
                  .read(notificationNotifierProvider.notifier)
                  .markAllAsRead(),
              child: Text(
                'Đánh dấu đã đọc',
                style: textTheme.labelLarge?.copyWith(color: cs.primary),
              ),
            ),
          const SizedBox(width: 8),
        ],
      ),
      body: _buildBody(context, cs, textTheme, state),
    );
  }

  Widget _buildBody(
    BuildContext context,
    ColorScheme cs,
    TextTheme textTheme,
    NotificationState state,
  ) {
    if (state.isLoading) {
      return const Center(child: CircularProgressIndicator());
    }
    if (state.errorMessage != null) {
      return Center(
        child: Text(state.errorMessage!, style: TextStyle(color: cs.error)),
      );
    }
    if (state.notifications.isEmpty) {
      return Center(
        child: Text(
          'Chưa có thông báo nào.',
          style: TextStyle(color: cs.outline),
        ),
      );
    }

    return RefreshIndicator(
      onRefresh: () =>
          ref.read(notificationNotifierProvider.notifier).fetchNotifications(),
      child: ListView.separated(
        controller: _scrollController,
        padding: const EdgeInsets.all(16.0),
        itemCount:
            state.notifications.length +
            (state.isFetchingMore
                ? 1
                : 0), // Cộng thêm 1 item ở cuối để vẽ vòng quay Loading nếu đang tải thêm
        separatorBuilder: (context, index) => const SizedBox(height: 8),
        itemBuilder: (context, index) {
          // Nếu render đến item cuối cùng và đang báo isFetchingMore
          if (index == state.notifications.length) {
            return const Padding(
              padding: EdgeInsets.symmetric(vertical: 16.0),
              child: Center(child: CircularProgressIndicator()),
            );
          }

          final notif = state.notifications[index];
          return _buildNotificationItem(context, ref, cs, textTheme, notif);
        },
        // children: [
        //   // Unread Alerts - System Warning
        //   _buildNotificationItem(
        //     context,
        //     icon: Icons.warning_amber_rounded,
        //     iconColor: cs.onErrorContainer,
        //     bgColor: cs.errorContainer.withOpacity(0.5),
        //     title: 'Cảnh báo kẹt xe nghiêm trọng',
        //     message:
        //         'Đường Cộng Hòa hiện tại không thể di chuyển. Vui lòng chọn lộ trình khác.',
        //     time: 'Vừa xong',
        //     isUnread: true,
        //     borderColor: cs.errorContainer,
        //   ),
        //   const SizedBox(height: 8),

        //   // Unread Alerts - Community
        //   _buildNotificationItem(
        //     context,
        //     icon: Icons.star,
        //     iconColor: cs.primary,
        //     bgColor: cs.primaryContainer.withOpacity(0.3),
        //     title: '+50 Điểm uy tín',
        //     message:
        //         'Báo cáo tai nạn của bạn đã giúp 120 người tránh được kẹt xe.',
        //     time: '2 giờ trước',
        //     isUnread: true,
        //     borderColor: cs.primaryContainer,
        //   ),
        //   const SizedBox(height: 8),

        //   // Read Notifications
        //   _buildNotificationItem(
        //     context,
        //     icon: Icons.local_police,
        //     iconColor: cs.onSurfaceVariant,
        //     bgColor: cs.surfaceContainerLowest,
        //     title: 'Chốt kiểm tra đã hết',
        //     message:
        //         'Cộng đồng báo cáo chốt kiểm tra trên đường Xa Lộ Hà Nội đã rời đi.',
        //     time: 'Hôm qua',
        //     isUnread: false,
        //     borderColor: cs.outlineVariant.withOpacity(0.3),
        //   ),
        //   const SizedBox(height: 8),
        //   _buildNotificationItem(
        //     context,
        //     icon: Icons.construction,
        //     iconColor: cs.onSurfaceVariant,
        //     bgColor: cs.surfaceContainerLowest,
        //     title: 'Công trình thi công',
        //     message:
        //         'Bắt đầu tuần sau sẽ thi công đường Mai Chí Thọ. Lưu ý lịch trình.',
        //     time: '2 ngày trước',
        //     isUnread: false,
        //     borderColor: cs.outlineVariant.withOpacity(0.3),
        //   ),
        // ],
      ),
    );
  }

  Widget _buildNotificationItem(
    BuildContext context,
    WidgetRef ref,
    ColorScheme cs,
    TextTheme textTheme,
    AppNotification notif,
  ) {
    // Xử lý UI theo từng loại thông báo
    IconData icon = Icons.notifications;
    Color iconColor = cs.primary;
    Color bgColor = cs.primaryContainer.withOpacity(0.3);
    Color borderColor = cs.primaryContainer;

    if (!notif.isRead) {
      if (notif.type == 'incident') {
        icon = Icons.warning_amber_rounded;
        iconColor = cs.onErrorContainer;
        bgColor = cs.errorContainer.withOpacity(0.5);
        borderColor = cs.errorContainer;
      }
    } else {
      // Đã đọc thì xám đi
      iconColor = cs.onSurfaceVariant;
      bgColor = cs.surfaceContainerLowest;
      borderColor = cs.outlineVariant.withOpacity(0.3);
    }

    return InkWell(
      onTap: () {
        // 1. Đánh dấu đã đọc
        if (!notif.isRead) {
          ref.read(notificationNotifierProvider.notifier).markAsRead(notif.id);
        }

        // 2. Nếu là thông báo sự cố -> Chuyển về tab Map và mở detail
        if (notif.type == 'incident' && notif.referenceIncidentId != null) {
          // Bắn ID vào Provider cầu nối (Giống y hệt cách làm của Push Notification)
          ref.read(selectedIncidentIdFromNotificationProvider.notifier).state =
              notif.referenceIncidentId;

          // Chuyển về tab Map (branch 0) và quay lại initial location của branch đó
          context.go("/explore");
        }
      },
      borderRadius: BorderRadius.circular(16.0),

      child: Container(
        padding: const EdgeInsets.all(16.0),
        decoration: BoxDecoration(
          color: bgColor,
          borderRadius: BorderRadius.circular(16.0),
          border: Border.all(color: borderColor),
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              padding: const EdgeInsets.all(10),
              decoration: BoxDecoration(
                color: notif.isRead
                    ? cs.surfaceContainerHigh
                    : cs.surfaceContainerLowest.withOpacity(0.5),
                shape: BoxShape.circle,
              ),
              child: Icon(icon, color: iconColor, size: 24),
            ),
            const SizedBox(width: 16),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(
                        child: Text(
                          notif.title,
                          style: textTheme.titleMedium?.copyWith(
                            fontWeight: FontWeight.bold,
                            color: cs.onSurface,
                          ),
                        ),
                      ),
                      if (!notif.isRead)
                        Container(
                          width: 8,
                          height: 8,
                          decoration: BoxDecoration(
                            color: cs.primary,
                            shape: BoxShape.circle,
                          ),
                        ),
                    ],
                  ),
                  const SizedBox(height: 4),
                  Text(
                    notif.body,
                    style: textTheme.bodyMedium?.copyWith(
                      color: cs.onSurfaceVariant,
                    ),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    _getTimeAgo(notif.createdAt),
                    style: textTheme.labelMedium?.copyWith(color: cs.outline),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  String _getTimeAgo(DateTime date) {
    final diff = DateTime.now().difference(date);
    if (diff.inDays > 0) return '${diff.inDays} ngày trước';
    if (diff.inHours > 0) return '${diff.inHours} giờ trước';
    if (diff.inMinutes > 0) return '${diff.inMinutes} phút trước';
    return 'Vừa xong';
  }
}
