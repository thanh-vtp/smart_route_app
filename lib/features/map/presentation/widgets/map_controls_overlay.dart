import 'package:flutter/material.dart';
import 'package:smart_route_app/features/map/presentation/widgets/base_map_switcher.dart';
import 'package:smart_route_app/features/map/presentation/widgets/map_mode_switcher.dart';

/// Widget hiển thị các controls (Basemap switcher, Map mode switcher) trên map
class MapControlsOverlay extends StatelessWidget {
  const MapControlsOverlay({super.key});

  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: 120,
      right: 10,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          BasemapSwitcher(),
          const SizedBox(height: 10),
          MapModeSwitcher(),
        ],
      ),
    );
  }
}
