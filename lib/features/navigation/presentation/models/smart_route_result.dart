import 'package:smart_route_app/features/incident/domain/entities/incident.dart';
import 'package:smart_route_app/features/navigation/domain/entities/route_result.dart';

/// Result class cho smart routing
/// Wrapper cho kết quả trả về khi sử dụng smart routing

class SmartRouteResult {
  /// Tuyến đường đã được ArcGIS tối ưu (né sự cố)
  final RouteResult route;

  /// Danh sách sự cố nằm trong khu vực ảnh hưởng của tuyến đường này
  /// (Được lọc lại từ danh sách incidents đầu vào dựa trên Bounding Box)
  final List<Incident> avoidedIncidents;

  /// Flag đánh dấu đây là route đã tối ưu (Mặc định true)
  final bool isOptimized;

  const SmartRouteResult({
    required this.route,
    required this.avoidedIncidents,
    this.isOptimized = true,
  });

  // --- Getters hỗ trợ UI (Backward Compatibility) ---

  /// Alias cho route (để đỡ phải sửa code UI cũ)
  RouteResult get activeRoute => route;

  /// Số lượng sự cố đã tránh
  int get avoidedIncidentsCount => avoidedIncidents.length;

  /// Có sự cố nào bị ảnh hưởng không
  bool get hasAffectedIncidents => avoidedIncidents.isNotEmpty;

  // NOTE: Bỏ field 'estimatedTimeSaved' cứng nhắc ở đây.
  // Việc tính toán thời gian tiết kiệm hay chậm hơn nên được thực hiện
  // ở tầng UI/State bằng cách so sánh: SmartRoute.time - NormalRoute.time
}
