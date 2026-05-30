import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:smart_route_app/features/incident/presentation/providers/location_info_provider.dart';
import 'package:smart_route_app/features/incident/presentation/widgets/incident_detail_draggable_sheet.dart';
import 'package:smart_route_app/features/incident/presentation/widgets/location_info_draggable_sheet.dart';

/// Container widget quản lý hiển thị bottom sheet trên map
/// Chỉ hiển thị 1 bottom sheet tại 1 thời điểm dựa trên state
/// Có animation khi chuyển đổi giữa các loại bottom sheet
class MapBottomSheetContainer extends ConsumerWidget {
  const MapBottomSheetContainer({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final bottomSheetState = ref.watch(mapBottomSheetProvider);

    // Không hiển thị gì nếu state là hidden
    if (!bottomSheetState.isVisible) {
      return const SizedBox.shrink();
    }

    // Sử dụng AnimatedSwitcher để có animation khi chuyển đổi bottom sheet
    return AnimatedSwitcher(
      duration: const Duration(milliseconds: 250),
      switchInCurve: Curves.easeOutCubic,
      switchOutCurve: Curves.easeInCubic,
      transitionBuilder: (Widget child, Animation<double> animation) {
        return SlideTransition(
          position: Tween<Offset>(
            begin: const Offset(0, 1), // Slide từ dưới lên
            end: Offset.zero,
          ).animate(animation),
          child: child,
        );
      },
      child: _buildBottomSheet(bottomSheetState),
    );
  }

  Widget _buildBottomSheet(MapBottomSheetState state) {
    // Key unique để AnimatedSwitcher nhận biết widget thay đổi
    return switch (state.type) {
      BottomSheetType.locationInfo => LocationInfoDraggableSheet(
        key: ValueKey('location_${state.lat}_${state.lng}'),
      ),
      BottomSheetType.incidentDetail => IncidentDetailDraggableSheet(
        key: ValueKey('incident_${state.selectedIncident!.id}'),
        incident: state.selectedIncident!,
      ),
      BottomSheetType.none => const SizedBox.shrink(key: ValueKey('none')),
    };
  }
}
