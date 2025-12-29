import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:smart_route_app/features/map/domain/entities/incident.dart';
import 'package:smart_route_app/features/map/presentation/helpers/location_marker_helper.dart';

/// Enum xác định loại bottom sheet đang hiển thị
enum BottomSheetType {
  /// Không hiển thị bottom sheet nào
  none,

  /// Hiển thị thông tin vị trí (long press)
  locationInfo,

  /// Hiển thị chi tiết incident (tap vào marker)
  incidentDetail,
}

/// Model chứa thông tin hiển thị trên bottom sheet
class MapBottomSheetState {
  final BottomSheetType type;

  /// Tọa độ vị trí (dùng cho locationInfo)
  final double? latitude;
  final double? longitude;

  /// Incident gần vị trí long press (optional)
  final Incident? nearbyIncident;

  /// Incident được tap (dùng cho incidentDetail)
  final Incident? selectedIncident;

  const MapBottomSheetState({
    this.type = BottomSheetType.none,
    this.latitude,
    this.longitude,
    this.nearbyIncident,
    this.selectedIncident,
  });

  /// State mặc định - không hiển thị gì
  const MapBottomSheetState.hidden()
    : type = BottomSheetType.none,
      latitude = null,
      longitude = null,
      nearbyIncident = null,
      selectedIncident = null;

  /// State hiển thị location info
  const MapBottomSheetState.locationInfo({
    required double lat,
    required double lon,
    Incident? nearby,
  }) : type = BottomSheetType.locationInfo,
       latitude = lat,
       longitude = lon,
       nearbyIncident = nearby,
       selectedIncident = null;

  /// State hiển thị incident detail
  const MapBottomSheetState.incidentDetail({required Incident incident})
    : type = BottomSheetType.incidentDetail,
      latitude = null,
      longitude = null,
      nearbyIncident = null,
      selectedIncident = incident;

  bool get isVisible => type != BottomSheetType.none;
  bool get isLocationInfo => type == BottomSheetType.locationInfo;
  bool get isIncidentDetail => type == BottomSheetType.incidentDetail;
}

/// Singleton LocationMarkerHelper để có thể xóa marker từ bất kỳ đâu
final _sharedLocationMarkerHelper = LocationMarkerHelper();

/// Getter để truy cập shared helper từ MapInteractionLogic
LocationMarkerHelper get sharedLocationMarkerHelper =>
    _sharedLocationMarkerHelper;

/// Provider quản lý state hiển thị bottom sheet trên map
/// Chỉ cho phép hiển thị 1 bottom sheet tại 1 thời điểm
class MapBottomSheetNotifier extends StateNotifier<MapBottomSheetState> {
  MapBottomSheetNotifier() : super(const MapBottomSheetState.hidden());

  /// Hiển thị bottom sheet thông tin vị trí (long press)
  void showLocationInfo(
    double latitude,
    double longitude, {
    Incident? nearbyIncident,
  }) {
    state = MapBottomSheetState.locationInfo(
      lat: latitude,
      lon: longitude,
      nearby: nearbyIncident,
    );
  }

  /// Hiển thị bottom sheet chi tiết incident (tap marker)
  void showIncidentDetail(Incident incident) {
    // Xóa location marker nếu có (vì đang chuyển sang xem incident)
    _sharedLocationMarkerHelper.removeMarker();

    state = MapBottomSheetState.incidentDetail(incident: incident);
  }

  /// Ẩn bottom sheet và xóa marker trên map
  void hide() {
    state = const MapBottomSheetState.hidden();
    // Xóa marker khi đóng bottom sheet
    _sharedLocationMarkerHelper.removeMarker();
  }

  /// Kiểm tra có đang hiển thị không
  bool get isVisible => state.isVisible;
}

/// Provider chính để quản lý bottom sheet trên map
final mapBottomSheetProvider =
    StateNotifierProvider<MapBottomSheetNotifier, MapBottomSheetState>((ref) {
      return MapBottomSheetNotifier();
    });

// ============================================================================
// BACKWARD COMPATIBILITY - Giữ lại provider cũ để không break code hiện tại
// ============================================================================

/// Model cũ - giữ lại để backward compatibility
class LocationInfo {
  final double latitude;
  final double longitude;
  final Incident? nearbyIncident;

  const LocationInfo({
    required this.latitude,
    required this.longitude,
    this.nearbyIncident,
  });
}

/// Provider cũ - delegate sang mapBottomSheetProvider
class LocationInfoNotifier extends StateNotifier<LocationInfo?> {
  final Ref _ref;

  LocationInfoNotifier(this._ref) : super(null);

  void show(double latitude, double longitude, {Incident? nearbyIncident}) {
    state = LocationInfo(
      latitude: latitude,
      longitude: longitude,
      nearbyIncident: nearbyIncident,
    );
    // Sync với provider mới
    _ref
        .read(mapBottomSheetProvider.notifier)
        .showLocationInfo(latitude, longitude, nearbyIncident: nearbyIncident);
  }

  void hide() {
    state = null;
    _ref.read(mapBottomSheetProvider.notifier).hide();
  }

  bool get isVisible => state != null;
}

final locationInfoProvider =
    StateNotifierProvider<LocationInfoNotifier, LocationInfo?>((ref) {
      return LocationInfoNotifier(ref);
    });
