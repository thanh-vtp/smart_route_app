// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'use_case_providers.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(signInWithGoogleUsecase)
final signInWithGoogleUsecaseProvider = SignInWithGoogleUsecaseProvider._();

final class SignInWithGoogleUsecaseProvider
    extends
        $FunctionalProvider<
          SignInWithGoogleUsecase,
          SignInWithGoogleUsecase,
          SignInWithGoogleUsecase
        >
    with $Provider<SignInWithGoogleUsecase> {
  SignInWithGoogleUsecaseProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'signInWithGoogleUsecaseProvider',
        isAutoDispose: false,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$signInWithGoogleUsecaseHash();

  @$internal
  @override
  $ProviderElement<SignInWithGoogleUsecase> $createElement(
    $ProviderPointer pointer,
  ) => $ProviderElement(pointer);

  @override
  SignInWithGoogleUsecase create(Ref ref) {
    return signInWithGoogleUsecase(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(SignInWithGoogleUsecase value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<SignInWithGoogleUsecase>(value),
    );
  }
}

String _$signInWithGoogleUsecaseHash() =>
    r'1f8ee2e7cf300ef90eefd11482560d1c18e9435d';

@ProviderFor(signOutUsecase)
final signOutUsecaseProvider = SignOutUsecaseProvider._();

final class SignOutUsecaseProvider
    extends $FunctionalProvider<SignOutUsecase, SignOutUsecase, SignOutUsecase>
    with $Provider<SignOutUsecase> {
  SignOutUsecaseProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'signOutUsecaseProvider',
        isAutoDispose: false,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$signOutUsecaseHash();

  @$internal
  @override
  $ProviderElement<SignOutUsecase> $createElement($ProviderPointer pointer) =>
      $ProviderElement(pointer);

  @override
  SignOutUsecase create(Ref ref) {
    return signOutUsecase(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(SignOutUsecase value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<SignOutUsecase>(value),
    );
  }
}

String _$signOutUsecaseHash() => r'207e9e27d03cf5fe30f249c4ad8272ca00e517f8';

@ProviderFor(getAuthStateChangesUsecase)
final getAuthStateChangesUsecaseProvider =
    GetAuthStateChangesUsecaseProvider._();

final class GetAuthStateChangesUsecaseProvider
    extends
        $FunctionalProvider<
          GetAuthStateChangesUsecase,
          GetAuthStateChangesUsecase,
          GetAuthStateChangesUsecase
        >
    with $Provider<GetAuthStateChangesUsecase> {
  GetAuthStateChangesUsecaseProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'getAuthStateChangesUsecaseProvider',
        isAutoDispose: false,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$getAuthStateChangesUsecaseHash();

  @$internal
  @override
  $ProviderElement<GetAuthStateChangesUsecase> $createElement(
    $ProviderPointer pointer,
  ) => $ProviderElement(pointer);

  @override
  GetAuthStateChangesUsecase create(Ref ref) {
    return getAuthStateChangesUsecase(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(GetAuthStateChangesUsecase value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<GetAuthStateChangesUsecase>(value),
    );
  }
}

String _$getAuthStateChangesUsecaseHash() =>
    r'6528f318b36d48342cc229d82e2cf72774df35f7';

@ProviderFor(getCurrentUserUsecase)
final getCurrentUserUsecaseProvider = GetCurrentUserUsecaseProvider._();

final class GetCurrentUserUsecaseProvider
    extends
        $FunctionalProvider<
          GetCurrentUserUsecase,
          GetCurrentUserUsecase,
          GetCurrentUserUsecase
        >
    with $Provider<GetCurrentUserUsecase> {
  GetCurrentUserUsecaseProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'getCurrentUserUsecaseProvider',
        isAutoDispose: false,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$getCurrentUserUsecaseHash();

  @$internal
  @override
  $ProviderElement<GetCurrentUserUsecase> $createElement(
    $ProviderPointer pointer,
  ) => $ProviderElement(pointer);

  @override
  GetCurrentUserUsecase create(Ref ref) {
    return getCurrentUserUsecase(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(GetCurrentUserUsecase value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<GetCurrentUserUsecase>(value),
    );
  }
}

String _$getCurrentUserUsecaseHash() =>
    r'4d13aa920eae8a48a4e3e70cff35bf1753d3a63b';
