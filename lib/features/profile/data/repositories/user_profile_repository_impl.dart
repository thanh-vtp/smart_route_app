import 'package:fpdart/fpdart.dart';
import 'package:smart_route_app/core/errors/failures.dart';
import 'package:smart_route_app/core/utils/app_logger.dart';
import 'package:smart_route_app/features/profile/data/datasources/user_profile_datasource.dart';
import 'package:smart_route_app/features/profile/data/maper/user_profile_mapper.dart';
import 'package:smart_route_app/features/profile/data/models/user_profile_model.dart';
import 'package:smart_route_app/features/profile/domain/entities/user_profile.dart';
import 'package:smart_route_app/features/profile/domain/repositories/user_profile_repository.dart';

class UserProfileRepositoryImpl implements UserProfileRepository {
  final UserProfileDatasource _datasource;

  UserProfileRepositoryImpl(this._datasource);

  @override
  Future<Either<Failure, UserProfile>> getProfile() async {
    try {
      final model = await _datasource.getProfile();

      // Map Model -> Entity
      final UserProfile userProfile = model.toEntity();
      return right(userProfile);
    } catch (e, st) {
      AppLogger.error(
        'GET User Profile Error: $e',
        name: 'UserProfileRepositoryImpl.getProfile',
        error: e,
        stackTrace: st,
      );

      return left(
        UnexpectedFailure(e, st),
      ); // return UnexpectedFailure (lỗi chưa xác định)
    }
  }

  @override
  Future<Either<Failure, void>> updateProfile(UserProfile profile) async {
    await _datasource.upsertUserProfile(profile.toModel());

    try {
      final model = UserProfileModel.fromEntity(
        profile,
      ).copyWith(id: profile.id);

      if (profile.id.isNotEmpty) {
        await _datasource.upsertUserProfile(model);
      }

      return right(null);
    } catch (e, st) {
      AppLogger.error(
        'UPDATE User Profile Error: $e',
        name: 'UserProfileRepositoryImpl.updateProfile',
        error: e,
        stackTrace: st,
      );

      return left(
        UnexpectedFailure(e, st),
      ); // return UnexpectedFailure (lỗi chưa xác định)
    }
  }
}
