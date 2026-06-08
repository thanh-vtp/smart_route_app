import 'package:fpdart/fpdart.dart';
import '../../../../core/errors/failures.dart';
import '../../domain/entities/notification_entity.dart';
import '../../domain/repositories/notification_repository.dart';
import '../datasources/notification_remote_data_source.dart';

class NotificationRepositoryImpl implements NotificationRepository {
  final NotificationRemoteDataSource _remoteDataSource;

  NotificationRepositoryImpl(this._remoteDataSource);

  @override
  Future<Either<Failure, List<AppNotification>>> getNotifications(
    String userId,
    int page,
    int limit,
  ) async {
    try {
      final models = await _remoteDataSource.getNotifications(
        userId,
        page,
        limit,
      );
      // Map Model thành Entity cho UI dùng
      final entities = models.map((model) => model.toEntity()).toList();
      return right(entities);
    } catch (e) {
      return left(ServerFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, void>> markAsRead(String notificationId) async {
    try {
      await _remoteDataSource.markAsRead(notificationId);
      return right(null);
    } catch (e) {
      return left(ServerFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, void>> markAllAsRead(String userId) async {
    try {
      await _remoteDataSource.markAllAsRead(userId);
      return right(null);
    } catch (e) {
      return left(ServerFailure(e.toString()));
    }
  }
}
