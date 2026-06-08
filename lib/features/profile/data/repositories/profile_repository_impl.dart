import 'dart:io';
import 'package:fpdart/fpdart.dart';

import '../../../../core/errors/failures.dart';
import '../../domain/repositories/profile_repository.dart';
import '../datasources/profile_remote_data_source.dart';

class ProfileRepositoryImpl implements ProfileRepository {
  final ProfileRemoteDataSource _remoteDataSource;

  ProfileRepositoryImpl(this._remoteDataSource);

  @override
  Future<Either<Failure, Map<String, dynamic>>> getProfileSettings(
    String userId,
  ) async {
    try {
      final data = await _remoteDataSource.getProfileSettings(userId);
      return right(data);
    } catch (e) {
      return left(ServerFailure('Không thể tải cài đặt: $e'));
    }
  }

  @override
  Future<Either<Failure, void>> updatePushSetting(
    String userId,
    bool isEnabled,
  ) async {
    try {
      await _remoteDataSource.updatePushSetting(userId, isEnabled);
      return right(null);
    } on SocketException {
      return left(const NetworkFailure('Không có kết nối mạng'));
    } catch (e) {
      return left(ServerFailure('Lỗi cập nhật cài đặt: ${e.toString()}'));
    }
  }

  @override
  Future<Either<Failure, void>> updateProfileName(
    String userId,
    String newName,
  ) async {
    try {
      if (newName.trim().isEmpty) {
        return left(const ServerFailure('Tên không được để trống'));
      }
      await _remoteDataSource.updateProfileName(userId, newName);
      return right(null);
    } catch (e) {
      return left(ServerFailure('Lỗi cập nhật tên: $e'));
    }
  }
}
