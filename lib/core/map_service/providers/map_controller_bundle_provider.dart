import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:smart_route_app/common/app_logger.dart';
import '../controller/map_controller_bundle.dart';

final mapControllerBundleProvider = Provider<MapControllerBundle>((ref) {
  final bundle = MapControllerBundle();
  AppLogger.debug('Create MapControllerBundle');

  ref.onDispose(() {
    AppLogger.debug('Dispose MapControllerBundle');
    bundle.dispose();
  });

  return bundle;
});
