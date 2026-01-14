import 'package:flutter/material.dart';
import 'package:smart_route_app/features/incident/presentation/widgets/base_map_switcher.dart';
import 'package:smart_route_app/features/incident/presentation/widgets/map_mode_switcher.dart';

/// Widget hiển thị các controls (Basemap switcher, Map mode switcher) trên map
/// Bố trí: MapModeSwitcher ở trên (toggle 2D/3D), BasemapSwitcher ở dưới (chọn style)
class MapControlsOverlay extends StatelessWidget {
  const MapControlsOverlay({super.key});

  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: MediaQuery.of(context).padding.top + 76,
      right: 16,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        mainAxisSize: MainAxisSize.min,
        children: const [
          // Toggle 2D/3D - đặt trên cùng vì là action thường dùng
          MapModeSwitcher(),
          SizedBox(height: 12),
          // Chọn basemap style
          BasemapSwitcher(),
        ],
      ),
    );
  }
}
