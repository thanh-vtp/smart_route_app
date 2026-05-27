import 'package:arcgis_maps/arcgis_maps.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:smart_route_app/features/incident/domain/entities/incident.dart'
    as domain;
import 'package:smart_route_app/features/incident/presentation/extensions/incident_display_extensions.dart';
import 'package:smart_route_app/features/incident/presentation/providers/map_mode_provider.dart';
import 'package:smart_route_app/core/common/screens/map_page_notifier.dart';
import 'package:smart_route_app/features/incident/presentation/widgets/incident_type_widgets.dart';

class NavigatorIncidentsBottomSheet extends ConsumerStatefulWidget {
  final ArcGISMapViewController mapViewController;
  final ArcGISSceneViewController sceneViewController;

  const NavigatorIncidentsBottomSheet({
    super.key,
    required this.mapViewController,
    required this.sceneViewController,
  });

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _State();
}

class _State extends ConsumerState<NavigatorIncidentsBottomSheet> {
  String _selectedFilter = 'all';

  void _navigateToIncident(domain.Incident incident) async {
    final mapMode = ref.read(mapModeProviderProvider);
    final lat = double.parse(incident.latitude);
    final lon = double.parse(incident.longitude);

    final viewpoint = Viewpoint.withLatLongScale(
      latitude: lat,
      longitude: lon,
      scale: 5000,
    );

    if (mapMode == MapMode.map2D) {
      widget.mapViewController.setViewpoint(viewpoint);
    } else {
      widget.sceneViewController.setViewpoint(viewpoint);
    }

    if (mounted) Navigator.pop(context);
  }

  List<domain.Incident> _filterIncidents(List<domain.Incident> incidents) {
    if (_selectedFilter == 'all') return incidents;
    return incidents.where((i) => i.type == _selectedFilter).toList();
  }

  @override
  Widget build(BuildContext context) {
    final mapState = ref.watch(mapPageNotifierProvider);

    return Positioned(
      bottom: 10,
      left: 10,
      child: FloatingActionButton.small(
        heroTag: 'navigator_incidents_fab',
        backgroundColor: Colors.white,
        foregroundColor: Colors.blue.shade700,
        elevation: 4,
        onPressed: () => _showIncidentsSheet(context, mapState),
        child: const Icon(Icons.list_alt_rounded),
      ),
    );
  }

  void _showIncidentsSheet(BuildContext context, dynamic mapState) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      builder: (context) => StatefulBuilder(
        builder: (context, setModalState) => DraggableScrollableSheet(
          initialChildSize: 0.65,
          minChildSize: 0.4,
          maxChildSize: 0.95,
          builder: (context, scrollController) => Container(
            decoration: const BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.vertical(top: Radius.circular(24)),
            ),
            child: Column(
              children: [
                _buildHeader(),
                _buildFilterChips(setModalState),
                const Divider(height: 1),
                Expanded(
                  child: mapState.when(
                    initial: () => _buildEmptyState('Chưa có dữ liệu'),
                    loading: () =>
                        const Center(child: CircularProgressIndicator()),
                    loaded: (incidents) => _buildIncidentsList(
                      _filterIncidents(incidents),
                      scrollController,
                    ),
                    submitting: (incidents) => _buildIncidentsList(
                      _filterIncidents(incidents),
                      scrollController,
                    ),
                    submitted: (incidents) => _buildIncidentsList(
                      _filterIncidents(incidents),
                      scrollController,
                    ),
                    error: (failure) =>
                        _buildErrorState(failure.technicalMessage),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildHeader() {
    return Container(
      padding: const EdgeInsets.fromLTRB(20, 12, 20, 8),
      child: Column(
        children: [
          // Drag handle
          Container(
            width: 40,
            height: 4,
            decoration: BoxDecoration(
              color: Colors.grey.shade300,
              borderRadius: BorderRadius.circular(2),
            ),
          ),
          const SizedBox(height: 16),
          Row(
            children: [
              Container(
                padding: const EdgeInsets.all(10),
                decoration: BoxDecoration(
                  color: Colors.blue.shade50,
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Icon(
                  Icons.warning_amber_rounded,
                  color: Colors.blue.shade700,
                  size: 24,
                ),
              ),
              const SizedBox(width: 12),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'Danh sách sự cố',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      'Chạm để xem vị trí trên bản đồ',
                      style: TextStyle(
                        fontSize: 12,
                        color: Colors.grey.shade600,
                      ),
                    ),
                  ],
                ),
              ),
              IconButton(
                onPressed: () => Navigator.pop(context),
                icon: const Icon(Icons.close),
                style: IconButton.styleFrom(
                  backgroundColor: Colors.grey.shade100,
                  foregroundColor: Colors.grey.shade700,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildFilterChips(StateSetter setModalState) {
    final filters = [
      ('all', 'Tất cả', Icons.apps),
      ('traffic', 'Kẹt xe', Icons.traffic),
      ('accident', 'Tai nạn', Icons.car_crash),
      ('construction', 'Công trình', Icons.construction),
      ('other', 'Khác', Icons.more_horiz),
    ];

    return Container(
      height: 44,
      margin: const EdgeInsets.symmetric(vertical: 8),
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        padding: const EdgeInsets.symmetric(horizontal: 16),
        itemCount: filters.length,
        separatorBuilder: (_, __) => const SizedBox(width: 8),
        itemBuilder: (context, index) {
          final (id, label, icon) = filters[index];
          final isSelected = _selectedFilter == id;
          return FilterChip(
            selected: isSelected,
            label: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Icon(icon, size: 16),
                const SizedBox(width: 4),
                Text(label),
              ],
            ),
            onSelected: (_) {
              setModalState(() => _selectedFilter = id);
              setState(() {});
            },
            selectedColor: Colors.blue.shade100,
            checkmarkColor: Colors.blue.shade700,
            labelStyle: TextStyle(
              color: isSelected ? Colors.blue.shade700 : Colors.grey.shade700,
              fontWeight: isSelected ? FontWeight.w600 : FontWeight.normal,
            ),
            side: BorderSide(
              color: isSelected ? Colors.blue.shade300 : Colors.grey.shade300,
            ),
            padding: const EdgeInsets.symmetric(horizontal: 8),
          );
        },
      ),
    );
  }

  Widget _buildIncidentsList(
    List<domain.Incident> incidents,
    ScrollController controller,
  ) {
    if (incidents.isEmpty) {
      return _buildEmptyState('Không có sự cố nào');
    }

    final sorted = List<domain.Incident>.from(incidents)
      ..sort((a, b) => b.reportedTime.compareTo(a.reportedTime));

    return ListView.builder(
      controller: controller,
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      itemCount: sorted.length,
      itemBuilder: (context, index) => _IncidentCard(
        incident: sorted[index],
        onTap: () => _navigateToIncident(sorted[index]),
      ),
    );
  }

  Widget _buildEmptyState(String message) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(Icons.inbox_outlined, size: 64, color: Colors.grey.shade300),
          const SizedBox(height: 16),
          Text(
            message,
            style: TextStyle(color: Colors.grey.shade500, fontSize: 16),
          ),
        ],
      ),
    );
  }

  Widget _buildErrorState(String message) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(Icons.error_outline, size: 64, color: Colors.red.shade300),
          const SizedBox(height: 16),
          Text(
            'Đã xảy ra lỗi',
            style: TextStyle(color: Colors.red.shade700, fontSize: 16),
          ),
          const SizedBox(height: 8),
          Text(
            message,
            style: TextStyle(color: Colors.grey.shade500, fontSize: 12),
          ),
        ],
      ),
    );
  }
}

/// Card hiển thị thông tin incident
class _IncidentCard extends StatelessWidget {
  final domain.Incident incident;
  final VoidCallback onTap;

  const _IncidentCard({required this.incident, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.only(bottom: 12),
      elevation: 0,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16),
        side: BorderSide(color: Colors.grey.shade200),
      ),
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(16),
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Icon
              Container(
                padding: const EdgeInsets.all(12),
                decoration: BoxDecoration(
                  // color: incident.backgroundColor,
                  borderRadius: BorderRadius.circular(12),
                ),
                child: IncidentTypeIcon(
                  typeId: incident.type,
                  size: 32,
                  showBackground: false,
                ),
              ),
              const SizedBox(width: 12),
              // Content
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Expanded(
                          child: Text(
                            incident.typeDisplayName,
                            style: const TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 16,
                            ),
                          ),
                        ),
                        _buildSeverityBadge(incident.severity),
                      ],
                    ),
                    const SizedBox(height: 6),
                    Text(
                      incident.description,
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(
                        color: Colors.grey.shade700,
                        fontSize: 14,
                      ),
                    ),
                    const SizedBox(height: 8),
                    Row(
                      children: [
                        Icon(
                          Icons.schedule,
                          size: 14,
                          color: Colors.grey.shade500,
                        ),
                        const SizedBox(width: 4),
                        Text(
                          incident.formatCustomDate(
                            incident.editDate ?? incident.reportedTime,
                          ),
                          style: TextStyle(
                            color: Colors.grey.shade500,
                            fontSize: 12,
                          ),
                        ),
                        const Spacer(),
                        Icon(
                          Icons.navigation_outlined,
                          size: 16,
                          color: Colors.blue.shade400,
                        ),
                        const SizedBox(width: 4),
                        Text(
                          'Xem vị trí',
                          style: TextStyle(
                            color: Colors.blue.shade400,
                            fontSize: 12,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildSeverityBadge(String severity) {
    final (color, label) = switch (severity.toLowerCase()) {
      'high' => (Colors.red, 'Cao'),
      'medium' => (Colors.orange, 'TB'),
      'low' => (Colors.green, 'Thấp'),
      _ => (Colors.grey, severity),
    };

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
      decoration: BoxDecoration(
        color: color.withValues(alpha: 0.1),
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: color.withValues(alpha: 0.3)),
      ),
      child: Text(
        label,
        style: TextStyle(
          color: color,
          fontSize: 11,
          fontWeight: FontWeight.w600,
        ),
      ),
    );
  }
}
