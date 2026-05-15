import 'dart:ui' as ui;
import 'package:arcgis_maps/arcgis_maps.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:smart_route_app/core/utils/utils.dart';
import 'package:smart_route_app/features/incident/presentation/models/incident_type_config.dart';

/// Factory để tạo ArcGIS PictureMarkerSymbol cho Incident với Stack (background + border + image)
class IncidentSymbolFactory {
  // // Singleton instance
  // static final IncidentSymbolFactory _instance =
  //     IncidentSymbolFactory._internal();

  // factory IncidentSymbolFactory() => _instance;
  // IncidentSymbolFactory._internal();

  // Cache: Lưu trữ Symbol đã tạo để không phải load lại
  final Map<String, PictureMarkerSymbol> _cache = {};

  // Cache cho highlight symbol để không tạo mới mỗi lần
  ArcGISSymbol? _cachedHighlightSymbol;

  // Flag để biết đã pre-cache chưa
  bool _isPreCached = false;

  /// Pre-cache tất cả symbols để tránh lag khi hiển thị map
  /// Gọi hàm này sau khi app khởi động (có thể trong background)
  /// Gọi khi app khởi động để tạo sẵn ảnh
  Future<void> preCacheAllSymbols() async {
    if (_isPreCached) return;

    // Tạo symbol cho tất cả incident types
    try {
      await Future.wait(
        IncidentTypes.all.map((config) => getSymbol(config.id)),
      );
      _isPreCached = true;
      AppLogger.info(
        'Pre-cached all symbols in RAM',
        name: 'IncidentSymbolFactory',
      );
    } catch (e, st) {
      AppLogger.error(
        'Pre-cache failed',
        error: e,
        stackTrace: st,
        name: 'IncidentSymbolFactory',
      );
    }
  }

  /// Hàm lấy Symbol với Stack (background + border + image)
  /// Lấy Marker theo loại sự cố
  /// [displaySize] - Kích thước hiển thị trên map (mặc định 32.0)
  Future<PictureMarkerSymbol> getSymbol(
    String typeId, {
    double displaySize = 32.0,
  }) async {
    // Cache key bao gồm cả size để hỗ trợ nhiều kích thước
    final cacheKey = '${typeId}_$displaySize';

    //  Trả về Cache nếu có
    // Nếu đã load rồi thì trả về ngay (Tốc độ tức thì)
    if (_cache.containsKey(cacheKey)) {
      return _cache[cacheKey]!;
    }

    // Nếu chưa có thì vẽ mới
    final config = IncidentTypes.getById(typeId);

    try {
      // Tạo marker với Stack (background + border + image)
      final markerImage = await _createMarkerWithStack(config);

      // Tạo Symbol từ image đã composite
      final arcGISImage = ArcGISImage.fromBytes(markerImage);
      final symbol = PictureMarkerSymbol.withImage(arcGISImage);

      // Cấu hình kích thước hiển thị (pointer size)
      symbol.width = displaySize;
      symbol.height = displaySize;

      // Lưu vào cache
      _cache[cacheKey] = symbol;
      return symbol;
    } catch (e) {
      AppLogger.error(
        'Error loading symbol for $typeId at path ${config.assetPath}',
        name: 'IncidentSymbolFactory',
        error: e,
      );

      if (typeId != 'other') {
        return await getSymbol('other');
      }
      rethrow;
    }
  }

  // Lấy Symbol dùng cho Highlight / Location Marker khi User Click vào sự cố
  Future<ArcGISSymbol> getHighlightSymbol() async {
    // Trả về cache nếu có
    if (_cachedHighlightSymbol != null) {
      return _cachedHighlightSymbol!;
    }

    try {
      // Load image từ assets
      final image = await ArcGISImage.fromAsset(
        'assets/icons/location_marker.png',
      );

      // Tạo picture marker symbol
      final pictureMarkerSymbol = PictureMarkerSymbol.withImage(image)
        ..width = 50
        ..height = 50
        ..offsetY = 25; // Offset để pin trỏ đúng vị trí

      // Cache để dùng lại
      _cachedHighlightSymbol = pictureMarkerSymbol;

      return _cachedHighlightSymbol!;
    } catch (e) {
      AppLogger.error('Error creating highlight symbol', error: e);

      // Fallback symbol đơn giản nếu load thất bại
      _cachedHighlightSymbol =
          SimpleMarkerSymbol(
              style: SimpleMarkerSymbolStyle.circle,
              color: Colors.yellow,
              size: 24,
            )
            ..outline = SimpleLineSymbol(
              style: SimpleLineSymbolStyle.solid,
              color: Colors.orange,
              width: 3,
            );

      return _cachedHighlightSymbol!;
    }
  }

  /// Tạo marker image với Stack (background + border + image overlay)
  Future<Uint8List> _createMarkerWithStack(IncidentTypeConfig config) async {
    const double size = 120.0; // Kích thước canvas (3x để có quality tốt)
    const double padding = 4.0;

    // Load asset image
    final ByteData data = await rootBundle.load(config.assetPath);
    final codec = await ui.instantiateImageCodec(
      data.buffer.asUint8List(),
      targetWidth: (size - padding * 2).toInt(),
      targetHeight: (size - padding * 2).toInt(),
    );
    final frame = await codec.getNextFrame();
    final assetImage = frame.image;

    // Tạo canvas để vẽ
    final recorder = ui.PictureRecorder();
    final canvas = Canvas(recorder);
    final paint = Paint();

    // 1. Vẽ background với border radius
    final backgroundRect = RRect.fromRectAndRadius(
      Rect.fromLTWH(0, 0, size, size),
      const Radius.circular(16),
    );

    // Vẽ background color
    paint.color = config.backgroundColor;
    canvas.drawRRect(backgroundRect, paint);

    // Vẽ border
    paint.style = PaintingStyle.stroke;
    paint.strokeWidth = 3.0;
    paint.color = config.color.withValues(alpha: 0.3);
    canvas.drawRRect(backgroundRect, paint);

    // 2. Vẽ image overlay lên trên với padding
    paint.style = PaintingStyle.fill;
    final imageRect = Rect.fromLTWH(
      padding,
      padding,
      size - padding * 2,
      size - padding * 2,
    );
    canvas.drawImageRect(
      assetImage,
      Rect.fromLTWH(
        0,
        0,
        assetImage.width.toDouble(),
        assetImage.height.toDouble(),
      ),
      imageRect,
      paint,
    );

    // Convert canvas thành image
    final picture = recorder.endRecording();
    final img = await picture.toImage(size.toInt(), size.toInt());
    final byteData = await img.toByteData(format: ui.ImageByteFormat.png);

    // TỐI ƯU: Giải phóng bộ nhớ native sau khi đã lấy được byteData
    assetImage.dispose(); // Giải phóng ảnh gốc load từ asset
    img.dispose(); // Giải phóng ảnh vừa vẽ xong
    picture.dispose(); // Giải phóng bộ thu hình

    return byteData!.buffer.asUint8List();
  }
}
