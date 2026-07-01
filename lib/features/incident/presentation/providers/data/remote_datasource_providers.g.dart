// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'remote_datasource_providers.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning
/// dùng Ref hoặc tự định nghĩa Ref type
/// Quy tắc: name function + Ref
/// Provider cho ArcGIS Data Source (chỉ GET)

@ProviderFor(arcgisRemoteDataSource)
final arcgisRemoteDataSourceProvider = ArcgisRemoteDataSourceProvider._();

/// dùng Ref hoặc tự định nghĩa Ref type
/// Quy tắc: name function + Ref
/// Provider cho ArcGIS Data Source (chỉ GET)

final class ArcgisRemoteDataSourceProvider
    extends
        $FunctionalProvider<
          ArcGISRemoteDataSource,
          ArcGISRemoteDataSource,
          ArcGISRemoteDataSource
        >
    with $Provider<ArcGISRemoteDataSource> {
  /// dùng Ref hoặc tự định nghĩa Ref type
  /// Quy tắc: name function + Ref
  /// Provider cho ArcGIS Data Source (chỉ GET)
  ArcgisRemoteDataSourceProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'arcgisRemoteDataSourceProvider',
        isAutoDispose: false,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$arcgisRemoteDataSourceHash();

  @$internal
  @override
  $ProviderElement<ArcGISRemoteDataSource> $createElement(
    $ProviderPointer pointer,
  ) => $ProviderElement(pointer);

  @override
  ArcGISRemoteDataSource create(Ref ref) {
    return arcgisRemoteDataSource(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(ArcGISRemoteDataSource value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<ArcGISRemoteDataSource>(value),
    );
  }
}

String _$arcgisRemoteDataSourceHash() =>
    r'd44f9f7b6a742347dd5ba1865110bda577d0ec58';

/// Provider cho Supabase Data Source (ADD & DELETE)

@ProviderFor(supabaseRemoteDataSource)
final supabaseRemoteDataSourceProvider = SupabaseRemoteDataSourceProvider._();

/// Provider cho Supabase Data Source (ADD & DELETE)

final class SupabaseRemoteDataSourceProvider
    extends
        $FunctionalProvider<
          SupabaseRemoteDataSource,
          SupabaseRemoteDataSource,
          SupabaseRemoteDataSource
        >
    with $Provider<SupabaseRemoteDataSource> {
  /// Provider cho Supabase Data Source (ADD & DELETE)
  SupabaseRemoteDataSourceProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'supabaseRemoteDataSourceProvider',
        isAutoDispose: false,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$supabaseRemoteDataSourceHash();

  @$internal
  @override
  $ProviderElement<SupabaseRemoteDataSource> $createElement(
    $ProviderPointer pointer,
  ) => $ProviderElement(pointer);

  @override
  SupabaseRemoteDataSource create(Ref ref) {
    return supabaseRemoteDataSource(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(SupabaseRemoteDataSource value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<SupabaseRemoteDataSource>(value),
    );
  }
}

String _$supabaseRemoteDataSourceHash() =>
    r'54d51326a5b9ef9f832e60b89acf3fa80774f3d6';
