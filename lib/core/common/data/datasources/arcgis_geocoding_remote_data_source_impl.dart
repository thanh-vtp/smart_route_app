import 'dart:async';
import 'dart:convert';
import 'dart:io';
import 'package:http/http.dart' as http;
import 'package:smart_route_app/core/errors/failures.dart';
import 'package:smart_route_app/core/utils/constants.dart';
import 'package:smart_route_app/core/common/data/datasources/arcgis_geocoding_remote_data_source.dart';
import 'package:smart_route_app/core/common/data/models/geocoding_models.dart';

class ArcGISGeocodingRemoteDataSourceImpl
    implements ArcGISGeocodingRemoteDataSource {
  final http.Client _client;
  final String _apiKey;

  // Timeout configurations
  static const Duration _receiveTimeout = Duration(seconds: 30);
  static const int _maxRetries = 3;

  ArcGISGeocodingRemoteDataSourceImpl({http.Client? client, String? apiKey})
    : _client = client ?? http.Client(),
      _apiKey = apiKey ?? Constants.arcgisApiKey {
    // Validate key ngay khi khởi tạo
    if (_apiKey.isEmpty) {
      throw ServerFailure('API KEY là bắt buộc');
    }
  }

  /// Helper parse JSON
  Map<String, dynamic> _parseAndValidateResponse(http.Response response) {
    if (response.statusCode != 200) {
      throw ServerFailure(
        'HTTP Error: ${response.statusCode} - ${response.reasonPhrase}',
      );
    }

    try {
      final data = json.decode(response.body) as Map<String, dynamic>;

      // Check for API errors in response
      if (data['error'] != null) {
        final errorMessage = data['error']['message'] ?? 'Unknown error';
        throw ServerFailure(errorMessage);
      }

      return data;
    } catch (e) {
      if (e is Failure) rethrow;
      throw const ServerFailure('Lỗi đọc dữ liệu JSON');
    }
  }

  /// Helper xử lý Request và Retry
  Future<http.Response> _makeRequest(Uri uri) async {
    int retryCount = 0;
    while (retryCount <= _maxRetries) {
      try {
        final response = await _client.get(uri).timeout(_receiveTimeout);

        // Nếu status code 5xx (Server Error), có thể retry
        if (response.statusCode >= 500 && response.statusCode < 600) {
          throw HttpException('Server Error: ${response.statusCode}');
        }
        return response;
      } on SocketException catch (_) {
        if (retryCount > _maxRetries) {
          throw ServerFailure(
            'Lỗi kết nối mạng',
          ); // Mất mạng hoặc không kết nối được server
        }
      } on TimeoutException catch (_) {
        if (retryCount > _maxRetries) {
          throw ServerFailure('Quá thời gian chờ'); // Quá thời gian chờ
        }
      } on http.ClientException catch (_) {
        if (retryCount > _maxRetries) {
          throw ServerFailure(
            'Lỗi kết nối client',
          ); // Lỗi client bị đóng hoặc lỗi giao thức
        }
      } catch (e) {
        throw ServerFailure('Lỗi không xác định: ${e.toString()}');
      }

      // Logic Backoff: Chờ 2s, 4s, 6s... trước khi thử lại
      await Future.delayed(Duration(seconds: retryCount * 2));
      retryCount++;
    }

    throw ServerFailure('Không thể kết nối đến ArcGIS Server');
  }

  /// Chuyển đổi văn bản địa chỉ hoặc tên địa điểm thành địa chỉ đầy đủ kèm theo vị trí.
  @override
  Future<GeocodeResponse> findAddressCandidates(String address) async {
    final queryParameters = {
      'SingleLine': address,
      'f': 'json',
      'token': _apiKey,
      'outFields': '*',
      'maxLocations': '10',
      'sourceCountry': 'VNM', // Giới hạn tại Việt Nam
    };

    final uri = Uri.parse(
      '${Constants.arcgisGeocodeBaseUrl}${Constants.findAddressCandidates}',
    ).replace(queryParameters: queryParameters);

    final response = await _makeRequest(uri);
    return GeocodeResponse.fromJson(_parseAndValidateResponse(response));
  }

  /// Chuyển đổi một điểm thành địa chỉ hoặc vị trí đầy đủ
  @override
  Future<ReverseGeocodeResponse> reverseGeocode(double lat, double lng) async {
    final queryParameters = {
      'location': '$lng,$lat',
      'f': 'json',
      'token': _apiKey,
      'outFields': '*',
      'langCode': 'vi', // Lấy địa chỉ bằng Tiếng Việt
    };

    final uri = Uri.parse(
      '${Constants.arcgisGeocodeBaseUrl}${Constants.reverseGeocode}',
    ).replace(queryParameters: queryParameters);

    final response = await _makeRequest(uri);
    return ReverseGeocodeResponse.fromJson(_parseAndValidateResponse(response));
  }
}
