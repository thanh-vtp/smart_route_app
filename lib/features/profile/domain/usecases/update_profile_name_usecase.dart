import 'package:fpdart/fpdart.dart';
import '../../../../core/errors/failures.dart';
import '../repositories/profile_repository.dart';

class UpdateProfileNameUseCase {
  final ProfileRepository _repository;

  UpdateProfileNameUseCase(this._repository);

  Future<Either<Failure, void>> call(String userId, String newName) async {
    return await _repository.updateProfileName(userId, newName);
  }
}
