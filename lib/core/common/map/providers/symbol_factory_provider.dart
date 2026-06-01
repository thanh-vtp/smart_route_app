import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:smart_route_app/core/common/map/symbols/incident_symbol_factory.dart';

final symbolFactoryProvider = Provider<IncidentSymbolFactory>((ref) {
  return IncidentSymbolFactory();
});
