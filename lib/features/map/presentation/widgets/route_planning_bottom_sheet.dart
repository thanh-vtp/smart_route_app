import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:smart_route_app/features/map/presentation/providers/states/route_state.dart';
import 'package:smart_route_app/features/map/presentation/providers/usecase/use_case_providers.dart';
import 'package:smart_route_app/features/map/domain/entities/route_result.dart';

class RoutePlanningBottomSheet extends HookConsumerWidget {
  final List<Map<String, double>> waypoints;
  final Function(RouteResult)? onRouteCalculated;

  const RoutePlanningBottomSheet({
    super.key,
    required this.waypoints,
    this.onRouteCalculated,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final routeState = ref.watch(routeStateProvider);
    final waypointControllers = useState<List<TextEditingController>>([]);
    final currentWaypoints = useState<List<Map<String, double>>>(waypoints);

    useEffect(() {
      // Initialize controllers
      waypointControllers.value = List.generate(
        waypoints.length,
        (index) => TextEditingController(),
      );

      // Load address names for waypoints
      for (int i = 0; i < waypoints.length; i++) {
        _loadAddressForWaypoint(
          ref,
          waypoints[i],
          waypointControllers.value[i],
        );
      }

      return () {
        for (final controller in waypointControllers.value) {
          controller.dispose();
        }
      };
    }, []);

    return Container(
      height: MediaQuery.of(context).size.height * 0.8,
      decoration: const BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      child: Column(
        children: [
          // Handle bar
          Container(
            width: 40,
            height: 4,
            margin: const EdgeInsets.symmetric(vertical: 12),
            decoration: BoxDecoration(
              color: Colors.grey[300],
              borderRadius: BorderRadius.circular(2),
            ),
          ),

          // Header
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Row(
              children: [
                const Icon(Icons.directions, color: Colors.blue),
                const SizedBox(width: 8),
                const Text(
                  'Lập kế hoạch đường đi',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
                const Spacer(),
                IconButton(
                  onPressed: () => Navigator.of(context).pop(),
                  icon: const Icon(Icons.close),
                ),
              ],
            ),
          ),

          const Divider(),

          Expanded(
            child: SingleChildScrollView(
              padding: const EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Waypoints list
                  _buildWaypointsList(
                    waypointControllers.value,
                    currentWaypoints,
                  ),

                  const SizedBox(height: 16),

                  // Add waypoint button
                  _buildAddWaypointButton(
                    waypointControllers,
                    currentWaypoints,
                  ),

                  const SizedBox(height: 16),

                  // Calculate route button
                  _buildCalculateRouteButton(ref, currentWaypoints.value),

                  const SizedBox(height: 16),

                  // Route result
                  _buildRouteResult(context, routeState),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildWaypointsList(
    List<TextEditingController> controllers,
    ValueNotifier<List<Map<String, double>>> waypoints,
  ) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Điểm đi qua',
          style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 8),
        ...List.generate(controllers.length, (index) {
          return Card(
            margin: const EdgeInsets.only(bottom: 8),
            child: Padding(
              padding: const EdgeInsets.all(12),
              child: Row(
                children: [
                  Container(
                    width: 24,
                    height: 24,
                    decoration: BoxDecoration(
                      color: index == 0
                          ? Colors.green
                          : index == controllers.length - 1
                          ? Colors.red
                          : Colors.blue,
                      shape: BoxShape.circle,
                    ),
                    child: Center(
                      child: Text(
                        index == 0
                            ? 'A'
                            : index == controllers.length - 1
                            ? 'B'
                            : '${index + 1}',
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 12,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(width: 12),
                  Expanded(
                    child: TextField(
                      controller: controllers[index],
                      decoration: InputDecoration(
                        hintText: index == 0
                            ? 'Điểm xuất phát'
                            : index == controllers.length - 1
                            ? 'Điểm đến'
                            : 'Điểm dừng $index',
                        border: InputBorder.none,
                        isDense: true,
                      ),
                      readOnly: true,
                    ),
                  ),
                  if (controllers.length > 2)
                    IconButton(
                      onPressed: () =>
                          _removeWaypoint(index, controllers, waypoints),
                      icon: const Icon(Icons.remove_circle, color: Colors.red),
                    ),
                ],
              ),
            ),
          );
        }),
      ],
    );
  }

  Widget _buildAddWaypointButton(
    ValueNotifier<List<TextEditingController>> controllers,
    ValueNotifier<List<Map<String, double>>> waypoints,
  ) {
    return SizedBox(
      width: double.infinity,
      child: OutlinedButton.icon(
        onPressed: () => _showAddWaypointDialog(controllers, waypoints),
        icon: const Icon(Icons.add_location),
        label: const Text('Thêm điểm dừng'),
      ),
    );
  }

  Widget _buildCalculateRouteButton(
    WidgetRef ref,
    List<Map<String, double>> waypoints,
  ) {
    return SizedBox(
      width: double.infinity,
      child: ElevatedButton.icon(
        onPressed: waypoints.length >= 2
            ? () => _calculateRoute(ref, waypoints)
            : null,
        icon: const Icon(Icons.navigation),
        label: const Text('Tính toán đường đi'),
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.blue,
          foregroundColor: Colors.white,
          padding: const EdgeInsets.symmetric(vertical: 12),
        ),
      ),
    );
  }

  Widget _buildRouteResult(
    BuildContext context,
    AsyncValue<RouteResult?> routeState,
  ) {
    return routeState.when(
      data: (route) {
        if (route == null) return const SizedBox.shrink();

        return Card(
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'Kết quả tính toán',
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 12),
                Row(
                  children: [
                    const Icon(Icons.straighten, color: Colors.blue),
                    const SizedBox(width: 8),
                    Text(
                      'Khoảng cách: ${(route.totalDistance / 1000).toStringAsFixed(2)} km',
                    ),
                  ],
                ),
                const SizedBox(height: 8),
                Row(
                  children: [
                    const Icon(Icons.access_time, color: Colors.green),
                    const SizedBox(width: 8),
                    Text('Thời gian: ${_formatDuration(route.totalTime)}'),
                  ],
                ),
                const SizedBox(height: 8),
                Row(
                  children: [
                    const Icon(Icons.route, color: Colors.orange),
                    const SizedBox(width: 8),
                    Text('Tuyến đường: ${route.routeName}'),
                  ],
                ),
                const SizedBox(height: 12),
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton.icon(
                    onPressed: () {
                      if (onRouteCalculated != null) {
                        onRouteCalculated!(route);
                      }
                      if (context.mounted) {
                        Navigator.of(context).pop();
                      }
                    },
                    icon: const Icon(Icons.map),
                    label: const Text('Hiển thị trên bản đồ'),
                  ),
                ),
              ],
            ),
          ),
        );
      },
      loading: () => const Card(
        child: Padding(
          padding: EdgeInsets.all(16),
          child: Center(child: CircularProgressIndicator()),
        ),
      ),
      error: (error, _) => Card(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Text('Lỗi: $error', style: const TextStyle(color: Colors.red)),
        ),
      ),
    );
  }

  void _loadAddressForWaypoint(
    WidgetRef ref,
    Map<String, double> waypoint,
    TextEditingController controller,
  ) async {
    final lat = waypoint['latitude']!;
    final lon = waypoint['longitude']!;

    final useCase = ref.read(reverseGeocodeUseCaseProvider);
    final result = await useCase(lat, lon);

    result.fold(
      (error) => controller.text =
          'Lat: ${lat.toStringAsFixed(4)}, Lon: ${lon.toStringAsFixed(4)}',
      (address) => controller.text = address.fullAddress.isNotEmpty
          ? address.fullAddress
          : 'Lat: ${lat.toStringAsFixed(4)}, Lon: ${lon.toStringAsFixed(4)}',
    );
  }

  void _removeWaypoint(
    int index,
    List<TextEditingController> controllers,
    ValueNotifier<List<Map<String, double>>> waypoints,
  ) {
    if (controllers.length > 2) {
      controllers[index].dispose();
      controllers.removeAt(index);
      waypoints.value = List.from(waypoints.value)..removeAt(index);
    }
  }

  void _showAddWaypointDialog(
    ValueNotifier<List<TextEditingController>> controllers,
    ValueNotifier<List<Map<String, double>>> waypoints,
  ) {
    // TODO: Implement dialog to add waypoint by coordinates or address search
    // For now, we'll add a placeholder waypoint
    final newWaypoint = {'latitude': 10.762622, 'longitude': 106.660172};

    final newController = TextEditingController(text: 'Điểm dừng mới');
    controllers.value = List.from(controllers.value)
      ..insert(controllers.value.length - 1, newController);
    waypoints.value = List.from(waypoints.value)
      ..insert(waypoints.value.length - 1, newWaypoint);
  }

  void _calculateRoute(WidgetRef ref, List<Map<String, double>> waypoints) {
    ref.read(routeStateProvider.notifier).calculateRoute(waypoints);
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
