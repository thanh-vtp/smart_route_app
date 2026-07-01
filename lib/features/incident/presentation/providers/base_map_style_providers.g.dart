// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'base_map_style_providers.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning
/// Provider để lưu trữ kiểu basemap

@ProviderFor(BaseMapStyleProvider)
final baseMapStyleProviderProvider = BaseMapStyleProviderProvider._();

/// Provider để lưu trữ kiểu basemap
final class BaseMapStyleProviderProvider
    extends $NotifierProvider<BaseMapStyleProvider, BasemapStyle> {
  /// Provider để lưu trữ kiểu basemap
  BaseMapStyleProviderProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'baseMapStyleProviderProvider',
        isAutoDispose: false,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$baseMapStyleProviderHash();

  @$internal
  @override
  BaseMapStyleProvider create() => BaseMapStyleProvider();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(BasemapStyle value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<BasemapStyle>(value),
    );
  }
}

String _$baseMapStyleProviderHash() =>
    r'a22b28595d7113c65508ed1677318e8e924d809e';

/// Provider để lưu trữ kiểu basemap

abstract class _$BaseMapStyleProvider extends $Notifier<BasemapStyle> {
  BasemapStyle build();
  @$mustCallSuper
  @override
  WhenComplete runBuild() {
    final ref = this.ref as $Ref<BasemapStyle, BasemapStyle>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<BasemapStyle, BasemapStyle>,
              BasemapStyle,
              Object?,
              Object?
            >;
    return element.handleCreate(ref, build);
  }
}

/// Provider để track trạng thái loading khi đổi basemap

@ProviderFor(BasemapLoading)
final basemapLoadingProvider = BasemapLoadingProvider._();

/// Provider để track trạng thái loading khi đổi basemap
final class BasemapLoadingProvider
    extends $NotifierProvider<BasemapLoading, bool> {
  /// Provider để track trạng thái loading khi đổi basemap
  BasemapLoadingProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'basemapLoadingProvider',
        isAutoDispose: false,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$basemapLoadingHash();

  @$internal
  @override
  BasemapLoading create() => BasemapLoading();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(bool value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<bool>(value),
    );
  }
}

String _$basemapLoadingHash() => r'5251185abcb00846c63533477d7ff9a52f3b9a19';

/// Provider để track trạng thái loading khi đổi basemap

abstract class _$BasemapLoading extends $Notifier<bool> {
  bool build();
  @$mustCallSuper
  @override
  WhenComplete runBuild() {
    final ref = this.ref as $Ref<bool, bool>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<bool, bool>,
              bool,
              Object?,
              Object?
            >;
    return element.handleCreate(ref, build);
  }
}
