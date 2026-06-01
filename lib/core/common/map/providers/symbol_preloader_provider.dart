import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:smart_route_app/core/common/map/providers/symbol_factory_provider.dart';
import 'package:smart_route_app/core/common/map/symbols/symbol_preloader.dart';

final symbolPreloaderProvider = Provider<SymbolPreloader>((ref) {
  return SymbolPreloader(ref.watch(symbolFactoryProvider));
});
