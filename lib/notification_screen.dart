import 'package:flutter/material.dart';

class NotificationScreen extends StatelessWidget {
  const NotificationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final cs = theme.colorScheme;
    final textTheme = theme.textTheme;

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
          TextButton(
            onPressed: () {},
            child: Text(
              'Đánh dấu đã đọc',
              style: textTheme.labelLarge?.copyWith(color: cs.primary),
            ),
          ),
          const SizedBox(width: 8),
        ],
      ),
      body: ListView(
        padding: const EdgeInsets.all(16.0),
        children: [
          // Unread Alerts - System Warning
          _buildNotificationItem(
            context,
            icon: Icons.warning_amber_rounded,
            iconColor: cs.onErrorContainer,
            bgColor: cs.errorContainer.withOpacity(0.5),
            title: 'Cảnh báo kẹt xe nghiêm trọng',
            message:
                'Đường Cộng Hòa hiện tại không thể di chuyển. Vui lòng chọn lộ trình khác.',
            time: 'Vừa xong',
            isUnread: true,
            borderColor: cs.errorContainer,
          ),
          const SizedBox(height: 8),

          // Unread Alerts - Community
          _buildNotificationItem(
            context,
            icon: Icons.star,
            iconColor: cs.primary,
            bgColor: cs.primaryContainer.withOpacity(0.3),
            title: '+50 Điểm uy tín',
            message:
                'Báo cáo tai nạn của bạn đã giúp 120 người tránh được kẹt xe.',
            time: '2 giờ trước',
            isUnread: true,
            borderColor: cs.primaryContainer,
          ),
          const SizedBox(height: 8),

          // Read Notifications
          _buildNotificationItem(
            context,
            icon: Icons.local_police,
            iconColor: cs.onSurfaceVariant,
            bgColor: cs.surfaceContainerLowest,
            title: 'Chốt kiểm tra đã hết',
            message:
                'Cộng đồng báo cáo chốt kiểm tra trên đường Xa Lộ Hà Nội đã rời đi.',
            time: 'Hôm qua',
            isUnread: false,
            borderColor: cs.outlineVariant.withOpacity(0.3),
          ),
          const SizedBox(height: 8),
          _buildNotificationItem(
            context,
            icon: Icons.construction,
            iconColor: cs.onSurfaceVariant,
            bgColor: cs.surfaceContainerLowest,
            title: 'Công trình thi công',
            message:
                'Bắt đầu tuần sau sẽ thi công đường Mai Chí Thọ. Lưu ý lịch trình.',
            time: '2 ngày trước',
            isUnread: false,
            borderColor: cs.outlineVariant.withOpacity(0.3),
          ),
        ],
      ),
    );
  }

  Widget _buildNotificationItem(
    BuildContext context, {
    required IconData icon,
    required Color iconColor,
    required Color bgColor,
    required String title,
    required String message,
    required String time,
    required bool isUnread,
    required Color borderColor,
  }) {
    final cs = Theme.of(context).colorScheme;
    final textTheme = Theme.of(context).textTheme;

    return Container(
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
              color: isUnread
                  ? cs.surfaceContainerLowest.withOpacity(0.5)
                  : cs.surfaceContainerHigh,
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
                        title,
                        style: textTheme.titleMedium?.copyWith(
                          fontWeight: FontWeight.bold,
                          color: cs.onSurface,
                        ),
                      ),
                    ),
                    if (isUnread)
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
                  message,
                  style: textTheme.bodyMedium?.copyWith(
                    color: cs.onSurfaceVariant,
                  ),
                ),
                const SizedBox(height: 8),
                Text(
                  time,
                  style: textTheme.labelMedium?.copyWith(color: cs.outline),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
