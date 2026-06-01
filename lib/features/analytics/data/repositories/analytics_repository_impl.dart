import 'dart:io';
import 'package:fpdart/fpdart.dart';
import 'package:smart_route_app/core/errors/failures.dart';
import '../../domain/entities/analytics_data.dart';
import '../../domain/repositories/analytics_repository.dart';
import '../datasources/analytics_remote_data_source.dart';

class AnalyticsRepositoryImpl implements AnalyticsRepository {
  final AnalyticsRemoteDataSource remoteDataSource;

  AnalyticsRepositoryImpl(this.remoteDataSource);

  @override
  Future<Either<Failure, AnalyticsData>> getUserAnalytics({
    required String userId,
    required String timeRange,
  }) async {
    // 1. Kiểm tra kết nối mạng (Tùy chọn)
    /*
    if (!await networkInfo.isConnected) {
      return const Left(NetworkFailure('Không có kết nối mạng'));
    }
    */

    try {
      // 2. Gọi Data Source để lấy Model (Dữ liệu thô từ DB)
      final model = await remoteDataSource.getUserAnalytics(
        userId: userId,
        timeRange: timeRange,
      );

      // 3. Chuyển đổi Data Model -> Domain Entity bằng hàm toEntity()
      final entity = model.toEntity();

      // 4. Trả về thành công
      return Right(entity);
    } on SocketException {
      // Lỗi do rớt mạng giữa chừng khi đang gọi API
      return const Left(NetworkFailure('Mất kết nối máy chủ'));
    } catch (e) {
      // Bắt tất cả các lỗi còn lại (Kể cả lỗi quăng ra từ Data Source)
      return Left(ServerFailure('Lỗi tải thống kê: ${e.toString()}'));
    }
  }
}
