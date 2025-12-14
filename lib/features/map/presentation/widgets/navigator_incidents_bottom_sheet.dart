import 'package:arcgis_maps/arcgis_maps.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:smart_route_app/features/map/domain/entities/incident.dart'
    as domain;
import 'package:smart_route_app/features/map/presentation/helpers/incident_display_helper.dart';
import 'package:smart_route_app/features/map/presentation/providers/map_mode_provider.dart';
import 'package:smart_route_app/features/map/presentation/providers/states/map_page_notifier.dart';

import 'package:smart_route_app/features/map/presentation/widgets/incident_type_widgets.dart';

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
  void _navigateToIncident(domain.Incident incident) async {
    final mapMode = ref.read(mapModeProviderProvider);
    final lat = double.parse(incident.latitude);
    final lon = double.parse(incident.longitude);

    final viewpoint = Viewpoint.withLatLongScale(
      latitude: lat,
      longitude: lon,
      scale: 5000, // Zoom level
    );

    if (mapMode == MapMode.map2D) {
      widget.mapViewController.setViewpoint(viewpoint);
    } else {
      widget.sceneViewController.setViewpoint(viewpoint);
    }

    // Đóng bottom sheet
    if (mounted) {
      Navigator.pop(context);
    }
  }

  @override
  Widget build(BuildContext context) {
    final mapState = ref.watch(mapPageNotifierProvider);

    return Positioned(
      bottom: 10,
      left: 10,
      child: FloatingActionButton(
        heroTag: 'navigator_incidents_fab',
        onPressed: () {
          showModalBottomSheet(
            context: context,
            isScrollControlled: true,
            backgroundColor: Colors.transparent,
            builder: (context) {
              return DraggableScrollableSheet(
                initialChildSize: 0.6,
                minChildSize: 0.3,
                maxChildSize: 0.9,
                builder: (context, scrollController) {
                  return Container(
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.vertical(
                        top: Radius.circular(20),
                      ),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black12,
                          blurRadius: 10,
                          spreadRadius: 2,
                        ),
                      ],
                    ),
                    child: Column(
                      children: [
                        // Drag handle
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
                        // Header
                        Padding(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 20,
                            vertical: 10,
                          ),
                          child: Row(
                            children: [
                              Icon(Icons.list, color: Colors.blue),
                              SizedBox(width: 10),
                              Text(
                                'Danh sách sự cố',
                                style: TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ],
                          ),
                        ),
                        Divider(height: 1),
                        // Content
                        Expanded(
                          child: mapState.when(
                            initial: () =>
                                Center(child: Text('Chưa có dữ liệu')),
                            loading: () =>
                                Center(child: CircularProgressIndicator()),
                            loaded: (incidents, failure) => _buildIncidentsList(
                              incidents,
                              scrollController,
                            ),
                            submitting: (incidents) => _buildIncidentsList(
                              incidents,
                              scrollController,
                            ),
                            submitted: (incidents) => _buildIncidentsList(
                              incidents,
                              scrollController,
                            ),
                            error: (failure) {
                              final message = failure.technicalMessage;
                              return Center(
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Icon(
                                      Icons.error_outline,
                                      size: 48,
                                      color: Colors.red,
                                    ),
                                    SizedBox(height: 16),
                                    Text(
                                      'Lỗi: $message',
                                      style: TextStyle(color: Colors.red),
                                    ),
                                  ],
                                ),
                              );
                            },
                          ),
                        ),
                      ],
                    ),
                  );
                },
              );
            },
          );
        },
        child: const Icon(Icons.list),
      ),
    );
  }

  Widget _buildIncidentsList(
    List<domain.Incident> incidents,
    ScrollController scrollController,
  ) {
    if (incidents.isEmpty) {
      return Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(Icons.info_outline, size: 48, color: Colors.grey),
            SizedBox(height: 16),
            Text(
              'Chưa có sự cố nào',
              style: TextStyle(color: Colors.grey, fontSize: 16),
            ),
          ],
        ),
      );
    }

    // Sắp xếp theo thời gian mới nhất
    final sortedIncidents = List<domain.Incident>.from(incidents)
      ..sort((a, b) => b.reportedTime.compareTo(a.reportedTime));

    return ListView.separated(
      controller: scrollController,
      padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      itemCount: sortedIncidents.length,
      separatorBuilder: (context, index) => Divider(height: 1),
      itemBuilder: (context, index) {
        final incident = sortedIncidents[index];

        return ListTile(
          contentPadding: EdgeInsets.symmetric(horizontal: 12, vertical: 8),
          leading: IncidentTypeIcon(incidentType: incident.type, size: 40),
          title: Text(
            IncidentDisplayHelper.getDisplayName(incident),
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
          ),
          subtitle: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 4),
              Text(
                IncidentDisplayHelper.getDescription(incident),
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
                style: TextStyle(fontSize: 14),
              ),
              SizedBox(height: 4),
              Row(
                children: [
                  Icon(Icons.access_time, size: 12, color: Colors.grey),
                  SizedBox(width: 4),
                  Flexible(
                    child: Text(
                      "Thời điểm cập nhật: ${IncidentDisplayHelper.formatDateTime(incident.editDate!)}",
                      style: TextStyle(fontSize: 12, color: Colors.grey),
                    ),
                  ),
                ],
              ),
            ],
          ),
          trailing: SeverityIndicator(severity: incident.severity),
          onTap: () => _navigateToIncident(incident),
        );
      },
    );
  }
}
