import 'package:equatable/equatable.dart';

// Entity cho điểm trên route
class RoutePoint extends Equatable {
  final double latitude;
  final double longitude;

  const RoutePoint({required this.latitude, required this.longitude});

  @override
  List<Object?> get props => [latitude, longitude];
}
