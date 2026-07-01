/// Bottom panel dạng DraggableScrollableSheet khi đang navigation.
///
/// Hiển thị:
///   - Header: ETA, thời gian/khoảng cách còn lại (từ NavigationSession),
///     nút thoát navigation
///   - Danh sách chi tiết từng bước chỉ đường với highlight bước đang active
///
/// Đọc real-time từ [navigationNotifierProvider] và [mapUiProvider].
library;

import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:smart_route_app/features/navigation/domain/entities/route_entity.dart';
import 'package:smart_route_app/features/navigation/presentation/state/navigation_notifier.dart';
import 'package:smart_route_app/features/map_drawing/state/map_ui_notifier.dart';

/// Draggable bottom panel danh sách chỉ đường + ETA khi đang navigation.
///
/// [minChildSize] và [maxChildSize] điều khiển chiều cao tối thiểu/tối đa.
class NavigationBottomPanel extends ConsumerStatefulWidget {
  final RouteResult routeResult;
  final List<RouteDirection> directions;
  final double minChildSize;
  final double maxChildSize;

  const NavigationBottomPanel({
    super.key,
    required this.routeResult,
    required this.directions,
    this.minChildSize = 0.16,
    this.maxChildSize = 0.6,
  });

  @override
  ConsumerState<NavigationBottomPanel> createState() =>
      _NavigationBottomPanelState();
}

class _NavigationBottomPanelState extends ConsumerState<NavigationBottomPanel> {
  final DraggableScrollableController _sheetController =
      DraggableScrollableController();
  bool _isExpanded = false;

  @override
  void dispose() {
    _sheetController.dispose();
    super.dispose();
  }

  void _toggleSheet() {
    setState(() => _isExpanded = !_isExpanded);
    _sheetController.animateTo(
      _isExpanded ? widget.maxChildSize : widget.minChildSize,
      duration: const Duration(milliseconds: 300),
      curve: Curves.easeInOut,
    );
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final cs = theme.colorScheme;
    final textTheme = theme.textTheme;

    return DraggableScrollableSheet(
      controller: _sheetController,
      initialChildSize: widget.minChildSize,
      minChildSize: widget.minChildSize,
      maxChildSize: widget.maxChildSize,
      builder: (context, scrollController) {
        return Container(
          decoration: BoxDecoration(
            color: cs.surfaceContainerLowest,
            borderRadius: const BorderRadius.vertical(top: Radius.circular(32)),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.15),
                blurRadius: 20,
                offset: const Offset(0, -4),
              ),
            ],
          ),
          child: GestureDetector(
            onTap: _toggleSheet,
            behavior: HitTestBehavior.opaque,
            child: Column(
              children: [
                _PanelHeader(
                  routeResult: widget.routeResult,
                  cs: cs,
                  textTheme: textTheme,
                ),
                Divider(height: 1, color: cs.outlineVariant.withOpacity(0.3)),
                Expanded(
                  child: _DirectionsList(
                    directions: widget.directions,
                    scrollController: scrollController,
                    cs: cs,
                    textTheme: textTheme,
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}

// ── Header ────────────────────────────────────────────────────────────────────

class _PanelHeader extends ConsumerWidget {
  final RouteResult routeResult;
  final ColorScheme cs;
  final TextTheme textTheme;

  const _PanelHeader({
    required this.routeResult,
    required this.cs,
    required this.textTheme,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final navSession = ref.watch(navigationNotifierProvider).session;

    final eta = navSession?.estimatedArrival ?? routeResult.estimatedArrival;
    final summary = navSession != null
        ? '${navSession.formattedRemainingTime} • ${navSession.formattedRemainingDistance}'
        : '${routeResult.formattedTime} • ${routeResult.formattedDistance}';

    return Column(
      children: [
        // Drag handle
        const SizedBox(height: 12),
        Container(
          width: 48,
          height: 5,
          decoration: BoxDecoration(
            color: cs.outlineVariant,
            borderRadius: BorderRadius.circular(99),
          ),
        ),
        const SizedBox(height: 12),

        // ETA row
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24),
          child: Row(
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Text(
                          eta,
                          style: textTheme.headlineLarge?.copyWith(
                            fontWeight: FontWeight.w900,
                            color: cs.primary,
                            fontSize: 36,
                            height: 1.0,
                          ),
                        ),
                        const SizedBox(width: 8),
                        Padding(
                          padding: const EdgeInsets.only(bottom: 4),
                          child: Text(
                            'Dự kiến',
                            style: textTheme.labelMedium?.copyWith(
                              color: cs.onSurfaceVariant,
                            ),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 4),
                    Text(
                      summary,
                      style: textTheme.titleMedium?.copyWith(
                        color: cs.onSurfaceVariant,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ],
                ),
              ),

              // Nút thoát navigation
              GestureDetector(
                onTap: () => ref.read(mapUiProvider.notifier).stopNavigation(),
                child: Container(
                  padding: const EdgeInsets.all(12),
                  decoration: BoxDecoration(
                    color: cs.errorContainer,
                    shape: BoxShape.circle,
                  ),
                  child: Icon(Icons.close, color: cs.error, size: 28),
                ),
              ),
            ],
          ),
        ),
        const SizedBox(height: 16),
      ],
    );
  }
}

// ── Directions list ───────────────────────────────────────────────────────────

class _DirectionsList extends ConsumerWidget {
  final List<RouteDirection> directions;
  final ScrollController scrollController;
  final ColorScheme cs;
  final TextTheme textTheme;

  const _DirectionsList({
    required this.directions,
    required this.scrollController,
    required this.cs,
    required this.textTheme,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final currentStepIndex =
        ref.watch(navigationNotifierProvider).session?.currentDirectionIndex ??
        0;

    return ListView.separated(
      controller: scrollController,
      padding: const EdgeInsets.symmetric(vertical: 8),
      itemCount: directions.length,
      separatorBuilder: (_, _) =>
          Divider(height: 1, indent: 64, color: cs.surfaceVariant),
      itemBuilder: (_, index) => _DirectionTile(
        direction: directions[index],
        isActive: index == currentStepIndex,
        cs: cs,
        textTheme: textTheme,
      ),
    );
  }
}

// ── Direction tile ────────────────────────────────────────────────────────────

class _DirectionTile extends StatelessWidget {
  final RouteDirection direction;
  final bool isActive;
  final ColorScheme cs;
  final TextTheme textTheme;

  const _DirectionTile({
    required this.direction,
    required this.isActive,
    required this.cs,
    required this.textTheme,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      contentPadding: const EdgeInsets.symmetric(horizontal: 24, vertical: 8),
      tileColor: isActive ? cs.primaryContainer.withOpacity(0.25) : null,
      leading: Container(
        width: 40,
        height: 40,
        decoration: BoxDecoration(
          color: (isActive ? cs.primary : direction.maneuverType.color)
              .withOpacity(0.15),
          shape: BoxShape.circle,
          border: isActive ? Border.all(color: cs.primary, width: 2) : null,
        ),
        child: Icon(
          direction.maneuverType.icon,
          color: isActive ? cs.primary : direction.maneuverType.color,
          size: 24,
        ),
      ),
      title: Text(
        direction.instruction,
        style: textTheme.titleMedium?.copyWith(
          fontWeight: isActive ? FontWeight.w800 : FontWeight.w600,
          color: isActive ? cs.primary : cs.onSurface,
        ),
      ),
      subtitle: direction.distanceMeters > 0
          ? Padding(
              padding: const EdgeInsets.only(top: 4),
              child: Text(
                direction.formattedDistance,
                style: textTheme.bodyMedium?.copyWith(
                  color: isActive ? cs.primary : cs.outline,
                  fontWeight: FontWeight.bold,
                ),
              ),
            )
          : null,
    );
  }
}
