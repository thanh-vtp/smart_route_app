import 'dart:async';
import 'dart:convert';
import 'dart:io';
import 'package:http/http.dart' as http;
import 'package:smart_route_app/core/errors/failures.dart';
import 'package:smart_route_app/core/utils/app_logger.dart';
import 'package:smart_route_app/core/utils/constants.dart';
import '../models/cluster_model.dart';
import 'cluster_remote_data_source.dart';

class ClusterRemoteDataSourceImpl implements ClusterRemoteDataSource {
  final http.Client _client;

  ClusterRemoteDataSourceImpl({http.Client? client})
    : _client = client ?? http.Client();

  @override
  Future<ClusterResponseModel> fetchClusters() async {
    final uri = Uri.parse(Constants.clusteringApiUrl);

    try {
      final response = await _client
          .get(uri)
          .timeout(const Duration(seconds: 15));

      if (response.statusCode != 200) {
        throw ServerFailure('Lỗi Server FastAPI: ${response.statusCode}');
      }

      final data = json.decode(response.body) as Map<String, dynamic>;

      AppLogger.debug(
        'Cluster data: $data',
        name: 'ClusterRemoteDataSourceImpl',
      );

      AppLogger.debug(
        'Fields: ${data.keys.toList().toString()}',
        name: 'ClusterRemoteDataSourceImpl',
      );

      if (data['status'] != 'success') {
        throw ServerFailure(data['message'] ?? 'Lỗi tính toán phân cụm');
      }

      return ClusterResponseModel.fromJson(data);
    } on SocketException {
      throw const NetworkFailure('Không thể kết nối đến máy chủ phân cụm.');
    } on TimeoutException {
      throw const ServerFailure(
        'Thời gian kết nối đến máy chủ phân cụm quá hạn.',
      );
    } catch (e) {
      if (e is Failure) rethrow;
      AppLogger.error(
        'Lỗi không xác định khi lấy phân cụm: ${e.toString()}',
        name: 'ClusterRemoteDataSourceImpl',
      );
      throw ServerFailure(
        'Lỗi không xác định khi lấy phân cụm: ${e.toString()}',
      );
    }
  }
}
