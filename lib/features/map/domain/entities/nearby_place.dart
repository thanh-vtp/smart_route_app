import 'package:equatable/equatable.dart';

// Entity cho địa điểm gần đó
class NearbyPlace extends Equatable {
  final String name;
  final String address;
  final double latitude;
  final double longitude;
  final double distance; // in meters
  final String? category;
  final double score;

  const NearbyPlace({
    required this.name,
    required this.address,
    required this.latitude,
    required this.longitude,
    required this.distance,
    this.category,
    required this.score,
  });

  @override
  List<Object?> get props => [
    name,
    address,
    latitude,
    longitude,
    distance,
    category,
    score,
  ];
}
