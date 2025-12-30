import 'package:freezed_annotation/freezed_annotation.dart';

part 'app_user.freezed.dart';
part 'app_user.g.dart';

@freezed
class AppUser with _$AppUser {
  const AppUser._();
  const factory AppUser({
    required String uid,
    required String email,
    String? displayName,
    String? avatarUrl,
  }) = _AppUser;

  factory AppUser.fromJson(Map<String, Object?> json) =>
      _$AppUserFromJson(json);

  // factory AppUser.fromSession(Session? session) => session == null
  //     ? empty
  //     : AppUser(
  //         uid: session.user.id,
  //         email: session.user.email ?? '',
  //         displayName: session.user.userMetadata?['name'],
  //         photoUrl: session.user.userMetadata?['avatar_url'],
  //       );

  static AppUser empty = const AppUser(uid: '', email: '');

  bool get isEmpty => uid.isEmpty;
  bool get isNotEmpty => uid.isNotEmpty;
  bool get isAuthenticated => uid.isNotEmpty;
}

// extension UserX on AppUser {
//   bool get isEmpty => this == AppUser.empty;
// }
