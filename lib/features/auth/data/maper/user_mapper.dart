import 'package:smart_route_app/features/auth/domain/entities/app_user.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

extension UserMapper on User {
  // Chuyển từ Supabase User -> AppUser
  AppUser toDomain() {
    return AppUser(
      uid: id,
      email: email ?? '',
      displayName: userMetadata?['name'] ?? userMetadata?['full_name'],
      photoUrl: userMetadata?['avatar_url'] ?? userMetadata?['picture'],
    );
  }
}

extension SessionMapper on Session? {
  // Chuyển từ Session -> AppUser
  AppUser toDomain() {
    final session = this;
    if (session == null) {
      return AppUser.empty;
    }
    return session.user.toDomain();
  }
}
