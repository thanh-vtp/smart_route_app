import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:smart_route_app/core/map_service/providers/map_controller_bundle_provider.dart';

/// Provider expose riêng ArcGISMapViewController.
///
/// Tách riêng để:
/// - Widget 2D chỉ rebuild khi cần
/// - Dễ inject/test
/// - Tránh coupling với Scene controller
final mapViewControllerProvider = Provider((ref) {
  final bundle = ref.watch(mapControllerBundleProvider);

  return bundle.map2D;
});
