import 'package:arcgis_maps/arcgis_maps.dart';

class SymbolCache {
  static final Map<String, ArcGISSymbol> _symbols = {};

  static T? get<T extends ArcGISSymbol>(String key) {
    return _symbols[key] as T?;
  }

  static void set(String key, ArcGISSymbol symbol) {
    _symbols[key] = symbol;
  }

  static bool contains(String key) {
    return _symbols.containsKey(key);
  }

  static void clear() {
    _symbols.clear();
  }
}
