// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'base_map_style_providers.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$baseMapStyleProviderHash() =>
    r'a22b28595d7113c65508ed1677318e8e924d809e';

/// Provider để lưu trữ kiểu basemap
///
/// Copied from [BaseMapStyleProvider].
@ProviderFor(BaseMapStyleProvider)
final baseMapStyleProviderProvider =
    NotifierProvider<BaseMapStyleProvider, BasemapStyle>.internal(
  BaseMapStyleProvider.new,
  name: r'baseMapStyleProviderProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$baseMapStyleProviderHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$BaseMapStyleProvider = Notifier<BasemapStyle>;
String _$basemapLoadingHash() => r'5251185abcb00846c63533477d7ff9a52f3b9a19';

/// Provider để track trạng thái loading khi đổi basemap
///
/// Copied from [BasemapLoading].
@ProviderFor(BasemapLoading)
final basemapLoadingProvider = NotifierProvider<BasemapLoading, bool>.internal(
  BasemapLoading.new,
  name: r'basemapLoadingProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$basemapLoadingHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$BasemapLoading = Notifier<bool>;
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member
