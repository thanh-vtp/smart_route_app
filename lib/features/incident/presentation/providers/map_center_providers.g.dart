// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'map_center_providers.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning
/// Provider lưu trữ tâm của bản đồ khi người dùng di chuyển bản đồ

@ProviderFor(MapCenter)
final mapCenterProvider = MapCenterProvider._();

/// Provider lưu trữ tâm của bản đồ khi người dùng di chuyển bản đồ
final class MapCenterProvider
    extends $NotifierProvider<MapCenter, ArcGISPoint?> {
  /// Provider lưu trữ tâm của bản đồ khi người dùng di chuyển bản đồ
  MapCenterProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'mapCenterProvider',
        isAutoDispose: false,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$mapCenterHash();

  @$internal
  @override
  MapCenter create() => MapCenter();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(ArcGISPoint? value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<ArcGISPoint?>(value),
    );
  }
}

String _$mapCenterHash() => r'd6b592ac57829c3f63c9b8e7d52a508f25f59dd1';

/// Provider lưu trữ tâm của bản đồ khi người dùng di chuyển bản đồ

abstract class _$MapCenter extends $Notifier<ArcGISPoint?> {
  ArcGISPoint? build();
  @$mustCallSuper
  @override
  WhenComplete runBuild() {
    final ref = this.ref as $Ref<ArcGISPoint?, ArcGISPoint?>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<ArcGISPoint?, ArcGISPoint?>,
              ArcGISPoint?,
              Object?,
              Object?
            >;
    return element.handleCreate(ref, build);
  }
}

/// Provider để yêu cầu map di chuyển đến vị trí cụ thể
/// MapPage sẽ listen provider này và thực hiện setViewpointCenter

@ProviderFor(NavigateToPoint)
final navigateToPointProvider = NavigateToPointProvider._();

/// Provider để yêu cầu map di chuyển đến vị trí cụ thể
/// MapPage sẽ listen provider này và thực hiện setViewpointCenter
final class NavigateToPointProvider
    extends $NotifierProvider<NavigateToPoint, NavigateToPointRequest?> {
  /// Provider để yêu cầu map di chuyển đến vị trí cụ thể
  /// MapPage sẽ listen provider này và thực hiện setViewpointCenter
  NavigateToPointProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'navigateToPointProvider',
        isAutoDispose: false,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$navigateToPointHash();

  @$internal
  @override
  NavigateToPoint create() => NavigateToPoint();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(NavigateToPointRequest? value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<NavigateToPointRequest?>(value),
    );
  }
}

String _$navigateToPointHash() => r'50fe0a14569712dec95e4fa4ccd03e568fd62b96';

/// Provider để yêu cầu map di chuyển đến vị trí cụ thể
/// MapPage sẽ listen provider này và thực hiện setViewpointCenter

abstract class _$NavigateToPoint extends $Notifier<NavigateToPointRequest?> {
  NavigateToPointRequest? build();
  @$mustCallSuper
  @override
  WhenComplete runBuild() {
    final ref =
        this.ref as $Ref<NavigateToPointRequest?, NavigateToPointRequest?>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<NavigateToPointRequest?, NavigateToPointRequest?>,
              NavigateToPointRequest?,
              Object?,
              Object?
            >;
    return element.handleCreate(ref, build);
  }
}
