import 'package:arcgis_maps/arcgis_maps.dart';
import 'package:flutter/material.dart';

/// ArcGISMapsExample demonstrates how to get started with a basic 2D mapping application using arcgis_maps.
/// This application:
/// - Creates and displays an [ArcGISMapView] widget with an [ArcGISMapViewController].
/// - Sets an [ArcGISMap] to [ArcGISMapViewController.arcGISMap].
/// - Adds a list of [FeatureLayer] to [ArcGISMap.operationalLayers].
/// - Adds a [GraphicsOverlay] to [ArcGISMapViewController.graphicsOverlays].
/// - Configures a [GeometryEditor] to create a new [Graphic] and add to [GraphicsOverlay.graphics].
class ArcGISMapsExample extends StatefulWidget {
  const ArcGISMapsExample({super.key});

  @override
  State<ArcGISMapsExample> createState() => _ArcGISMapsExampleState();
}

class _ArcGISMapsExampleState extends State<ArcGISMapsExample> {
  // Create a controller for the map view.
  final _mapViewController = ArcGISMapView.createController();
  // Create a map with a basemap style.
  final _map = ArcGISMap.withBasemapStyle(BasemapStyle.arcGISImageryStandard);
  // Create a graphics overlay for displaying graphics.
  final _graphicsOverlay = GraphicsOverlay();
  // Create a geometry editor to create new geometries.
  final _geometryEditor = GeometryEditor();

  // A flag that indicates if the UI is ready to be used.
  var _ready = false;
  // A flag that controls the UI based on whether editing is in progress.
  var _editingInProgress = false;
  // A flag that controls the UI based on layer visibility.
  var _layersVisible = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          ArcGISMapView(
            controllerProvider: () => _mapViewController,
            // Configure actions when the map view is ready to be used.
            onMapViewReady: onMapViewReady,
            // Configure actions when a user taps on the map view widget.
            onTap: !_editingInProgress ? onTap : null,
          ),
          // Add buttons to the UI to toggle layer visibility and create new graphics.
          SafeArea(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Padding(
                  padding: const EdgeInsets.only(bottom: 30),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Tooltip(
                        message: 'Toggle layer visibility',
                        child: ElevatedButton(
                          onPressed: _ready ? toggleLayerVisibility : null,
                          child: Icon(
                            _layersVisible
                                ? Icons.visibility
                                : Icons.visibility_off,
                          ),
                        ),
                      ),
                      Tooltip(
                        message: 'Create a new graphic',
                        child: ElevatedButton(
                          onPressed: _ready
                              ? _editingInProgress
                                    ? saveEdits
                                    : startEditing
                              : null,
                          child: Icon(
                            _editingInProgress ? Icons.save : Icons.draw,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Future<void> onMapViewReady() async {
    // Create feature layers using the ArcGISOnline portal and the required item IDs and layer IDs, where relevant.
    final arcGISOnlinePortal = Portal.arcGISOnline();
    final buildings = FeatureLayer.withFeatureLayerItem(
      PortalItem.withPortalAndItemId(
        portal: arcGISOnlinePortal,
        itemId: '0ec8512ad21e4bb987d7e848d14e7e24',
      ),
    );

    final primaryRoads = FeatureLayer.withItem(
      item: PortalItem.withPortalAndItemId(
        portal: arcGISOnlinePortal,
        itemId: 'f42ecc08a3634182b8678514af35fac3',
      ),
      layerId: 2,
    );

    final secondaryRoads = FeatureLayer.withItem(
      item: PortalItem.withPortalAndItemId(
        portal: arcGISOnlinePortal,
        itemId: 'f42ecc08a3634182b8678514af35fac3',
      ),
      layerId: 6,
    );

    final localRoads = FeatureLayer.withItem(
      item: PortalItem.withPortalAndItemId(
        portal: arcGISOnlinePortal,
        itemId: 'f42ecc08a3634182b8678514af35fac3',
      ),
      layerId: 8,
    );

    // Add the layers to the map's operational layers.
    _map.operationalLayers.addAll([
      buildings,
      primaryRoads,
      secondaryRoads,
      localRoads,
    ]);

    // Define a renderer for the graphics overlay to style any graphics added to it.
    _graphicsOverlay.renderer = SimpleRenderer(
      symbol: SimpleFillSymbol(
        color: Colors.cyanAccent.withValues(alpha: 0.4),
        outline: SimpleLineSymbol(
          style: SimpleLineSymbolStyle.dash,
          color: Colors.cyan,
          width: 2,
        ),
      ),
    );

    // Add some initial graphics to the graphics overlay to display at start up.
    _graphicsOverlay.graphics.addAll(createGraphics());
    // Add the graphics overlay to the map view controller to display it.
    _mapViewController.graphicsOverlays.add(_graphicsOverlay);

    // Assign the map to the map view controller.
    _mapViewController.arcGISMap = _map;

    // Set an initial viewpoint to show at start up.
    _mapViewController.setViewpoint(
      Viewpoint.fromCenter(
        ArcGISPoint(x: -13310927.924, y: 4367840.399),
        scale: 5000,
      ),
    );

    // Assign the geometry editor to the map view controller.
    _mapViewController.geometryEditor = _geometryEditor;

    // Configure some geometry editor settings.
    await configureGeometryEditor();

    // Enable the UI once all configuration is completed.
    setState(() => _ready = true);
  }

  Future<void> onTap(Offset offset) async {
    // Perform an identify operation on the graphics overlay at the tapped screen point provided by the onTap callback.
    final identifyGraphicsOverlayResult = await _mapViewController
        .identifyGraphicsOverlay(
          _graphicsOverlay,
          screenPoint: offset,
          tolerance: 22,
        );

    // If a graphic is identified at the tap location, display a dialog.
    if (identifyGraphicsOverlayResult.graphics.isNotEmpty) {
      final identifiedGraphic = identifyGraphicsOverlayResult.graphics.first;
      if (mounted) {
        await showDialog(
          context: context,
          builder: (context) {
            return AlertDialog(
              alignment: Alignment.center,
              title: const Text('Tapped on Graphic'),
              content: Text(
                'Center point:\n'
                'x: ${identifiedGraphic.geometry?.extent.center.x}\n'
                'y: ${identifiedGraphic.geometry?.extent.center.y}',
              ),
              actions: [
                TextButton(
                  onPressed: () => Navigator.of(context).pop(),
                  child: const Text('OK'),
                ),
              ],
            );
          },
        );
      }
    }
  }

  // Create an initial list of graphics to display.
  List<Graphic> createGraphics() {
    const largePolygonJson = '''
        {"rings":[[[-13311062.662636876,4368080.2952499595],[-13311057.127783449,4368076.3178643389],
            [-13311061.634682227,4367769.666227323],[-13311103.149254397,4367767.9142679712],
            [-13311104.043995325,4367698.8852444943],[-13311091.295635514,4367692.5083970781],
            [-13311089.376387239,4367666.5662346007],[-13311068.132243464,4367666.3481658408],
            [-13311067.365961147,4367656.5642296085],[-13311058.564161845,4367655.1021004347],
            [-13311060.260100655,4367569.1472102059],[-13311314.397355149,4367569.6304349722],
            [-13311329.11803535,4367581.7673969641],[-13311325.279430484,4368078.8186992826],
            [-13311229.822984351,4368080.2299739141],[-13311228.715676585,4367907.4899566751],
            [-13311146.872602904,4367905.7258633124],[-13311145.543586506,4368081.7248991122],
            [-13311062.662636876,4368080.2952499595]]],
            "spatialReference":{"latestWkid":3857,"wkid":102100}}''';
    // Create a polygon geometry using the provided JSON string.
    final largePolygonGeometry = Geometry.fromJsonString(largePolygonJson);
    // Create a new graphic using the geometry.
    final largeGraphic = Graphic(geometry: largePolygonGeometry);

    const mediumPolygonJson = '''
        {"rings":[[[-13310930.109359179,4367955.6946535213],[-13310939.951467492,4367565.1394895678],
            [-13311052.146218125,4367566.2247806583],[-13311050.523812089,4367957.6713874312],
            [-13310930.109359179,4367955.6946535213]]],
            "spatialReference":{"latestWkid":3857,"wkid":102100}}''';
    // Create a polygon geometry using the provided JSON string.
    final mediumPolygonGeometry = Geometry.fromJsonString(mediumPolygonJson);
    // Create a new graphic using the geometry.
    final mediumGraphic = Graphic(geometry: mediumPolygonGeometry);

    const smallPolygonJson = '''
        {"rings":[[[-13311036.736801982,4368106.8208614551],[-13311035.197346671,4368240.6001734752],
            [-13310765.222839184,4368239.1766897719],[-13310763.479211008,4368109.3070116714],
            [-13311036.736801982,4368106.8208614551]]],
            "spatialReference":{"latestWkid":3857,"wkid":102100}}''';
    // Create a polygon geometry using the provided JSON string.
    final smallPolygonGeometry = Geometry.fromJsonString(smallPolygonJson);
    // Create a new graphic using the geometry.
    final smallGraphic = Graphic(geometry: smallPolygonGeometry);

    return [largeGraphic, mediumGraphic, smallGraphic];
  }

  // Configures some geometry editor settings.
  Future<void> configureGeometryEditor() async {
    // Use a reticle vertex tool.
    _geometryEditor.tool = ReticleVertexTool();

    // Set the feature tiling mode on the map.
    // Snapping is used to maintain data integrity between different sources of data when editing,
    // so full resolution is needed for valid snapping.
    _map.loadSettings.featureTilingMode =
        FeatureTilingMode.enabledWithFullResolutionWhenSupported;
    // Ensure the map and each layer loads in order to synchronize snap settings.
    await _map.load();
    await Future.wait(_map.operationalLayers.map((layer) => layer.load()));

    // Enable snapping on the geometry editor.
    _geometryEditor.snapSettings.isEnabled = true;
    _geometryEditor.snapSettings.isGeometryGuidesEnabled = true;

    // Add the graphics overlay and feature layers to the snap sources and enable snapping for each source.
    _geometryEditor.snapSettings.syncSourceSettings();
    for (final snapSourceSetting
        in _geometryEditor.snapSettings.sourceSettings) {
      snapSourceSetting.isEnabled = true;
    }
  }

  // Starts the geometry editor to create new geometries.
  void startEditing() {
    // Start the geometry editor with the polygon geometry type to create new polygon geometries.
    _geometryEditor.startWithGeometryType(GeometryType.polygon);
    setState(() => _editingInProgress = true);
  }

  // Saves the geometry created by the geometry editor to the graphics overlay.
  void saveEdits() {
    // Stop the geometry editor and get the returned geometry.
    final geometry = _geometryEditor.stop();
    setState(() => _editingInProgress = false);

    if (geometry != null) {
      // If there is a valid geometry, create a new graphic using it.
      final graphic = Graphic(geometry: geometry);
      // Add the graphic to the graphics overlay.
      _graphicsOverlay.graphics.add(graphic);
    }
  }

  // Toggle the visibility of the map's operational layers.
  void toggleLayerVisibility() {
    setState(() => _layersVisible = !_layersVisible);

    if (_mapViewController.arcGISMap != null) {
      // Get each layer from the list of operational layers on the map and toggle the isVisible property.
      for (final layer in _mapViewController.arcGISMap!.operationalLayers) {
        layer.isVisible = _layersVisible;
      }
    }
  }
}
