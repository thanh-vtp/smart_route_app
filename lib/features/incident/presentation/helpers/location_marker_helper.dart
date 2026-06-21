import 'package:arcgis_maps/arcgis_maps.dart';
import 'package:flutter/material.dart';
import 'package:smart_route_app/common/app_logger.dart';
import 'package:smart_route_app/core/map_service/symbols/incident_symbol_factory.dart';

/// Helper class để quản lý location marker trên bản đồ
class LocationMarkerHelper {
  // Singleton pattern
  static final LocationMarkerHelper _instance =
      LocationMarkerHelper._internal();
  factory LocationMarkerHelper() => _instance;
  LocationMarkerHelper._internal();

  // Graphics overlay để chứa location marker
  GraphicsOverlay? _locationMarkerOverlay;

  // Graphic hiện tại của location marker
  Graphic? _currentLocationMarker;

  /// Khởi tạo overlay (gọi một lần khi khởi tạo map)
  void initialize(GraphicsOverlay overlay) {
    _locationMarkerOverlay = overlay;
  }

  /// Thêm marker tại vị trí được chọn
  Future<void> addMarker(ArcGISPoint point) async {
    if (_locationMarkerOverlay == null) {
      AppLogger.ui('LocationMarkerOverlay not initialized');
      return;
    }

    // Xóa marker cũ nếu có
    removeMarker();

    // Tạo graphic mới với fallback symbol (hiển thị ngay)
    _currentLocationMarker = Graphic(
      geometry: point,
      symbol: _createFallbackSymbol(),
    );

    // Thêm vào overlay
    _locationMarkerOverlay!.graphics.add(_currentLocationMarker!);

    // Tải picture marker và cập nhật (async)
    await _updateToPictureMarker();

    AppLogger.ui('Added location marker at: ${point.y}, ${point.x}');
  }

  /// Xóa location marker
  void removeMarker() {
    if (_currentLocationMarker != null && _locationMarkerOverlay != null) {
      _locationMarkerOverlay!.graphics.remove(_currentLocationMarker!);
      _currentLocationMarker = null;
    }
  }

  /// Kiểm tra xem có marker đang hiển thị không
  bool hasMarker() => _currentLocationMarker != null;

  /// Lấy vị trí hiện tại của marker
  ArcGISPoint? getCurrentMarkerPosition() {
    return _currentLocationMarker?.geometry as ArcGISPoint?;
  }

  /// Tạo fallback symbol (SimpleMarkerSymbol)
  SimpleMarkerSymbol _createFallbackSymbol() {
    return SimpleMarkerSymbol(
        style: SimpleMarkerSymbolStyle.circle,
        color: Colors.blue,
        size: 16,
      )
      ..outline = SimpleLineSymbol(
        style: SimpleLineSymbolStyle.solid,
        color: Colors.white,
        width: 2,
      );
  }

  /// Load và cache picture marker symbol
  Future<void> _updateToPictureMarker() async {
    if (_currentLocationMarker == null) return;

    try {
      final pictureMarkerSymbol = await IncidentSymbolFactory()
          .getHighlightSymbol();

      // Cập nhật symbol
      _currentLocationMarker?.symbol = pictureMarkerSymbol;
    } catch (e) {
      AppLogger.ui('Error loading location marker image: $e', error: e);
      // Giữ fallback symbol nếu load image thất bại
    }
  }

  /// Di chuyển marker đến vị trí mới (không xóa và tạo lại)
  void moveMarker(ArcGISPoint newPoint) {
    if (_currentLocationMarker != null) {
      _currentLocationMarker!.geometry = newPoint;
      AppLogger.ui('Moved location marker to: ${newPoint.y}, ${newPoint.x}');
    }
  }

  /// Cleanup khi dispose
  void dispose() {
    removeMarker();
    _locationMarkerOverlay = null;
  }
}
