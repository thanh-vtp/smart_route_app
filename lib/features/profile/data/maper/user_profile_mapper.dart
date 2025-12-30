import 'package:smart_route_app/features/profile/data/models/user_profile_model.dart';
import 'package:smart_route_app/features/profile/domain/entities/user_profile.dart';

extension UserProfileModelMapper on UserProfileModel {
  UserProfile toDomain() => UserProfile(
    id: id,
    email: email,
    displayName: displayName,
    avatarUrl: avatarUrl,
    createdAt: createdAt,
  );
}

extension UserProfileMapper on UserProfile {
  UserProfileModel toModel() => UserProfileModel(
    id: id,
    email: email,
    displayName: displayName,
    avatarUrl: avatarUrl,
    createdAt: createdAt,
  );
}
