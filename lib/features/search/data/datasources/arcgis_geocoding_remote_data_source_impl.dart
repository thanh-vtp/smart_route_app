import 'dart:async';
import 'dart:convert';
import 'dart:io';
import 'package:http/http.dart' as http;
import 'package:smart_route_app/core/errors/failures.dart';
import 'package:smart_route_app/common/constants/app_constants.dart';
import 'package:smart_route_app/features/search/data/datasources/arcgis_geocoding_remote_data_source.dart';
import 'package:smart_route_app/features/search/data/models/geocoding_models.dart';

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
  /// Tối ưu hóa cho địa chỉ Việt Nam với các tham số:
  /// - Tìm kiếm theo số nhà, tên đường, phường/xã, quận/huyện, tỉnh/thành phố
  /// - Hỗ trợ tìm kiếm POI (điểm quan tâm)
  /// - Ưu tiên kết quả ở Việt Nam
  @override
  Future<GeocodeResponse> findAddressCandidates(String address) async {
    final queryParameters = {
      'SingleLine': address,
      'f': 'json',
      'token': _apiKey,

      // Trường dữ liệu trả về - lấy tất cả để có đầy đủ thông tin địa chỉ VN
      'outFields': '*',

      // Giới hạn số kết quả trả về
      'maxLocations': '20',

      // Chỉ tìm kiếm tại Việt Nam
      'sourceCountry': 'VNM',

      // Ngôn ngữ trả về
      'langCode': 'vi',

      // Loại địa chỉ ưu tiên: StreetAddress > POI > PointAddress > Postal
      'category': 'Address,POI',

      // Chế độ tìm kiếm: SingleField cho phép tìm kiếm tổng hợp
      'searchExtent': '', // Có thể thêm giới hạn vùng tìm kiếm nếu cần
      // Fuzzy matching: cho phép tìm kiếm gần đúng (typo, thiếu dấu)
      'fuzzy': 'true',

      // Prefer locations: ưu tiên địa điểm thay vì vùng rộng
      'location': '', // Có thể thêm vị trí hiện tại để ưu tiên kết quả gần
    };

    final uri = Uri.parse(
      '${Constants.arcgisGeocodeBaseUrl}${Constants.findAddressCandidates}',
    ).replace(queryParameters: queryParameters);

    final response = await _makeRequest(uri);
    return GeocodeResponse.fromJson(_parseAndValidateResponse(response));
  }

  /// Chuyển đổi một điểm thành địa chỉ hoặc vị trí đầy đủ
  /// Lấy thông tin địa chỉ chi tiết theo cấu trúc Việt Nam
  @override
  Future<ReverseGeocodeResponse> reverseGeocode(double lat, double lng) async {
    final queryParameters = {
      'location': '$lng,$lat',
      'f': 'json',
      'token': _apiKey,

      // Lấy tất cả trường thông tin
      'outFields': '*',

      // Ngôn ngữ Tiếng Việt
      'langCode': 'vi',

      // Loại vị trí: StreetAddress để lấy địa chỉ chi tiết nhất
      'featureTypes': 'StreetAddress,PointAddress,StreetInt,POI',

      // Bán kính tìm kiếm (meters) - mặc định 100m
      'distance': '100',

      // Trả về thông tin chi tiết nhất
      'returnIntersection': 'true',
    };

    final uri = Uri.parse(
      '${Constants.arcgisGeocodeBaseUrl}${Constants.reverseGeocode}',
    ).replace(queryParameters: queryParameters);

    final response = await _makeRequest(uri);
    return ReverseGeocodeResponse.fromJson(_parseAndValidateResponse(response));
  }

  /// Tìm kiếm địa chỉ nâng cao với các trường riêng biệt theo cấu trúc Việt Nam
  /// Ví dụ:
  /// - houseNumber: "123", street: "Nguyễn Huệ", ward: "Bến Nghé", district: "Quận 1", city: "TP. Hồ Chí Minh"
  /// - street: "Lê Lợi", city: "Nha Trang", province: "Khánh Hòa"
  @override
  Future<GeocodeResponse> findAddressCandidatesStructured({
    String? houseNumber,
    String? street,
    String? ward,
    String? district,
    String? city,
    String? province,
    String? postalCode,
  }) async {
    final queryParameters = <String, String>{
      'f': 'json',
      'token': _apiKey,
      'outFields': '*',
      'maxLocations': '20',
      'sourceCountry': 'VNM',
      'langCode': 'vi',
      'category': 'Address',
    };

    // Xây dựng địa chỉ từ các trường riêng biệt
    // ArcGIS hỗ trợ cả SingleLine và MultiField
    if (houseNumber != null && houseNumber.isNotEmpty) {
      queryParameters['Address'] = houseNumber;
    }

    if (street != null && street.isNotEmpty) {
      queryParameters['Address2'] = street;
    }

    if (ward != null && ward.isNotEmpty) {
      queryParameters['Neighborhood'] = ward;
    }

    if (district != null && district.isNotEmpty) {
      queryParameters['District'] = district;
    }

    if (city != null && city.isNotEmpty) {
      queryParameters['City'] = city;
    }

    if (province != null && province.isNotEmpty) {
      queryParameters['Region'] = province;
    }

    if (postalCode != null && postalCode.isNotEmpty) {
      queryParameters['Postal'] = postalCode;
    }

    final uri = Uri.parse(
      '${Constants.arcgisGeocodeBaseUrl}${Constants.findAddressCandidates}',
    ).replace(queryParameters: queryParameters);

    final response = await _makeRequest(uri);
    return GeocodeResponse.fromJson(_parseAndValidateResponse(response));
  }
}
