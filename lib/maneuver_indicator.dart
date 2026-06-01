import 'package:flutter/material.dart';

enum ManeuverType {
  straight, // Đi thẳng
  turnLeft, // Rẽ trái
  turnRight, // Rẽ phải
  uTurn, // Quay đầu
  roundabout, // Vòng xuyến/Bùng binh
  start, // Bắt đầu
  arrive, // Đã đến nơi
}

enum ManeuverSize { small, large }

// TODO: Widget Flutter dùng chung cho chức năng điều hướng
class ManeuverIndicator extends StatelessWidget {
  final ManeuverType type;
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

  IconData _getIconForType(ManeuverType type) {
    switch (type) {
      case ManeuverType.start:
        return Icons.straight_rounded; // Hoặc Icons.trip_origin
      case ManeuverType.straight:
        return Icons.arrow_upward_rounded;
      case ManeuverType.turnLeft:
        return Icons.turn_left_rounded;
      case ManeuverType.turnRight:
        return Icons.turn_right_rounded;
      case ManeuverType.uTurn:
        return Icons.u_turn_left_rounded;
      case ManeuverType.roundabout:
        return Icons.roundabout_right_rounded; // Hỗ trợ vòng xuyến
      case ManeuverType.arrive:
        return Icons.location_on_rounded;
    }
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final cs = theme.colorScheme;

    final isLarge = size == ManeuverSize.large;

    return Container(
      padding: EdgeInsets.all(isLarge ? 24.0 : 16.0),
      decoration: BoxDecoration(
        color: cs.primaryContainer,
        borderRadius: BorderRadius.circular(isLarge ? 24.0 : 8.0),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.1),
            offset: Offset(0, isLarge ? 4 : 1),
            blurRadius: isLarge ? 12 : 2,
          ),
        ],
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Icon(
            _getIconForType(type),
            color: cs.onPrimary,
            size: isLarge ? 64.0 : 32.0,
          ),
          SizedBox(width: isLarge ? 16.0 : 12.0),
          Expanded(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  distance,
                  style: isLarge
                      ? theme.textTheme.headlineMedium?.copyWith(
                          color: cs.onPrimary,
                          fontWeight: FontWeight.bold,
                          fontSize: 28, // Matches headline-lg-mobile
                          height: 1.2,
                        )
                      : theme.textTheme.titleLarge?.copyWith(
                          color: cs.onPrimary,
                          fontWeight: FontWeight.bold,
                          height: 1.1,
                        ),
                ),

                const SizedBox(height: 2.0),

                if (instruction != null)
                  Text(
                    instruction!,
                    style: isLarge
                        ? theme.textTheme.titleMedium?.copyWith(
                            color: cs.onPrimaryContainer,
                          )
                        : theme.textTheme.bodyMedium?.copyWith(
                            color: cs.onPrimaryContainer,
                          ),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
