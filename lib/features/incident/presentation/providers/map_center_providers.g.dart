// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'map_center_providers.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$mapCenterHash() => r'd6b592ac57829c3f63c9b8e7d52a508f25f59dd1';

/// Provider lưu trữ tâm của bản đồ khi người dùng di chuyển bản đồ
///
/// Copied from [MapCenter].
@ProviderFor(MapCenter)
final mapCenterProvider = NotifierProvider<MapCenter, ArcGISPoint?>.internal(
  MapCenter.new,
  name: r'mapCenterProvider',
  debugGetCreateSourceHash:
      const bool.fromEnvironment('dart.vm.product') ? null : _$mapCenterHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$MapCenter = Notifier<ArcGISPoint?>;
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member
