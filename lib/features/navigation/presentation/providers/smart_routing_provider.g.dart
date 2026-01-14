// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'smart_routing_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$smartRoutingEnabledHash() =>
    r'6a301c135ec34baaea81eba8cd16ab15db7b6a85';

/// Provider cho việc bật/tắt smart routing (tránh incidents)
///
/// Copied from [SmartRoutingEnabled].
@ProviderFor(SmartRoutingEnabled)
final smartRoutingEnabledProvider =
    NotifierProvider<SmartRoutingEnabled, bool>.internal(
  SmartRoutingEnabled.new,
  name: r'smartRoutingEnabledProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$smartRoutingEnabledHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$SmartRoutingEnabled = Notifier<bool>;
String _$smartRouteStateHash() => r'87e54520ef4322da976144f34a70a379b5b60a92';

/// ============================================================================
/// SMART ROUTING với Dynamic Weight Adjustment + A* inspired approach
/// ============================================================================
///
/// Chiến lược:
/// 1. Tính route gốc từ ArcGIS
/// 2. Kiểm tra incidents trong bán kính ảnh hưởng của route
/// 3. Nếu có incidents → đánh dấu route này có "penalty cao"
/// 4. Tìm alternative routes bằng cách thêm waypoints offset
/// 5. So sánh và chọn route có tổng cost thấp nhất (distance + time + penalty)
/// ============================================================================
///
/// Copied from [SmartRouteState].
@ProviderFor(SmartRouteState)
final smartRouteStateProvider =
    NotifierProvider<SmartRouteState, AsyncValue<SmartRouteResult?>>.internal(
  SmartRouteState.new,
  name: r'smartRouteStateProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$smartRouteStateHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$SmartRouteState = Notifier<AsyncValue<SmartRouteResult?>>;
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member
