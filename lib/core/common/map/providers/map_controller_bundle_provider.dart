import 'package:hooks_riverpod/hooks_riverpod.dart';
import '../controller/map_controller_bundle.dart';

final mapControllerBundleProvider = Provider<MapControllerBundle>((ref) {
  final bundle = MapControllerBundle();

  ref.onDispose(bundle.dispose);

  return bundle;
});
