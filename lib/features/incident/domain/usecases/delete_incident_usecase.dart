import 'package:fpdart/fpdart.dart';
import 'package:smart_route_app/core/errors/failures.dart';
import 'package:smart_route_app/core/utils/app_logger.dart';
import 'package:smart_route_app/features/auth/domain/entities/app_user.dart';
import 'package:smart_route_app/features/incident/domain/repositories/incident_repository.dart';

class DeleteIncidentUsecase {
  final IncidentRepository repository;
  DeleteIncidentUsecase(this.repository);

  Future<Either<Failure, void>> call({
    required String incidentId,
    required AppUser currentUser,
  }) async {
    // 1. Validation: Kiểm tra User đã đăng nhập chưa
    // Nếu user rỗng hoặc id rỗng -> Chặn ngay lập tức
    if (currentUser.isEmpty || currentUser.id.isEmpty) {
      AppLogger.warning(
        'Unauthenticated user tried to delete incident $incidentId',
        name: 'DeleteIncidentUsecase',
      );
      return left(SupabaseFailure.unauthorized());
    }

    AppLogger.domain(
      'User ${currentUser.id} requesting delete for incident: $incidentId',
      useCase: 'DeleteIncident',
    );

    // 2. Gọi Repository để thực hiện xóa
    // Repository sẽ chịu trách nhiệm kiểm tra xem incidentId này có thuộc về userUid này không (Ownership Check)
    final repositoryResult = await repository.deleteIncident(
      incidentId: incidentId,
      userUid: currentUser.id,
    );

    return repositoryResult.fold(
      (failure) {
        return left(failure);
      },
      (result) {
        return right(result);
      },
    );
  }
}
