/// Search bar nổi phía trên bản đồ — lối vào tìm kiếm địa điểm và lập lộ trình.
///
/// Bấm vào mở màn hình route-setup.
/// Bên phải có chuông thông báo với red dot.
library;

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:smart_route_app/core/app/router.dart';

/// Floating search bar hiển thị khi chưa có route active.
class MapSearchBar extends StatelessWidget {
  const MapSearchBar({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final cs = theme.colorScheme;
    final textTheme = theme.textTheme;

    return GestureDetector(
      onTap: () => context.push('/explore/route-setup'),
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
        decoration: BoxDecoration(
          color: cs.surfaceContainerLowest,
          borderRadius: BorderRadius.circular(16),
          border: Border.all(color: cs.outlineVariant.withOpacity(0.5)),
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
            // Avatar placeholder
            CircleAvatar(
              radius: 16,
              backgroundColor: cs.surfaceVariant,
              child: Icon(Icons.person, size: 20, color: cs.onSurfaceVariant),
            ),
            const SizedBox(width: 12),

            // Search prompt
            Expanded(
              child: Row(
                children: [
                  Icon(Icons.search, color: cs.outline),
                  const SizedBox(width: 8),
                  Text(
                    'Bạn muốn đi đâu?',
                    style: textTheme.bodyMedium?.copyWith(
                      color: cs.onSurfaceVariant,
                    ),
                  ),
                ],
              ),
            ),

            // Notification bell
            GestureDetector(
              onTap: () => context.go(AppRoutes.notifications),
              child: Stack(
                clipBehavior: Clip.none,
                children: [
                  Icon(Icons.notifications_none, color: cs.onSurfaceVariant),
                  Positioned(
                    right: 2,
                    top: 2,
                    child: Container(
                      width: 8,
                      height: 8,
                      decoration: BoxDecoration(
                        color: cs.error,
                        shape: BoxShape.circle,
                        border: Border.all(
                          color: cs.surfaceContainerLowest,
                          width: 1.5,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
