/// Widget hiển thị bảng chỉ dẫn ngã rẽ phía trên màn hình trong chế độ navigation.
///
/// Bao gồm:
///   - [NavigationTopBanner]: chỉ dẫn hiện tại (ManeuverIndicator lớn) + chip "Sau đó..."
///   - [OffRouteBanner]: banner lệch tuyến / đang tính lại đường
library;

import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:smart_route_app/features/navigation/domain/entities/route_entity.dart';
import 'package:smart_route_app/features/navigation/presentation/state/navigation_notifier.dart';
import 'package:smart_route_app/maneuver_indicator.dart';

// ============================================================
// NavigationTopBanner
// ============================================================

/// Bảng chỉ dẫn ngã rẽ hiện tại + chip "Sau đó..." phía trên màn hình.
/// Đọc từ [navigationNotifierProvider] để hiển thị bước real-time.
class NavigationTopBanner extends ConsumerWidget {
  final RouteResult routeResult;

  const NavigationTopBanner({super.key, required this.routeResult});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final theme = Theme.of(context);
    final cs = theme.colorScheme;
    final textTheme = theme.textTheme;

    final navSession = ref.watch(navigationNotifierProvider).session;

    final currentDirection =
        navSession?.currentDirection ??
        (routeResult.directions.isNotEmpty
            ? routeResult.directions.first
            : null);
    final nextDirection =
        navSession?.nextDirection ??
        (routeResult.directions.length > 1 ? routeResult.directions[1] : null);

    if (currentDirection == null) return const SizedBox.shrink();

    return Positioned(
      top: MediaQuery.of(context).padding.top + 16,
      left: 16,
      right: 16,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          ManeuverIndicator(
            type: currentDirection.maneuverType,
            distance: currentDirection.formattedDistance,
            instruction: currentDirection.instruction,
            size: ManeuverSize.large,
          ),
          const SizedBox(height: 8),
          if (nextDirection != null &&
              nextDirection.maneuverType != ManeuverType.stop)
            _NextStepChip(
              cs: cs,
              textTheme: textTheme,
              direction: nextDirection,
            ),
        ],
      ),
    );
  }
}

class _NextStepChip extends StatelessWidget {
  final ColorScheme cs;
  final TextTheme textTheme;
  final RouteDirection direction;

  const _NextStepChip({
    required this.cs,
    required this.textTheme,
    required this.direction,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
      decoration: BoxDecoration(
        color: cs.surfaceContainerLowest,
        borderRadius: BorderRadius.circular(8),
        boxShadow: [
          BoxShadow(color: Colors.black12.withOpacity(0.1), blurRadius: 8),
        ],
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(
            direction.maneuverType.icon,
            size: 16,
            color: direction.maneuverType.color,
          ),
          const SizedBox(width: 8),
          Text(
            'Sau đó ${direction.formattedDistance}',
            style: textTheme.labelLarge?.copyWith(
              fontWeight: FontWeight.bold,
              color: cs.onSurface,
            ),
          ),
        ],
      ),
    );
  }
}

// ============================================================
// OffRouteBanner
// ============================================================

/// Banner cảnh báo khi người dùng lệch tuyến hoặc đang tính lại đường.
/// Tự ẩn khi session bình thường.
class OffRouteBanner extends ConsumerWidget {
  const OffRouteBanner({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final theme = Theme.of(context);
    final cs = theme.colorScheme;
    final textTheme = theme.textTheme;

    final session = ref.watch(navigationNotifierProvider).session;

    if (session == null || (!session.isOffRoute && !session.isRerouting)) {
      return const SizedBox.shrink();
    }

    final isRerouting = session.isRerouting;

    return Positioned(
      top: MediaQuery.of(context).size.height * 0.35,
      left: 24,
      right: 24,
      child: Material(
        color: Colors.transparent,
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
          decoration: BoxDecoration(
            color: isRerouting ? cs.tertiaryContainer : cs.errorContainer,
            borderRadius: BorderRadius.circular(12),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.12),
                blurRadius: 12,
                offset: const Offset(0, 4),
              ),
            ],
          ),
          child: Row(
            children: [
              if (isRerouting)
                SizedBox(
                  width: 20,
                  height: 20,
                  child: CircularProgressIndicator(
                    strokeWidth: 2.5,
                    color: cs.onTertiaryContainer,
                  ),
                )
              else
                Icon(
                  Icons.warning_amber_rounded,
                  color: cs.onErrorContainer,
                  size: 20,
                ),
              const SizedBox(width: 12),
              Expanded(
                child: Text(
                  isRerouting
                      ? 'Đang tính lại đường...'
                      : 'Bạn đã đi lệch tuyến đường',
                  style: textTheme.titleSmall?.copyWith(
                    fontWeight: FontWeight.bold,
                    color: isRerouting
                        ? cs.onTertiaryContainer
                        : cs.onErrorContainer,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
