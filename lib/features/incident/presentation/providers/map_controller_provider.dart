import 'package:arcgis_maps/arcgis_maps.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'map_controller_provider.g.dart';

// Provider để giữ Controller.
// Dùng 'Provider' thay vì 'StateProvider' vì ta chỉ cần tạo 1 lần và giữ nguyên instance đó.
@riverpod
ArcGISMapViewController mapController(Ref ref) {
  // Logic tạo controller chuyển từ initState vào đây
  final controller = ArcGISMapView.createController();

  ref.onDispose(() {
    // Nếu ArcGIS SDK yêu cầu cleanup thì gọi ở đây
    // ArcGIS controller thường tự quản lý, nhưng nếu cần clean up
    // controller.dispose();
  });

  return controller;
}
