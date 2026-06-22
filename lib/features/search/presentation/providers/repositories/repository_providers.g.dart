// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'repository_providers.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning
/// Provider cho Geocoding Repository
/// Sử dụng ArcGIS Geocoding Data Source
/// Được dùng cho các use case liên quan đến geocoding

@ProviderFor(geocodingRepository)
final geocodingRepositoryProvider = GeocodingRepositoryProvider._();

/// Provider cho Geocoding Repository
/// Sử dụng ArcGIS Geocoding Data Source
/// Được dùng cho các use case liên quan đến geocoding

final class GeocodingRepositoryProvider
    extends
        $FunctionalProvider<
          GeocodingRepository,
          GeocodingRepository,
          GeocodingRepository
        >
    with $Provider<GeocodingRepository> {
  /// Provider cho Geocoding Repository
  /// Sử dụng ArcGIS Geocoding Data Source
  /// Được dùng cho các use case liên quan đến geocoding
  GeocodingRepositoryProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'geocodingRepositoryProvider',
        isAutoDispose: false,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$geocodingRepositoryHash();

  @$internal
  @override
  $ProviderElement<GeocodingRepository> $createElement(
    $ProviderPointer pointer,
  ) => $ProviderElement(pointer);

  @override
  GeocodingRepository create(Ref ref) {
    return geocodingRepository(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(GeocodingRepository value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<GeocodingRepository>(value),
    );
  }
}

String _$geocodingRepositoryHash() =>
    r'3669ade8bd0f286f671120dc27e437fc6febf910';
