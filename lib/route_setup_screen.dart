import 'package:arcgis_maps/arcgis_maps.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:smart_route_app/core/common/domain/entities/address_result.dart';
import 'package:smart_route_app/core/common/map/providers/map_controller_bundle_provider.dart';
import 'package:smart_route_app/core/common/screens/state/location_ui_notifier.dart';
import 'package:smart_route_app/core/utils/app_logger.dart';
import 'package:smart_route_app/features/navigation/domain/entities/route_entity.dart'
    as entity;
import 'package:smart_route_app/features/navigation/presentation/state/route_notifier.dart';

class RouteSetupScreen extends ConsumerStatefulWidget {
  final AddressResult?
  initialDestination; // Nhận điểm đến nếu người dùng chọn từ trang Map chính
  const RouteSetupScreen({super.key, this.initialDestination});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _RouteSetupScreenState();
}

class _RouteSetupScreenState extends ConsumerState<RouteSetupScreen> {
  bool _avoidTolls = false;
  bool _avoidHighways = true;
  int _selectedVehicle = 0; // 0: Ô tô, 1: Xe máy, 2: Taxi

  AddressResult? _startLocation;
  AddressResult? _endLocation;

  @override
  void initState() {
    super.initState();
    _endLocation = widget.initialDestination;

    // Đợi Flutter vẽ xong frame đầu tiên mới lấy GPS và tính đường
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (!mounted) return; // Đảm bảo widget chưa bị đóng

      final gpsLocation = ref.read(locationUiProvider).location?.position;
      AppLogger.info(
        'Current GPS Location: ${gpsLocation != null ? '(${gpsLocation.y}, ${gpsLocation.x})' : 'Unavailable'}',
        name: 'RouteSetupScreen',
      );

      if (gpsLocation != null) {
        setState(() {
          _startLocation = AddressResult(
            fullAddress: 'Vị trí hiện tại',
            lat: gpsLocation.y,
            lng: gpsLocation.x,
            score: 100,
          );
        });

        // Chỉ TỰ ĐỘNG tính đường nếu đã có đủ 2 điểm (truyền isAuto = true)
        if (_endLocation != null) {
          _calculateRoute(isAuto: true);
        }
      }
    });
  }

  // --- HÀM TÍNH TOÁN ĐƯỜNG ĐI ---
  void _calculateRoute({bool isAuto = false}) {
    if (_startLocation == null || _endLocation == null) {
      // CHỈ HIỆN SNACKBAR NẾU NGƯỜI DÙNG CHỦ ĐỘNG BẤM NÚT (isAuto = false)
      if (!isAuto && mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text('Vui lòng chọn cả điểm bắt đầu và điểm đến'),
          ),
        );
      }
      return; // Nếu thiếu điểm thì thoát im lặng
    }

    // Nếu đã đủ điểm, gọi Notifier tính toán
    ref
        .read(routeNotifierProvider.notifier)
        .calculateRoute(
          startLat: _startLocation!.lat,
          startLng: _startLocation!.lng,
          endLat: _endLocation!.lat,
          endLng: _endLocation!.lng,
          avoidIncidents: true,
        );

    AppLogger.info(
      'Calculating route with parameters: '
      'Start(${_startLocation!.lat}, ${_startLocation!.lng}), '
      'End(${_endLocation!.lat}, ${_endLocation!.lng}), '
      'Avoid Tolls: $_avoidTolls, Avoid Highways: $_avoidHighways',
      name: 'RouteSetupScreen',
    );
  }

  // --- HÀM MỞ MÀN HÌNH TÌM KIẾM ---
  Future<void> _openSearchScreen(bool isStartLocation) async {
    // Gọi màn hình Search và chờ kết quả trả về
    final result = await context.push<AddressResult>('/explore/search');

    if (result != null) {
      setState(() {
        if (isStartLocation) {
          _startLocation = result;
        } else {
          _endLocation = result;
        }
      });

      // Tự động tính đường lại mỗi khi đổi điểm
      if (_startLocation != null && _endLocation != null) {
        _calculateRoute();
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final cs = theme.colorScheme;
    final textTheme = theme.textTheme;

    final routeState = ref.watch(routeNotifierProvider);

    ref.listen(routeNotifierProvider, (previous, next) {
      if (next.errorMessage != null &&
          next.errorMessage != previous?.errorMessage) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(next.errorMessage!),
            backgroundColor: cs.error,
          ),
        );
      }
    });

    return Scaffold(
      body: Stack(
        children: [
          // Simulated Map Background
          Positioned.fill(
            child: Container(
              color: cs.surfaceContainerLow,
              child: CustomPaint(
                painter: _MapGridPainter(
                  color: cs.outlineVariant.withOpacity(0.3),
                ),
              ),

              // TODO: BẢN ĐỒ ACRGIS (Góc nhìn 2D - Vẽ Polyline và Maneuver)
              // child: ArcGISMapView(
              //   controllerProvider: () =>
              //       ref.read(mapControllerBundleProvider).map2D,
              //   onMapViewReady: () {
              //     // Tự động bật chế độ theo dõi (Navigation mode) khi mở màn hình này
              //     // ref.read(locationUiProvider.notifier).startNavigationMode();
              //   },
              // ),
            ),
          ),
          SafeArea(
            child: Column(
              children: [
                // Top Configuration Card
                Container(
                  margin: const EdgeInsets.all(16.0),
                  padding: const EdgeInsets.all(16.0),
                  decoration: BoxDecoration(
                    color: cs.surfaceContainerLowest,
                    borderRadius: BorderRadius.circular(24.0),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.05),
                        blurRadius: 8,
                        offset: const Offset(0, 2),
                      ),
                    ],
                  ),
                  child: Column(
                    children: [
                      // Inputs
                      Stack(
                        children: [
                          Positioned(
                            left: 19,
                            top: 24,
                            bottom: 24,
                            child: Container(
                              width: 2,
                              color: cs.outlineVariant,
                            ),
                          ),
                          Column(
                            children: [
                              // Điểm bắt đầu và điểm đến
                              _buildLocationInput(
                                context,
                                icon: Icons.trip_origin,
                                iconColor: cs.outline,
                                value:
                                    _startLocation?.streetName ??
                                    _startLocation?.fullAddress ??
                                    'Chọn điểm xuất phát',
                                cs: cs,
                                textTheme: textTheme,
                                isPlaceholder: _startLocation == null,
                                onTap: () => _openSearchScreen(true),
                              ),
                              const SizedBox(height: 8),
                              _buildLocationInput(
                                context,
                                icon: Icons.location_on,
                                iconColor: cs.primaryContainer,
                                value:
                                    _endLocation?.streetName ??
                                    _endLocation?.fullAddress ??
                                    'Chọn điểm đến',
                                cs: cs,
                                textTheme: textTheme,
                                isPlaceholder: _endLocation == null,
                                onTap: () => _openSearchScreen(false),
                              ),
                            ],
                          ),
                        ],
                      ),
                      const SizedBox(height: 16),

                      // Vehicle Tabs
                      Row(
                        children: [
                          _buildVehicleTab(
                            context,
                            0,
                            '🚗',
                            'Ô tô',
                            cs,
                            textTheme,
                          ),
                          const SizedBox(width: 8),
                          _buildVehicleTab(
                            context,
                            1,
                            '🛵',
                            'Xe máy',
                            cs,
                            textTheme,
                          ),
                          const SizedBox(width: 8),
                          _buildVehicleTab(
                            context,
                            2,
                            '🚕',
                            'Taxi',
                            cs,
                            textTheme,
                          ),
                        ],
                      ),
                      const SizedBox(height: 16),

                      // Toggles
                      _buildToggle(
                        context,
                        label: 'Tránh trạm thu phí',
                        value: _avoidTolls,
                        onChanged: (val) {
                          setState(() => _avoidTolls = val);

                          if (_startLocation != null && _endLocation != null) {
                            _calculateRoute(isAuto: true);
                          }
                        },
                        cs: cs,
                        textTheme: textTheme,
                      ),
                      const SizedBox(height: 8),
                      _buildToggle(
                        context,
                        label: 'Tránh đường cao tốc',
                        value: _avoidHighways,
                        onChanged: (val) {
                          setState(() => _avoidHighways = val);

                          if (_startLocation != null && _endLocation != null) {
                            _calculateRoute(isAuto: true);
                          }
                        },
                        cs: cs,
                        textTheme: textTheme,
                      ),
                    ],
                  ),
                ),

                const Spacer(),

                // 2.CHỈ HIỆN KHI ĐANG TÍNH HOẶC CÓ KẾT QUẢ
                // Bottom Summary Card
                if (routeState.isCalculating)
                  Container(
                    margin: const EdgeInsets.all(16.0),
                    padding: const EdgeInsets.all(24.0),
                    decoration: BoxDecoration(
                      color: cs.surfaceContainerLowest,
                      borderRadius: BorderRadius.circular(16.0),
                    ),
                    child: const Center(child: CircularProgressIndicator()),
                  )
                else if (routeState.routeResult != null)
                  _buildSummaryCard(cs, textTheme, routeState.routeResult!)
                else
                  Container(
                    width: double.infinity,
                    margin: const EdgeInsets.all(16.0),
                    child: FilledButton(
                      onPressed: () => _calculateRoute(isAuto: false),
                      style: FilledButton.styleFrom(
                        backgroundColor: cs.primary,
                        foregroundColor: cs.onPrimary,
                        padding: const EdgeInsets.symmetric(vertical: 16),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(9999),
                        ),
                      ),
                      child: Text(
                        'TÌM ĐƯỜNG',
                        style: textTheme.labelLarge?.copyWith(
                          fontWeight: FontWeight.bold,
                          color: cs.onPrimary,
                          letterSpacing: 1.2,
                        ),
                      ),
                    ),
                  ),
              ],
            ),
          ),

          /// TODO: Nút back về trang trước (BỎ)
          // SafeArea(
          //   child: Padding(
          //     padding: const EdgeInsets.all(8.0),
          //     child: IconButton(
          //       onPressed: () => Navigator.pop(context),
          //       icon: const Icon(Icons.arrow_back),
          //       style: IconButton.styleFrom(
          //         backgroundColor: cs.surfaceContainerLowest,
          //         shadowColor: Colors.black.withOpacity(0.1),
          //         elevation: 2,
          //       ),
          //     ),
          //   ),
          // ),
        ],
      ),
    );
  }

  Container _buildSummaryCard(
    ColorScheme cs,
    TextTheme textTheme,
    entity.RouteResult routeResult,
  ) {
    return Container(
      margin: const EdgeInsets.all(16.0),
      padding: const EdgeInsets.all(24.0),
      decoration: BoxDecoration(
        color: cs.surfaceContainerLowest,
        borderRadius: BorderRadius.circular(16.0),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.1),
            blurRadius: 12,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Text(
            // NẾU SAU NÀY BẠN CÓ CHỨC NĂNG SO SÁNH (Ví dụ: Né được kẹt xe)
            'Đã chọn đường né sự cố',
            style: textTheme.titleSmall?.copyWith(
              color: cs.primary,
              fontWeight: FontWeight.bold,
            ),
          ),

          const SizedBox(height: 16),
          Text(
            routeResult.formattedTime, // Thời gian
            style: textTheme.headlineMedium?.copyWith(
              fontWeight: FontWeight.bold,
              color: cs.onSurface,
            ),
          ),
          const SizedBox(height: 4),
          Text(
            '${routeResult.formattedDistance} • Tới lúc ${routeResult.estimatedArrival}',
            style: textTheme.bodyMedium?.copyWith(color: cs.onSurfaceVariant),
          ),
          const SizedBox(height: 16),
          FilledButton(
            onPressed: () {
              /// TODO: '/go/active-navigation' is the route for ActiveNavigationScreen
              context.push('/go/active-navigation');
            },
            style: FilledButton.styleFrom(
              backgroundColor: cs.primary,
              foregroundColor: cs.onPrimary,
              padding: const EdgeInsets.symmetric(vertical: 16),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(9999),
              ),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'BẮT ĐẦU ĐI',
                  style: textTheme.labelLarge?.copyWith(
                    fontWeight: FontWeight.bold,
                    color: cs.onPrimary,
                  ),
                ),
                const SizedBox(width: 8),
                Icon(Icons.navigation, color: cs.onPrimary, size: 20),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildLocationInput(
    BuildContext context, {
    required IconData icon,
    required Color iconColor,
    required String value,
    required ColorScheme cs,
    required TextTheme textTheme,
    required bool isPlaceholder,
    required VoidCallback onTap, // Nhận sự kiện Tap
  }) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(8),
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 12),
        decoration: BoxDecoration(
          color: cs.surfaceContainer,
          borderRadius: BorderRadius.circular(8),
        ),
        child: Row(
          children: [
            Icon(icon, color: iconColor, size: 20),
            const SizedBox(width: 12),
            Expanded(
              child: Text(
                value,
                style: textTheme.bodyMedium?.copyWith(
                  color: isPlaceholder ? cs.outline : cs.onSurface,
                  fontWeight: isPlaceholder
                      ? FontWeight.normal
                      : FontWeight.w500,
                ),
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildVehicleTab(
    BuildContext context,
    int index,
    String emoji,
    String label,
    ColorScheme cs,
    TextTheme textTheme,
  ) {
    final isSelected = _selectedVehicle == index;
    return Expanded(
      child: GestureDetector(
        onTap: () {
          setState(() {
            _selectedVehicle = index;
          });
        },
        child: Container(
          padding: const EdgeInsets.symmetric(vertical: 8),
          decoration: BoxDecoration(
            color: isSelected ? cs.primaryContainer : Colors.transparent,
            borderRadius: BorderRadius.circular(8),
            border: Border.all(
              color: isSelected ? cs.primaryContainer : cs.outlineVariant,
            ),
          ),
          alignment: Alignment.center,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(emoji, style: const TextStyle(fontSize: 16)),
              const SizedBox(width: 4),
              Text(
                label,
                style: textTheme.labelLarge?.copyWith(
                  color: isSelected
                      ? cs.onPrimaryContainer
                      : cs.onSurfaceVariant,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildToggle(
    BuildContext context, {
    required String label,
    required bool value,
    required ValueChanged<bool> onChanged,
    required ColorScheme cs,
    required TextTheme textTheme,
  }) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(label, style: textTheme.bodyMedium?.copyWith(color: cs.onSurface)),
        Switch(
          value: value,
          onChanged: onChanged,
          activeColor: cs.onPrimary,
          activeTrackColor: cs.primary,
          inactiveThumbColor: cs.outline,
          inactiveTrackColor: cs.surfaceVariant,
        ),
      ],
    );
  }
}

class _MapGridPainter extends CustomPainter {
  final Color color;

  _MapGridPainter({required this.color});

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = color
      ..strokeWidth = 1.0;

    const double spacing = 40.0;

    for (double i = 0; i <= size.width; i += spacing) {
      canvas.drawLine(Offset(i, 0), Offset(i, size.height), paint);
    }

    for (double i = 0; i <= size.height; i += spacing) {
      canvas.drawLine(Offset(0, i), Offset(size.width, i), paint);
    }
  }

  @override
  bool shouldRepaint(covariant _MapGridPainter oldDelegate) {
    return color != oldDelegate.color;
  }
}
