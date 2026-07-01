/// Bottom sheet tóm tắt lộ trình sau khi tính đường thành công.
///
/// Hiển thị:
///   - Selector lựa chọn lộ trình thay thế (nếu có)
///   - Thông tin route: thời gian, khoảng cách, ETA
///   - Nút "BẮT ĐẦU ĐI" để vào chế độ navigation
///   - Nút hủy route
library;

import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:smart_route_app/features/map_drawing/state/map_ui_notifier.dart';
import 'package:smart_route_app/features/navigation/domain/entities/route_entity.dart';
import 'package:smart_route_app/features/navigation/presentation/state/route_notifier.dart';
import 'package:smart_route_app/features/navigation/presentation/widgets/alternative_routes_selector.dart';

/// Sheet tóm tắt lộ trình hiển thị ở bottom khi có route, trước khi bắt đầu.
class RouteSummarySheet extends ConsumerWidget {
  final RouteResult routeResult;

  const RouteSummarySheet({super.key, required this.routeResult});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final theme = Theme.of(context);
    final cs = theme.colorScheme;
    final textTheme = theme.textTheme;

    final routeState = ref.watch(routeProvider);
    final alternatives = routeState.alternativeRoutesResult;
    final selectedStrategy =
        routeState.selectedStrategy ?? RouteStrategy.balanced;

    return Container(
      padding: const EdgeInsets.fromLTRB(24, 12, 16, 32),
      decoration: BoxDecoration(
        color: cs.surfaceContainerLowest,
        borderRadius: const BorderRadius.vertical(top: Radius.circular(24)),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.15),
            blurRadius: 16,
            offset: const Offset(0, -4),
          ),
        ],
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          // Drag handle
          Center(
            child: Container(
              width: 40,
              height: 4,
              margin: const EdgeInsets.only(bottom: 16),
              decoration: BoxDecoration(
                color: cs.outlineVariant,
                borderRadius: BorderRadius.circular(2),
              ),
            ),
          ),

          // Tiêu đề + nút hủy
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                alternatives != null
                    ? 'Lựa chọn lộ trình'
                    : 'Đã chọn lộ trình né sự cố',
                style: textTheme.titleSmall?.copyWith(
                  color: cs.primary,
                  fontWeight: FontWeight.bold,
                ),
              ),
              GestureDetector(
                onTap: () => ref.read(routeProvider.notifier).clearRoute(),
                child: Container(
                  width: 40,
                  height: 40,
                  decoration: BoxDecoration(
                    color: cs.surface,
                    shape: BoxShape.circle,
                    border: Border.all(color: cs.outlineVariant),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.05),
                        blurRadius: 4,
                      ),
                    ],
                  ),
                  child: Icon(
                    Icons.close,
                    color: cs.onSurfaceVariant,
                    size: 20,
                  ),
                ),
              ),
            ],
          ),

          const SizedBox(height: 12),

          // Alternative routes selector
          if (alternatives != null && alternatives.alternatives.isNotEmpty) ...[
            AlternativeRoutesSelector(
              alternatives: alternatives,
              selectedStrategy: selectedStrategy,
            ),
            const SizedBox(height: 16),
          ],

          // Route info
          Text(
            routeResult.formattedTime,
            style: textTheme.headlineMedium?.copyWith(
              fontWeight: FontWeight.bold,
              color: cs.onSurface,
            ),
          ),
          const SizedBox(height: 4),
          Text(
            '${routeResult.formattedDistance} • Tới lúc ${routeResult.estimatedArrival}',
            style: textTheme.bodyMedium?.copyWith(color: cs.onSurfaceVariant),
          ),
          const SizedBox(height: 20),

          // CTA
          FilledButton(
            onPressed: () => ref.read(mapUiProvider.notifier).startNavigation(),
            style: FilledButton.styleFrom(
              backgroundColor: cs.primary,
              foregroundColor: cs.onPrimary,
              padding: const EdgeInsets.symmetric(vertical: 16),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(9999),
              ),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'BẮT ĐẦU ĐI',
                  style: textTheme.labelLarge?.copyWith(
                    fontWeight: FontWeight.bold,
                    color: cs.onPrimary,
                  ),
                ),
                const SizedBox(width: 8),
                Icon(Icons.navigation, color: cs.onPrimary, size: 20),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
