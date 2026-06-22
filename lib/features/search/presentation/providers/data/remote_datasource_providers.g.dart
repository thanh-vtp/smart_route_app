// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'remote_datasource_providers.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning
/// dùng Ref hoặc tự định nghĩa Ref type
/// Quy tắc: name function + Ref
/// Provider cho ArcGIS Geocoding Data Source

@ProviderFor(arcgisGeocodingRemoteDataSource)
final arcgisGeocodingRemoteDataSourceProvider =
    ArcgisGeocodingRemoteDataSourceProvider._();

/// dùng Ref hoặc tự định nghĩa Ref type
/// Quy tắc: name function + Ref
/// Provider cho ArcGIS Geocoding Data Source

final class ArcgisGeocodingRemoteDataSourceProvider
    extends
        $FunctionalProvider<
          ArcGISGeocodingRemoteDataSource,
          ArcGISGeocodingRemoteDataSource,
          ArcGISGeocodingRemoteDataSource
        >
    with $Provider<ArcGISGeocodingRemoteDataSource> {
  /// dùng Ref hoặc tự định nghĩa Ref type
  /// Quy tắc: name function + Ref
  /// Provider cho ArcGIS Geocoding Data Source
  ArcgisGeocodingRemoteDataSourceProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'arcgisGeocodingRemoteDataSourceProvider',
        isAutoDispose: false,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$arcgisGeocodingRemoteDataSourceHash();

  @$internal
  @override
  $ProviderElement<ArcGISGeocodingRemoteDataSource> $createElement(
    $ProviderPointer pointer,
  ) => $ProviderElement(pointer);

  @override
  ArcGISGeocodingRemoteDataSource create(Ref ref) {
    return arcgisGeocodingRemoteDataSource(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(ArcGISGeocodingRemoteDataSource value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<ArcGISGeocodingRemoteDataSource>(
        value,
      ),
    );
  }
}

String _$arcgisGeocodingRemoteDataSourceHash() =>
    r'b5cd65ec6a0dc6f177cddb9af5c586166e83548d';
