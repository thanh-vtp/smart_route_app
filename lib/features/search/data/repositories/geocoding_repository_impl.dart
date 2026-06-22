import 'package:fpdart/fpdart.dart';
import 'package:smart_route_app/core/errors/failures.dart';
import 'package:smart_route_app/core/network/network_info.dart';
import '../../domain/entities/address_result.dart';
import '../../domain/repositories/geocoding_repository.dart';
import '../datasources/arcgis_geocoding_remote_data_source.dart';

class GeocodingRepositoryImpl implements GeocodingRepository {
  final ArcGISGeocodingRemoteDataSource _remoteDataSource;
  final NetworkInfo _networkInfo;

  GeocodingRepositoryImpl(this._remoteDataSource, this._networkInfo);

  @override
  Future<Either<Failure, List<AddressResult>>> findAddressCandidates(
    String address,
  ) async {
    // 1. Kiểm tra mạng
    if (!await _networkInfo.isConnected) {
      return left(const NetworkFailure('Không có kết nối mạng'));
    }

    try {
      // 2. Gọi API Remote
      final response = await _remoteDataSource.findAddressCandidates(address);

      // 3. Map Data Model -> Domain Entity
      final results = response.candidates.map((c) => c.toEntity()).toList();

      return right(results);
    } on Failure catch (f) {
      return left(f);
    } catch (e) {
      return left(const ServerFailure('Lỗi máy chủ khi tìm kiếm'));
    }
  }

  @override
  Future<Either<Failure, AddressResult>> reverseGeocode(
    double lat,
    double lng,
  ) async {
    // 1. Kiểm tra mạng
    if (!await _networkInfo.isConnected) {
      return left(const NetworkFailure('Không có kết nối mạng'));
    }

    try {
      // 2. Gọi API Remote
      final response = await _remoteDataSource.reverseGeocode(lat, lng);

      // 3. Map Data Model -> Domain Entity
      return right(response.toEntity());
    } on Failure catch (f) {
      return left(f);
    } catch (e) {
      return left(
        const ServerFailure('Không thể nhận diện địa chỉ tại vị trí này'),
      );
    }
  }

  @override
  Future<Either<Failure, List<AddressResult>>> findAddressCandidatesStructured({
    String? houseNumber,
    String? street,
    String? ward,
    String? district,
    String? city,
    String? province,
    String? postalCode,
  }) async {
    // 1. Kiểm tra mạng
    if (!await _networkInfo.isConnected) {
      return left(const NetworkFailure('Không có kết nối mạng'));
    }

    // 2. Validate: ít nhất phải có một trường
    if ((houseNumber?.isEmpty ?? true) &&
        (street?.isEmpty ?? true) &&
        (ward?.isEmpty ?? true) &&
        (district?.isEmpty ?? true) &&
        (city?.isEmpty ?? true) &&
        (province?.isEmpty ?? true) &&
        (postalCode?.isEmpty ?? true)) {
      return left(
        const ServerFailure('Vui lòng nhập ít nhất một trường địa chỉ'),
      );
    }

    try {
      // 3. Gọi API Remote
      final response = await _remoteDataSource.findAddressCandidatesStructured(
        houseNumber: houseNumber,
        street: street,
        ward: ward,
        district: district,
        city: city,
        province: province,
        postalCode: postalCode,
      );

      // 4. Map Data Model -> Domain Entity
      final results = response.candidates.map((c) => c.toEntity()).toList();

      return right(results);
    } on Failure catch (f) {
      return left(f);
    } catch (e) {
      return left(const ServerFailure('Lỗi máy chủ khi tìm kiếm'));
    }
  }
}
