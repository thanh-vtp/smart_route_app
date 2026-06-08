import 'package:fpdart/fpdart.dart';
import '../../../../core/errors/failures.dart';
import '../entities/notification_entity.dart';
import '../repositories/notification_repository.dart';

class GetNotificationsUseCase {
  final NotificationRepository _repository;

  GetNotificationsUseCase(this._repository);

  Future<Either<Failure, List<AppNotification>>> call(
    String userId, {
    int page = 1,
    int limit = 15,
  }) async {
    if (userId.trim().isEmpty) {
      return left(const ServerFailure('Không tìm thấy ID người dùng.'));
    }
    return await _repository.getNotifications(userId, page, limit);
  }
}
