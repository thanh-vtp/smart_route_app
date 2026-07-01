import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:smart_route_app/features/navigation/domain/entities/route_entity.dart';
import 'package:smart_route_app/features/navigation/presentation/state/route_notifier.dart';

/// Alternative routes selector với large cards (horizontal PageView)
class AlternativeRoutesSelector extends ConsumerWidget {
  final AlternativeRoutesResult alternatives;
  final RouteStrategy selectedStrategy;

  const AlternativeRoutesSelector({
    super.key,
    required this.alternatives,
    required this.selectedStrategy,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final theme = Theme.of(context);
    final cs = theme.colorScheme;
    final textTheme = theme.textTheme;

    // Tạo danh sách tất cả routes
    final allRoutes = <({RouteStrategy strategy, RouteResult route})>[
      (strategy: RouteStrategy.balanced, route: alternatives.recommendedRoute),
      ...alternatives.alternatives.map(
        (alt) => (strategy: alt.strategy, route: alt.route),
      ),
    ];

    return SizedBox(
      height: 114, // Giảm height xuống
      child: PageView.builder(
        controller: PageController(viewportFraction: 0.92),
        itemCount: allRoutes.length,
        itemBuilder: (context, index) {
          final item = allRoutes[index];
          final isSelected = selectedStrategy == item.strategy;
          final isRecommended = item.strategy == RouteStrategy.balanced;

          // Comparison note (so với recommended)
          String? comparisonNote;
          if (!isRecommended) {
            comparisonNote = _getComparisonNote(
              alternatives.recommendedRoute,
              item.route,
            );
          }

          return Padding(
            padding: const EdgeInsets.only(right: 8.0, bottom: 4, top: 4),
            child: _RouteCard(
              strategy: item.strategy,
              route: item.route,
              isSelected: isSelected,
              isRecommended: isRecommended,
              comparisonNote: comparisonNote,
              cs: cs,
              textTheme: textTheme,
              onTap: () {
                ref
                    .read(routeProvider.notifier)
                    .selectAlternativeRoute(item.strategy);
              },
            ),
          );
        },
      ),
    );
  }

  String _getComparisonNote(RouteResult mainRoute, RouteResult altRoute) {
    final timeDiff = altRoute.totalTimeMinutes - mainRoute.totalTimeMinutes;
    final distDiff =
        altRoute.totalDistanceMeters - mainRoute.totalDistanceMeters;

    final List<String> parts = [];

    if (timeDiff > 0) {
      parts.add('+${timeDiff.toStringAsFixed(0)} phút');
    } else if (timeDiff < 0) {
      parts.add('${timeDiff.toStringAsFixed(0)} phút');
    }

    if (distDiff > 0) {
      parts.add('+${(distDiff / 1000).toStringAsFixed(1)} km');
    } else if (distDiff < 0) {
      parts.add('${(distDiff / 1000).toStringAsFixed(1)} km');
    }

    return parts.isEmpty ? 'Tương đương' : parts.join(', ');
  }
}

class _RouteCard extends StatelessWidget {
  final RouteStrategy strategy;
  final RouteResult route;
  final bool isSelected;
  final bool isRecommended;
  final String? comparisonNote;
  final ColorScheme cs;
  final TextTheme textTheme;
  final VoidCallback onTap;

  const _RouteCard({
    required this.strategy,
    required this.route,
    required this.isSelected,
    required this.isRecommended,
    this.comparisonNote,
    required this.cs,
    required this.textTheme,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      elevation: isSelected ? 3 : 1,
      borderRadius: BorderRadius.circular(16.0),
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(16.0),
        child: Ink(
          decoration: BoxDecoration(
            color: isSelected
                ? cs.primary.withOpacity(0.12) // Màu primary nhạt khi selected
                : cs.surfaceContainerLowest,
            borderRadius: BorderRadius.circular(16.0),
            border: Border.all(
              color: isSelected ? cs.primary : cs.outlineVariant,
              width: isSelected ? 2.0 : 1.0,
            ),
          ),
          child: Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 14.0,
              vertical: 12.0,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                // Title row với badge
                Row(
                  children: [
                    Flexible(
                      child: Text(
                        strategy.name,
                        style: textTheme.titleSmall?.copyWith(
                          fontWeight: FontWeight.w600,
                          color: isSelected ? cs.primary : cs.onSurface,
                        ),
                      ),
                    ),
                    if (isRecommended) ...[
                      const SizedBox(width: 6),
                      Container(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 6,
                          vertical: 2,
                        ),
                        decoration: BoxDecoration(
                          color: cs.primary,
                          borderRadius: BorderRadius.circular(6.0),
                        ),
                        child: Text(
                          'ĐỀ XUẤT',
                          style: textTheme.labelSmall?.copyWith(
                            color: cs.onPrimary,
                            fontWeight: FontWeight.bold,
                            fontSize: 9,
                            letterSpacing: 0.3,
                          ),
                        ),
                      ),
                    ],
                  ],
                ),
                const SizedBox(height: 8),

                // Time & Distance row with icons
                Row(
                  children: [
                    Icon(
                      Icons.schedule_rounded,
                      size: 16,
                      color: isSelected ? cs.primary : cs.onSurfaceVariant,
                    ),
                    const SizedBox(width: 4),
                    Text(
                      route.formattedTime,
                      style: textTheme.bodyMedium?.copyWith(
                        color: isSelected ? cs.primary : cs.onSurface,
                        fontWeight: isSelected
                            ? FontWeight.w700
                            : FontWeight.w600,
                        fontSize: 14,
                      ),
                    ),
                    const SizedBox(width: 12),
                    Icon(
                      Icons.straighten_rounded,
                      size: 16,
                      color: isSelected ? cs.primary : cs.onSurfaceVariant,
                    ),
                    const SizedBox(width: 4),
                    Text(
                      route.formattedDistance,
                      style: textTheme.bodyMedium?.copyWith(
                        color: isSelected ? cs.primary : cs.onSurface,
                        fontWeight: isSelected
                            ? FontWeight.w700
                            : FontWeight.w600,
                        fontSize: 14,
                      ),
                    ),
                  ],
                ),

                // Comparison note
                if (comparisonNote != null) ...[
                  const SizedBox(height: 6),
                  Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 8,
                      vertical: 4,
                    ),
                    decoration: BoxDecoration(
                      color: cs.surfaceVariant.withOpacity(0.5),
                      borderRadius: BorderRadius.circular(6.0),
                    ),
                    child: Text(
                      comparisonNote ?? '',
                      style: textTheme.labelSmall?.copyWith(
                        color: cs.onSurfaceVariant,
                        fontSize: 11,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                ],
              ],
            ),
          ),
        ),
      ),
    );
  }
}
