import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:smart_route_app/features/map/presentation/providers/location_info_provider.dart';
import 'package:smart_route_app/features/map/presentation/widgets/incident_detail_draggable_sheet.dart';
import 'package:smart_route_app/features/map/presentation/widgets/location_info_draggable_sheet.dart';

/// Container widget quản lý hiển thị bottom sheet trên map
/// Chỉ hiển thị 1 bottom sheet tại 1 thời điểm dựa trên state
class MapBottomSheetContainer extends ConsumerWidget {
  const MapBottomSheetContainer({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final bottomSheetState = ref.watch(mapBottomSheetProvider);

    // Không hiển thị gì nếu state là hidden
    if (!bottomSheetState.isVisible) {
      return const SizedBox.shrink();
    }

    // Hiển thị bottom sheet tương ứng với type
    return switch (bottomSheetState.type) {
      BottomSheetType.locationInfo => const LocationInfoDraggableSheet(),
      BottomSheetType.incidentDetail => IncidentDetailDraggableSheet(
        incident: bottomSheetState.selectedIncident!,
      ),
      BottomSheetType.none => const SizedBox.shrink(),
    };
  }
}
