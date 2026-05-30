import 'dart:async';
import 'package:arcgis_maps/arcgis_maps.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:smart_route_app/core/utils/app_logger.dart';
import 'package:smart_route_app/features/incident/presentation/providers/base_map_style_providers.dart';
import 'package:smart_route_app/features/incident/presentation/providers/location_display_providers.dart';

class LocationPickerMapWidget extends HookConsumerWidget {
  const LocationPickerMapWidget({
    super.key,
    required this.initiallat,
    required this.initiallng,
  });

  final double initiallat;
  final double initiallng;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // 1. Controller cho MapView
    final mapViewController = useMemoized(
      () => ArcGISMapView.createController(),
    );

    // Data Source cho GPS (Tạo riêng cho màn hình này)
    final locationDataSource = useMemoized(() => SystemLocationDataSource());

    // 2. States
    // Tọa độ tâm bản đồ (WGS84) để hiển thị và trả về
    final centerlat = useState<double>(initiallat);
    final centerlng = useState<double>(initiallng);
    // Trạng thái đang kéo map (để làm hiệu ứng UI)
    final isMoving = useState(false);

    // Trạng thái theo dõi người dùng (để đổi màu nút)
    final isFollowingUser = useState(false);

    // Đọc trạng thái GPS toàn cục
    final isGlobalLocationEnabled = ref.read(locationDisplayProviderProvider);

    // 3. Lifecycle: Init Map & Dispose
    useEffect(() {
      final baseMapStyle = ref.read(baseMapStyleProviderProvider);
      final map = ArcGISMap.withBasemapStyle(baseMapStyle);
      map.minScale = 100000000;
      mapViewController.arcGISMap = map;

      // Cleanup: Tắt GPS khi thoát màn hình để tiết kiệm pin
      return () {
        locationDataSource.stop();
      };
    }, []);

    // 5. Hàm xử lý nút My Location
    Future<void> onMyLocationPressed() async {
      try {
        final locationDisplay = mapViewController.locationDisplay;

        // Nếu chưa bật -> Bật lên
        if (!locationDisplay.started) {
          locationDisplay.dataSource = locationDataSource;
          locationDisplay.autoPanMode = LocationDisplayAutoPanMode.recenter;
          await locationDataSource.start();
          locationDisplay.start();

          // Nếu bật thành công -> Zoom về vị trí hiện tại
          if (locationDisplay.location != null) {
            await mapViewController.setViewpointCenter(
              locationDisplay.location!.position,
              scale: 5000,
            );
          }
        }
        // Nếu đã start -> Chỉ cần Recenter (Khóa camera lại)
        else {
          locationDisplay.autoPanMode = LocationDisplayAutoPanMode.recenter;
          final location = locationDisplay.location;
          // Nếu đang ở quá xa vị trí hiện tại thì zoom về
          if (location != null) {
            await mapViewController.setViewpointCenter(
              location.position,
              scale: 5000,
            );
          }
        }
        // Cập nhật màu nút
        isFollowingUser.value = true;
      } catch (e) {
        AppLogger.ui("Lỗi bật định vị picker: $e");
      }
    }

    // 6. Callback khi Map đã sẵn sàng
    void onMapViewReady() async {
      // Di chuyển camera đến vị trí ban đầu (Incident cũ hoặc Default)
      final initialPoint = ArcGISPoint(
        x: initiallng,
        y: initiallat,
        spatialReference: SpatialReference.wgs84,
      );
      // zoom về initial point
      await mapViewController.setViewpointCenter(initialPoint, scale: 5000);

      // Nếu GPS đang tắt (từ global), ta mới zoom về initialPoint.
      // Còn nếu GPS đang bật, tí nữa logic bên dưới sẽ tự zoom về current location.
      if (isGlobalLocationEnabled) {
        try {
          final locationDisplay = mapViewController.locationDisplay;
          if (!locationDisplay.started) {
            locationDisplay.dataSource = locationDataSource;
            await locationDataSource.start();
            locationDisplay.start();
          }
        } catch (e) {
          AppLogger.ui("Picker Map: Failed to auto-start GPS: $e");
        }
      }

      // --- LẮNG NGHE SỰ THAY ĐỔI AUTOPAN (Logic Xanh/Xám) ---
      // ArcGIS tự động chuyển về .off khi user vuốt map.
      // Ta lắng nghe để update nút thành màu Xám.
      mapViewController.locationDisplay.onAutoPanModeChanged.listen((mode) {
        if (mode == LocationDisplayAutoPanMode.recenter ||
            mode == LocationDisplayAutoPanMode.compassNavigation) {
          isFollowingUser.value = true;
        } else {
          isFollowingUser.value = false;
        }
      });

      // -- LOGIC DETECT DỪNG MAP (DEBOUNCE) --
      Timer? debounceTimer;

      // Lắng nghe sự thay đổi của camera
      mapViewController.onViewpointChanged.listen((_) {
        // Ngay khi map nhúc nhích, set isMoving = true
        if (!isMoving.value) isMoving.value = true;

        // Hủy timer cũ
        debounceTimer?.cancel();

        // Cập nhật tọa độ hiển thị (Real-time update)
        try {
          final visibleArea = mapViewController.visibleArea;
          if (visibleArea != null) {
            final center = visibleArea.extent.center;

            // Project từ WebMercator sang WGS84
            final wgs84Point =
                GeometryEngine.project(
                      center,
                      outputSpatialReference: SpatialReference.wgs84,
                    )
                    as ArcGISPoint?;

            if (wgs84Point != null) {
              centerlat.value = wgs84Point.y;
              centerlng.value = wgs84Point.x;
            }
          }
        } catch (_) {}

        // Set timer mới: Nếu 150ms không di chuyển nữa -> Coi như dừng
        debounceTimer = Timer(const Duration(milliseconds: 150), () {
          isMoving.value = false;
        });
      });
    }

    return Scaffold(
      appBar: AppBar(
        title: const Text('Chọn vị trí'),
        elevation: 0,
        actions: [
          TextButton(
            onPressed: () {
              // Trả về kết quả cho màn hình trước
              Navigator.pop(context, {
                'lat': centerlat.value,
                'lng': centerlng.value,
              });
            },
            child: const Text(
              'LƯU',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
            ),
          ),
        ],
      ),
      body: Stack(
        children: [
          // A. MAP VIEW
          ArcGISMapView(
            controllerProvider: () => mapViewController,
            onMapViewReady: onMapViewReady,
          ),

          // B. CENTER PIN (Marker tĩnh)
          Center(
            child: Padding(
              // Offset padding bottom để mũi nhọn của Pin chạm đúng tâm màn hình
              padding: const EdgeInsets.only(bottom: 40),
              child: AnimatedTranslation(
                // Hiệu ứng: Khi đang kéo map (isMoving), Pin nảy lên 1 chút (-10px)
                offset: isMoving.value ? const Offset(0, -10) : Offset.zero,
                child: const Icon(
                  Icons.location_on,
                  size: 50,
                  color: Colors.red,
                  shadows: [
                    Shadow(
                      color: Colors.black26,
                      blurRadius: 10,
                      offset: Offset(0, 5),
                    ),
                  ],
                ),
              ),
            ),
          ),

          // Bóng đổ dưới chân Pin (Cho đẹp)
          Center(
            child: Container(
              margin: const EdgeInsets.only(top: 5),
              width: 6,
              height: 6,
              decoration: BoxDecoration(
                color: Colors.black.withValues(alpha: 0.2),
                shape: BoxShape.circle,
              ),
            ),
          ),

          // C. NÚT MY LOCATION
          Positioned(
            right: 16,
            bottom: 250, // Nằm trên Info Card
            child: FloatingActionButton(
              heroTag: 'picker_gps_btn',
              backgroundColor: Colors.white,
              onPressed: onMyLocationPressed,
              child: Icon(
                isFollowingUser.value
                    ? Icons.my_location
                    : Icons.location_searching,
                color: isFollowingUser.value ? Colors.blue : Colors.grey[700],
              ),
            ),
          ),

          // D. INFO CARD (Hiển thị tọa độ)
          Positioned(
            left: 16,
            right: 16,
            bottom: 30,
            child: Card(
              elevation: 4,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(16),
              ),
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Row(
                      children: [
                        const Icon(
                          Icons.info_outline,
                          color: Colors.blue,
                          size: 20,
                        ),
                        const SizedBox(width: 8),
                        Expanded(
                          child: Text(
                            isMoving.value ? "Đang chọn..." : "Vị trí đã chọn",
                            style: TextStyle(
                              color: isMoving.value
                                  ? Colors.blue
                                  : Colors.black87,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ),
                      ],
                    ),
                    const Divider(height: 24),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        _CoordinateItem(
                          label: "lat",
                          value: centerlat.value.toStringAsFixed(6),
                        ),
                        _CoordinateItem(
                          label: "lng",
                          value: centerlng.value.toStringAsFixed(6),
                        ),
                      ],
                    ),
                    const SizedBox(height: 16),
                    SizedBox(
                      width: double.infinity,
                      child: ElevatedButton(
                        onPressed: () {
                          Navigator.pop(context, {
                            'lat': centerlat.value,
                            'lng': centerlng.value,
                          });
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.blue,
                          foregroundColor: Colors.white,
                          padding: const EdgeInsets.symmetric(vertical: 12),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8),
                          ),
                        ),
                        child: const Text("Xác nhận vị trí này"),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

// Widget con hiển thị thông số tọa độ
class _CoordinateItem extends StatelessWidget {
  final String label;
  final String value;

  const _CoordinateItem({required this.label, required this.value});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(label, style: TextStyle(fontSize: 12, color: Colors.grey[600])),
        const SizedBox(height: 4),
        Text(
          value,
          style: const TextStyle(
            fontSize: 15,
            fontWeight: FontWeight.bold,
            fontFamily: 'Monospace', // Font đơn cách cho số đẹp hơn
          ),
        ),
      ],
    );
  }
}

// Widget con làm hiệu ứng nảy (Bounce Animation)
class AnimatedTranslation extends StatelessWidget {
  final Offset offset;
  final Widget child;

  const AnimatedTranslation({
    super.key,
    required this.offset,
    required this.child,
  });

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 150),
      curve: Curves.easeOut,
      transform: Matrix4.translationValues(offset.dx, offset.dy, 0),
      child: child,
    );
  }
}
