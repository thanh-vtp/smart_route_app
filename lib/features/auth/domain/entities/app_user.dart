import 'package:freezed_annotation/freezed_annotation.dart';

part 'app_user.freezed.dart';

// - đăng nhập
// - session
// - auth state
// - check login

@freezed
class AppUser with _$AppUser {
  const AppUser._();
  const factory AppUser({
    required String id,
    required String email,
    String? displayName,
    String? avatarUrl,
  }) = _AppUser;

  factory AppUser.empty() => const AppUser(id: '', email: '');
}

extension AppUserX on AppUser {
  bool get isEmpty => id.isEmpty;
  bool get isNotEmpty => id.isNotEmpty;
}
