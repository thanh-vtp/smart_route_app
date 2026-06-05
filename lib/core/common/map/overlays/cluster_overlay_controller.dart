import 'package:arcgis_maps/arcgis_maps.dart';
import 'package:flutter/material.dart';
import 'package:smart_route_app/features/cluster/domain/entities/cluster_entities.dart';

class ClusterOverlayController {
  final GraphicsOverlay overlay;

  // Cache graphic theo ID duy nhất của sự cố (id = OBJECTID)
  final Map<String, Graphic> _graphicsById = {};

  ClusterOverlayController({required this.overlay});

  Future<void> renderClusters(List<ClusterItem> clusters) async {
    // 🟢 SỬA TẠI ĐÂY: Lấy ID duy nhất của điểm (id) thay vì clusterId chung
    final incomingIds = clusters.map((e) => e.id).toSet();

    final removedIds = _graphicsById.keys
        .where((id) => !incomingIds.contains(id))
        .toList();

    for (final id in removedIds) {
      final graphic = _graphicsById.remove(id);
      if (graphic != null) {
        overlay.graphics.remove(graphic);
      }
    }

    for (final cluster in clusters) {
      await _upsertCluster(cluster);
    }
  }

  Future<void> _upsertCluster(ClusterItem cluster) async {
    // 🟢 LỌC BỎ ĐIỂM NHIỄU: Điểm nhiễu (DBSCAN định nghĩa là -1)
    // không thuộc cụm nguy hiểm nào nên không cần vẽ vòng tròn mờ
    if (cluster.clusterId == -1) {
      return;
    }

    final key = cluster.id; // 🟢 Dùng id duy nhất làm khóa cache
    final existing = _graphicsById[key];

    final point = ArcGISPoint(
      x: cluster.lng,
      y: cluster.lat,
      spatialReference: SpatialReference.wgs84,
    );

    if (existing != null) {
      existing.geometry = point;
      return;
    }

    // Tự động lấy màu mờ đặc trưng cho từng cụm để phân biệt vùng nóng trên map
    final clusterColor = _getClusterColor(cluster.clusterId);

    final symbol = SimpleMarkerSymbol(
      style: SimpleMarkerSymbolStyle.circle,
      color: clusterColor.withValues(
        alpha: 0.25,
      ), // Màu mờ 25% tạo hiệu ứng vùng ảnh hưởng
      size:
          45, // Size to hẳn ra (45px) để bao bọc lấy cái Marker sự cố thô nằm ở giữa
    );

    final graphic = Graphic(
      geometry: point,
      symbol: symbol,
      attributes: {'incident_id': cluster.id, 'cluster_id': cluster.clusterId},
    );

    // Đặt Z-Index cực thấp để vòng tròn mờ luôn nằm lót dưới các Icon sự cố thô
    graphic.zIndex = -100;

    _graphicsById[key] = graphic;
    overlay.graphics.add(graphic);
  }

  /// Hàm Helper tự chọn màu sắc theo ID cụm
  Color _getClusterColor(int clusterId) {
    switch (clusterId % 4) {
      case 0:
        return Colors.orange; // Cụm 0: Cam mờ
      case 1:
        return Colors.purple; // Cụm 1: Tím mờ
      case 2:
        return Colors.blue; // Cụm 2: Xanh dương mờ
      case 3:
        return Colors.pink; // Cụm 3: Hồng mờ
      default:
        return Colors.red;
    }
  }

  void clear() {
    _graphicsById.clear();
    overlay.graphics.clear();
  }
}
