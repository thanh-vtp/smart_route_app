import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:intl/intl.dart';
import 'package:smart_route_app/core/core.dart';
import 'package:smart_route_app/core/common/domain/entities/address_result.dart';
import 'package:smart_route_app/features/incident/domain/entities/incident.dart';
import 'package:smart_route_app/core/common/domain/entities/location_imagery.dart';
import 'package:smart_route_app/core/common/incident_type_config.dart';
import 'package:smart_route_app/features/incident/presentation/providers/location_info_provider.dart';
import 'package:smart_route_app/features/incident/presentation/providers/map_center_providers.dart';
import 'package:smart_route_app/core/common/presentation/providers/selected_address.dart';
import 'package:smart_route_app/core/common/presentation/providers/states/get_location_imagery_state.dart';
import 'package:smart_route_app/core/common/presentation/providers/states/nearby_places_notifier.dart';
import 'package:smart_route_app/core/common/presentation/providers/states/nearby_places_state.dart';
import 'package:smart_route_app/features/incident/presentation/widgets/add_incident_bottom_sheet.dart';
import 'package:smart_route_app/core/common/presentation/providers/states/reverse_geocode_state.dart';
import 'package:smart_route_app/core/common/presentation/widgets/nearby_place_list.dart';
import 'package:smart_route_app/core/common/presentation/widgets/shimmer/nearby_places_shimmer.dart';

/// DraggableScrollableSheet hiển thị thông tin vị trí
/// Dùng CustomScrollView với SliverAppBar để header được giữ cố định khi scroll
class LocationInfoDraggableSheet extends HookConsumerWidget {
  const LocationInfoDraggableSheet({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final bottomSheetState = ref.watch(mapBottomSheetProvider);

    // Không hiển thị nếu không phải locationInfo
    if (!bottomSheetState.isLocationInfo) {
      return const SizedBox.shrink();
    }

    // Tính maxChildSize để không che status bar
    final statusBarHeight =
        context.padding.top; // hoặc MediaQuery.of(context).padding.top
    final screenHeight = context.height; // MediaQuery.of(context).size.height;
    final maxSize = (screenHeight - statusBarHeight) / screenHeight;

    // Controller để control DraggableScrollableSheet programmatically
    final sheetController = useMemoized(() => DraggableScrollableController());

    // Dispose controller khi widget unmount
    useEffect(() {
      return sheetController.dispose;
    }, [sheetController]);

    return SafeArea(
      top: true,
      bottom: false,
      child: DraggableScrollableSheet(
        controller: sheetController,
        initialChildSize: 0.45,
        minChildSize: 0.12,
        maxChildSize: maxSize,
        builder: (context, scrollController) => _LocationInfoContent(
          lat: bottomSheetState.lat!,
          lng: bottomSheetState.lng!,
          nearbyIncident: bottomSheetState.nearbyIncident,
          scrollController: scrollController,
          sheetController: sheetController,
        ),
      ),
    );
  }
}

class _LocationInfoContent extends HookConsumerWidget {
  final double lat;
  final double lng;
  final Incident? nearbyIncident;
  final ScrollController scrollController;
  final DraggableScrollableController sheetController;

  const _LocationInfoContent({
    required this.lat,
    required this.lng,
    this.nearbyIncident,
    required this.scrollController,
    required this.sheetController,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final reverseGeocodingState = ref.watch(reverseGeocodingStateProvider);
    final locationImageryState = ref.watch(locationImageryStateProvider);
    final nearbyPlacesState = ref.watch(nearbyPlacesNotifierProvider);

    // Flag để track khi đã sẵn sàng listen map center changes
    // Delay 1s để đợi zoom/recenter animation hoàn tất
    final isReadyToListen = useState(false);

    useEffect(() {
      AppLogger.ui(
        'LocationInfoContent useEffect called with lat: $lat, lon: $lng',
      );
      WidgetsBinding.instance.addPostFrameCallback((_) {
        ref
            .read(reverseGeocodingStateProvider.notifier)
            .reverseGeocode(lat, lng);
        ref
            .read(locationImageryStateProvider.notifier)
            .getLocationImagery(lat, lng);
        ref
            .read(nearbyPlacesNotifierProvider.notifier)
            .findNearbyPlaces(lat: lat, lng: lng);
      });

      // Reset flag khi location thay đổi (long press mới)
      isReadyToListen.value = false;

      // Mở lại sheet về initialChildSize khi long press vị trí mới
      _expandSheet();

      // Delay 1s để đợi zoom/recenter animation hoàn tất
      // Sau đó mới bắt đầu listen map center changes
      Future.delayed(const Duration(milliseconds: 1000), () {
        isReadyToListen.value = true;
      });

      return null;
    }, [lat, lng]);

    // Listen mapCenterProvider để thu nhỏ sheet khi map center thay đổi
    // Chỉ listen khi đã ready (sau khi zoom/recenter hoàn tất)
    ref.listen(mapCenterProvider, (previous, next) {
      if (!isReadyToListen.value) return; // Bỏ qua nếu chưa ready

      // Chỉ cần mapCenterProvider thay đổi là thu nhỏ sheet ngay
      if (previous != null && next != null) {
        _minimizeSheet();
      }
    });

    return ClipRRect(
      borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
          boxShadow: [
            BoxShadow(color: Colors.black12, blurRadius: 10, spreadRadius: 2),
          ],
        ),
        child: CustomScrollView(
          controller: scrollController,
          slivers: [
            // Pinned Header using SliverAppBar
            SliverAppBar(
              pinned: true,
              floating: false,
              automaticallyImplyLeading: false,
              backgroundColor: Colors.white,
              surfaceTintColor: Colors.white,
              elevation: 0,
              toolbarHeight: 100,
              actions: [
                SizedBox(),
              ], // remove auto create icon ☰ when using endDrawer
              flexibleSpace: _buildHeader(context, ref),
            ),
            // Content
            SliverToBoxAdapter(
              child: Padding(
                padding: const EdgeInsets.fromLTRB(16, 0, 16, 16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    _buildActionButtons(context, ref),
                    const SizedBox(height: 16),
                    // Hiển thị incident gần đó nếu có (ưu tiên)
                    if (nearbyIncident != null) ...[
                      _buildNearbyIncidentSection(nearbyIncident!),
                      const SizedBox(height: 16),
                    ],
                    _buildCoordinatesSection(),
                    const SizedBox(height: 16),
                    _buildAddressSection(reverseGeocodingState),
                    const SizedBox(height: 16),
                    _buildSatelliteImageSection(locationImageryState),
                    const SizedBox(height: 16),
                    _buildNearbyPlacesSection(nearbyPlacesState),
                    const SizedBox(height: 20),
                    _buildReportButton(context, ref),
                    SizedBox(
                      height: MediaQuery.of(context).padding.bottom + 16,
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildHeader(BuildContext context, WidgetRef ref) {
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [Colors.blue.withValues(alpha: 0.1), Colors.white],
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
        ),
        borderRadius: const BorderRadius.vertical(top: Radius.circular(20)),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          // Handle bar
          Center(
            child: Container(
              margin: EdgeInsets.only(top: 10, bottom: 10),
              width: 40,
              height: 4,
              decoration: BoxDecoration(
                color: Colors.grey[300],
                borderRadius: BorderRadius.circular(2),
              ),
            ),
          ),
          // Title row
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Row(
              children: [
                const Icon(Icons.location_on, color: Colors.blue),
                const SizedBox(width: 8),
                const Text(
                  'Thông tin vị trí',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
                const Spacer(),
                IconButton(
                  icon: Icon(Icons.close, size: 20, color: Colors.grey[600]),
                  onPressed: () {
                    ref.read(mapBottomSheetProvider.notifier).hide();
                    ref
                        .read(selectedAddressProvider.notifier)
                        .clear(); // Xóa địa chỉ đã chọn (MapSearchTopBar)
                  },
                  padding: EdgeInsets.zero,
                  constraints: BoxConstraints(minWidth: 32, minHeight: 32),
                ),
              ],
            ),
          ),
          const Divider(height: 1),
        ],
      ),
    );
  }

  Widget _buildActionButtons(BuildContext context, WidgetRef ref) {
    return Row(
      children: [
        Expanded(
          child: ElevatedButton.icon(
            onPressed: () {
              ref.read(mapBottomSheetProvider.notifier).hide();
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
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(
                  content: Text('TODO: Save location'),
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

  /// Hiển thị thông tin incident gần vị trí long press
  Widget _buildNearbyIncidentSection(Incident incident) {
    final config = IncidentTypes.getById(incident.type);
    final dateFormat = DateFormat('dd/MM/yyyy - HH:mm');

    return Card(
      // color: config.color.withValues(alpha: 0.1),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
        // side: BorderSide(color: config.color, width: 1.5),
      ),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Header với icon và badge
            Row(
              children: [
                Container(
                  padding: const EdgeInsets.all(8),
                  decoration: BoxDecoration(
                    // color: config.color.withValues(alpha: 0.2),
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Icon(
                    _getIncidentIcon(incident.type),
                    // color: config.color,
                    size: 24,
                  ),
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Text(
                            config.displayName,
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                              // color: config.color,
                            ),
                          ),
                          const SizedBox(width: 8),
                          Container(
                            padding: const EdgeInsets.symmetric(
                              horizontal: 8,
                              vertical: 2,
                            ),
                            decoration: BoxDecoration(
                              color: _getSeverityColor(incident.severity),
                              borderRadius: BorderRadius.circular(12),
                            ),
                            child: Text(
                              _getSeverityLabel(incident.severity),
                              style: const TextStyle(
                                fontSize: 10,
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 4),
                      Text(
                        'Sự cố gần vị trí này',
                        style: TextStyle(fontSize: 12, color: Colors.grey[600]),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            const SizedBox(height: 12),
            const Divider(height: 1),
            const SizedBox(height: 12),
            // Mô tả
            Text(
              incident.description,
              style: const TextStyle(fontSize: 14),
              maxLines: 3,
              overflow: TextOverflow.ellipsis,
            ),
            const SizedBox(height: 12),
            // Thông tin thời gian và người báo cáo
            Row(
              children: [
                Icon(Icons.access_time, size: 14, color: Colors.grey[600]),
                const SizedBox(width: 4),
                Text(
                  dateFormat.format(incident.reportedTime),
                  style: TextStyle(fontSize: 12, color: Colors.grey[600]),
                ),
              ],
            ),
            if (incident.reportedBy != null) ...[
              const SizedBox(height: 4),
              Row(
                children: [
                  Icon(Icons.person, size: 14, color: Colors.grey[600]),
                  const SizedBox(width: 4),
                  Text(
                    incident.reportedBy!,
                    style: TextStyle(fontSize: 12, color: Colors.grey[600]),
                  ),
                ],
              ),
            ],
          ],
        ),
      ),
    );
  }

  IconData _getIncidentIcon(String type) {
    switch (type) {
      case 'traffic':
        return Icons.traffic;
      case 'accident':
        return Icons.car_crash;
      case 'construction':
        return Icons.construction;
      case 'road_closed':
        return Icons.block;
      case 'hazard':
        return Icons.warning;
      case 'police':
        return Icons.local_police;
      default:
        return Icons.report_problem;
    }
  }

  Color _getSeverityColor(String severity) {
    switch (severity.toLowerCase()) {
      case 'high':
      case 'cao':
        return Colors.red;
      case 'medium':
      case 'trung bình':
        return Colors.orange;
      case 'low':
      case 'thấp':
        return Colors.green;
      default:
        return Colors.grey;
    }
  }

  String _getSeverityLabel(String severity) {
    switch (severity.toLowerCase()) {
      case 'high':
        return 'Cao';
      case 'medium':
        return 'Trung bình';
      case 'low':
        return 'Thấp';
      default:
        return severity;
    }
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
                Text('Vĩ độ: ${lat.toStringAsFixed(6)}'),
              ],
            ),
            const SizedBox(height: 4),
            Row(
              children: [
                const Icon(Icons.my_location, size: 16, color: Colors.grey),
                const SizedBox(width: 8),
                Text('Kinh độ: ${lng.toStringAsFixed(6)}'),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildAddressSection(AsyncValue<AddressResult?> state) {
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
            width: 100,
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

  Widget _buildSatelliteImageSection(AsyncValue<LocationImagery?> state) {
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
                    'Lỗi tải hình ảnh',
                    style: const TextStyle(color: Colors.red),
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
              initial: () => const NearbyPlacesShimmer(),
              loading: () => const NearbyPlacesShimmer(),
              loaded: (places, _, selected) {
                if (places.isEmpty) {
                  return const Padding(
                    padding: EdgeInsets.symmetric(vertical: 16),
                    child: Center(
                      child: Text(
                        'Không tìm thấy địa điểm nào gần đây',
                        style: TextStyle(color: Colors.grey),
                      ),
                    ),
                  );
                }
                return NearbyPlaceList(
                  places: places,
                  onPlaceTap: (place) {
                    /// TODO: Xử lý khi chọn 1 địa điểm gần đó: Di chuyển Map tới vị trí này
                  },
                  onDirectionTap: (place) {
                    // TODO: Chỉ đường tới địa điểm gần đó: Vẽ đường đi từ vị trí hiện tại đến đây
                  },
                );
              },
              error: (failure) =>
                  Center(child: Text("Lỗi: ${failure.technicalMessage}")),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildReportButton(BuildContext context, WidgetRef ref) {
    return SizedBox(
      width: double.infinity,
      child: ElevatedButton.icon(
        onPressed: () {
          ref.read(mapBottomSheetProvider.notifier).hide();
          showModalBottomSheet(
            context: context,
            isScrollControlled: true,
            backgroundColor: Colors.transparent,
            builder: (context) => AddIncidentBottomSheet(lat: lat, lng: lng),
          );
        },
        icon: const Icon(Icons.report),
        label: const Text('Báo cáo sự cố'),
        style: ElevatedButton.styleFrom(
          padding: const EdgeInsets.symmetric(vertical: 14),
          backgroundColor: Colors.red.shade600,
          foregroundColor: Colors.white,
        ),
      ),
    );
  }

  /// Thu nhỏ DraggableScrollableSheet về minChildSize
  void _minimizeSheet() {
    try {
      if (sheetController.isAttached) {
        sheetController.animateTo(
          0.14, // minChildSize
          duration: const Duration(milliseconds: 100),
          // duration: Duration.zero,
          curve: Curves.easeInOut,
        );
      }
    } catch (e) {
      AppLogger.ui('Error minimizing sheet: $e', error: e);
    }
  }

  /// Mở rộng DraggableScrollableSheet về initialChildSize khi long press vị trí mới
  void _expandSheet() {
    try {
      if (sheetController.isAttached) {
        sheetController.animateTo(
          0.5, // initialChildSize
          duration: const Duration(milliseconds: 100),
          curve: Curves.easeInOut,
        );
      }
    } catch (e) {
      AppLogger.ui('Error expanding sheet: $e', error: e);
    }
  }
}
