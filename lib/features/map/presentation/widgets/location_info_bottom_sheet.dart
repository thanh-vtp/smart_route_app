import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:smart_route_app/core/core.dart';
import 'package:smart_route_app/core/utils/app_logger.dart';
import 'package:smart_route_app/features/map/presentation/providers/states/get_location_imagery_state.dart';
import 'package:smart_route_app/features/map/presentation/providers/states/nearby_places_state.dart';
import 'package:smart_route_app/features/map/presentation/providers/states/reverse_geocode_state.dart';
import 'package:smart_route_app/features/map/presentation/widgets/add_incident_bottom_sheet.dart';
import '../../domain/entities/address_result.dart' as entities;
import '../../domain/entities/location_imagery.dart' as entities;

class LocationInfoBottomSheet extends HookConsumerWidget {
  final double latitude;
  final double longitude;
  final ScrollController scrollController;
  final bool useListView;

  const LocationInfoBottomSheet({
    super.key,
    required this.latitude,
    required this.longitude,
    required this.scrollController,
    this.useListView = true,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final reverseGeocodingState = ref.watch(reverseGeocodingStateProvider);
    final locationImageryState = ref.watch(locationImageryStateProvider);
    final nearbyPlacesState = ref.watch(nearbyPlacesNotifierProvider);

    useEffect(() {
      // Tự động load thông tin khi widget được tạo
      AppLogger.ui(
        'LocationInfoBottomSheet useEffect called with lat: $latitude, lon: $longitude',
      );
      WidgetsBinding.instance.addPostFrameCallback((_) {
        AppLogger.ui('Starting reverse geocoding...');
        ref
            .read(reverseGeocodingStateProvider.notifier)
            .reverseGeocode(latitude, longitude);

        AppLogger.ui('Starting location imagery...');
        ref
            .read(locationImageryStateProvider.notifier)
            .getLocationImagery(latitude, longitude);

        AppLogger.ui('Starting nearby places...');
        ref
            .read(nearbyPlacesNotifierProvider.notifier)
            .findNearbyPlaces(latitude: latitude, longitude: longitude);
      });
      return null;
    }, [latitude, longitude]);

    // Hiển thị form báo cáo sự cố mới
    void showReportForm(
      BuildContext context,
      double latitude,
      double longitude,
    ) {
      showModalBottomSheet(
        context: context,
        isScrollControlled: true,
        backgroundColor: Colors.transparent,
        builder: (context) =>
            AddIncidentBottomSheet(latitude: latitude, longitude: longitude),
      );
    }

    return _buildContent(
      context,
      reverseGeocodingState,
      locationImageryState,
      nearbyPlacesState,
      showReportForm,
    );
  }

  Widget _buildContent(
    BuildContext context,
    AsyncValue<entities.AddressResult?> reverseGeocodingState,
    AsyncValue<entities.LocationImagery?> locationImageryState,
    NearbyPlacesState nearbyPlacesState,
    void Function(BuildContext context, double latitude, double longitude)
    showReportForm,
  ) {
    final content = Padding(
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Action Buttons
          _buildActionButtons(context),
          const SizedBox(height: 16),

          // Tọa độ
          _buildCoordinatesSection(),

          const SizedBox(height: 16),

          // Thông tin địa chỉ
          _buildAddressSection(reverseGeocodingState),

          const SizedBox(height: 16),

          // Hình ảnh vệ tinh
          _buildSatelliteImageSection(locationImageryState),

          const SizedBox(height: 16),

          // Địa điểm gần đó
          _buildNearbyPlacesSection(nearbyPlacesState),

          const SizedBox(height: 20),

          SizedBox(
            width: double.infinity,
            child: ElevatedButton.icon(
              onPressed: () {
                Navigator.pop(context);
                showReportForm(context, latitude, longitude);
              },
              icon: const Icon(Icons.report),
              label: const Text('Báo cáo sự cố'),
              style: ElevatedButton.styleFrom(
                padding: const EdgeInsets.symmetric(vertical: 14),
                backgroundColor: Colors.red.shade600,
                foregroundColor: Colors.white,
              ),
            ),
          ),

          // Safe area
          SizedBox(height: MediaQuery.of(context).padding.bottom),
        ],
      ),
    );

    // Nếu không dùng ListView (parent đã có scroll), trả về content trực tiếp
    if (!useListView) {
      return content;
    }

    // Dùng ListView khi cần scroll riêng
    return ListView(controller: scrollController, children: [content]);
  }

  Widget _buildActionButtons(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: ElevatedButton.icon(
            onPressed: () {
              Navigator.pop(context);
              // Use DirectionButton logic
              context.push('/direction');
            },
            icon: const Icon(Icons.directions),
            label: const Text('Chỉ đường'),
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.blue.shade600,
              foregroundColor: Colors.white,
              padding: const EdgeInsets.symmetric(vertical: 12),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8),
              ),
            ),
          ),
        ),
        const SizedBox(width: 12),
        Expanded(
          child: OutlinedButton.icon(
            onPressed: () {
              // TODO: Save location
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(
                  content: Text('TODO: Save location, Đã lưu vị trí, '),
                  duration: Duration(seconds: 2),
                ),
              );
            },
            icon: const Icon(Icons.bookmark_add),
            label: const Text('Lưu'),
            style: OutlinedButton.styleFrom(
              padding: const EdgeInsets.symmetric(vertical: 12),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8),
              ),
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildCoordinatesSection() {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Tọa độ',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            Row(
              children: [
                const Icon(Icons.my_location, size: 16, color: Colors.grey),
                const SizedBox(width: 8),
                Text('Vĩ độ: ${latitude.toStringAsFixed(6)}'),
              ],
            ),
            const SizedBox(height: 4),
            Row(
              children: [
                const Icon(Icons.my_location, size: 16, color: Colors.grey),
                const SizedBox(width: 8),
                Text('Kinh độ: ${longitude.toStringAsFixed(6)}'),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildAddressSection(AsyncValue<entities.AddressResult?> state) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Địa chỉ',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            state.when(
              data: (address) {
                if (address == null) {
                  return const Text('Chưa có thông tin địa chỉ');
                }
                return Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    if (address.fullAddress.isNotEmpty)
                      _buildAddressRow('Địa chỉ đầy đủ', address.fullAddress),
                    if (address.streetName != null)
                      _buildAddressRow('Tên đường', address.streetName!),
                    if (address.neighborhood != null)
                      _buildAddressRow('Khu vực', address.neighborhood!),
                    if (address.district != null)
                      _buildAddressRow('Quận/Huyện', address.district!),
                    if (address.city != null)
                      _buildAddressRow('Thành phố', address.city!),
                    if (address.region != null)
                      _buildAddressRow('Tỉnh/Thành', address.region!),
                    if (address.countryName != null)
                      _buildAddressRow('Quốc gia', address.countryName!),
                  ],
                );
              },
              loading: () => const Center(child: CircularProgressIndicator()),
              error: (error, _) => Text(
                'Lỗi: $error',
                style: const TextStyle(color: Colors.red),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildAddressRow(String label, String value) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 2),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            width: 80,
            child: Text(
              '$label:',
              style: const TextStyle(
                fontWeight: FontWeight.w500,
                color: Colors.grey,
              ),
            ),
          ),
          Expanded(child: Text(value)),
        ],
      ),
    );
  }

  Widget _buildSatelliteImageSection(AsyncValue<entities.LocationImagery?> state) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Hình ảnh vệ tinh',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            state.when(
              data: (imagery) {
                if (imagery == null) {
                  return const Text('Chưa có hình ảnh');
                }
                return Column(
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(8),
                      child: Image.memory(
                        imagery.imageData,
                        width: double.infinity,
                        height: 200,
                        fit: BoxFit.cover,
                      ),
                    ),
                    if (imagery.copyrightText != null) ...[
                      const SizedBox(height: 8),
                      Text(
                        imagery.copyrightText!,
                        style: const TextStyle(
                          fontSize: 12,
                          color: Colors.grey,
                        ),
                      ),
                    ],
                  ],
                );
              },
              loading: () => Container(
                height: 200,
                decoration: BoxDecoration(
                  color: Colors.grey[200],
                  borderRadius: BorderRadius.circular(8),
                ),
                child: const Center(child: CircularProgressIndicator()),
              ),
              error: (error, _) => Container(
                height: 200,
                decoration: BoxDecoration(
                  color: Colors.grey[200],
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Center(
                  child: Text(
                    'Lỗi tải hình ảnh: $error',
                    style: const TextStyle(color: Colors.red),
                    textAlign: TextAlign.center,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildNearbyPlacesSection(NearbyPlacesState state) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Địa điểm gần đó',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            state.when(
              initial: () =>
                  const Center(child: Text('Hãy chọn vị trí để tìm kiếm')),
              loading: () => const Center(child: CircularProgressIndicator()),
              loaded: (places, category, isSearchingMore) {
                if (places.isEmpty) {
                  return const Text('Không có địa điểm gần đó');
                }
                return Column(
                  children: places.take(5).map((place) {
                    return ListTile(
                      contentPadding: EdgeInsets.zero,
                      leading: const Icon(Icons.place, color: Colors.orange),
                      title: Text(place.name),
                      subtitle: Text(
                        '${place.address}\nKhoảng cách: ${(place.distance / 1000).toStringAsFixed(2)} km',
                      ),
                      isThreeLine: true,
                    );
                  }).toList(),
                );
              },

              error: (error, _) => Text(
                'Lỗi: $error',
                style: const TextStyle(color: Colors.red),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
