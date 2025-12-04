import 'package:fpdart/fpdart.dart';
import 'package:smart_route_app/core/errors/failures.dart';
import 'package:smart_route_app/core/utils/app_logger.dart';
import 'package:smart_route_app/features/auth/domain/entities/app_user.dart';
import 'package:smart_route_app/features/map/domain/entities/incident.dart';
import 'package:smart_route_app/features/map/domain/repositories/incident_repository.dart';

class AddIncidentUsecase {
  final IncidentRepository repository;

  AddIncidentUsecase(this.repository);

  /// Add incident with user information from authenticated user
  /// [incident] - Incident data to add
  /// [currentUser] - Current authenticated user (from auth state)
  Future<Either<Failure, void>> call(
    Incident incident,
    AppUser currentUser,
  ) async {
    try {
      // Validation: Kiểm tra user đã đăng nhập chưa (validate authentication logic)
      if (currentUser.isEmpty) {
        AppLogger.warning(
          'User not authenticated - cannot add incident',
          name: 'AddIncidentUsecase',
        );
        return left(
          NetworkFailure.unauthorized(
            'Bạn phải đăng nhập để thực hiện chức năng này',
          ),
        );
      }

      // Validation: Kiểm tra user có uid và email hợp lệ
      if (currentUser.uid.isEmpty || currentUser.email.isEmpty) {
        AppLogger.warning(
          'Invalid user data - uid or email missing',
          name: 'AddIncidentUsecase',
        );
        return left(NetworkFailure.unauthorized('Invalid user credentials'));
      }

      AppLogger.domain(
        'Adding incident reported by: ${currentUser.displayName ?? currentUser.email} (uid: ${currentUser.uid})',
        useCase: 'AddIncident',
      );

      // Enrich incident with user info
      final enrichedIncident = Incident(
        id: incident.id,
        latitude: incident.latitude,
        longitude: incident.longitude,
        type: incident.type,
        severity: incident.severity,
        description: incident.description,
        reportedTime: incident.reportedTime,
        reportedBy: currentUser.displayName ?? currentUser.email,
        reportedByUid: currentUser.uid,
      );

      final repositoryResult = await repository.addIncident(enrichedIncident);

      return repositoryResult.fold(
        (failure) {
          AppLogger.error(
            'Failed to add incident',
            name: 'AddIncidentUsecase',
            error: failure,
          );
          return left(failure);
        },
        (result) {
          AppLogger.domain(
            'Incident added successfully',
            useCase: 'AddIncident',
          );
          return right(result);
        },
      );
    } catch (e, stackTrace) {
      AppLogger.error(
        'Unexpected error in AddIncidentUsecase',
        name: 'AddIncidentUsecase',
        error: e,
        stackTrace: stackTrace,
      );
      return left(NetworkFailure.serverError(e.toString()));
    }
  }
}
