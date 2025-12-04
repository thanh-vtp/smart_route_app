import 'package:flutter/material.dart';
import 'package:smart_route_app/features/map/presentation/widgets/location_button.dart';

/// Widget hiển thị các Floating Action Buttons (Location, Directions)
class MapFloatingActions extends StatelessWidget {
  const MapFloatingActions({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        const SizedBox(height: 10),
        LocationButton(),
        const SizedBox(height: 10),
        FloatingActionButton(
          heroTag: 'directions',
          onPressed: () {
            // TODO: Implement directions feature
          },
          backgroundColor: Colors.white,
          child: const Icon(Icons.directions, color: Colors.blue),
        ),
      ],
    );
  }
}
