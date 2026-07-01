import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:smart_route_app/features/analytics/domain/entities/analytics_data.dart';
import 'package:smart_route_app/features/analytics/presentation/states/analytics_notifier.dart';
import 'package:smart_route_app/features/analytics/presentation/states/analytics_state.dart';
import 'package:smart_route_app/features/auth/domain/entities/app_user.dart';
import 'package:smart_route_app/features/auth/presentation/providers/uscases/use_case_providers.dart';

class AnalyticsScreen extends ConsumerWidget {
  const AnalyticsScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final theme = Theme.of(context);
    final cs = theme.colorScheme;
    final textTheme = theme.textTheme;

    final state = ref.watch(analyticsProvider);
    final currentUser = ref
        .watch(getCurrentUserUsecaseProvider)
        .call(); // Avatar, Name

    return Scaffold(
      backgroundColor: cs.surface,
      appBar: AppBar(
        title: Text(
          'Hồ sơ & Thống kê',
          style: textTheme.titleLarge?.copyWith(fontWeight: FontWeight.bold),
        ),
        backgroundColor: cs.surface,
        surfaceTintColor: Colors.transparent,
        actions: [
          IconButton(
            icon: const Icon(Icons.settings_outlined),
            onPressed: () {
              // TODO: Điều hướng đến trang quản lý tài khoản
              context.push('/reports/account');
            },
          ),
        ],
      ),
      body: _buildBody(cs, textTheme, context, ref, state, currentUser),
    );
  }

  Widget _buildBody(
    ColorScheme cs,
    TextTheme textTheme,
    BuildContext context,
    WidgetRef ref,
    AnalyticsState state,
    dynamic currentUser,
  ) {
    if (state.isLoading && state.data == null) {
      return const Center(child: CircularProgressIndicator());
    }

    if (state.errorMessage != null && state.data == null) {
      return Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(Icons.error_outline, size: 48, color: cs.error),
            const SizedBox(height: 16),
            Text(state.errorMessage!, style: textTheme.bodyLarge),
            const SizedBox(height: 16),
            FilledButton(
              onPressed: () =>
                  ref.read(analyticsProvider.notifier).fetchAnalytics(),
              child: const Text('Thử lại'),
            ),
          ],
        ),
      );
    }

    final data = state.data!;

    return RefreshIndicator(
      onRefresh: () => ref.read(analyticsProvider.notifier).fetchAnalytics(),
      child: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            // User Header
            _buildUserHeader(cs, textTheme, currentUser, data.reputationScore),
            const SizedBox(height: 24),

            // Time Filter
            _buildTimeFilter(
              cs,
              ref,
              textTheme,
              currentUser,
              state.selectedRange,
            ),

            const SizedBox(height: 24),

            // Stats Grid
            Row(
              children: [
                Expanded(
                  child: _buildStatCard(
                    context,
                    title: 'Báo cáo đã gửi',
                    value: data.totalReports.toString(),
                    icon: Icons.campaign_rounded,
                    percent: data.reportsChangePercent,
                    direction: data.reportsDirection,
                    timeRange: state.selectedRange,
                  ),
                ),
                const SizedBox(width: 16),
                Expanded(
                  child: _buildStatCard(
                    context,
                    title: 'Lượt xác nhận',
                    value: data.totalUpvotes.toString(),
                    icon: Icons.thumb_up_rounded,
                    percent: data.upvotesChangePercent,
                    direction: data.upvotesDirection,
                    timeRange: state.selectedRange,
                  ),
                ),
              ],
            ),

            const SizedBox(height: 16),

            // Tỷ lệ xác nhận
            _buildConfirmationRateCard(cs, textTheme, data),

            const SizedBox(height: 24),

            // Incident Chart
            _buildChartSection(cs, textTheme, data),

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
            if (data.recentActivities.isEmpty)
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 24),
                child: Center(
                  child: Text(
                    'Chưa có hoạt động nào trong thời gian này.',
                    style: textTheme.bodyMedium?.copyWith(color: cs.outline),
                  ),
                ),
              )
            else
              ...data.recentActivities.map((act) {
                // Danh sách hoạt động
                return _buildActivityItem(context, cs, textTheme, act);
              }),
          ],
        ),
      ),
    );
  }

  Container _buildConfirmationRateCard(
    ColorScheme cs,
    TextTheme textTheme,
    AnalyticsData data,
  ) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 16.0),
      decoration: BoxDecoration(
        color: cs.surfaceContainerLowest,
        borderRadius: BorderRadius.circular(16.0),
        border: Border.all(color: cs.outlineVariant.withOpacity(0.3)),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Icon(Icons.verified_rounded, color: cs.primary, size: 20),
                  const SizedBox(width: 8),
                  Text(
                    'Tỷ lệ xác nhận',
                    style: textTheme.titleMedium?.copyWith(
                      color: cs.onSurfaceVariant,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 4),
              Text(
                'Dựa trên ${data.totalUpvotes + data.totalDownvotes} lượt đánh giá',
                style: textTheme.bodySmall?.copyWith(color: cs.outline),
              ),
            ],
          ),

          // v_conf_rate := round(COALESCE((v_curr_upvotes::numeric * 100.0) / NULLIF(v_curr_upvotes + v_curr_downvotes, 0), 0.0), 1);
          // Tỷ lệ xác nhận = (Tổng upvote) / (Tổng upvote + Tổng downvote)
          Text(
            '${data.confirmationRate.toStringAsFixed(0)}%',
            style: textTheme.headlineMedium?.copyWith(
              fontWeight: FontWeight.bold,
              color: cs.primary,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildChartSection(
    ColorScheme cs,
    TextTheme textTheme,
    AnalyticsData data,
  ) {
    if (data.distribution.isEmpty) {
      return const SizedBox.shrink();
    }

    int totalFeatures = data.distribution.fold(
      0,
      (sum, item) => sum + item.count,
    );

    // Default vẽ chart < 2
    if (data.distributionTotal < 2) {
      return Container(
        padding: const EdgeInsets.all(24.0),
        decoration: BoxDecoration(
          color: cs.surfaceContainerLowest,
          borderRadius: BorderRadius.circular(24.0),
          border: Border.all(color: cs.outlineVariant.withOpacity(0.5)),
        ),
        child: Center(
          child: Text(
            'Bạn đã gửi ${data.distributionTotal} báo cáo.\nCần ít nhất 5 báo cáo để hiển thị biểu đồ.',
            textAlign: TextAlign.center,
            style: textTheme.bodyMedium?.copyWith(
              color: cs.outline,
              height: 1.5,
            ),
          ),
        ),
      );
    }
    return Container(
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

          const SizedBox(height: 32),

          SizedBox(
            height: 180,
            child: TweenAnimationBuilder<double>(
              tween: Tween<double>(begin: 0.0, end: 1.0),
              duration: const Duration(
                milliseconds: 1000,
              ), // Thời gian chạy 1 giây
              curve: Curves.easeOutCubic,
              builder: (context, value, child) {
                return Stack(
                  children: [
                    PieChart(
                      PieChartData(
                        sectionsSpace: 2,
                        centerSpaceRadius: 60,
                        sections: data.distribution.map((item) {
                          return PieChartSectionData(
                            color: _getTypeColor(item.type, cs),
                            value: (item.count.toDouble() * value).clamp(
                              0.1,
                              double.infinity,
                            ),
                            title: '', // Ẩn số trên chart
                            radius: 24,
                          );
                        }).toList(),
                      ),
                    ),
                    Center(
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Text(
                            'Tổng',
                            style: textTheme.labelMedium?.copyWith(
                              color: cs.outline,
                            ),
                          ),
                          Text(
                            (totalFeatures * value).toInt().toString(),
                            style: textTheme.headlineSmall?.copyWith(
                              fontWeight: FontWeight.bold,
                              color: cs.onSurface,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                );
              },
            ),
          ),

          const SizedBox(height: 32),

          // Chú thích
          Wrap(
            runSpacing: 12, // Khoảng cách dọc giữa các hàng
            alignment: WrapAlignment.center,
            children: data.distribution.map((item) {
              final percentage = ((item.count / totalFeatures) * 100)
                  .toStringAsFixed(0);
              return FractionallySizedBox(
                widthFactor:
                    0.5, // Ép mỗi item chiếm đúng 50% (Tạo thành 2 cột)
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Container(
                      width: 12,
                      height: 12,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: _getTypeColor(item.type, cs),
                      ),
                    ),
                    const SizedBox(
                      width: 8,
                    ), // Tăng khoảng cách từ icon tới chữ cho thoáng
                    Expanded(
                      child: Text(
                        '${_getTypeName(item.type)} ($percentage%)',
                        style: textTheme.labelMedium?.copyWith(
                          color: cs.onSurfaceVariant,
                        ),
                        maxLines: 1, // Tránh rớt dòng nếu chữ quá dài
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                  ],
                ),
              );
            }).toList(),
          ),
        ],
      ),
    );
  }

  Container _buildTimeFilter(
    ColorScheme cs,
    WidgetRef ref,
    TextTheme textTheme,
    AppUser user,
    TimeRange currentRange,
  ) {
    return Container(
      padding: const EdgeInsets.all(4),
      decoration: BoxDecoration(
        color: cs.surfaceContainerHigh,
        borderRadius: BorderRadius.circular(8),
      ),
      child: Row(
        children: TimeRange.values.map((range) {
          final isSelected = currentRange == range;
          final String label = range == TimeRange.week
              ? 'Tuần này'
              : range == TimeRange.month
              ? 'Tháng này'
              : 'Năm nay';

          return Expanded(
            child: GestureDetector(
              onTap: () {
                if (!isSelected) {
                  ref.read(analyticsProvider.notifier).fetchAnalytics(range);
                }
              },
              child: AnimatedContainer(
                duration: const Duration(milliseconds: 200),
                padding: const EdgeInsets.symmetric(vertical: 8),
                decoration: BoxDecoration(
                  color: isSelected ? cs.primaryContainer : Colors.transparent,
                  borderRadius: BorderRadius.circular(6),
                  boxShadow: isSelected
                      ? [const BoxShadow(color: Colors.black12, blurRadius: 4)]
                      : [],
                ),
                child: Text(
                  label,
                  textAlign: TextAlign.center,
                  style: textTheme.labelLarge?.copyWith(
                    fontWeight: FontWeight.bold,
                    color: isSelected
                        ? cs.onPrimaryContainer
                        : cs.onSurfaceVariant,
                  ),
                ),
              ),
            ),
          );
        }).toList(),
      ),
    );
  }

  Container _buildUserHeader(
    ColorScheme cs,
    TextTheme textTheme,
    AppUser user,
    int reputationScore,
  ) {
    final bool hasAvatar =
        user.avatarUrl != null && user.avatarUrl.toString().isNotEmpty;

    return Container(
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
          Container(
            width: 64,
            height: 64,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: cs.surfaceVariant,
              image: hasAvatar
                  ? DecorationImage(
                      image: NetworkImage(user.avatarUrl!),
                      fit: BoxFit.cover,
                    )
                  : null,
            ),
            child: Icon(
              hasAvatar ? null : Icons.person,
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
                  user.displayName ?? 'Người dùng',
                  style: textTheme.titleLarge?.copyWith(
                    fontWeight: FontWeight.bold,
                    color: cs.onSurface,
                  ),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
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
                    border: Border.all(color: cs.tertiary.withOpacity(0.1)),
                  ),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      const Text('⭐', style: TextStyle(fontSize: 16)),
                      const SizedBox(width: 8),
                      Text(
                        'Điểm uy tín: $reputationScore',
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
    );
  }

  Widget _buildStatCard(
    BuildContext context, {
    required String title,
    required String value,
    required IconData icon,
    required double percent,
    required String direction,
    required TimeRange timeRange,
  }) {
    final cs = Theme.of(context).colorScheme;
    final textTheme = Theme.of(context).textTheme;

    final isUp = direction == 'up';
    final isDown = direction == 'down';

    // Xanh nếu tăng, Đỏ nếu giảm
    final Color trendColor = isUp
        ? cs.tertiary
        : (isDown ? cs.error : cs.outline);

    final IconData trendIcon = isUp
        ? Icons.arrow_drop_up_rounded
        : (isDown ? Icons.arrow_drop_down_rounded : Icons.remove_rounded);

    final String rangeText = timeRange == TimeRange.week
        ? 'tuần'
        : (timeRange == TimeRange.month ? 'tháng' : 'năm');

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
          Container(
            padding: const EdgeInsets.all(8),
            decoration: BoxDecoration(
              color: cs.primaryContainer.withOpacity(0.3),
              borderRadius: BorderRadius.circular(8),
            ),
            child: Icon(icon, color: cs.primary, size: 20),
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
            style: textTheme.labelMedium?.copyWith(
              color: cs.onSurfaceVariant,
              fontWeight: FontWeight.w500,
            ),
          ),
          const SizedBox(height: 12),

          // Trend
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(trendIcon, color: trendColor, size: 18),
              Text(
                '${percent.toStringAsFixed(0)}%',
                style: textTheme.labelMedium?.copyWith(
                  color: trendColor,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
          Text(
            'so với $rangeText trước',
            style: textTheme.labelSmall?.copyWith(color: cs.outline),
          ),
        ],
      ),
    );
  }

  Widget _buildActivityItem(
    BuildContext context,
    ColorScheme cs,
    TextTheme textTheme,
    ActivityItem act,
  ) {
    final bgColor = _getTypeBgColor(act.actionType, cs);
    final iconColor = _getTypeOnColor(act.actionType, cs);

    // Tính toán thời gian hiển thị
    final timeStr = _getTimeAgo(act.createdAt);

    // Nếu đang dịch thì hiện loading/tọa độ, dịch xong thì hiện tên đường
    final addressStr =
        act.address ??
        'Đang tải địa chỉ... (${act.lat.toStringAsFixed(3)}, ${act.lng.toStringAsFixed(3)})';

    return Container(
      margin: const EdgeInsets.only(bottom: 12),
      padding: const EdgeInsets.all(16.0),
      decoration: BoxDecoration(
        color: cs.surfaceContainerLowest,
        borderRadius: BorderRadius.circular(16.0),
        border: Border.all(color: cs.outlineVariant.withOpacity(0.4)),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            padding: const EdgeInsets.all(12),
            decoration: BoxDecoration(color: bgColor, shape: BoxShape.circle),
            child: Icon(
              _getTypeIcon(act.actionType),
              color: iconColor,
              size: 20,
            ),
          ),
          const SizedBox(width: 16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  _getTypeName(act.actionType),
                  style: textTheme.titleMedium?.copyWith(
                    fontWeight: FontWeight.bold,
                    color: cs.onSurface,
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  // addressStr.length > 25
                  //     ? '${addressStr.substring(0, 25)}...'
                  //     : addressStr,
                  addressStr,
                  style: textTheme.bodyMedium?.copyWith(
                    color: cs.onSurfaceVariant,
                    fontSize: 13,
                  ),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
                const SizedBox(height: 2),
                Text(
                  timeStr,
                  style: textTheme.bodyMedium?.copyWith(
                    color: cs.onSurfaceVariant,
                    fontSize: 13,
                  ),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),

                const SizedBox(height: 12),

                // Xác nhận
                Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 10,
                    vertical: 6,
                  ),
                  decoration: BoxDecoration(
                    // Nếu có upvote thì nền màu xanh, không có thì nền xám nhạt
                    color: act.upvotes > 0
                        ? cs.tertiaryContainer.withOpacity(0.15)
                        : cs.surfaceContainer,
                    borderRadius: BorderRadius.circular(8),
                    border: Border.all(
                      color: act.upvotes > 0
                          ? cs.tertiary.withOpacity(0.2)
                          : cs.outlineVariant.withOpacity(0.5),
                    ),
                  ),
                  child: Row(
                    mainAxisSize: MainAxisSize.min, // Bo sát nội dung chữ
                    children: [
                      Icon(
                        Icons.thumb_up_alt_rounded,
                        size: 14,
                        color: act.upvotes > 0 ? cs.tertiary : cs.outline,
                      ),
                      const SizedBox(width: 6),
                      Text(
                        act.upvotes > 0
                            // ? 'Đã được ${act.upvotes} người xác nhận'
                            ? 'Được ${act.upvotes} người xác nhận'
                            : 'Chưa có xác nhận',
                        style: textTheme.labelMedium?.copyWith(
                          fontWeight: FontWeight.bold,
                          color: act.upvotes > 0 ? cs.tertiary : cs.outline,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),

          // Điểm uy tín
          // if (act.upvotes > 0)
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
            decoration: BoxDecoration(
              color: cs.tertiary.withOpacity(0.1),
              borderRadius: BorderRadius.circular(9999),
            ),
            child: Text(
              '+${act.earnedPoints} điểm',
              style: textTheme.labelMedium?.copyWith(
                fontWeight: FontWeight.bold,
                color: cs.tertiary,
              ),
            ),
          ),
        ],
      ),
    );
  }

  String _getTypeName(String type) {
    switch (type) {
      case 'crash':
        return 'Tai nạn';
      case 'traffic':
        return 'Kẹt xe';
      case 'police':
        return 'Chốt CSGT';
      case 'hazard':
        return 'Nguy hiểm';
      case 'camera':
        return 'Camera';
      case 'closure':
        return 'Đường cấm';
      default:
        return 'Sự cố khác';
    }
  }

  IconData _getTypeIcon(String type) {
    switch (type) {
      case 'crash':
        return Icons.car_crash;
      case 'traffic':
        return Icons.traffic;
      case 'police':
        return Icons.local_police;
      case 'hazard':
        return Icons.warning_amber_rounded;
      case 'camera':
        return Icons.camera_alt;
      case 'closure':
        return Icons.remove_road;
      default:
        return Icons.info;
    }
  }

  Color _getTypeColor(String type, ColorScheme cs) {
    switch (type) {
      case 'crash':
        return Colors.red;
      case 'traffic':
        return Colors.orange;
      case 'police':
        return Colors.blue;
      case 'hazard':
        return Colors.blueGrey;
      case 'camera':
        return Colors.teal;
      case 'closure':
        return Colors.black54;
      default:
        return cs.primary;
    }
  }

  Color _getTypeBgColor(String type, ColorScheme cs) {
    switch (type) {
      case 'crash':
        return cs.errorContainer;
      case 'traffic':
        return Colors.orange.withOpacity(0.2);
      case 'police':
        return Colors.blue.withOpacity(0.2);
      case 'hazard':
        return Colors.blueGrey.withOpacity(0.2);
      case 'camera':
        return Colors.teal.withOpacity(0.2);
      case 'closure':
        return Colors.black54.withOpacity(0.2);

      default:
        return cs.primaryContainer;
    }
  }

  Color _getTypeOnColor(String type, ColorScheme cs) {
    switch (type) {
      case 'crash':
        return cs.onErrorContainer;
      case 'traffic':
        return Colors.orange[900]!;
      case 'police':
        return Colors.blue[900]!;
      case 'hazard':
        return Colors.blueGrey[900]!;
      case 'camera':
        return Colors.teal[900]!;
      case 'closure':
        return Colors.black54;
      default:
        return cs.onPrimaryContainer;
    }
  }

  String _getTimeAgo(DateTime date) {
    final diff = DateTime.now().difference(date);
    if (diff.inDays > 0) return '${diff.inDays} ngày trước';
    if (diff.inHours > 0) return '${diff.inHours} giờ trước';
    if (diff.inMinutes > 0) return '${diff.inMinutes} phút trước';
    return 'Vừa xong';
  }
}
