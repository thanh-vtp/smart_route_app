import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:smart_route_app/features/incident/presentation/design_pattern/structural_pattern/arcgis_map_facade.dart';
import 'package:smart_route_app/features/incident/presentation/providers/map_controller_provider.dart';
import 'package:smart_route_app/features/incident/presentation/providers/scene_controller_provider.dart';

/// Provider quản lý singleton ArcGISMapFacade
final mapFacadeProvider = Provider<ArcGISMapFacade>((ref) {
  // Lấy controllers từ provider hiện có
  final mapController = ref.watch(mapControllerProvider);
  final sceneController = ref.watch(sceneControllerProvider);

  // Tạo facade
  final facade = ArcGISMapFacade(mapController, sceneController);

  // Dispose tự động khi provider bị huỷ
  ref.onDispose(() {
    facade.dispose();
  });

  return facade;
});
