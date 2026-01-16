import 'package:equatable/equatable.dart';
import 'package:smart_route_app/features/search/domain/entities/emergency_category.dart';

// Entity cho địa điểm gần đó
class NearbyPlace extends Equatable {
  final String name;
  final String address;
  final double latitude;
  final double longitude;
  final double distance; // in meters
  final String? category;
  final double score;
  final String type;

  const NearbyPlace({
    required this.name,
    required this.address,
    required this.latitude,
    required this.longitude,
    required this.distance,
    this.category,
    required this.score,
    required this.type,
  });

  EmergencyCategory get emergencyCategory => EmergencyCategory.fromType(type);

  @override
  List<Object?> get props => [
    name,
    address,
    latitude,
    longitude,
    distance,
    category,
    score,
    type,
  ];
}
