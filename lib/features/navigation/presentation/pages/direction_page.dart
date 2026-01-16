import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:smart_route_app/core/core.dart';
import 'package:smart_route_app/core/errors/failures.dart';
import 'package:smart_route_app/features/search/domain/entities/address_result.dart';
import 'package:smart_route_app/features/search/presentation/pages/search_directions_page.dart';
import 'package:smart_route_app/features/navigation/presentation/providers/states/route_state.dart';
import 'package:smart_route_app/features/search/presentation/providers/usecases/use_case_providers.dart';
import '../../../incident/domain/entities/incident.dart';
import '../../domain/entities/route_direction.dart';
import '../helpers/direction_formatter.dart';
import '../providers/geocoding_helper.dart';
import '../../../incident/presentation/providers/location_display_providers.dart';
import '../providers/smart_routing_provider.dart';
import '../../../incident/presentation/providers/states/map_page_notifier.dart';
import '../../../incident/presentation/providers/user_location_provider.dart';
import '../../../map/presentation/widgets/recent_search_widget.dart';
import '../../widgets/route_map_widget.dart';
import 'package:smart_route_app/features/navigation/domain/entities/route_result.dart';

/// Enum để xác định đang chọn field nào
enum LocationFieldType { start, end }

/// Enum cho transport mode
enum TransportMode { car, motorcycle, bus, walk }

class DirectionPage extends ConsumerStatefulWidget {
  const DirectionPage({super.key});

  @override
  ConsumerState<DirectionPage> createState() => _DirectionPageState();
}

class _DirectionPageState extends ConsumerState<DirectionPage> {
  AddressResult? _startLocation;
  AddressResult? _endLocation;
  TransportMode _selectedMode = TransportMode.car;
  bool _showMapView = false;
  bool _isLoadingCurrentLocation = false;

  final sheetController = DraggableScrollableController();

  @override
  void initState() {
    super.initState();
    // Tự động set start location từ GPS nếu đang bật
    _initStartLocationFromGPS();
  }

  /// Lấy vị trí GPS hiện tại làm start location nếu GPS đang bật
  Future<void> _initStartLocationFromGPS() async {
    final isLocationEnabled = ref.read(locationDisplayProviderProvider);
    if (!isLocationEnabled) return;

    final userLocation = ref.read(userLocationProvider);
    if (userLocation == null) return;

    setState(() => _isLoadingCurrentLocation = true);

    try {
      // Reverse geocode để lấy địa chỉ từ tọa độ
      final reverseGeocodeUseCase = ref.read(reverseGeocodeUseCaseProvider);
      final result = await reverseGeocodeUseCase(
        userLocation.y, // latitude
        userLocation.x, // longitude
      );

      result.fold(
        (failure) {
          // Nếu reverse geocode fail, vẫn set location với tọa độ
          if (mounted) {
            setState(() {
              _startLocation = AddressResult(
                fullAddress: 'Vị trí hiện tại',
                latitude: userLocation.y,
                longitude: userLocation.x,
                score: 100,
              );
              _isLoadingCurrentLocation = false;
            });
          }
        },
        (address) {
          if (mounted) {
            setState(() {
              _startLocation = address;
              _isLoadingCurrentLocation = false;
            });
          }
        },
      );
    } catch (e) {
      if (mounted) {
        setState(() => _isLoadingCurrentLocation = false);
      }
    }
  }

  void _swapLocations() {
    if (_startLocation != null || _endLocation != null) {
      setState(() {
        final temp = _startLocation;
        _startLocation = _endLocation;
        _endLocation = temp;
      });
      if (_startLocation != null && _endLocation != null) {
        _calculateRouteAndShowMap();
      }
    }
  }

  Future<void> _openLocationSearch(LocationFieldType fieldType) async {
    final result = await Navigator.push<AddressResult>(
      context,
      MaterialPageRoute(
        builder: (context) => SearchDirectionsPage(
          fieldType: fieldType,
          currentStart: _startLocation,
          currentEnd: _endLocation,
        ),
      ),
    );

    if (result != null) {
      setState(() {
        if (fieldType == LocationFieldType.start) {
          _startLocation = result;
        } else {
          _endLocation = result;
        }
      });

      // Auto calculate if both locations selected
      if (_startLocation != null && _endLocation != null) {
        _calculateRouteAndShowMap();
      }
    }
  }

  Future<void> _calculateRouteAndShowMap() async {
    if (_startLocation == null || _endLocation == null) return;

    final stops = [
      {
        'latitude': _startLocation!.latitude,
        'longitude': _startLocation!.longitude,
      },
      {
        'latitude': _endLocation!.latitude,
        'longitude': _endLocation!.longitude,
      },
    ];

    setState(() => _showMapView = true);

    // Check if smart routing is enabled
    final isSmartRoutingEnabled = ref.read(smartRoutingEnabledProvider);

    if (isSmartRoutingEnabled) {
      // Get incidents from map page state
      final mapState = ref.read(mapPageNotifierProvider);
      final incidents = mapState.maybeWhen(
        loaded: (incidents) => incidents,
        submitted: (incidents) => incidents,
        orElse: () => <Incident>[],
      );

      // Use smart routing with incident avoidance
      ref.read(smartRouteStateProvider.notifier).reset();
      await ref
          .read(smartRouteStateProvider.notifier)
          .calculateSmartRoute(stops: stops, incidents: incidents);
    } else {
      // Use normal routing
      ref.read(routeStateProvider.notifier).reset();
      await ref.read(routeStateProvider.notifier).calculateRoute(stops);
    }
  }

  @override
  void dispose() {
    sheetController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    if (_showMapView) {
      return _buildMapView();
    }
    return _buildInputView();
  }

  Widget _buildInputView() {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Column(
          children: [
            // Header with location inputs
            _buildHeader(),

            const Divider(height: 1),

            // Recent searches list
            Expanded(child: _buildRecentSearchesList()),
          ],
        ),
      ),
    );
  }

  Widget _buildHeader() {
    return Container(
      color: Colors.white,
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 8),
            child: _buildHeaderInput(),
          ),

          // Transport mode selector
          _buildTransportModeSelector(),
        ],
      ),
    );
  }

  Widget _buildHeaderInput() {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Back button
        IconButton(
          onPressed: () => Navigator.of(context).pop(),
          icon: const Icon(Icons.arrow_back),
        ),

        // Location fields
        Expanded(
          child: Row(
            spacing: 5,
            children: [
              Column(
                spacing: 10,
                children: [
                  SizedBox(
                    width: 24,
                    child: Icon(Icons.circle, color: Colors.blue, size: 15),
                  ),

                  Column(
                    children: List.generate(
                      3,
                      (i) => Container(
                        width: 2,
                        height: 4,
                        margin: const EdgeInsets.symmetric(vertical: 1),
                        color: Colors.grey.shade400,
                      ),
                    ),
                  ),

                  SizedBox(
                    width: 24,
                    child: Icon(Icons.location_on, color: Colors.red, size: 18),
                  ),
                ],
              ),

              Column(
                spacing: 10,
                children: [
                  // Start location
                  _buildLocationField(
                    hint: 'Vị trí của bạn',
                    value: _startLocation?.fullAddress.split('\n').first,
                    onTap: () => _openLocationSearch(LocationFieldType.start),
                    isLoading: _isLoadingCurrentLocation,
                  ),

                  // End location
                  _buildLocationField(
                    hint: 'Chọn điểm đến',
                    value: _endLocation?.fullAddress.split('\n').first,
                    onTap: () => _openLocationSearch(LocationFieldType.end),
                  ),
                ],
              ),

              // Swap button
              IconButton(
                onPressed: _swapLocations,
                icon: const Icon(Icons.swap_vert),
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildLocationField({
    required String hint,
    String? value,
    required VoidCallback onTap,
    bool isLoading = false,
  }) {
    return InkWell(
      onTap: isLoading ? null : onTap,
      child: Container(
        width: MediaQuery.of(context).size.width * 0.6,
        padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 10),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(8),
          border: Border.all(color: Colors.grey.shade300),
        ),
        child: isLoading
            ? Row(
                children: [
                  SizedBox(
                    width: 14,
                    height: 14,
                    child: CircularProgressIndicator(
                      strokeWidth: 2,
                      color: Colors.blue,
                    ),
                  ),
                  const SizedBox(width: 8),
                  Text(
                    'Đang lấy vị trí...',
                    style: TextStyle(fontSize: 16, color: Colors.grey.shade600),
                  ),
                ],
              )
            : Text(
                value ?? hint,
                style: TextStyle(
                  fontSize: 16,
                  color: value != null ? Colors.black87 : Colors.grey.shade600,
                ),
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
              ),
      ),
    );
  }

  Widget _buildTransportModeSelector() {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          _buildTransportModeButton(TransportMode.car, Icons.directions_car),
          const SizedBox(width: 8),
          _buildTransportModeButton(
            TransportMode.motorcycle,
            Icons.two_wheeler,
          ),
          const SizedBox(width: 8),
          _buildTransportModeButton(TransportMode.bus, Icons.directions_bus),
          const SizedBox(width: 8),
          _buildTransportModeButton(TransportMode.walk, Icons.directions_walk),
        ],
      ),
    );
  }

  Widget _buildTransportModeButton(TransportMode mode, IconData icon) {
    final isSelected = _selectedMode == mode;
    return InkWell(
      onTap: () => setState(() => _selectedMode = mode),
      borderRadius: BorderRadius.circular(20),
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        decoration: BoxDecoration(
          color: isSelected ? Colors.blue.shade50 : Colors.transparent,
          borderRadius: BorderRadius.circular(20),
          border: Border.all(
            color: isSelected ? Colors.blue : Colors.grey.shade300,
          ),
        ),
        child: Icon(
          icon,
          color: isSelected ? Colors.blue : Colors.grey.shade600,
          size: 20,
        ),
      ),
    );
  }

  Widget _buildRecentSearchesList() {
    return RecentSearchWidget(
      showHeader: true,
      maxItems: 10,
      onAddressSelected: (address) {
        // Nếu đã có start location, set end location
        // Ngược lại set start location
        if (_startLocation != null && _endLocation == null) {
          setState(() => _endLocation = address);
        } else {
          setState(() => _startLocation = address);
        }

        // Auto calculate nếu đã có cả 2 điểm
        if (_startLocation != null && _endLocation != null) {
          _calculateRouteAndShowMap();
        }
      },
    );
  }

  Widget _buildMapView() {
    final isSmartRoutingEnabled = ref.watch(smartRoutingEnabledProvider);
    final smartRouteState = ref.watch(smartRouteStateProvider);
    final normalRouteState = ref.watch(routeStateProvider);

    final waypoints = [
      if (_startLocation != null) _startLocation!,
      if (_endLocation != null) _endLocation!,
    ];

    // Lấy incidents để hiển thị trên map
    final mapState = ref.watch(mapPageNotifierProvider);
    final incidents = mapState.maybeWhen(
      loaded: (incidents) => incidents,
      submitted: (incidents) => incidents,
      orElse: () => <Incident>[],
    );

    return Scaffold(
      body: SafeArea(
        child: Stack(
          fit: StackFit.expand,
          children: [
            // Map
            RouteMapWidget(
              waypoints: waypoints,
              route: isSmartRoutingEnabled
                  ? smartRouteState.maybeWhen(
                      data: (result) => result?.activeRoute,
                      orElse: () => null,
                    )
                  : normalRouteState.maybeWhen(
                      data: (route) => route,
                      orElse: () => null,
                    ),
              showIncidents: isSmartRoutingEnabled,
              incidents: isSmartRoutingEnabled ? incidents : [],
            ),

            // Top header
            Positioned(
              top: 0,
              left: 0,
              right: 0,
              child: Align(
                alignment: Alignment.topCenter,
                child: _buildMapHeader(),
              ),
            ),

            // Bottom sheet
            Positioned.fill(child: _buildRouteDetailsSheet(sheetController)),
          ],
        ),
      ),
    );
  }

  /// Widget toggle bật/tắt smart routing (compact cho bottom sheet)
  Widget _buildSmartRoutingToggle() {
    final isSmartRoutingEnabled = ref.watch(smartRoutingEnabledProvider);
    final mapState = ref.watch(mapPageNotifierProvider);
    final smartRouteState = ref.watch(smartRouteStateProvider);

    // Tổng số incidents trong khu vực
    final totalIncidents = mapState.maybeWhen(
      loaded: (incidents) => incidents.length,
      submitted: (incidents) => incidents.length,
      orElse: () => 0,
    );

    // Số incidents trên tuyến đường
    final incidentsOnRoute = smartRouteState.maybeWhen(
      data: (result) => result?.affectedIncidents.length ?? 0,
      orElse: () => 0,
    );

    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 16),
      decoration: BoxDecoration(
        color: isSmartRoutingEnabled
            ? Colors.orange.shade50
            : Colors.grey.shade50,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(
          color: isSmartRoutingEnabled
              ? Colors.orange.shade300
              : Colors.grey.shade300,
        ),
      ),
      child: Column(
        children: [
          // Header row với toggle
          Padding(
            padding: const EdgeInsets.fromLTRB(12, 10, 8, 6),
            child: Row(
              children: [
                Container(
                  padding: const EdgeInsets.all(6),
                  decoration: BoxDecoration(
                    color: isSmartRoutingEnabled
                        ? Colors.orange.shade100
                        : Colors.grey.shade200,
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Icon(
                    Icons.shield_outlined,
                    color: isSmartRoutingEnabled
                        ? Colors.orange.shade700
                        : Colors.grey.shade600,
                    size: 18,
                  ),
                ),
                const SizedBox(width: 10),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Tránh sự cố giao thông',
                        style: TextStyle(
                          fontSize: 13,
                          fontWeight: FontWeight.w600,
                          color: isSmartRoutingEnabled
                              ? Colors.orange.shade800
                              : Colors.grey.shade700,
                        ),
                      ),
                      const SizedBox(height: 2),
                      Text(
                        isSmartRoutingEnabled
                            ? 'Tự động tìm đường an toàn'
                            : 'Bật để tránh điểm nguy hiểm',
                        style: TextStyle(
                          fontSize: 11,
                          color: Colors.grey.shade600,
                        ),
                      ),
                    ],
                  ),
                ),
                Transform.scale(
                  scale: 0.85,
                  child: Switch(
                    value: isSmartRoutingEnabled,
                    onChanged: (value) async {
                      ref.read(smartRoutingEnabledProvider.notifier).toggle();
                      if (_startLocation != null && _endLocation != null) {
                        await _calculateRouteAndShowMap();
                      }
                    },

                    activeThumbColor: Colors.orange,
                  ),
                ),
              ],
            ),
          ),

          // Stats row
          if (totalIncidents > 0)
            Container(
              padding: const EdgeInsets.fromLTRB(12, 6, 12, 10),
              decoration: BoxDecoration(
                color: isSmartRoutingEnabled
                    ? Colors.orange.shade100.withValues(alpha: 0.5)
                    : Colors.grey.shade100,
                borderRadius: const BorderRadius.only(
                  bottomLeft: Radius.circular(11),
                  bottomRight: Radius.circular(11),
                ),
              ),
              child: Row(
                children: [
                  _buildIncidentStat(
                    icon: Icons.location_on,
                    label: 'Khu vực',
                    count: totalIncidents,
                    color: Colors.blue,
                  ),
                  const SizedBox(width: 16),
                  _buildIncidentStat(
                    icon: Icons.route,
                    label: 'Trên đường',
                    count: incidentsOnRoute,
                    color: incidentsOnRoute > 0 ? Colors.red : Colors.green,
                    highlight: incidentsOnRoute > 0,
                  ),
                ],
              ),
            ),
        ],
      ),
    );
  }

  Widget _buildIncidentStat({
    required IconData icon,
    required String label,
    required int count,
    required Color color,
    bool highlight = false,
  }) {
    return Row(
      children: [
        Icon(icon, size: 14, color: color),
        const SizedBox(width: 4),
        Text(
          '$label: ',
          style: TextStyle(fontSize: 11, color: Colors.grey.shade600),
        ),
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 2),
          decoration: BoxDecoration(
            color: highlight
                ? color.withValues(alpha: 0.15)
                : Colors.transparent,
            borderRadius: BorderRadius.circular(8),
          ),
          child: Text(
            '$count',
            style: TextStyle(
              fontSize: 12,
              fontWeight: FontWeight.bold,
              color: color,
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildMapHeader() {
    return Container(
      width: context.width - 32,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.all(Radius.circular(12)),
        boxShadow: [
          BoxShadow(color: Colors.black12, blurRadius: 8, offset: Offset(0, 2)),
        ],
      ),
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.fromLTRB(4, 8, 8, 8),
            child: Row(
              children: [
                IconButton(
                  onPressed: () => setState(() => _showMapView = false),
                  icon: const Icon(Icons.arrow_back),
                ),

                Column(
                  spacing: 5,
                  children: [
                    SizedBox(
                      width: 24,
                      child: Icon(Icons.circle, color: Colors.blue, size: 15),
                    ),

                    Column(
                      children: List.generate(
                        3,
                        (i) => Container(
                          width: 2,
                          height: 4,
                          margin: const EdgeInsets.symmetric(vertical: 1),
                          color: Colors.grey.shade400,
                        ),
                      ),
                    ),

                    SizedBox(
                      width: 24,
                      child: Icon(
                        Icons.location_on,
                        color: Colors.red,
                        size: 18,
                      ),
                    ),
                  ],
                ),

                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,

                    children: [
                      _buildCompactLocationRow(
                        _startLocation?.fullAddress.split('\n').first ?? '',
                      ),
                      const Divider(height: 10, endIndent: 10),
                      _buildCompactLocationRow(
                        _endLocation?.fullAddress.split('\n').first ?? '',
                      ),
                    ],
                  ),
                ),
                IconButton(
                  onPressed: _swapLocations,
                  icon: const Icon(Icons.swap_vert),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildCompactLocationRow(String text) {
    return Text(
      text,
      style: const TextStyle(fontSize: 14),
      maxLines: 1,
      overflow: TextOverflow.ellipsis,
    );
  }

  Widget _buildRouteDetailsSheet(
    DraggableScrollableController sheetController,
  ) {
    final isSmartRoutingEnabled = ref.watch(smartRoutingEnabledProvider);
    final smartRouteState = ref.watch(smartRouteStateProvider);
    final normalRouteState = ref.watch(routeStateProvider);

    final widthExtend = 0.5;

    return DraggableScrollableSheet(
      controller: sheetController,
      initialChildSize: widthExtend,
      minChildSize: 0.16,
      maxChildSize: widthExtend,
      builder: (context, scrollController) => Container(
        decoration: const BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.vertical(top: Radius.circular(16)),
          boxShadow: [
            BoxShadow(
              color: Colors.black26,
              blurRadius: 8,
              offset: Offset(0, -2),
            ),
          ],
        ),
        child: Padding(
          padding: const EdgeInsets.only(top: 16),
          child: ListView(
            controller: scrollController,
            // mainAxisSize: MainAxisSize.min,
            children: [
              // Smart routing toggle
              _buildSmartRoutingToggle(),
              const SizedBox(height: 8),
              if (isSmartRoutingEnabled)
                smartRouteState.when(
                  data: (result) {
                    if (result == null) {
                      return const Padding(
                        padding: EdgeInsets.all(16),
                        child: Text('Đang tính toán tuyến đường thông minh...'),
                      );
                    }
                    return _buildSmartRouteInfo(result);
                  },
                  loading: () => const Padding(
                    padding: EdgeInsets.all(24),
                    child: Center(child: CircularProgressIndicator()),
                  ),
                  error: (error, _) => _buildErrorWidget(error),
                )
              else
                normalRouteState.when(
                  data: (route) {
                    if (route == null) {
                      return const Padding(
                        padding: EdgeInsets.all(16),
                        child: Text('Đang tính toán tuyến đường...'),
                      );
                    }
                    return _buildRouteInfo(route);
                  },
                  loading: () => const Padding(
                    padding: EdgeInsets.all(24),
                    child: Center(child: CircularProgressIndicator()),
                  ),
                  error: (error, _) => _buildErrorWidget(error),
                ),
            ],
          ),
        ),
      ),
    );
  }

  /// Widget hiển thị thông tin smart route
  Widget _buildSmartRouteInfo(SmartRouteResult result) {
    final route = result.activeRoute;
    final formatter = DirectionFormatter(
      startLocation: _startLocation,
      endLocation: _endLocation,
    );
    final actualSteps = formatter.countActualSteps(
      route.directions,
      isSmartRoute: true,
    );

    return Padding(
      padding: const EdgeInsets.all(16),
      child: Column(
        children: [
          // Smart routing status banner - Expandable
          if (result.hasAffectedIncidents) _buildAvoidedIncidentsBanner(result),

          const SizedBox(height: 12),

          // Stats row
          Row(
            children: [
              Expanded(
                child: _buildStatCard(
                  Icons.access_time,
                  Colors.blue,
                  route.formattedTime,
                  'Thời gian',
                ),
              ),
              const SizedBox(width: 8),
              Expanded(
                child: _buildStatCard(
                  Icons.straighten,
                  Colors.green,
                  route.formattedDistance,
                  'Khoảng cách',
                ),
              ),
              const SizedBox(width: 8),
              Expanded(
                child: _buildStatCard(
                  Icons.flag,
                  Colors.orange,
                  route.estimatedArrival,
                  'Đến lúc',
                ),
              ),
            ],
          ),
          const SizedBox(height: 16),
          // Action buttons
          Row(
            children: [
              Expanded(
                flex: 2,
                child: ElevatedButton.icon(
                  onPressed: () =>
                      _showDirectionsDetail(route, isSmartRoute: true),
                  icon: const Icon(Icons.navigation),
                  label: const Text('Bắt đầu'),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.teal,
                    foregroundColor: Colors.white,
                    padding: const EdgeInsets.symmetric(vertical: 14),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                ),
              ),
              const SizedBox(width: 8),
              OutlinedButton.icon(
                onPressed: () =>
                    _showDirectionsDetail(route, isSmartRoute: true),
                icon: const Icon(Icons.list_alt),
                label: Text('$actualSteps bước'),
                style: OutlinedButton.styleFrom(
                  padding: const EdgeInsets.symmetric(
                    vertical: 14,
                    horizontal: 12,
                  ),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
              ),
              const SizedBox(width: 8),
              IconButton(
                onPressed: () {},
                icon: const Icon(Icons.share),
                style: IconButton.styleFrom(
                  backgroundColor: Colors.grey.shade100,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  /// Banner hiển thị danh sách incidents đã tránh
  Widget _buildAvoidedIncidentsBanner(SmartRouteResult result) {
    final isOptimized = result.isOptimized;
    final avoidedCount = result.avoidedIncidentsCount;
    final affectedIncidents = result.affectedIncidents;

    return Container(
      decoration: BoxDecoration(
        color: isOptimized ? Colors.green.shade50 : Colors.orange.shade50,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(
          color: isOptimized ? Colors.green.shade200 : Colors.orange.shade200,
        ),
      ),
      child: Theme(
        data: Theme.of(context).copyWith(dividerColor: Colors.transparent),
        child: ExpansionTile(
          tilePadding: const EdgeInsets.symmetric(horizontal: 12),
          childrenPadding: EdgeInsets.zero,
          initiallyExpanded: false,
          leading: Container(
            padding: const EdgeInsets.all(8),
            decoration: BoxDecoration(
              color: isOptimized
                  ? Colors.green.shade100
                  : Colors.orange.shade100,
              shape: BoxShape.circle,
            ),
            child: Icon(
              isOptimized ? Icons.verified_user : Icons.warning_amber,
              color: isOptimized
                  ? Colors.green.shade700
                  : Colors.orange.shade700,
              size: 20,
            ),
          ),
          title: Text(
            isOptimized
                ? 'Đã tránh $avoidedCount sự cố'
                : '${affectedIncidents.length} sự cố trên đường',
            style: TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.w600,
              color: isOptimized
                  ? Colors.green.shade800
                  : Colors.orange.shade800,
            ),
          ),
          subtitle: isOptimized && result.estimatedTimeSaved > 0
              ? Text(
                  'Tiết kiệm ~${result.estimatedTimeSaved.toInt()} phút',
                  style: TextStyle(fontSize: 12, color: Colors.green.shade600),
                )
              : Text(
                  'Nhấn để xem chi tiết',
                  style: TextStyle(fontSize: 11, color: Colors.grey.shade600),
                ),
          children: [
            Container(
              decoration: BoxDecoration(
                color: Colors.white.withValues(alpha: 0.7),
                borderRadius: const BorderRadius.only(
                  bottomLeft: Radius.circular(11),
                  bottomRight: Radius.circular(11),
                ),
              ),
              child: Column(
                children: [
                  const Divider(height: 1),
                  ...affectedIncidents.asMap().entries.map((entry) {
                    final index = entry.key;
                    final incident = entry.value;
                    final isAvoided = index < avoidedCount;
                    return _buildIncidentItem(incident, isAvoided);
                  }),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  /// Item hiển thị từng incident
  Widget _buildIncidentItem(Incident incident, bool isAvoided) {
    // Map incident type to Vietnamese
    String getIncidentTypeName(String type) {
      switch (type.toLowerCase()) {
        case 'accident':
          return 'Tai nạn';
        case 'construction':
          return 'Công trình';
        case 'flood':
          return 'Ngập nước';
        case 'traffic':
          return 'Ùn tắc';
        case 'roadblock':
          return 'Chặn đường';
        default:
          return type;
      }
    }

    // Map severity to color and text
    Color getSeverityColor(String severity) {
      switch (severity.toLowerCase()) {
        case 'high':
          return Colors.red;
        case 'medium':
          return Colors.orange;
        case 'low':
          return Colors.yellow.shade700;
        default:
          return Colors.grey;
      }
    }

    String getSeverityText(String severity) {
      switch (severity.toLowerCase()) {
        case 'high':
          return 'Nghiêm trọng';
        case 'medium':
          return 'Trung bình';
        case 'low':
          return 'Nhẹ';
        default:
          return severity;
      }
    }

    // Estimate time impact based on severity
    int getEstimatedDelay(String severity) {
      switch (severity.toLowerCase()) {
        case 'high':
          return 15;
        case 'medium':
          return 10;
        case 'low':
          return 5;
        default:
          return 10;
      }
    }

    final typeName = getIncidentTypeName(incident.type);
    final severityColor = getSeverityColor(incident.severity);
    final severityText = getSeverityText(incident.severity);
    final estimatedDelay = getEstimatedDelay(incident.severity);

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
      decoration: BoxDecoration(
        border: Border(
          bottom: BorderSide(color: Colors.grey.shade200, width: 0.5),
        ),
      ),
      child: Row(
        children: [
          // Status icon
          Container(
            padding: const EdgeInsets.all(6),
            decoration: BoxDecoration(
              color: isAvoided ? Colors.green.shade50 : Colors.red.shade50,
              shape: BoxShape.circle,
            ),
            child: Icon(
              isAvoided ? Icons.check : Icons.close,
              size: 14,
              color: isAvoided ? Colors.green : Colors.red,
            ),
          ),
          const SizedBox(width: 10),

          // Incident info
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Text(
                      typeName,
                      style: TextStyle(
                        fontSize: 13,
                        fontWeight: FontWeight.w600,
                        color: Colors.grey.shade800,
                        decoration: isAvoided
                            ? TextDecoration.lineThrough
                            : TextDecoration.none,
                      ),
                    ),
                    const SizedBox(width: 8),
                    Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 6,
                        vertical: 2,
                      ),
                      decoration: BoxDecoration(
                        color: severityColor.withValues(alpha: 0.15),
                        borderRadius: BorderRadius.circular(4),
                      ),
                      child: Text(
                        severityText,
                        style: TextStyle(
                          fontSize: 10,
                          fontWeight: FontWeight.w500,
                          color: severityColor,
                        ),
                      ),
                    ),
                  ],
                ),
                if (incident.description.isNotEmpty) ...[
                  const SizedBox(height: 2),
                  Text(
                    incident.description,
                    style: TextStyle(fontSize: 11, color: Colors.grey.shade600),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                ],
              ],
            ),
          ),

          // Time saved/lost
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
            decoration: BoxDecoration(
              color: isAvoided ? Colors.green.shade50 : Colors.red.shade50,
              borderRadius: BorderRadius.circular(8),
            ),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Icon(
                  isAvoided ? Icons.timer_off : Icons.timer,
                  size: 12,
                  color: isAvoided ? Colors.green : Colors.red,
                ),
                const SizedBox(width: 4),
                Text(
                  isAvoided ? '-$estimatedDelay phút' : '+$estimatedDelay phút',
                  style: TextStyle(
                    fontSize: 11,
                    fontWeight: FontWeight.w600,
                    color: isAvoided
                        ? Colors.green.shade700
                        : Colors.red.shade700,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildRouteInfo(RouteResult route) {
    final formatter = DirectionFormatter(
      startLocation: _startLocation,
      endLocation: _endLocation,
    );
    final formattedDirections = formatter.formatDirections(
      route.directions,
      isSmartRoute: false,
    );

    return Padding(
      padding: const EdgeInsets.all(16),
      child: Column(
        children: [
          // Stats row
          Row(
            children: [
              Expanded(
                child: _buildStatCard(
                  Icons.access_time,
                  Colors.blue,
                  route.formattedTime,
                  'Thời gian',
                ),
              ),
              const SizedBox(width: 8),
              Expanded(
                child: _buildStatCard(
                  Icons.straighten,
                  Colors.green,
                  route.formattedDistance,
                  'Khoảng cách',
                ),
              ),
              const SizedBox(width: 8),
              Expanded(
                child: _buildStatCard(
                  Icons.flag,
                  Colors.orange,
                  route.estimatedArrival,
                  'Đến lúc',
                ),
              ),
            ],
          ),
          const SizedBox(height: 16),
          // Action buttons
          Row(
            children: [
              Expanded(
                flex: 2,
                child: ElevatedButton.icon(
                  onPressed: () =>
                      _showDirectionsDetail(route, isSmartRoute: false),
                  icon: const Icon(Icons.navigation),
                  label: const Text('Bắt đầu'),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.teal,
                    foregroundColor: Colors.white,
                    padding: const EdgeInsets.symmetric(vertical: 14),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                ),
              ),
              const SizedBox(width: 8),
              OutlinedButton.icon(
                onPressed: () =>
                    _showDirectionsDetail(route, isSmartRoute: false),
                icon: const Icon(Icons.list_alt),
                label: Text('${formattedDirections.length} bước'),
                style: OutlinedButton.styleFrom(
                  padding: const EdgeInsets.symmetric(
                    vertical: 14,
                    horizontal: 12,
                  ),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
              ),
              const SizedBox(width: 8),
              IconButton(
                onPressed: () {},
                icon: const Icon(Icons.share),
                style: IconButton.styleFrom(
                  backgroundColor: Colors.grey.shade100,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildStatCard(
    IconData icon,
    Color color,
    String value,
    String label,
  ) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 8),
      decoration: BoxDecoration(
        color: Colors.grey.shade50,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        children: [
          Icon(icon, color: color, size: 24),
          const SizedBox(height: 4),
          Text(
            value,
            style: const TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
            textAlign: TextAlign.center,
          ),
          Text(
            label,
            style: TextStyle(fontSize: 11, color: Colors.grey.shade600),
          ),
        ],
      ),
    );
  }

  Widget _buildErrorWidget(Object error) {
    final message = error is Failure
        ? getFailureMessage(error)
        : error.toString();
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Column(
        children: [
          Icon(Icons.error_outline, color: Colors.red.shade400, size: 32),
          const SizedBox(height: 8),
          Text(
            message,
            style: TextStyle(color: Colors.red.shade600, fontSize: 14),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 12),
          TextButton(
            onPressed: _calculateRouteAndShowMap,
            child: const Text('Thử lại'),
          ),
        ],
      ),
    );
  }

  void _showDirectionsDetail(RouteResult route, {bool isSmartRoute = false}) {
    // Tạo formatter với thông tin địa điểm
    final formatter = DirectionFormatter(
      startLocation: _startLocation,
      endLocation: _endLocation,
    );

    // Format directions
    final formattedDirections = formatter.formatDirections(
      route.directions,
      isSmartRoute: isSmartRoute,
    );

    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      builder: (context) => DraggableScrollableSheet(
        initialChildSize: 0.7,
        minChildSize: 0.3,
        maxChildSize: 0.95,
        builder: (context, scrollController) {
          return Container(
            decoration: const BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.vertical(top: Radius.circular(16)),
            ),
            child: Column(
              children: [
                Container(
                  margin: const EdgeInsets.symmetric(vertical: 8),
                  width: 40,
                  height: 4,
                  decoration: BoxDecoration(
                    color: Colors.grey.shade300,
                    borderRadius: BorderRadius.circular(2),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(16),
                  child: Row(
                    children: [
                      const Icon(Icons.directions, color: Colors.teal),
                      const SizedBox(width: 8),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text(
                              'Chi tiết chỉ đường',
                              style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            Text(
                              '${route.formattedDistance} • ${route.formattedTime}',
                              style: TextStyle(
                                fontSize: 14,
                                color: Colors.grey.shade600,
                              ),
                            ),
                          ],
                        ),
                      ),
                      IconButton(
                        onPressed: () => Navigator.pop(context),
                        icon: const Icon(Icons.close),
                      ),
                    ],
                  ),
                ),
                // Smart route indicator
                if (isSmartRoute)
                  Container(
                    margin: const EdgeInsets.symmetric(horizontal: 16),
                    padding: const EdgeInsets.symmetric(
                      horizontal: 12,
                      vertical: 8,
                    ),
                    decoration: BoxDecoration(
                      color: Colors.orange.shade50,
                      borderRadius: BorderRadius.circular(8),
                      border: Border.all(color: Colors.orange.shade200),
                    ),
                    child: Row(
                      children: [
                        Icon(
                          Icons.alt_route,
                          color: Colors.orange.shade700,
                          size: 18,
                        ),
                        const SizedBox(width: 8),
                        Expanded(
                          child: Text(
                            'Tuyến đường đã được tối ưu để tránh sự cố',
                            style: TextStyle(
                              fontSize: 12,
                              color: Colors.orange.shade700,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                const SizedBox(height: 8),
                const Divider(height: 1),
                Expanded(
                  child: ListView.builder(
                    controller: scrollController,
                    padding: const EdgeInsets.all(16),
                    itemCount: formattedDirections.length,
                    itemBuilder: (context, index) {
                      final direction = formattedDirections[index];
                      return _buildDirectionItem(
                        direction,
                        index == 0,
                        index == formattedDirections.length - 1,
                      );
                    },
                  ),
                ),
                _buildStartNavigationButton(),
              ],
            ),
          );
        },
      ),
    );
  }

  Widget _buildStartNavigationButton() {
    return Container(
      padding: EdgeInsets.fromLTRB(
        16,
        12,
        16,
        12 + MediaQuery.of(context).padding.bottom,
      ),
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.05),
            blurRadius: 4,
            offset: const Offset(0, -2),
          ),
        ],
      ),
      child: SizedBox(
        width: double.infinity,
        child: ElevatedButton.icon(
          onPressed: () => Navigator.pop(context),
          icon: const Icon(Icons.navigation),
          label: const Text('Bắt đầu điều hướng'),
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.teal,
            foregroundColor: Colors.white,
            padding: const EdgeInsets.symmetric(vertical: 14),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildDirectionItem(
    RouteDirection direction,
    bool isFirst,
    bool isLast,
  ) {
    return IntrinsicHeight(
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            width: 40,
            child: Column(
              children: [
                Container(
                  width: 36,
                  height: 36,
                  decoration: BoxDecoration(
                    color: direction.maneuverType.color.withValues(alpha: 0.1),
                    shape: BoxShape.circle,
                    border: Border.all(
                      color: direction.maneuverType.color,
                      width: 2,
                    ),
                  ),
                  child: Icon(
                    direction.maneuverType.icon,
                    color: direction.maneuverType.color,
                    size: 18,
                  ),
                ),
                if (!isLast)
                  Expanded(
                    child: Container(width: 2, color: Colors.grey.shade300),
                  ),
              ],
            ),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.only(bottom: 16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    direction.instruction,
                    style: const TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  if (direction.distanceMeters > 0 ||
                      direction.timeMinutes > 0) ...[
                    const SizedBox(height: 4),
                    Row(
                      children: [
                        if (direction.distanceMeters > 0) ...[
                          Icon(
                            Icons.straighten,
                            size: 14,
                            color: Colors.grey.shade500,
                          ),
                          const SizedBox(width: 4),
                          Text(
                            direction.formattedDistance,
                            style: TextStyle(
                              fontSize: 12,
                              color: Colors.grey.shade600,
                            ),
                          ),
                          const SizedBox(width: 12),
                        ],
                        if (direction.timeMinutes > 0) ...[
                          Icon(
                            Icons.access_time,
                            size: 14,
                            color: Colors.grey.shade500,
                          ),
                          const SizedBox(width: 4),
                          Text(
                            direction.formattedTime,
                            style: TextStyle(
                              fontSize: 12,
                              color: Colors.grey.shade600,
                            ),
                          ),
                        ],
                      ],
                    ),
                  ],
                  if (direction.streetName != null) ...[
                    const SizedBox(height: 4),
                    Text(
                      direction.streetName!,
                      style: TextStyle(
                        fontSize: 12,
                        color: Colors.blue.shade700,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ],
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
