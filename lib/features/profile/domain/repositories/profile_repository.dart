import 'package:fpdart/fpdart.dart';
import '../../../../core/errors/failures.dart';

abstract class ProfileRepository {
  Future<Either<Failure, Map<String, dynamic>>> getProfileSettings(
    String userId,
  );

  /// Cập nhật trạng thái nhận thông báo đẩy lên Supabase (bảng users)
  Future<Either<Failure, void>> updatePushSetting(
    String userId,
    bool isEnabled,
  );

  Future<Either<Failure, void>> updateProfileName(
    String userId,
    String newName,
  );

  // (updateDisplayName, deleteAccountPermanently...)
}
