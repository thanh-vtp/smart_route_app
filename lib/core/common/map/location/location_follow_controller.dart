import 'package:arcgis_maps/arcgis_maps.dart';

class LocationFollowController {
  void enableFollow(LocationDisplay display) {
    display.autoPanMode = LocationDisplayAutoPanMode.recenter;
  }

  void disableFollow(LocationDisplay display) {
    display.autoPanMode = LocationDisplayAutoPanMode.off;
  }

  bool isFollowing(LocationDisplay display) {
    return display.autoPanMode != LocationDisplayAutoPanMode.off;
  }
}
