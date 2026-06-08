import 'package:fpdart/fpdart.dart';
import '../../../../core/errors/failures.dart';
import '../repositories/notification_repository.dart';

class MarkAllNotificationsReadUseCase {
  final NotificationRepository _repository;

  MarkAllNotificationsReadUseCase(this._repository);

  Future<Either<Failure, void>> call(String userId) async {
    return await _repository.markAllAsRead(userId);
  }
}
