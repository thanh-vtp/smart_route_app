import 'package:fpdart/fpdart.dart';
import 'package:smart_route_app/core/errors/failures.dart';
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
    // Business Validation: Kiểm tra user đã đăng nhập
    if (currentUser.isEmpty) {
      return left(SupabaseFailure.unauthorized());
    }

    // Business Validation: Kiểm tra user có uid và email hợp lệ
    if (currentUser.uid.isEmpty || currentUser.email.isEmpty) {
      return left(ValidationFailure.invalidUserData());
    }

    // AppLogger.domain(
    //   'Adding incident reported by: ${currentUser.displayName ?? currentUser.email} (uid: ${currentUser.uid})',
    //   useCase: 'AddIncident',
    // );

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
        return left(failure);
      },
      (result) {
        return right(result);
      },
    );
  }
}
