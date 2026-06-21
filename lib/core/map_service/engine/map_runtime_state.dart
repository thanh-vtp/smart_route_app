import 'package:arcgis_maps/arcgis_maps.dart';

class MapRuntimeState {
  final bool isInitialized;
  final bool is3DMode;
  final bool isSwitchingView;

  final BasemapStyle basemapStyle;

  const MapRuntimeState({
    required this.isInitialized,
    required this.is3DMode,
    required this.isSwitchingView,
    required this.basemapStyle,
  });

  factory MapRuntimeState.initial() {
    return const MapRuntimeState(
      isInitialized: false,
      is3DMode: false,
      isSwitchingView: false,
      basemapStyle: BasemapStyle.arcGISNavigation,
    );
  }

  MapRuntimeState copyWith({
    bool? isInitialized,
    bool? is3DMode,
    bool? isSwitchingView,
    BasemapStyle? basemapStyle,
  }) {
    return MapRuntimeState(
      isInitialized: isInitialized ?? this.isInitialized,
      is3DMode: is3DMode ?? this.is3DMode,
      isSwitchingView: isSwitchingView ?? this.isSwitchingView,
      basemapStyle: basemapStyle ?? this.basemapStyle,
    );
  }
}
