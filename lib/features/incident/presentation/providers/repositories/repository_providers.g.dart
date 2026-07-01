// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'repository_providers.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning
/// Provider cho Incident Repository
/// Điều phối giữa ArcGIS (GET) và Supabase (ADD/DELETE)

@ProviderFor(incidentRepository)
final incidentRepositoryProvider = IncidentRepositoryProvider._();

/// Provider cho Incident Repository
/// Điều phối giữa ArcGIS (GET) và Supabase (ADD/DELETE)

final class IncidentRepositoryProvider
    extends
        $FunctionalProvider<
          IncidentRepository,
          IncidentRepository,
          IncidentRepository
        >
    with $Provider<IncidentRepository> {
  /// Provider cho Incident Repository
  /// Điều phối giữa ArcGIS (GET) và Supabase (ADD/DELETE)
  IncidentRepositoryProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'incidentRepositoryProvider',
        isAutoDispose: false,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$incidentRepositoryHash();

  @$internal
  @override
  $ProviderElement<IncidentRepository> $createElement(
    $ProviderPointer pointer,
  ) => $ProviderElement(pointer);

  @override
  IncidentRepository create(Ref ref) {
    return incidentRepository(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(IncidentRepository value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<IncidentRepository>(value),
    );
  }
}

String _$incidentRepositoryHash() =>
    r'1ec8ed6f5bad0c9a8000bf3e08e4c0d5d4b3a1e9';
