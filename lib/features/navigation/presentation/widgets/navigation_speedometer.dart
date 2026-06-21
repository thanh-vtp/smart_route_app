/// Widget đồng hồ tốc độ hình tròn hiển thị tốc độ hiện tại khi đang navigation.
///
/// Đọc tốc độ từ [locationUiProvider] (ArcGISLocation.speed, đơn vị m/s).
/// Hiển thị km/h. Viền đổi màu đỏ khi tốc độ > 80 km/h.
library;

import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:smart_route_app/features/map_drawing/state/location_ui_notifier.dart';

/// Đồng hồ tốc độ góc dưới trái màn hình navigation.
class NavigationSpeedometer extends ConsumerWidget {
  const NavigationSpeedometer({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final theme = Theme.of(context);
    final cs = theme.colorScheme;
    final textTheme = theme.textTheme;

    final locationState = ref.watch(locationUiProvider);
    final double speedMpS = locationState.location?.speed ?? 0.0;
    final int speedKmh = (speedMpS * 3.6).round();

    return Positioned(
      left: 16,
      bottom: MediaQuery.of(context).size.height * 0.15 + 16,
      child: Container(
        width: 72,
        height: 72,
        decoration: BoxDecoration(
          color: cs.surfaceContainerLowest,
          shape: BoxShape.circle,
          border: Border.all(
            color: speedKmh > 80 ? cs.error : cs.outlineVariant,
            width: 3,
          ),
          boxShadow: [
            BoxShadow(color: Colors.black.withOpacity(0.1), blurRadius: 8),
          ],
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              speedKmh.toString(),
              style: textTheme.headlineMedium?.copyWith(
                fontWeight: FontWeight.w900,
                color: cs.onSurface,
                height: 1.0,
              ),
            ),
            Text(
              'km/h',
              style: textTheme.labelSmall?.copyWith(color: cs.onSurfaceVariant),
            ),
          ],
        ),
      ),
    );
  }
}
