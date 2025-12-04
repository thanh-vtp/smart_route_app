import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:smart_route_app/features/map/presentation/providers/location_display_provider.dart';
import 'package:smart_route_app/features/map/presentation/providers/map_mode_provider.dart';

/// Widget button để bật/tắt LocationDisplay (GPS)
class LocationButton extends ConsumerWidget {
  const LocationButton({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final isLocationEnabled = ref.watch(locationDisplayProviderProvider);
    final mapMode = ref.watch(mapModeProviderProvider);
    final isDisabled = mapMode == MapMode.scene3D;

    return Tooltip(
      message: isDisabled
          ? 'GPS chỉ khả dụng ở chế độ 2D'
          : (isLocationEnabled ? 'Tắt GPS' : 'Bật GPS'),
      child: Opacity(
        opacity: isDisabled ? 0.5 : 1.0,
        child: FloatingActionButton(
          onPressed: isDisabled
              ? null
              : () {
                  ref.read(locationDisplayProviderProvider.notifier).toggle();
                },

          backgroundColor: isDisabled
              ? Colors.grey[300]
              : (isLocationEnabled ? Colors.blue : Colors.white),

          child: Icon(
            isLocationEnabled ? Icons.my_location : Icons.location_searching,
            color: isDisabled
                ? Colors.grey[400]
                : (isLocationEnabled ? Colors.white : Colors.grey[700]),
            size: 24,
          ),
        ),
      ),
    );
  }
}
