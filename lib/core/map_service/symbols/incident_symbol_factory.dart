import 'package:arcgis_maps/arcgis_maps.dart';
import 'package:flutter/material.dart';
import 'package:smart_route_app/core/map_service/incident_type_config.dart';
import 'package:smart_route_app/core/map_service/symbols/symbol_cache.dart';
import 'package:smart_route_app/core/map_service/symbols/symbol_config.dart';
import 'package:smart_route_app/core/map_service/symbols/symbol_keys.dart';

class IncidentSymbolFactory {
  Future<PictureMarkerSymbol> getSymbol(
    String typeId, {
    SymbolConfig? config,
  }) async {
    final symbolConfig = config ?? SymbolConfig.defaultMarker();

    final cacheKey = SymbolKeys.incident(typeId, symbolConfig.size);

    final cached = SymbolCache.get<PictureMarkerSymbol>(cacheKey);

    if (cached != null) {
      return cached;
    }

    final incidentConfig = IncidentTypes.getById(typeId);

    final image = await ArcGISImage.fromAsset(incidentConfig.assetPath);

    final symbol = PictureMarkerSymbol.withImage(image)
      ..width = symbolConfig.size
      ..height = symbolConfig.size
      ..offsetY = symbolConfig.offsetY;

    SymbolCache.set(cacheKey, symbol);

    return symbol;
  }

  Future<ArcGISSymbol> getHighlightSymbol() async {
    final cached = SymbolCache.get<ArcGISSymbol>(SymbolKeys.highlight);

    if (cached != null) {
      return cached;
    }

    try {
      final image = await ArcGISImage.fromAsset(
        'assets/icons/location_marker.png',
      );

      final config = SymbolConfig.highlight();

      final symbol = PictureMarkerSymbol.withImage(image)
        ..width = config.size
        ..height = config.size
        ..offsetY = config.offsetY;

      SymbolCache.set(SymbolKeys.highlight, symbol);

      return symbol;
    } catch (_) {
      final fallback =
          SimpleMarkerSymbol(
              style: SimpleMarkerSymbolStyle.circle,
              color: Colors.yellow,
              size: 24,
            )
            ..outline = SimpleLineSymbol(
              style: SimpleLineSymbolStyle.solid,
              color: Colors.orange,
              width: 3,
            );

      SymbolCache.set(SymbolKeys.highlight, fallback);

      return fallback;
    }
  }
}
