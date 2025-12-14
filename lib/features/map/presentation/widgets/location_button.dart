import 'dart:async';

import 'package:arcgis_maps/arcgis_maps.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:smart_route_app/features/map/presentation/providers/location_display_providers.dart';
import 'package:smart_route_app/features/map/presentation/providers/map_controller_provider.dart';
import 'package:smart_route_app/features/map/presentation/providers/map_mode_provider.dart';

// Nút Vị trí (FAB) không dùng để TẮT GPS.
// Hành vi:
// Nếu GPS chưa bật -> Bật lên và bay đến vị trí hiện tại.
// Nếu GPS đã bật nhưng mình đang xem chỗ khác -> Bay về vị trí hiện tại (Re-center).
// Nếu đang ở vị trí hiện tại rồi -> Không làm gì (hoặc zoom nhẹ).
// Trạng thái nút:
// Màu Xanh: Khi bản đồ đang khóa vào vị trí người dùng (Auto Pan).
// Màu Xám/Trống: Khi người dùng di chuyển bản đồ đi chỗ khác (GPS vẫn chạy ngầm, chấm xanh vẫn còn, nhưng camera không đi theo nữa).

/// Widget button để bật/tắt LocationDisplay (GPS)
class LocationButton extends ConsumerStatefulWidget {
  const LocationButton({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _LocationButtonState();
}

class _LocationButtonState extends ConsumerState<LocationButton> {
  // Trạng thái nội bộ: Có đang follow người dùng không?
  bool _isFollowingUser = false;
  StreamSubscription? _autoPanSubscription;

  @override
  void initState() {
    super.initState();
    _subscribeToAutoPanMode();
  }

  void _subscribeToAutoPanMode() {
    // 1. Lấy controller từ Provider (đã khởi tạo bên MapPage hoặc Provider chung)
    final mapController = ref.read(mapControllerProvider);

    // 2. Lắng nghe stream
    _autoPanSubscription = mapController.locationDisplay.onAutoPanModeChanged
        .listen((mode) {
          if (mounted) {
            setState(() {
              // Nếu mode là recenter hoặc compass -> Đang follow (Icon Xanh)
              _isFollowingUser =
                  (mode == LocationDisplayAutoPanMode.recenter ||
                  mode == LocationDisplayAutoPanMode.compassNavigation);
            });
          }
        });
  }

  @override
  void dispose() {
    super.dispose();
    _autoPanSubscription?.cancel();
  }

  @override
  Widget build(BuildContext context) {
    final isGlobalLocationEnabled = ref.watch(locationDisplayProviderProvider);
    final mapMode = ref.watch(mapModeProviderProvider);
    final isDisabled = mapMode == MapMode.scene3D;

    final isBlueState = isGlobalLocationEnabled && _isFollowingUser; // change

    return Tooltip(
      message: isDisabled
          ? 'GPS chỉ khả dụng ở chế độ 2D'
          : (isBlueState ? 'Vị trí của bạn' : 'Cập nhật vị trí'),
      child: Opacity(
        opacity: isDisabled ? 0.5 : 1.0,
        child: FloatingActionButton(
          heroTag: 'main_gps_button',
          onPressed: isDisabled
              ? null
              : () async {
                  if (!isGlobalLocationEnabled) {
                    ref.read(locationDisplayProviderProvider.notifier).toggle();
                    // MapLocationLogic sẽ tự động bắt sự kiện này và start GPS + Recenter
                  } else {
                    // Trường hợp 2: GPS đang BẬT -> Chỉ Re-center (Khóa camera lại)
                    final mapController = ref.read(mapControllerProvider);

                    // Nếu chưa start thì start (đề phòng)
                    if (!mapController.locationDisplay.started) {
                      mapController.locationDisplay.start;
                    }

                    // Kéo camera về người dùng
                    mapController.locationDisplay.autoPanMode =
                        LocationDisplayAutoPanMode.recenter;

                    // (Tùy chọn) Zoom thêm vào nếu đang ở quá xa
                    if (mapController.locationDisplay.location != null) {
                      // mapController.setViewpointScale(5000);
                    }
                  }
                },

          backgroundColor: isDisabled
              ? Colors.grey[300]
              : (isBlueState ? Colors.blue : Colors.white),

          child: Icon(
            isBlueState ? Icons.my_location : Icons.location_searching,
            color: isDisabled
                ? Colors.grey[400]
                : (isBlueState ? Colors.white : Colors.grey[700]),
            size: 24,
          ),
        ),
      ),
    );
  }
}
