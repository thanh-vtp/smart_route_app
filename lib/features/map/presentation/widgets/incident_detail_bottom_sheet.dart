import 'package:flutter/material.dart';
import 'package:smart_route_app/core/utils/app_logger.dart';
import 'package:smart_route_app/features/map/domain/entities/incident.dart';
import 'package:smart_route_app/features/map/presentation/helpers/incident_display_helper.dart';
import 'package:smart_route_app/features/map/presentation/widgets/incident_type_widgets.dart';

/// Bottom sheet hiển thị chi tiết sự cố khi tap vào incident trên map
class IncidentDetailBottomSheet extends StatelessWidget {
  final Incident incident;

  const IncidentDetailBottomSheet({super.key, required this.incident});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      padding: const EdgeInsets.all(24),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Drag handle
          Center(
            child: Container(
              width: 40,
              height: 4,
              decoration: BoxDecoration(
                color: Colors.grey[300],
                borderRadius: BorderRadius.circular(2),
              ),
            ),
          ),
          const SizedBox(height: 16),

          // Header với icon và loại sự cố
          Row(
            children: [
              IncidentTypeIcon(incidentType: incident.type, size: 56),
              const SizedBox(width: 12),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      incident.type,
                      style: const TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 4),
                    SeverityIndicator(severity: incident.severity),
                  ],
                ),
              ),
            ],
          ),
          const SizedBox(height: 20),

          // Mô tả
          _buildInfoRow(
            icon: Icons.description,
            label: 'Mô tả',
            value: incident.description,
          ),
          const SizedBox(height: 12),

          // Vị trí
          _buildInfoRow(
            icon: Icons.location_on,
            label: 'Vị trí',
            value: '${incident.latitude}, ${incident.longitude}',
          ),
          const SizedBox(height: 12),

          // Thời gian báo cáo
          _buildInfoRow(
            icon: Icons.access_time,
            label: 'Thời gian báo cáo',
            value: IncidentDisplayHelper.formatDateTime(incident.reportedTime),
          ),
          const SizedBox(height: 12),

          _buildInfoRow(
            icon: Icons.edit,
            label: 'Thời gian cập nhật',
            value: IncidentDisplayHelper.formatDateTime(incident.editDate!),
          ),

          // Người báo cáo (nếu có)
          if (incident.reportedBy != null) ...[
            const SizedBox(height: 12),
            _buildInfoRow(
              icon: Icons.person,
              label: 'Người báo cáo',
              value: incident.reportedBy!,
            ),
          ],

          const SizedBox(height: 24),

          // Actions
          Row(
            children: [
              Expanded(
                child: OutlinedButton.icon(
                  onPressed: () {
                    Navigator.pop(context);
                    // TODO: Navigate to incident location
                    AppLogger.ui('Navigate to incident: ${incident.id}');
                  },
                  icon: const Icon(Icons.directions),
                  label: const Text('Chỉ đường'),
                  style: OutlinedButton.styleFrom(
                    padding: const EdgeInsets.symmetric(vertical: 12),
                  ),
                ),
              ),
              const SizedBox(width: 12),
              Expanded(
                child: ElevatedButton.icon(
                  onPressed: () {
                    Navigator.pop(context);
                    // TODO: Share incident
                    AppLogger.ui('Share incident: ${incident.id}');
                  },
                  icon: const Icon(Icons.share),
                  label: const Text('Chia sẻ'),
                  style: ElevatedButton.styleFrom(
                    padding: const EdgeInsets.symmetric(vertical: 12),
                  ),
                ),
              ),
            ],
          ),

          // Safe area for bottom notch
          SizedBox(height: MediaQuery.of(context).padding.bottom),
        ],
      ),
    );
  }

  /// Widget helper để hiển thị thông tin với icon
  Widget _buildInfoRow({
    required IconData icon,
    required String label,
    required String value,
  }) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Icon(icon, size: 20, color: Colors.grey[600]),
        const SizedBox(width: 8),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                label,
                style: TextStyle(
                  fontSize: 12,
                  color: Colors.grey[600],
                  fontWeight: FontWeight.w500,
                ),
              ),
              const SizedBox(height: 2),
              Text(
                value,
                style: const TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
