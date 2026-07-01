// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'map_database_providers.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(mapDatabase)
final mapDatabaseProvider = MapDatabaseProvider._();

final class MapDatabaseProvider
    extends $FunctionalProvider<MapDatabase, MapDatabase, MapDatabase>
    with $Provider<MapDatabase> {
  MapDatabaseProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'mapDatabaseProvider',
        isAutoDispose: false,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$mapDatabaseHash();

  @$internal
  @override
  $ProviderElement<MapDatabase> $createElement($ProviderPointer pointer) =>
      $ProviderElement(pointer);

  @override
  MapDatabase create(Ref ref) {
    return mapDatabase(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(MapDatabase value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<MapDatabase>(value),
    );
  }
}

String _$mapDatabaseHash() => r'ac4d8669e33dadfb90f6216d2cd3a36a3e450473';
