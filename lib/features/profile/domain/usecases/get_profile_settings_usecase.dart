import 'package:fpdart/fpdart.dart';
import 'package:smart_route_app/core/errors/failures.dart';
import 'package:smart_route_app/features/profile/domain/repositories/profile_repository.dart';

class GetProfileSettingsUseCase {
  final ProfileRepository _repository;

  GetProfileSettingsUseCase(this._repository);

  Future<Either<Failure, Map<String, dynamic>>> call(String userId) =>
      _repository.getProfileSettings(userId);
}
