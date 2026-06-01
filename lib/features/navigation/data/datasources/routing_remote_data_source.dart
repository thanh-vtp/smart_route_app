import 'package:smart_route_app/features/navigation/data/models/routing_model.dart';

abstract class RoutingRemoteDataSource {
  /// Gọi API ArcGIS để tính toán tuyến đường
  /// [stops] là danh sách tọa độ (Kinh độ, Vĩ độ)
  /// [avoidIncidents] Bật/Tắt tính năng thông minh né sự cố
  Future<RouteResponseModel> solveRoute({
    required List<Map<String, double>> stops,
    bool avoidIncidents = true,
  });
}
