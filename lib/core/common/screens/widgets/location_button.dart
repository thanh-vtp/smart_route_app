import 'package:arcgis_maps/arcgis_maps.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:smart_route_app/core/common/design_pattern/structural_pattern/arcgis_map_facade.dart';
import 'package:smart_route_app/core/common/provider/is_following_user_provider.dart';
import 'package:smart_route_app/features/incident/presentation/providers/user_location_provider.dart';

// Nút Vị trí (FAB) không dùng để TẮT GPS.
// Hành vi:
// Nếu GPS chưa bật -> Bật lên và bay đến vị trí hiện tại.
// Nếu GPS đã bật nhưng mình đang xem chỗ khác -> Bay về vị trí hiện tại (Re-center).
// Nếu đang ở vị trí hiện tại rồi -> Không làm gì (hoặc zoom nhẹ).
// Trạng thái nút:
// Màu Xanh: Khi bản đồ đang khóa vào vị trí người dùng (Auto Pan).
// Màu Xám/Trống: Khi người dùng di chuyển bản đồ đi chỗ khác (GPS vẫn chạy ngầm, chấm xanh vẫn còn, nhưng camera không đi theo nữa).

/// Widget button để bật/tắt LocationDisplay (GPS)
class LocationButton extends ConsumerWidget {
  final ArcGISMapFacade mapFacade;

  const LocationButton({super.key, required this.mapFacade});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final followState = ref.watch(isFollowingUserProvider);

    final isFollowing = followState.value ?? false;

    return FloatingActionButton(
      heroTag: 'gps_button',
      backgroundColor: isFollowing ? Colors.blue : Colors.white,
      onPressed: () async {
        final status = mapFacade.locationManager.dataSource.status;

        if (status != LocationDataSourceStatus.started) {
          await mapFacade.startLocation(
            onLocationChanged: (location) {
              ref
                  .read(userLocationProvider.notifier)
                  .updateFromLocation(location);
            },
            onError: (error) {
              if (!context.mounted) return;

              ScaffoldMessenger.of(
                context,
              ).showSnackBar(SnackBar(content: Text(error)));
            },
          );
        } else {
          mapFacade.recenterLocation();
        }
      },

      child: Icon(isFollowing ? Icons.my_location : Icons.location_searching),
    );
  }
}
