import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:smart_route_app/features/search/domain/entities/address_result.dart';
import 'package:smart_route_app/features/map_drawing/state/location_ui_notifier.dart';
import 'package:smart_route_app/features/navigation/presentation/state/route_notifier.dart';
import 'package:smart_route_app/search_screen.dart';

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
      // AppLogger.info(
      //   'Vị trí hiện tại: ${gpsLocation != null ? '(${gpsLocation.y}, ${gpsLocation.x})' : 'Chưa lấy được vị trí hiện tại'}',
      //   name: 'RouteSetupScreen',
      // );

      if (gpsLocation != null) {
        setState(() {
          _startLocation = AddressResult(
            fullAddress: 'Vị trí hiện tại',
            lat: gpsLocation.y,
            lng: gpsLocation.x,
            score: 100,
          );
        });
      }
    });
  }

  // --- HÀM TÍNH TOÁN ĐƯỜNG ĐI ---
  void _calculateRoute() {
    if (_startLocation == null || _endLocation == null) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Vui lòng chọn cả điểm bắt đầu và điểm đến'),
        ),
      );
      return; // Nếu thiếu điểm thì thoát im lặng
    }

    // Gọi tính toán nhiều lộ trình thay thế
    ref
        .read(routeNotifierProvider.notifier)
        .calculateAlternativeRoutes(
          startLat: _startLocation!.lat,
          startLng: _startLocation!.lng,
          endLat: _endLocation!.lat,
          endLng: _endLocation!.lng,
        );
  }

  // --- HÀM MỞ MÀN HÌNH TÌM KIẾM ---
  Future<void> _openSearchScreen(bool isStartLocation) async {
    // Hiện SearchScreen dưới dạng modal bottom sheet thay vì push route,
    // để tránh StatefulShellRoute pop/restore cycle gây flicker ArcGIS map.
    final result = await showModalBottomSheet<AddressResult>(
      context: context,
      isScrollControlled: true,
      useSafeArea: true,
      backgroundColor: Colors.transparent,
      builder: (_) => ClipRRect(
        borderRadius: const BorderRadius.vertical(top: Radius.circular(20)),
        child: const SearchScreen(),
      ),
    );

    if (result != null) {
      setState(() {
        if (isStartLocation) {
          _startLocation = result;
        } else {
          _endLocation = result;
        }
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final cs = theme.colorScheme;
    final textTheme = theme.textTheme;

    final routeState = ref.watch(routeNotifierProvider);

    ref.listen(routeNotifierProvider, (previous, next) {
      // Tự động đóng screen khi có route và chuyển về map
      if (next.routeResult != null && previous?.routeResult == null) {
        context.pop();
      }

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
      backgroundColor: cs.surfaceContainerLowest,
      appBar: AppBar(
        backgroundColor: cs.surfaceContainerLowest,
        title: const Text('Lộ trình của bạn'),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () => context.pop(),
        ),
      ),
      body: SingleChildScrollView(
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
                        child: Container(width: 2, color: cs.outlineVariant),
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
                      _buildVehicleTab(context, 0, '🚗', 'Ô tô', cs, textTheme),
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
                      _buildVehicleTab(context, 2, '🚕', 'Taxi', cs, textTheme),
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
                    },
                    cs: cs,
                    textTheme: textTheme,
                  ),
                ],
              ),
            ),

            const SizedBox(height: 80), // Space for button

            Container(
              width: double.infinity,
              margin: const EdgeInsets.all(16.0),
              child: FilledButton(
                onPressed:
                    (routeState.isCalculating ||
                        routeState.isCalculatingAlternatives)
                    ? null
                    : () => _calculateRoute(),
                style: FilledButton.styleFrom(
                  backgroundColor: cs.primary,
                  foregroundColor: cs.onPrimary,
                  padding: const EdgeInsets.symmetric(vertical: 16),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(9999),
                  ),
                ),
                child:
                    (routeState.isCalculating ||
                        routeState.isCalculatingAlternatives)
                    ? const SizedBox(
                        height: 24,
                        width: 24,
                        child: CircularProgressIndicator(
                          color: Colors.white,
                          strokeWidth: 2,
                        ),
                      )
                    : Text(
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
