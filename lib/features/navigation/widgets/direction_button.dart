import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:go_router/go_router.dart';

class DirectionButton extends ConsumerStatefulWidget {
  final double? lat;
  final double? lng;
  final String? locationName;

  const DirectionButton({super.key, this.lat, this.lng, this.locationName});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _DirectionButtonState();
}

class _DirectionButtonState extends ConsumerState<DirectionButton> {
  @override
  Widget build(BuildContext context) {
    return Tooltip(
      message: 'Chức năng chỉ đường',
      child: Opacity(
        opacity: 1.0,
        child: FloatingActionButton(
          heroTag: 'direction_button',
          onPressed: () {
            // If we have location info, we could pass it to DirectionPage
            // For now, just navigate to DirectionPage
            context.push('/direction');

            // throw Exception(
            //   'Test Exception cho Crashlytics trong DirectionButton',
            // );
          },
          backgroundColor: Colors.white,
          child: const Icon(Icons.directions, color: Colors.blue),
        ),
      ),
    );
  }
}
