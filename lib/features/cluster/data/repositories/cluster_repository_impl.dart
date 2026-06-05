import 'package:fpdart/fpdart.dart';
import 'package:smart_route_app/core/errors/failures.dart';
import 'package:smart_route_app/features/cluster/data/datasource/cluster_remote_data_source.dart';
import '../../../../core/network/network_info.dart';
import '../../domain/entities/cluster_entities.dart';
import '../../domain/repositories/cluster_repository.dart';

class ClusterRepositoryImpl implements ClusterRepository {
  final ClusterRemoteDataSource _remoteDataSource;
  final NetworkInfo _networkInfo;

  ClusterRepositoryImpl(this._remoteDataSource, this._networkInfo);

  @override
  Future<Either<Failure, ClusterResult>> fetchClusters() async {
    if (!await _networkInfo.isConnected) {
      return left(const NetworkFailure('Không có kết nối mạng.'));
    }

    try {
      final responseModel = await _remoteDataSource.fetchClusters();

      return right(responseModel.toEntity());
    } on Failure catch (f) {
      return left(f);
    } catch (e) {
      return left(
        const ServerFailure('Lỗi không xác định khi đồng bộ phân cụm.'),
      );
    }
  }
}
