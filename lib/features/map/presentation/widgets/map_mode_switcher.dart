import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:smart_route_app/features/map/presentation/providers/map_mode_provider.dart';

class MapModeSwitcher extends ConsumerWidget {
  const MapModeSwitcher({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final mapMode = ref.watch(mapModeProviderProvider);

    return Container(
      padding: const EdgeInsets.all(4),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(8),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.2),
            blurRadius: 4,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          _buildModeButton(
            context: context,
            ref: ref,
            icon: Icons.map,
            label: '2D',
            isSelected: mapMode == MapMode.map2D,
            mode: MapMode.map2D,
          ),
          const SizedBox(width: 4),
          _buildModeButton(
            context: context,
            ref: ref,
            icon: Icons.threed_rotation,
            label: '3D',
            isSelected: mapMode == MapMode.scene3D,
            mode: MapMode.scene3D,
          ),
        ],
      ),
    );
  }

  /// Widget helper cho button mode
  Widget _buildModeButton({
    required BuildContext context,
    required WidgetRef ref,
    required IconData icon,
    required String label,
    required bool isSelected,
    required MapMode mode,
  }) {
    return InkWell(
      onTap: () {
        ref.read(mapModeProviderProvider.notifier).setMapMode(mode);
      },
      borderRadius: BorderRadius.circular(6),
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
        decoration: BoxDecoration(
          color: isSelected ? Colors.blue : Colors.transparent,
          borderRadius: BorderRadius.circular(6),
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(
              icon,
              size: 18,
              color: isSelected ? Colors.white : Colors.black87,
            ),
            const SizedBox(width: 4),
            Text(
              label,
              style: TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.w500,
                color: isSelected ? Colors.white : Colors.black87,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
