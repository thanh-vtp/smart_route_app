import 'package:freezed_annotation/freezed_annotation.dart';

import '../../domain/entities/app_user.dart';

part 'app_user_model.freezed.dart';
part 'app_user_model.g.dart';

@freezed
class AppUserModel with _$AppUserModel {
  const AppUserModel._();

  const factory AppUserModel({
    required String id,
    required String email,
    @JsonKey(name: 'display_name') String? displayName,
    @JsonKey(name: 'avatar_url') String? avatarUrl,
  }) = _AppUserModel;

  factory AppUserModel.fromJson(Map<String, dynamic> json) =>
      _$AppUserModelFromJson(json);

  factory AppUserModel.fromSupabaseUser(dynamic user) {
    return AppUserModel(
      id: user.id,
      email: user.email ?? '',
      displayName:
          user.userMetadata?['full_name'] ?? user.userMetadata?['name'],
      avatarUrl:
          user.userMetadata?['avatar_url'] ?? user.userMetadata?['picture'],
    );
  }

  AppUser toDomain() {
    return AppUser(
      id: id,
      email: email,
      displayName: displayName,
      avatarUrl: avatarUrl,
    );
  }
}
