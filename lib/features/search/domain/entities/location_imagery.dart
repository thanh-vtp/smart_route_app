import 'dart:typed_data';
import 'package:equatable/equatable.dart';

// Entity cho hình ảnh vị trí
class LocationImagery extends Equatable {
  final Uint8List imageData;
  final String? description;
  final String? copyrightText;
  final double latitude;
  final double longitude;

  const LocationImagery({
    required this.imageData,
    this.description,
    this.copyrightText,
    required this.latitude,
    required this.longitude,
  });

  @override
  List<Object?> get props => [
    imageData,
    description,
    copyrightText,
    latitude,
    longitude,
  ];
}
