import 'package:fpdart/fpdart.dart';
import '../../../../core/errors/failures.dart';
import '../repositories/profile_repository.dart';

class UpdatePushSettingUseCase {
  final ProfileRepository _repository;

  UpdatePushSettingUseCase(this._repository);

  Future<Either<Failure, void>> call(String userId, bool isEnabled) =>
      _repository.updatePushSetting(userId, isEnabled);
}
