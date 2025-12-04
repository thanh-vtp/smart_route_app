// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'auth_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$authRepositoryHash() => r'bcadfac55030e4b84a8f0d444a53e31718fb702d';

/// See also [authRepository].
@ProviderFor(authRepository)
final authRepositoryProvider = Provider<AuthRepository>.internal(
  authRepository,
  name: r'authRepositoryProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$authRepositoryHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef AuthRepositoryRef = ProviderRef<AuthRepository>;
String _$signInWithGoogleUsecaseHash() =>
    r'1f8ee2e7cf300ef90eefd11482560d1c18e9435d';

/// See also [signInWithGoogleUsecase].
@ProviderFor(signInWithGoogleUsecase)
final signInWithGoogleUsecaseProvider =
    Provider<SignInWithGoogleUsecase>.internal(
  signInWithGoogleUsecase,
  name: r'signInWithGoogleUsecaseProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$signInWithGoogleUsecaseHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef SignInWithGoogleUsecaseRef = ProviderRef<SignInWithGoogleUsecase>;
String _$signOutUsecaseHash() => r'207e9e27d03cf5fe30f249c4ad8272ca00e517f8';

/// See also [signOutUsecase].
@ProviderFor(signOutUsecase)
final signOutUsecaseProvider = Provider<SignOutUsecase>.internal(
  signOutUsecase,
  name: r'signOutUsecaseProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$signOutUsecaseHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef SignOutUsecaseRef = ProviderRef<SignOutUsecase>;
String _$getAuthStateChangesUsecaseHash() =>
    r'6528f318b36d48342cc229d82e2cf72774df35f7';

/// See also [getAuthStateChangesUsecase].
@ProviderFor(getAuthStateChangesUsecase)
final getAuthStateChangesUsecaseProvider =
    Provider<GetAuthStateChangesUsecase>.internal(
  getAuthStateChangesUsecase,
  name: r'getAuthStateChangesUsecaseProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$getAuthStateChangesUsecaseHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef GetAuthStateChangesUsecaseRef = ProviderRef<GetAuthStateChangesUsecase>;
String _$getCurrentUserUsecaseHash() =>
    r'4d13aa920eae8a48a4e3e70cff35bf1753d3a63b';

/// See also [getCurrentUserUsecase].
@ProviderFor(getCurrentUserUsecase)
final getCurrentUserUsecaseProvider = Provider<GetCurrentUserUsecase>.internal(
  getCurrentUserUsecase,
  name: r'getCurrentUserUsecaseProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$getCurrentUserUsecaseHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef GetCurrentUserUsecaseRef = ProviderRef<GetCurrentUserUsecase>;
String _$authStateHash() => r'da4fb0e57cd256902bb0de368d14d99680eeb2fc';

/// See also [authState].
@ProviderFor(authState)
final authStateProvider = StreamProvider<AppUser>.internal(
  authState,
  name: r'authStateProvider',
  debugGetCreateSourceHash:
      const bool.fromEnvironment('dart.vm.product') ? null : _$authStateHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef AuthStateRef = StreamProviderRef<AppUser>;
String _$authControllerHash() => r'4bb2444d3f17e4a91dd1208424ea14e39781f853';

/// See also [AuthController].
@ProviderFor(AuthController)
final authControllerProvider =
    AutoDisposeAsyncNotifierProvider<AuthController, void>.internal(
  AuthController.new,
  name: r'authControllerProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$authControllerHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$AuthController = AutoDisposeAsyncNotifier<void>;
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member
