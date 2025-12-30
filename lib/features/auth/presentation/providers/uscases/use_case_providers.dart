import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:smart_route_app/features/auth/domain/usecases/get_auth_state_changes_usecase.dart';
import 'package:smart_route_app/features/auth/domain/usecases/get_current_user_usecase.dart';
import 'package:smart_route_app/features/auth/domain/usecases/sign_in_with_google_usecase.dart';
import 'package:smart_route_app/features/auth/domain/usecases/sign_out_usecase.dart';
import 'package:smart_route_app/features/auth/presentation/providers/repositories/repository_providers.dart';

part 'use_case_providers.g.dart';

// Đăng nhập bằng Google
@Riverpod(keepAlive: true)
SignInWithGoogleUsecase signInWithGoogleUsecase(
  SignInWithGoogleUsecaseRef ref,
) {
  return SignInWithGoogleUsecase(ref.watch(authRepositoryProvider));
}

// Đăng xuất
@Riverpod(keepAlive: true)
SignOutUsecase signOutUsecase(SignOutUsecaseRef ref) {
  return SignOutUsecase(ref.watch(authRepositoryProvider));
}

// Lấy stream thay đổi trạng thái xác thực
@Riverpod(keepAlive: true)
GetAuthStateChangesUsecase getAuthStateChangesUsecase(
  GetAuthStateChangesUsecaseRef ref,
) {
  return GetAuthStateChangesUsecase(ref.watch(authRepositoryProvider));
}

// Lấy người dùng hiện tại
@Riverpod(keepAlive: true)
GetCurrentUserUsecase getCurrentUserUsecase(GetCurrentUserUsecaseRef ref) {
  return GetCurrentUserUsecase(ref.watch(authRepositoryProvider));
}
