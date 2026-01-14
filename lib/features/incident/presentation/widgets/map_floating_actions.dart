import 'package:flutter/material.dart';
import 'package:smart_route_app/features/incident/presentation/widgets/direction_button.dart';
import 'package:smart_route_app/features/incident/presentation/widgets/location_button.dart';

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
        DirectionButton(),
      ],
    );
  }
}
