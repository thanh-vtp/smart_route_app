import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import '../../../navigation/domain/entities/route_direction.dart';
import '../../../navigation/domain/entities/route_result.dart' as entities;

/// Bottom sheet hiển thị chi tiết chỉ đường
class RouteDirectionsSheet extends ConsumerWidget {
  final entities.RouteResult route;
  final VoidCallback? onStartNavigation;
  final VoidCallback? onClose;

  const RouteDirectionsSheet({
    super.key,
    required this.route,
    this.onStartNavigation,
    this.onClose,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return DraggableScrollableSheet(
      initialChildSize: 0.4,
      minChildSize: 0.15,
      maxChildSize: 0.9,
      builder: (context, scrollController) {
        return Container(
          decoration: const BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.vertical(top: Radius.circular(16)),
            boxShadow: [
              BoxShadow(
                color: Colors.black26,
                blurRadius: 10,
                offset: Offset(0, -2),
              ),
            ],
          ),
          child: Column(
            children: [
              // Handle bar
              _buildHandle(),

              // Route summary header
              _buildRouteSummary(context),

              const Divider(height: 1),

              // Directions list
              Expanded(child: _buildDirectionsList(scrollController)),

              // Action buttons
              _buildActionButtons(context),
            ],
          ),
        );
      },
    );
  }

  Widget _buildHandle() {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 8),
      width: 40,
      height: 4,
      decoration: BoxDecoration(
        color: Colors.grey.shade300,
        borderRadius: BorderRadius.circular(2),
      ),
    );
  }

  Widget _buildRouteSummary(BuildContext context) {
    final hours = (route.totalTime / 60).floor();
    final mins = (route.totalTime % 60).round();
    final timeStr = hours > 0
        ? '$hours giờ ${mins > 0 ? "$mins phút" : ""}'
        : '$mins phút';

    final distanceKm = route.totalDistance / 1000;
    final distanceStr = distanceKm >= 1
        ? '${distanceKm.toStringAsFixed(1)} km'
        : '${route.totalDistance.toStringAsFixed(0)} m';

    // Tính thời gian đến
    final now = DateTime.now();
    final arrival = now.add(Duration(minutes: route.totalTime.round()));
    final arrivalStr =
        '${arrival.hour.toString().padLeft(2, '0')}:${arrival.minute.toString().padLeft(2, '0')}';

    return Padding(
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Main stats row
          Row(
            children: [
              // Time
              Expanded(
                child: _buildStatCard(
                  icon: Icons.access_time,
                  iconColor: Colors.blue,
                  value: timeStr,
                  label: 'Thời gian',
                ),
              ),
              const SizedBox(width: 12),
              // Distance
              Expanded(
                child: _buildStatCard(
                  icon: Icons.straighten,
                  iconColor: Colors.green,
                  value: distanceStr,
                  label: 'Khoảng cách',
                ),
              ),
              const SizedBox(width: 12),
              // ETA
              Expanded(
                child: _buildStatCard(
                  icon: Icons.flag,
                  iconColor: Colors.orange,
                  value: arrivalStr,
                  label: 'Đến lúc',
                ),
              ),
            ],
          ),

          const SizedBox(height: 12),

          // Route name
          Text(
            route.routeName,
            style: TextStyle(fontSize: 14, color: Colors.grey.shade600),
          ),
        ],
      ),
    );
  }

  Widget _buildStatCard({
    required IconData icon,
    required Color iconColor,
    required String value,
    required String label,
  }) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 8),
      decoration: BoxDecoration(
        color: Colors.grey.shade50,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        children: [
          Icon(icon, color: iconColor, size: 24),
          const SizedBox(height: 4),
          Text(
            value,
            style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            textAlign: TextAlign.center,
          ),
          Text(
            label,
            style: TextStyle(fontSize: 11, color: Colors.grey.shade600),
          ),
        ],
      ),
    );
  }

  Widget _buildDirectionsList(ScrollController scrollController) {
    if (route.directions.isEmpty) {
      return const Center(child: Text('Không có thông tin chỉ đường chi tiết'));
    }

    return ListView.builder(
      controller: scrollController,
      padding: const EdgeInsets.symmetric(horizontal: 16),
      itemCount: route.directions.length,
      itemBuilder: (context, index) {
        final direction = route.directions[index];
        final isFirst = index == 0;
        final isLast = index == route.directions.length - 1;

        return _buildDirectionItem(direction, isFirst, isLast);
      },
    );
  }

  Widget _buildDirectionItem(
    RouteDirection direction,
    bool isFirst,
    bool isLast,
  ) {
    return IntrinsicHeight(
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Timeline indicator
          SizedBox(
            width: 40,
            child: Column(
              children: [
                // Icon
                Container(
                  width: 36,
                  height: 36,
                  decoration: BoxDecoration(
                    color: direction.maneuverType.color.withValues(alpha: 0.1),
                    shape: BoxShape.circle,
                    border: Border.all(
                      color: direction.maneuverType.color,
                      width: 2,
                    ),
                  ),
                  child: Icon(
                    direction.maneuverType.icon,
                    color: direction.maneuverType.color,
                    size: 18,
                  ),
                ),
                // Line
                if (!isLast)
                  Expanded(
                    child: Container(width: 2, color: Colors.grey.shade300),
                  ),
              ],
            ),
          ),

          const SizedBox(width: 12),

          // Content
          Expanded(
            child: Padding(
              padding: const EdgeInsets.only(bottom: 16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Instruction
                  Text(
                    direction.instruction,
                    style: const TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w500,
                    ),
                  ),

                  const SizedBox(height: 4),

                  // Distance & Time
                  if (direction.distanceMeters > 0 || direction.timeMinutes > 0)
                    Row(
                      children: [
                        if (direction.distanceMeters > 0) ...[
                          Icon(
                            Icons.straighten,
                            size: 14,
                            color: Colors.grey.shade500,
                          ),
                          const SizedBox(width: 4),
                          Text(
                            direction.formattedDistance,
                            style: TextStyle(
                              fontSize: 12,
                              color: Colors.grey.shade600,
                            ),
                          ),
                        ],
                        if (direction.distanceMeters > 0 &&
                            direction.timeMinutes > 0)
                          const SizedBox(width: 12),
                        if (direction.timeMinutes > 0) ...[
                          Icon(
                            Icons.access_time,
                            size: 14,
                            color: Colors.grey.shade500,
                          ),
                          const SizedBox(width: 4),
                          Text(
                            direction.formattedTime,
                            style: TextStyle(
                              fontSize: 12,
                              color: Colors.grey.shade600,
                            ),
                          ),
                        ],
                      ],
                    ),

                  // Street name
                  if (direction.streetName != null) ...[
                    const SizedBox(height: 4),
                    Text(
                      direction.streetName!,
                      style: TextStyle(
                        fontSize: 12,
                        color: Colors.blue.shade700,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ],
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildActionButtons(BuildContext context) {
    return Container(
      padding: EdgeInsets.fromLTRB(
        16,
        12,
        16,
        12 + MediaQuery.of(context).padding.bottom,
      ),
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.05),
            blurRadius: 4,
            offset: const Offset(0, -2),
          ),
        ],
      ),
      child: Row(
        children: [
          // Start navigation button
          Expanded(
            flex: 2,
            child: ElevatedButton.icon(
              onPressed: onStartNavigation,
              icon: const Icon(Icons.navigation),
              label: const Text('Bắt đầu'),
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.teal,
                foregroundColor: Colors.white,
                padding: const EdgeInsets.symmetric(vertical: 14),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
            ),
          ),

          const SizedBox(width: 12),

          // Preview button
          Expanded(
            child: OutlinedButton.icon(
              onPressed: () {
                // TODO: Preview route animation
              },
              icon: const Icon(Icons.play_arrow),
              label: const Text('Xem'),
              style: OutlinedButton.styleFrom(
                padding: const EdgeInsets.symmetric(vertical: 14),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
            ),
          ),

          const SizedBox(width: 8),

          // Share button
          IconButton(
            onPressed: () {
              // TODO: Share route
            },
            icon: const Icon(Icons.share),
            style: IconButton.styleFrom(
              backgroundColor: Colors.grey.shade100,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
