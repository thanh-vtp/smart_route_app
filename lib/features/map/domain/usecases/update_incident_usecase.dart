import 'package:fpdart/fpdart.dart';
import 'package:smart_route_app/core/errors/failures.dart';
import 'package:smart_route_app/core/utils/app_logger.dart';
import 'package:smart_route_app/features/auth/domain/entities/app_user.dart';
import 'package:smart_route_app/features/map/domain/entities/incident.dart';
import 'package:smart_route_app/features/map/domain/repositories/incident_repository.dart';

class UpdateIncidentUsecase {
  final IncidentRepository repository;

  UpdateIncidentUsecase(this.repository);

  /// Cập nhật incident với thông tin user đã xác thực
  /// [incident] - Dữ liệu incident cần cập nhật
  /// [userUid] - UID của user hiện tại (từ trạng thái xác thực)
  Future<Either<Failure, void>> call({
    required Incident incident,
    required AppUser currentUser,
  }) async {
    // 1. Validation: Kiểm tra User đã đăng nhập chưa
    // Nếu user rỗng hoặc uid rỗng -> Chặn ngay lập tức
    if (currentUser.isEmpty || currentUser.uid.isEmpty) {
      AppLogger.warning(
        'Unauthenticated user tried to update incident $incident.id',
        name: 'UpdateIncidentUsecase',
      );
      return left(SupabaseFailure.unauthorized());
    }

    AppLogger.domain(
      'User ${currentUser.uid} requesting update for incident: $incident.id',
      useCase: 'UpdateIncident',
    );

    // 2. Gọi Repository để thực hiện cập nhật
    // So sánh uid của người tạo ra sự cố (trong data) với uid người đang login
    if (incident.reportedByUid != currentUser.uid) {
      return left(
        ValidationFailure(
          code: 'UPDATE_DENIED_NOT_OWNER',
          technicalMessage:
              'User ${currentUser.uid} is not the owner of incident ${incident.id}',
        ),
      );
    }

    // 3. Validate Data (Ví dụ: không được để trống mô tả)
    if (incident.description.isEmpty) {
      return left(ValidationFailure.invalidInput('Description'));
    }
    final repositoryResult = await repository.updateIncident(
      incident,
      userUid: currentUser.uid,
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
