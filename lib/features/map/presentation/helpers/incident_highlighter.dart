import 'package:arcgis_maps/arcgis_maps.dart';
import 'package:flutter/material.dart';
import 'package:smart_route_app/core/utils/app_logger.dart';

/// Helper class để quản lý highlight incidents (đổi symbol khi chọn)
class IncidentHighlighter {
  Graphic? _highlightedGraphic;
  ArcGISSymbol? _originalSymbol;

  /// Highlight incident đã chọn bằng cách đổi symbol
  Future<void> highlight(Graphic graphic) async {
    try {
      // Clear highlight cũ trước
      clear();

      // Lưu symbol gốc
      _originalSymbol = graphic.symbol;
      _highlightedGraphic = graphic;

      // Tạo highlight symbol (marker lớn hơn, màu nổi bật)
      final highlightSymbol = await _createHighlightSymbol();

      // Đổi symbol của graphic
      graphic.symbol = highlightSymbol;

      AppLogger.ui('Highlighted incident');
    } catch (e) {
      AppLogger.ui('Error highlighting incident: $e', error: e);
    }
  }

  /// Clear highlight incident
  void clear() {
    if (_highlightedGraphic != null && _originalSymbol != null) {
      _highlightedGraphic!.symbol = _originalSymbol;
      _highlightedGraphic = null;
      _originalSymbol = null;
      AppLogger.ui('Cleared incident highlight');
    }
  }

  /// Tạo highlight symbol (marker lớn hơn)
  Future<ArcGISSymbol> _createHighlightSymbol() async {
    try {
      // Load marker image từ assets
      final image = await ArcGISImage.fromAsset(
        'assets/icons/location_marker.png',
      );

      // Tạo picture marker lớn hơn bình thường
      return PictureMarkerSymbol.withImage(image)
        ..width = 50 // Lớn hơn symbol thường (40)
        ..height = 50
        ..offsetY = 25; // Offset để pin trỏ đúng vị trí
    } catch (e) {
      AppLogger.ui('Error creating highlight symbol: $e', error: e);
      // Fallback: dùng SimpleMarkerSymbol màu vàng
      return SimpleMarkerSymbol(
        style: SimpleMarkerSymbolStyle.circle,
        color: Colors.yellow,
        size: 24,
      )
        ..outline = SimpleLineSymbol(
          style: SimpleLineSymbolStyle.solid,
          color: Colors.orange,
          width: 3,
        );
    }
  }

  /// Kiểm tra xem có graphic đang được highlight không
  bool get isHighlighting => _highlightedGraphic != null;
}
