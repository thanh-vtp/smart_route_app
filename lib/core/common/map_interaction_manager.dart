import 'dart:ui';

import 'package:arcgis_maps/arcgis_maps.dart';
import 'package:smart_route_app/core/utils/app_logger.dart';

/// Quản lý sự kiện tương tác (Click, Long Press) trên bản đồ
class MapInteractionManager {
  // variable để lưu trữ overlay incident, dùng để thêm/remove graphic khi user tương tác
  final GraphicsOverlay _incidentOverlay;
  MapInteractionManager(this._incidentOverlay);

  /// Xử lý sự kiện tap trên bản đồ,
  /// xác định xem người dùng có tap vào một graphic
  /// nếu có thì trả về ID của sự cố đó, nếu không thì trả về null
  Future<String?> handleMapTap({
    required Offset screenPoint,
    ArcGISMapViewController? mapController,
    ArcGISSceneViewController? sceneController,
  }) async {
    try {
      // Xác định graphic tại vị trí người dùng tap
      IdentifyGraphicsOverlayResult identifyResult;

      if (mapController != null) {
        identifyResult = await mapController.identifyGraphicsOverlay(
          _incidentOverlay,
          screenPoint: screenPoint,
          tolerance: 12, // Độ sai số của ngón tay (pixels)
        );
      } else if (sceneController != null) {
        identifyResult = await sceneController.identifyGraphicsOverlay(
          _incidentOverlay,
          screenPoint: screenPoint,
          tolerance: 12,
        );
      } else {
        return null; // Không có controller
      }

      // Nếu có graphic được xác định, lấy ID sự cố từ thuộc tính của graphic
      if (identifyResult.graphics.isNotEmpty) {
        final identifiedGraphic = identifyResult.graphics.first;

        // Lấy ID sự cố từ thuộc tính (Attributes) đã được cất giấu
        final incidentId =
            identifiedGraphic.attributes['incident_id'] as String?;
        return incidentId; // Trả ID ra ngoài cho UI xử lý
      }

      return null; // Chạm vào chỗ trống
    } catch (e) {
      AppLogger.error(
        '[LỖI]: identifying graphic khi TAP trên map $e',
        error: e,
      );
      return null;
    }
  }

  ///
}
