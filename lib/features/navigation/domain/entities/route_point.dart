import 'package:equatable/equatable.dart';

// Entity cho điểm trên route
class RoutePoint extends Equatable {
  final double lat;
  final double lng;

  const RoutePoint({required this.lat, required this.lng});

  @override
  List<Object?> get props => [lat, lng];
}
