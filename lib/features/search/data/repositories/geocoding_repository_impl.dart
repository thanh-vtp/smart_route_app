import 'dart:convert';
import 'package:fpdart/fpdart.dart';
import 'package:smart_route_app/core/network/network_info.dart';
import 'package:smart_route_app/core/utils/app_logger.dart';
import 'package:smart_route_app/core/errors/failures.dart';
import 'package:smart_route_app/features/search/data/datasources/arcgis_exception_handler.dart';
import 'package:smart_route_app/features/search/data/datasources/arcgis_geocoding_remote_data_source.dart';
import 'package:smart_route_app/features/search/data/local_datasource/geocoding_local_data_source_impl.dart';
import 'package:smart_route_app/features/search/data/models/geocoding_models.dart';
import 'package:smart_route_app/features/search/domain/entities/address_result.dart';
import 'package:smart_route_app/features/search/domain/repositories/geocoding_repository.dart';

class GeocodingRepositoryImpl implements GeocodingRepository {
  final ArcGISGeocodingRemoteDataSource _arcGISGeocodingRemoteDataSource;
  final GeocodingLocalDataSource _geocodingLocalDataSource;
  final ReverseGeocodingLocalDataSource _reverseGeocodingLocalDataSource;
  final NetworkInfo _networkInfo;

  GeocodingRepositoryImpl(
    this._arcGISGeocodingRemoteDataSource,
    this._geocodingLocalDataSource,
    this._reverseGeocodingLocalDataSource,
    this._networkInfo,
  );

  // Helper để tạo Key đồng nhất
  String _makeKey(String prefix, dynamic input) =>
      '${prefix}_${input.toString().hashCode}';

  @override
  Future<Either<Failure, List<AddressResult>>> findAddressCandidates(
    String address,
  ) async {
    final key = _makeKey('geocode', address.trim().toLowerCase());

    final bool isConnected = await _networkInfo.isConnected;

    // 1. Check Cache trước (ROM)
    final cached = await _geocodingLocalDataSource.get(
      key,
      expiry: const Duration(days: 7),
    );
    if (cached != null) {
      final response = GeocodeResponse.fromJson(cached);
      return right(_mapGeocodeToEntities(response));
    }

    // 2. Nếu không có cache, check mạng và gọi Remote
    if (!isConnected) return left(NetworkFailure.noInternet());

    try {
      final response = await _arcGISGeocodingRemoteDataSource
          .findAddressCandidates(address);

      // Lưu vào ROM cho lần sau
      await _geocodingLocalDataSource.save(key, response.toJson());

      final results = _mapGeocodeToEntities(response);

      return right(results);
    } catch (e, st) {
      final failure = ArcGISExceptionHandler.handleException(e, st);
      return left(failure);
    }
  }

  @override
  Future<Either<Failure, AddressResult>> reverseGeocode(
    double latitude,
    double longitude,
  ) async {
    final key =
        'rev_${latitude.toStringAsFixed(5)}_${longitude.toStringAsFixed(5)}';

    // 1. Check Cache (Nếu người dùng nhấn lại đúng điểm đó, không gọi API)
    final cached = await _reverseGeocodingLocalDataSource.get(
      key,
      expiry: const Duration(days: 3),
    );
    if (cached != null) {
      return right(
        _mapReverseGeocodeToEntity(ReverseGeocodeResponse.fromJson(cached)),
      );
    }
    try {
      final response = await _arcGISGeocodingRemoteDataSource.reverseGeocode(
        latitude,
        longitude,
      );

      // 2. Lưu vào Lịch sử (SQLite)
      await _reverseGeocodingLocalDataSource.save(key, response.toJson());

      final result = _mapReverseGeocodeToEntity(response);

      return right(result);
    } catch (e, st) {
      final failure = ArcGISExceptionHandler.handleException(e, st);
      return left(failure);
    }
  }

  // Helper chuyển đổi GeocodeResponse thành List<AddressResult>
  List<AddressResult> _mapGeocodeToEntities(GeocodeResponse response) {
    return response.candidates.map((candidate) {
      return AddressResult(
        fullAddress: candidate.address,
        streetName: candidate.attributes?['Address'] as String?,
        neighborhood: candidate.attributes?['Neighborhood'] as String?,
        district: candidate.attributes?['District'] as String?,
        city: candidate.attributes?['City'] as String?,
        region: candidate.attributes?['Region'] as String?,
        countryName: candidate.attributes?['CntryName'] as String?,
        postalCode: candidate.attributes?['Postal'] as String?,
        latitude: candidate.location.latitude,
        longitude: candidate.location.longitude,
        score: candidate.score,
      );
    }).toList();
  }

  // Helper chuyển đổi ReverseGeocodeResponse thành AddressResult
  AddressResult _mapReverseGeocodeToEntity(ReverseGeocodeResponse response) {
    final result = AddressResult(
      fullAddress: response.address.fullAddress ?? 'Không xác định',
      streetName: response.address.streetName,
      neighborhood: response.address.neighborhood,
      district: response.address.district,
      city: response.address.city,
      region: response.address.region,
      countryName: response.address.countryName,
      postalCode: response.address.postalCode,
      latitude: response.location.latitude,
      longitude: response.location.longitude,
      score: 100.0, // Reverse geocoding thường có độ chính xác cao
    );

    return result;
  }

  @override
  Future<Either<Failure, List<AddressResult>>> getRecentSearchHistory() async {
    try {
      // Lấy cả geocode (tìm bằng text) và reverse_geocode (nhấn trên map)
      final geoHistory = await _geocodingLocalDataSource.getRecentHistory(10);
      final revHistory = await _reverseGeocodingLocalDataSource
          .getRecentHistory(10);

      // Tag mỗi item với source type vì bảng không có cột type
      final taggedGeoHistory = geoHistory.map(
        (item) => {...item, 'source': 'geocode'},
      );
      final taggedRevHistory = revHistory.map(
        (item) => {...item, 'source': 'reverse'},
      );

      final combined = [...taggedGeoHistory, ...taggedRevHistory];
      // Sắp xếp lại theo thời gian giảm dần
      combined.sort(
        (a, b) => (b['timestamp'] as int).compareTo(a['timestamp'] as int),
      );
      // Lấy tối đa 10 kết quả gần nhất
      final results = combined.take(10).map((item) {
        final data = jsonDecode(item['data'] as String);
        // Map tương ứng dựa trên source table
        return item['source'] == 'geocode'
            ? _mapGeocodeToEntities(GeocodeResponse.fromJson(data)).first
            : _mapReverseGeocodeToEntity(ReverseGeocodeResponse.fromJson(data));
      }).toList();

      // AppLogger.repository(
      //   'Recent search history loaded: '
      //   'geocode=${geoHistory.length}, reverse=${revHistory.length}, '
      //   'total=${results.length}',
      // );
      // for (var i = 0; i < results.length; i++) {
      //   AppLogger.repository(
      //     '  [$i] ${results[i].fullAddress.split('\n').first} '
      //     '(${results[i].latitude.toStringAsFixed(4)}, ${results[i].longitude.toStringAsFixed(4)})',
      //   );
      // }

      return right(results);
    } catch (e, st) {
      AppLogger.error(
        'Error getting recent search history: $e',
        name: 'GeocodingRepositoryImpl',
        error: e,
        stackTrace: st,
      );

      final failure = CacheFailure.noData();
      return left(failure);
    }
  }

  @override
  Future<Either<Failure, void>> clearHistory() async {
    try {
      AppLogger.repository('Clearing geocoding history from ROM...');
      await _geocodingLocalDataSource.clearHistory();
      await _reverseGeocodingLocalDataSource.clearHistory();
      return right(null);
    } catch (e, st) {
      AppLogger.error(
        'Failed to clear history',
        name: 'GeocodingRepositoryImpl',
        error: e,
        stackTrace: st,
      );
      return left(UnexpectedFailure(e, st));
    }
  }
}
