import 'package:smart_route_app/features/navigation/data/models/routing_model.dart';

abstract class RoutingRemoteDataSource {
  /// Gọi API ArcGIS để tính toán tuyến đường
  /// [stops] là danh sách tọa độ (Kinh độ, Vĩ độ)
  /// [barriers] là danh sách tọa độ sự cố cần né (Tùy chọn)
  /// [impedanceAttribute] Thuộc tính tối ưu: 'TravelTime' hoặc 'Kilometers'
  Future<RouteResponseModel> solveRoute({
    required List<Map<String, double>> stops,
    List<Map<String, double>>? barriers,
    String? impedanceAttribute,
  });
}
