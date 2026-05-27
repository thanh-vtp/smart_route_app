import 'package:flutter/material.dart';

class AnalyticsScreen extends StatelessWidget {
  const AnalyticsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final cs = theme.colorScheme;
    final textTheme = theme.textTheme;

    return Scaffold(
      backgroundColor: cs.surface,
      appBar: AppBar(
        title: Text(
          'Hồ sơ & Thống kê',
          style: textTheme.titleLarge?.copyWith(fontWeight: FontWeight.bold),
        ),
        backgroundColor: cs.surface,
        surfaceTintColor: Colors.transparent,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            // User Header
            Container(
              padding: const EdgeInsets.all(24.0),
              decoration: BoxDecoration(
                color: cs.surfaceContainerLowest,
                borderRadius: BorderRadius.circular(24.0),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.05),
                    blurRadius: 8,
                    offset: const Offset(0, 2),
                  ),
                ],
              ),
              child: Row(
                children: [
                  CircleAvatar(
                    radius: 32,
                    backgroundColor: cs.surfaceVariant,
                    child: Icon(
                      Icons.person,
                      size: 40,
                      color: cs.onSurfaceVariant,
                    ),
                  ),
                  const SizedBox(width: 16),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Nguyễn Văn A',
                          style: textTheme.titleLarge?.copyWith(
                            fontWeight: FontWeight.bold,
                            color: cs.onSurface,
                          ),
                        ),
                        const SizedBox(height: 8),
                        Container(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 12,
                            vertical: 8,
                          ),
                          decoration: BoxDecoration(
                            color: cs.tertiaryContainer.withOpacity(0.2),
                            borderRadius: BorderRadius.circular(9999),
                            border: Border.all(
                              color: cs.tertiary.withOpacity(0.1),
                            ),
                          ),
                          child: Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              const Text('⭐', style: TextStyle(fontSize: 16)),
                              const SizedBox(width: 8),
                              Text(
                                'Điểm uy tín: 2,450',
                                style: textTheme.labelLarge?.copyWith(
                                  color: cs.tertiary,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 24),

            // Stats Grid
            Row(
              children: [
                Expanded(
                  child: _buildStatCard(
                    context,
                    title: 'Báo cáo đã gửi',
                    value: '124',
                    trend: '+12%',
                    trendUp: true,
                    icon: Icons.campaign,
                  ),
                ),
                const SizedBox(width: 16),
                Expanded(
                  child: _buildStatCard(
                    context,
                    title: 'Lượt Upvote',
                    value: '892',
                    trend: '+5%',
                    trendUp: true,
                    icon: Icons.thumb_up,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 24),

            // Incident Chart
            Container(
              padding: const EdgeInsets.all(24.0),
              decoration: BoxDecoration(
                color: cs.surfaceContainerLowest,
                borderRadius: BorderRadius.circular(24.0),
                border: Border.all(color: cs.outlineVariant.withOpacity(0.5)),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Phân bố sự cố',
                    style: textTheme.titleMedium?.copyWith(
                      fontWeight: FontWeight.bold,
                      color: cs.onSurface,
                    ),
                  ),
                  const SizedBox(height: 24),
                  SizedBox(
                    height: 200,
                    child: Center(
                      child: Stack(
                        alignment: Alignment.center,
                        children: [
                          SizedBox(
                            width: 160,
                            height: 160,
                            child: CircularProgressIndicator(
                              value: 0.7,
                              strokeWidth: 24,
                              color: cs.primary,
                              backgroundColor: cs.primaryContainer,
                            ),
                          ),
                          Text(
                            'Tổng\n124',
                            textAlign: TextAlign.center,
                            style: textTheme.titleMedium?.copyWith(
                              fontWeight: FontWeight.bold,
                              color: cs.onSurface,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 24),

            // Activity List
            Text(
              'Hoạt động gần đây',
              style: textTheme.titleLarge?.copyWith(
                fontWeight: FontWeight.bold,
                color: cs.onSurface,
              ),
            ),
            const SizedBox(height: 16),
            _buildActivityItem(
              context,
              icon: Icons.car_crash,
              iconBgColor: cs.errorContainer,
              iconColor: cs.onErrorContainer,
              title: 'Báo cáo tai nạn',
              subtitle: 'Đường Cộng Hòa • 2 giờ trước',
              points: '+10 điểm',
              pointsColor: cs.tertiary,
            ),
            const SizedBox(height: 12),
            _buildActivityItem(
              context,
              icon: Icons.thumb_up,
              iconBgColor: cs.primaryContainer,
              iconColor: cs.onPrimaryContainer,
              title: 'Nhận upvote',
              subtitle: 'Kẹt xe đường 3/2 • 5 giờ trước',
              points: '+2 điểm',
              pointsColor: cs.tertiary,
            ),
            const SizedBox(height: 12),
            _buildActivityItem(
              context,
              icon: Icons.check_circle,
              iconBgColor: cs.secondaryContainer,
              iconColor: cs.onSecondaryContainer,
              title: 'Xác nhận sự cố',
              subtitle: 'Đường ngập nước • Hôm qua',
              points: '+5 điểm',
              pointsColor: cs.tertiary,
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildStatCard(
    BuildContext context, {
    required String title,
    required String value,
    required String trend,
    required bool trendUp,
    required IconData icon,
  }) {
    final cs = Theme.of(context).colorScheme;
    final textTheme = Theme.of(context).textTheme;

    return Container(
      padding: const EdgeInsets.all(16.0),
      decoration: BoxDecoration(
        color: cs.surfaceContainerLowest,
        borderRadius: BorderRadius.circular(16.0),
        border: Border.all(color: cs.outlineVariant.withOpacity(0.3)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Icon(icon, color: cs.primary, size: 24),
              Row(
                children: [
                  Icon(
                    trendUp ? Icons.arrow_upward : Icons.arrow_downward,
                    color: trendUp ? cs.tertiary : cs.error,
                    size: 16,
                  ),
                  const SizedBox(width: 4),
                  Text(
                    trend,
                    style: textTheme.labelMedium?.copyWith(
                      color: trendUp ? cs.tertiary : cs.error,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ],
          ),
          const SizedBox(height: 16),
          Text(
            value,
            style: textTheme.headlineMedium?.copyWith(
              fontWeight: FontWeight.bold,
              color: cs.onSurface,
            ),
          ),
          const SizedBox(height: 4),
          Text(
            title,
            style: textTheme.labelMedium?.copyWith(color: cs.onSurfaceVariant),
          ),
        ],
      ),
    );
  }

  Widget _buildActivityItem(
    BuildContext context, {
    required IconData icon,
    required Color iconBgColor,
    required Color iconColor,
    required String title,
    required String subtitle,
    required String points,
    required Color pointsColor,
  }) {
    final cs = Theme.of(context).colorScheme;
    final textTheme = Theme.of(context).textTheme;

    return Container(
      padding: const EdgeInsets.all(16.0),
      decoration: BoxDecoration(
        color: cs.surfaceContainerLowest,
        borderRadius: BorderRadius.circular(16.0),
        border: Border.all(color: cs.outlineVariant.withOpacity(0.4)),
      ),
      child: Row(
        children: [
          Container(
            padding: const EdgeInsets.all(12),
            decoration: BoxDecoration(
              color: iconBgColor,
              shape: BoxShape.circle,
            ),
            child: Icon(icon, color: iconColor, size: 20),
          ),
          const SizedBox(width: 16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: textTheme.titleMedium?.copyWith(
                    fontWeight: FontWeight.bold,
                    color: cs.onSurface,
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  subtitle,
                  style: textTheme.bodyMedium?.copyWith(
                    color: cs.onSurfaceVariant,
                  ),
                ),
              ],
            ),
          ),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
            decoration: BoxDecoration(
              color: pointsColor.withOpacity(0.1),
              borderRadius: BorderRadius.circular(9999),
            ),
            child: Text(
              points,
              style: textTheme.labelMedium?.copyWith(
                fontWeight: FontWeight.bold,
                color: pointsColor,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
