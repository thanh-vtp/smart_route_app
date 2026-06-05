import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:smart_route_app/core/common/screens/state/location_ui_notifier.dart';
import 'package:smart_route_app/features/navigation/domain/entities/route_entity.dart';
import 'package:smart_route_app/features/navigation/domain/entities/route_entity.dart'
    as entity;
import 'package:smart_route_app/features/navigation/presentation/state/route_notifier.dart';
import 'package:smart_route_app/maneuver_indicator.dart';
import 'reporting_bottom_sheet.dart';

class ActiveNavigationScreen extends ConsumerStatefulWidget {
  const ActiveNavigationScreen({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _ActiveNavigationScreenState();
}

class _ActiveNavigationScreenState
    extends ConsumerState<ActiveNavigationScreen> {
  // 1. KHAI BÁO CONTROLLER ĐỂ ĐIỀU KHIỂN BOTTOM SHEET
  final DraggableScrollableController _sheetController =
      DraggableScrollableController();

  // Các mốc kích thước của Bottom Sheet
  final double _minChildSize = 0.15;
  final double _maxChildSize = 0.6;
  bool _isSheetExpanded = false; // Biến trạng thái để biết đang thu hay mở

  @override
  void dispose() {
    _sheetController.dispose();
    super.dispose();
  }

  // 2. HÀM XỬ LÝ SỰ KIỆN NHẤP VÀO HEADER
  void _toggleSheet() {
    setState(() {
      _isSheetExpanded = !_isSheetExpanded;
    });

    // Chạy Animation phóng to hoặc thu nhỏ
    _sheetController.animateTo(
      _isSheetExpanded ? _maxChildSize : _minChildSize,
      duration: const Duration(milliseconds: 300),
      curve: Curves.easeInOut,
    );
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final cs = theme.colorScheme;
    final textTheme = theme.textTheme;

    // 1. LẤY DỮ LIỆU TỪ STATE
    final routeState = ref.watch(routeNotifierProvider);
    final locationState = ref.watch(locationUiProvider);

    final routeResult = routeState.routeResult;

    // Tính toán tốc độ hiện tại (m/s -> km/h)
    final double speedMpS = locationState.location?.speed ?? 0.0;
    final int speedKmh = (speedMpS * 3.6).round();

    // Lấy danh sách chỉ đường, nếu không có thì để rỗng
    final List<RouteDirection> directions = routeResult?.directions ?? [];

    // Bước chỉ đường hiện tại (Đầu tiên) và Bước tiếp theo
    final currentDirection = directions.isNotEmpty ? directions.first : null;
    final nextDirection = directions.length > 1 ? directions[1] : null;

    return Scaffold(
      body: Stack(
        children: [
          // 1. Bản đồ nền (Mô phỏng màu xanh lá nhạt trong ảnh)
          Positioned.fill(
            child: Container(
              decoration: const BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [Color(0xFFB5B796), Color(0xFFE0E5D1)],
                ),
              ),
              child: Center(
                child: Transform(
                  transform: Matrix4.identity()
                    ..setEntry(3, 2, 0.001) // Perspective
                    ..rotateX(-0.8),
                  alignment: FractionalOffset.center,
                  child: Container(
                    width: 12,
                    height: 400,
                    decoration: BoxDecoration(
                      color: const Color(0xFF00488D), // Màu đường Line xanh đậm
                      borderRadius: BorderRadius.circular(10),
                      boxShadow: [
                        BoxShadow(
                          color: const Color(0xFF00488D).withOpacity(0.3),
                          blurRadius: 20,
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),

            // TODO: BẢN ĐỒ ARCGIS (Góc nhìn 3D - Dẫn đường)
            // child: ArcGISMapView(
            //   controllerProvider: () =>
            //       ref.read(mapControllerBundleProvider).map2D,
            //   onMapViewReady: () {
            //     // Tự động bật chế độ theo dõi (Navigation mode) khi mở màn hình này
            //     // ref.read(locationUiProvider.notifier).startNavigationMode();
            //   },
            // ),
          ),

          // 2. Bảng chỉ dẫn ngã rẽ chính (Top Banner)
          if (currentDirection != null)
            Positioned(
              top: MediaQuery.of(context).padding.top + 16,
              left: 16,
              right: 16,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  ManeuverIndicator(
                    type: currentDirection.maneuverType,
                    distance: currentDirection.formattedDistance,
                    instruction: currentDirection.instruction,
                    size: ManeuverSize.large,
                  ),

                  const SizedBox(height: 8),

                  // 3. Widget "Sau đó"  (Chỉ hiện nếu có bước tiếp theo)
                  if (nextDirection != null &&
                      nextDirection.maneuverType != ManeuverType.stop)
                    Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 12,
                        vertical: 8,
                      ),
                      decoration: BoxDecoration(
                        color: cs.surfaceContainerLowest,
                        borderRadius: BorderRadius.circular(8),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black12.withOpacity(0.1),
                            blurRadius: 8,
                          ),
                        ],
                      ),
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Icon(
                            nextDirection.maneuverType.icon,
                            size: 16,
                            color: nextDirection.maneuverType.color,
                          ),
                          const SizedBox(width: 8),
                          Text(
                            'Sau đó ${nextDirection.formattedDistance}',
                            style: textTheme.labelLarge?.copyWith(
                              fontWeight: FontWeight.bold,
                              color: cs.onSurface,
                            ),
                          ),
                        ],
                      ),
                    ),
                ],
              ),
            ),

          // 4. Đồng hồ tốc độ (Góc dưới bên trái)
          Positioned(
            left: 16,
            bottom: MediaQuery.of(context).size.height * 0.15 + 16,
            child: Container(
              width: 72,
              height: 72,
              decoration: BoxDecoration(
                color: cs.surfaceContainerLowest,
                shape: BoxShape.circle,
                border: Border.all(
                  color: speedKmh > 80 ? cs.error : cs.outlineVariant,
                  width: 3,
                ),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.1),
                    blurRadius: 8,
                  ),
                ],
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    speedKmh.toString(),
                    style: textTheme.headlineMedium?.copyWith(
                      fontWeight: FontWeight.w900,
                      color: cs.onSurface,
                      height: 1.0,
                    ),
                  ),
                  Text(
                    'km/h',
                    style: textTheme.labelSmall?.copyWith(
                      color: cs.onSurfaceVariant,
                    ),
                  ),
                ],
              ),
            ),
          ),

          // 5. Nút BÁO CÁO (Góc dưới bên phải - Pill shaped)
          Positioned(
            right: 16,
            bottom: MediaQuery.of(context).size.height * 0.15 + 16,
            child: FloatingActionButton.extended(
              heroTag: 'active_report',
              onPressed: () {
                showModalBottomSheet(
                  context: context,
                  isScrollControlled: true,
                  backgroundColor: Colors.transparent,
                  builder: (context) => const ReportingBottomSheet(),
                );
              },
              backgroundColor: cs.error,
              foregroundColor: cs.onError,
              elevation: 4,
              icon: Icon(Icons.campaign, color: cs.onError),
              label: Text(
                'BÁO CÁO',
                style: textTheme.labelLarge?.copyWith(
                  fontWeight: FontWeight.bold,
                  letterSpacing: 1.2,
                  color: cs.onError,
                ),
              ),
            ),
          ),

          if (routeResult != null)
            // 6. Bảng trạng thái hành trình (Bottom Panel)
            _buildDraggableBottomPanel(
              context,
              cs,
              textTheme,
              routeResult,
              directions,
            ),
        ],
      ),
    );
  }

  Widget _buildDraggableBottomPanel(
    BuildContext context,
    ColorScheme cs,
    TextTheme textTheme,
    entity.RouteResult routeResult,
    List<RouteDirection> directions,
  ) {
    return DraggableScrollableSheet(
      // 3. GẮN CONTROLLER VÀO ĐÂY
      controller: _sheetController,
      initialChildSize: _minChildSize,
      minChildSize: _minChildSize,
      maxChildSize: _maxChildSize,
      builder: (BuildContext context, ScrollController scrollController) {
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
          child: Column(
            children: [
              // ==========================================
              // BỌC GESTURE DETECTOR CHO TOÀN BỘ PHẦN HEADER
              // ==========================================
              GestureDetector(
                onTap: _toggleSheet, // <-- KHI BẤM VÀO SẼ GỌI HÀM TOGGLE
                behavior: HitTestBehavior.opaque, // Giúp vùng chạm mượt mà hơn
                child: Column(
                  children: [
                    // --- DRAG HANDLE ---
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

                    // --- HEADER TÓM TẮT ---
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 24.0),
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
                                      routeResult.estimatedArrival,
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
                                  '${routeResult.formattedTime} • ${routeResult.formattedDistance}',
                                  style: textTheme.titleMedium?.copyWith(
                                    color: cs.onSurfaceVariant,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                              ],
                            ),
                          ),

                          // NÚT THOÁT
                          // Lưu ý: Dùng GestureDetector chặn sự kiện lan truyền lên Header
                          GestureDetector(
                            onTap: () {
                              Navigator.of(context).pop();
                            },
                            child: Container(
                              padding: const EdgeInsets.all(12),
                              decoration: BoxDecoration(
                                color: cs.errorContainer,
                                shape: BoxShape.circle,
                              ),
                              child: Icon(
                                Icons.close,
                                color: cs.error,
                                size: 28,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 16),
                  ],
                ),
              ),

              Divider(height: 1, color: cs.outlineVariant.withOpacity(0.3)),

              // --- DANH SÁCH CHỈ ĐƯỜNG CHI TIẾT ---
              Expanded(
                child: ListView.separated(
                  controller: scrollController,
                  padding: const EdgeInsets.symmetric(vertical: 8),
                  itemCount: directions.length,
                  separatorBuilder: (context, index) =>
                      Divider(height: 1, indent: 64, color: cs.surfaceVariant),
                  itemBuilder: (context, index) {
                    final dir = directions[index];
                    return _buildDirectionListItem(dir, textTheme, cs);
                  },
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  ListTile _buildDirectionListItem(
    RouteDirection dir,
    TextTheme textTheme,
    ColorScheme cs,
  ) {
    return ListTile(
      contentPadding: const EdgeInsets.symmetric(horizontal: 24, vertical: 8),
      leading: Container(
        width: 40,
        height: 40,
        decoration: BoxDecoration(
          color: dir.maneuverType.color.withOpacity(0.15),
          shape: BoxShape.circle,
        ),
        child: Icon(
          dir.maneuverType.icon,
          color: dir.maneuverType.color,
          size: 24,
        ),
      ),
      title: Text(
        dir.instruction,
        style: textTheme.titleMedium?.copyWith(
          fontWeight: FontWeight.w600,
          color: cs.onSurface,
        ),
      ),
      subtitle: dir.distanceMeters > 0
          ? Padding(
              padding: const EdgeInsets.only(top: 4.0),
              child: Text(
                dir.formattedDistance,
                style: textTheme.bodyMedium?.copyWith(
                  color: cs.outline,
                  fontWeight: FontWeight.bold,
                ),
              ),
            )
          : null,
    );
  }
}
