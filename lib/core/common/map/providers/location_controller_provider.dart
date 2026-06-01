import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:smart_route_app/core/common/map/location/device_location_controller.dart';

final locationControllerProvider = Provider<DeviceLocationController>((ref) {
  final controller = DeviceLocationController();

  ref.onDispose(controller.dispose);

  return controller;
});
