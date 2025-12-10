import 'package:fpdart/fpdart.dart';
import 'package:smart_route_app/core/errors/failure_handler.dart';
import 'package:smart_route_app/core/errors/failures.dart';
import 'package:smart_route_app/core/utils/app_logger.dart';
import 'package:smart_route_app/features/auth/domain/entities/app_user.dart';
import 'package:smart_route_app/features/map/domain/repositories/incident_repository.dart';

class DeleteIncidentUsecase {
  final IncidentRepository repository;
  DeleteIncidentUsecase(this.repository);

  Future<Either<Failure, void>> call({
    required String incidentId,
    required AppUser currentUser,
  }) async {
    try {
      // 1. Validation: Kiểm tra User đã đăng nhập chưa
      // Nếu user rỗng hoặc uid rỗng -> Chặn ngay lập tức
      if (currentUser.isEmpty || currentUser.uid.isEmpty) {
        AppLogger.warning(
          'Unauthenticated user tried to delete incident $incidentId',
          name: 'DeleteIncidentUsecase',
        );
        return left(NetworkFailure.unauthorized());
      }

      AppLogger.domain(
        'User ${currentUser.uid} requesting delete for incident: $incidentId',
        useCase: 'DeleteIncident',
      );

      // 2. Gọi Repository để thực hiện xóa
      // Repository sẽ chịu trách nhiệm kiểm tra xem incidentId này có thuộc về userUid này không (Ownership Check)
      final result = await repository.deleteIncident(
        incidentId: incidentId,
        userUid: currentUser.uid,
      );

      // 3. Xử lý kết quả trả về
      return result.fold(
        (failure) {
          AppLogger.error(
            'Failed to delete incident',
            name: 'DeleteIncidentUsecase',
            error: failure,
          );
          return left(failure);
        },
        (_) {
          AppLogger.domain(
            'Incident deleted successfully',
            useCase: 'DeleteIncident',
          );
          return right(null);
        },
      );
    } catch (e, st) {
      AppLogger.error(
        'Unexpected error in DeleteIncidentUsecase',
        name: 'DeleteIncidentUsecase',
        error: e,
        stackTrace: st,
      );
      return left(e.toFailure(st));
    }
  }
}
