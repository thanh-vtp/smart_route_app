import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:smart_route_app/features/search/domain/entities/address_result.dart';
import 'package:smart_route_app/features/navigation/domain/entities/route_result.dart';
import 'package:smart_route_app/features/search/presentation/widgets/address_search_widget.dart';
// import 'location_info_bottom_sheet.dart';
import 'route_planning_bottom_sheet.dart';
import 'connection_status_widget.dart';
import 'simple_connection_test.dart';
import 'network_diagnostic_widget.dart';
import 'arcgis_asset_error_handler.dart';
import 'offline_geocoding_demo.dart';
import 'cache_management_widget.dart';
import 'debug_imagery_test.dart';

class ArcGISDemoWidget extends HookConsumerWidget {
  const ArcGISDemoWidget({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final selectedLocations = useState<List<Map<String, double>>>([]);
    final currentRoute = useState<RouteResult?>(null);

    return ArcGISAssetErrorHandler(
      child: Scaffold(
        appBar: AppBar(
          title: const Text('ArcGIS Geocoding Demo'),
          backgroundColor: Colors.blue,
          foregroundColor: Colors.white,
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              // Connection status
              const ConnectionStatusWidget(),

              // Simple connection test
              const SimpleConnectionTest(),

              // Network diagnostic
              const NetworkDiagnosticWidget(),

              // Offline demo
              const OfflineGeocodingDemo(),

              // Cache management
              const CacheManagementWidget(),

              // Debug imagery test
              const DebugImageryTest(),

              // Search section
              Container(
                padding: const EdgeInsets.all(16),
                color: Colors.grey[50],
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'Tìm kiếm địa chỉ',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 12),
                    AddressSearchWidget(
                      hintText: 'Nhập địa chỉ để tìm kiếm...',
                      onAddressSelected: (address) {
                        _addLocationToList(selectedLocations, address);
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            content: Text('Đã thêm: ${address.fullAddress}'),
                            duration: const Duration(seconds: 2),
                          ),
                        );
                      },
                    ),
                  ],
                ),
              ),

              // Selected locations
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.4,
                child: selectedLocations.value.isEmpty
                    ? _buildEmptyState()
                    : _buildLocationsList(
                        context,
                        selectedLocations,
                        currentRoute,
                      ),
              ),
            ],
          ),
        ),

        // Floating action buttons
        floatingActionButton: selectedLocations.value.isNotEmpty
            ? Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  // Route planning button
                  if (selectedLocations.value.length >= 2)
                    FloatingActionButton.extended(
                      onPressed: () =>
                          _showRoutePlanning(context, selectedLocations.value),
                      heroTag: 'route',
                      icon: const Icon(Icons.directions),
                      label: const Text('Tính đường đi'),
                      backgroundColor: Colors.green,
                    ),

                  const SizedBox(height: 8),

                  // Clear all button
                  FloatingActionButton(
                    onPressed: () =>
                        _clearAllLocations(selectedLocations, currentRoute),
                    heroTag: 'clear',
                    backgroundColor: Colors.red,
                    child: const Icon(Icons.clear_all),
                  ),
                ],
              )
            : null,
      ),
    );
  }

  Widget _buildEmptyState() {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(Icons.search_off, size: 64, color: Colors.grey[400]),
          const SizedBox(height: 16),
          Text(
            'Chưa có địa điểm nào',
            style: TextStyle(fontSize: 18, color: Colors.grey[600]),
          ),
          const SizedBox(height: 8),
          Text(
            'Tìm kiếm địa chỉ để bắt đầu',
            style: TextStyle(fontSize: 14, color: Colors.grey[500]),
          ),
        ],
      ),
    );
  }

  Widget _buildLocationsList(
    BuildContext context,
    ValueNotifier<List<Map<String, double>>> selectedLocations,
    ValueNotifier<RouteResult?> currentRoute,
  ) {
    return Column(
      children: [
        // Route info
        if (currentRoute.value != null)
          Container(
            width: double.infinity,
            margin: const EdgeInsets.all(16),
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: Colors.blue[50],
              borderRadius: BorderRadius.circular(12),
              border: Border.all(color: Colors.blue[200]!),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    const Icon(Icons.route, color: Colors.blue),
                    const SizedBox(width: 8),
                    const Text(
                      'Thông tin tuyến đường',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const Spacer(),
                    IconButton(
                      onPressed: () => currentRoute.value = null,
                      icon: const Icon(Icons.close, size: 20),
                    ),
                  ],
                ),
                const SizedBox(height: 8),
                Text(
                  'Khoảng cách: ${(currentRoute.value!.totalDistance / 1000).toStringAsFixed(2)} km',
                ),
                Text(
                  'Thời gian: ${_formatDuration(currentRoute.value!.totalTime)}',
                ),
                Text('Tuyến: ${currentRoute.value!.routeName}'),
              ],
            ),
          ),

        // Locations list
        Expanded(
          child: ListView.builder(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            itemCount: selectedLocations.value.length,
            itemBuilder: (context, index) {
              final location = selectedLocations.value[index];
              return Card(
                margin: const EdgeInsets.only(bottom: 8),
                child: ListTile(
                  leading: CircleAvatar(
                    backgroundColor: _getLocationColor(
                      index,
                      selectedLocations.value.length,
                    ),
                    child: Text(
                      '${index + 1}',
                      style: const TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  title: Text(
                    'Vị trí ${index + 1}',
                    style: const TextStyle(fontWeight: FontWeight.bold),
                  ),
                  subtitle: Text(
                    'Lat: ${location['latitude']!.toStringAsFixed(4)}\n'
                    'Lon: ${location['longitude']!.toStringAsFixed(4)}',
                  ),
                  trailing: PopupMenuButton<String>(
                    onSelected: (value) {
                      switch (value) {
                        case 'info':
                          _showLocationInfo(context, location);
                          break;
                        case 'remove':
                          _removeLocation(
                            selectedLocations,
                            index,
                            currentRoute,
                          );
                          break;
                      }
                    },
                    itemBuilder: (context) => [
                      const PopupMenuItem(
                        value: 'info',
                        child: Row(
                          children: [
                            Icon(Icons.info),
                            SizedBox(width: 8),
                            Text('Xem thông tin'),
                          ],
                        ),
                      ),
                      const PopupMenuItem(
                        value: 'remove',
                        child: Row(
                          children: [
                            Icon(Icons.delete, color: Colors.red),
                            SizedBox(width: 8),
                            Text('Xóa'),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              );
            },
          ),
        ),
      ],
    );
  }

  Color _getLocationColor(int index, int total) {
    if (total == 1) return Colors.blue;
    if (index == 0) return Colors.green;
    if (index == total - 1) return Colors.red;
    return Colors.orange;
  }

  void _addLocationToList(
    ValueNotifier<List<Map<String, double>>> selectedLocations,
    AddressResult address,
  ) {
    final newLocation = {
      'latitude': address.latitude,
      'longitude': address.longitude,
    };

    selectedLocations.value = [...selectedLocations.value, newLocation];
  }

  void _removeLocation(
    ValueNotifier<List<Map<String, double>>> selectedLocations,
    int index,
    ValueNotifier<RouteResult?> currentRoute,
  ) {
    selectedLocations.value = List.from(selectedLocations.value)
      ..removeAt(index);
    // Clear route if less than 2 locations
    if (selectedLocations.value.length < 2) {
      currentRoute.value = null;
    }
  }

  void _clearAllLocations(
    ValueNotifier<List<Map<String, double>>> selectedLocations,
    ValueNotifier<RouteResult?> currentRoute,
  ) {
    selectedLocations.value = [];
    currentRoute.value = null;
  }

  void _showLocationInfo(BuildContext context, Map<String, double> location) {
    // showModalBottomSheet(
    //   context: context,
    //   isScrollControlled: true,
    //   backgroundColor: Colors.transparent,
    //   builder: (context) => LocationInfoBottomSheet(
    //     latitude: location['latitude']!,
    //     longitude: location['longitude']!,
    //   ),
    // );
  }

  void _showRoutePlanning(
    BuildContext context,
    List<Map<String, double>> locations,
  ) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      builder: (context) => RoutePlanningBottomSheet(
        waypoints: locations,
        onRouteCalculated: (route) {
          // Handle route result - could update map or store route info
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text(
                'Đường đi: ${(route.totalDistance / 1000).toStringAsFixed(2)} km, '
                '${_formatDuration(route.totalTime)}',
              ),
            ),
          );
        },
      ),
    );
  }

  String _formatDuration(double minutes) {
    final hours = minutes ~/ 60;
    final mins = (minutes % 60).round();

    if (hours > 0) {
      return '${hours}h ${mins}m';
    } else {
      return '${mins}m';
    }
  }
}
