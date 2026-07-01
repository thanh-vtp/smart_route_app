// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'remote_datasource_providers.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning
/// dùng Ref hoặc tự định nghĩa Ref type
/// Quy tắc: name function + Ref
/// Provider cho Google Auth Data Source

@ProviderFor(googleAuthDatasource)
final googleAuthDatasourceProvider = GoogleAuthDatasourceProvider._();

/// dùng Ref hoặc tự định nghĩa Ref type
/// Quy tắc: name function + Ref
/// Provider cho Google Auth Data Source

final class GoogleAuthDatasourceProvider
    extends
        $FunctionalProvider<
          GoogleAuthDatasource,
          GoogleAuthDatasource,
          GoogleAuthDatasource
        >
    with $Provider<GoogleAuthDatasource> {
  /// dùng Ref hoặc tự định nghĩa Ref type
  /// Quy tắc: name function + Ref
  /// Provider cho Google Auth Data Source
  GoogleAuthDatasourceProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'googleAuthDatasourceProvider',
        isAutoDispose: false,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$googleAuthDatasourceHash();

  @$internal
  @override
  $ProviderElement<GoogleAuthDatasource> $createElement(
    $ProviderPointer pointer,
  ) => $ProviderElement(pointer);

  @override
  GoogleAuthDatasource create(Ref ref) {
    return googleAuthDatasource(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(GoogleAuthDatasource value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<GoogleAuthDatasource>(value),
    );
  }
}

String _$googleAuthDatasourceHash() =>
    r'ee7a61638866c20e8c1c3a6f3fae02785461efc3';

/// Provider cho Supabase Auth Data Source

@ProviderFor(supabaseAuthDatasource)
final supabaseAuthDatasourceProvider = SupabaseAuthDatasourceProvider._();

/// Provider cho Supabase Auth Data Source

final class SupabaseAuthDatasourceProvider
    extends
        $FunctionalProvider<
          SupabaseAuthDatasource,
          SupabaseAuthDatasource,
          SupabaseAuthDatasource
        >
    with $Provider<SupabaseAuthDatasource> {
  /// Provider cho Supabase Auth Data Source
  SupabaseAuthDatasourceProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'supabaseAuthDatasourceProvider',
        isAutoDispose: false,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$supabaseAuthDatasourceHash();

  @$internal
  @override
  $ProviderElement<SupabaseAuthDatasource> $createElement(
    $ProviderPointer pointer,
  ) => $ProviderElement(pointer);

  @override
  SupabaseAuthDatasource create(Ref ref) {
    return supabaseAuthDatasource(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(SupabaseAuthDatasource value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<SupabaseAuthDatasource>(value),
    );
  }
}

String _$supabaseAuthDatasourceHash() =>
    r'dc7b9aa49b1617040c17bda2292d02789bf653bd';

/// Provider cho User Device Data Source

@ProviderFor(userDeviceDatasource)
final userDeviceDatasourceProvider = UserDeviceDatasourceProvider._();

/// Provider cho User Device Data Source

final class UserDeviceDatasourceProvider
    extends
        $FunctionalProvider<
          UserDeviceDatasource,
          UserDeviceDatasource,
          UserDeviceDatasource
        >
    with $Provider<UserDeviceDatasource> {
  /// Provider cho User Device Data Source
  UserDeviceDatasourceProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'userDeviceDatasourceProvider',
        isAutoDispose: false,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$userDeviceDatasourceHash();

  @$internal
  @override
  $ProviderElement<UserDeviceDatasource> $createElement(
    $ProviderPointer pointer,
  ) => $ProviderElement(pointer);

  @override
  UserDeviceDatasource create(Ref ref) {
    return userDeviceDatasource(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(UserDeviceDatasource value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<UserDeviceDatasource>(value),
    );
  }
}

String _$userDeviceDatasourceHash() =>
    r'271380a4c880cf536d0eee286bf8a329b00f5b8e';
