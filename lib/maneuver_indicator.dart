import 'package:flutter/material.dart';
import 'package:smart_route_app/features/navigation/domain/entities/route_entity.dart';

enum ManeuverSize { small, large }

class ManeuverIndicator extends StatelessWidget {
  final ManeuverType type; // Lấy từ route_entity.dart
  final String distance;
  final String? instruction;
  final ManeuverSize size;

  const ManeuverIndicator({
    super.key,
    required this.type,
    required this.distance,
    this.instruction,
    this.size = ManeuverSize.small,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final cs = theme.colorScheme;

    final isLarge = size == ManeuverSize.large;

    return Container(
      padding: EdgeInsets.all(isLarge ? 24.0 : 16.0),
      decoration: BoxDecoration(
        // Dùng màu Primary (Xanh đậm) để giống bảng chỉ dẫn giao thông thật
        color: cs.primary,
        borderRadius: BorderRadius.circular(isLarge ? 24.0 : 16.0),
        boxShadow: [
          BoxShadow(
            color: cs.primary.withOpacity(0.3),
            offset: Offset(0, isLarge ? 8 : 4),
            blurRadius: isLarge ? 24 : 8,
          ),
        ],
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          // 1. ICON RẼ (Sử dụng thẳng getter .icon đã viết trong Enum)
          Icon(
            type.icon,
            color: cs.onPrimary, // Chữ/Icon màu trắng
            size: isLarge ? 56.0 : 32.0,
          ),

          SizedBox(width: isLarge ? 16.0 : 12.0),

          // 2. NỘI DUNG CHỈ DẪN
          Expanded(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                // Khoảng cách (Ví dụ: 200m)
                Text(
                  distance,
                  style: isLarge
                      ? theme.textTheme.headlineMedium?.copyWith(
                          color: cs.onPrimary,
                          fontWeight:
                              FontWeight.w900, // Cực đậm cho dễ nhìn khi lái xe
                          fontSize: 32,
                          height: 1.1,
                          letterSpacing: -0.5,
                        )
                      : theme.textTheme.titleLarge?.copyWith(
                          color: cs.onPrimary,
                          fontWeight: FontWeight.w900,
                          height: 1.1,
                        ),
                ),

                // Tên đường rẽ (Ví dụ: Rẽ phải vào Lê Lợi)
                if (instruction != null && instruction!.isNotEmpty) ...[
                  const SizedBox(height: 4.0),
                  Text(
                    instruction!,
                    style: isLarge
                        ? theme.textTheme.titleMedium?.copyWith(
                            color: cs.onPrimary.withOpacity(
                              0.9,
                            ), // Trắng hơi mờ
                            fontWeight: FontWeight.w500,
                            height: 1.3,
                          )
                        : theme.textTheme.bodyMedium?.copyWith(
                            color: cs.onPrimary.withOpacity(0.9),
                            fontWeight: FontWeight.w500,
                          ),
                    maxLines: 2, // Cho phép rớt 2 dòng nếu tên đường dài
                    overflow: TextOverflow.ellipsis,
                  ),
                ],
              ],
            ),
          ),
        ],
      ),
    );
  }
}
