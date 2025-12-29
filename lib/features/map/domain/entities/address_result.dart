import 'package:equatable/equatable.dart';

// Entity cho kết quả geocoding
class AddressResult extends Equatable {
  final String fullAddress;
  final String? streetName;
  final String? neighborhood;
  final String? district;
  final String? city;
  final String? region;
  final String? countryName;
  final String? postalCode;
  final double latitude;
  final double longitude;
  final double score;

  const AddressResult({
    required this.fullAddress,
    this.streetName,
    this.neighborhood,
    this.district,
    this.city,
    this.region,
    this.countryName,
    this.postalCode,
    required this.latitude,
    required this.longitude,
    required this.score,
  });

  @override
  List<Object?> get props => [
    fullAddress,
    streetName,
    neighborhood,
    district,
    city,
    region,
    countryName,
    postalCode,
    latitude,
    longitude,
    score,
  ];
}
