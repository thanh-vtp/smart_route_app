import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:smart_route_app/core/map_service/providers/symbol_factory_provider.dart';
import 'package:smart_route_app/core/map_service/symbols/symbol_preloader.dart';

final symbolPreloaderProvider = Provider<SymbolPreloader>((ref) {
  return SymbolPreloader(ref.watch(symbolFactoryProvider));
});
