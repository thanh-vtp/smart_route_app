import 'package:smart_route_app/core/map_service/incident_type_config.dart';
import 'package:smart_route_app/common/app_logger.dart';

import 'incident_symbol_factory.dart';

class SymbolPreloader {
  final IncidentSymbolFactory factory;

  SymbolPreloader(this.factory);

  // Flag để biết đã pre-cache chưa
  bool _isPreloaded = false;

  Future<void> preload() async {
    if (_isPreloaded) return;

    // Tạo symbol cho tất cả incident types
    await Future.wait([
      ...IncidentTypes.all.map((type) => factory.getSymbol(type.id)),

      factory.getHighlightSymbol(),
    ]);

    _isPreloaded = true;

    AppLogger.debug(
      'Pre-cached all symbols in RAM',
      name: 'IncidentSymbolFactory',
    );
  }
}
