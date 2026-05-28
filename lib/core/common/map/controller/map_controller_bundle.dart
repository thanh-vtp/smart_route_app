import 'package:arcgis_maps/arcgis_maps.dart';

/// Bundle quản lý toàn bộ native controllers của ArcGIS.
///
/// Responsibility:
/// - Tạo controllers
/// - Giữ lifecycle
/// - Dispose đúng lúc
///
/// Không chứa:
/// - business logic
/// - rendering logic
/// - GPS logic
/// - UI state
class MapControllerBundle {
  MapControllerBundle({
    ArcGISMapViewController? map2D,
    ArcGISSceneViewController? scene3D,
  }) : _map2D = map2D ?? ArcGISMapView.createController(),
       _scene3D = scene3D ?? ArcGISSceneView.createController();

  final ArcGISMapViewController _map2D;
  final ArcGISSceneViewController _scene3D;

  bool _disposed = false;

  ArcGISMapViewController get map2D {
    _ensureNotDisposed();
    return _map2D;
  }

  ArcGISSceneViewController get scene3D {
    _ensureNotDisposed();
    return _scene3D;
  }

  bool get isDisposed => _disposed;

  void dispose() {
    if (_disposed) return;

    _map2D.dispose();
    _scene3D.dispose();

    _disposed = true;
  }

  void _ensureNotDisposed() {
    if (_disposed) {
      throw StateError(
        'MapControllerBundle đã dispose. Không thể sử dụng controller.',
      );
    }
  }
}
