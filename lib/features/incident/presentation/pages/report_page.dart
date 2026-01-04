import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:smart_route_app/core/utils/app_logger.dart';
import 'package:smart_route_app/features/auth/domain/entities/app_user.dart';
import 'package:smart_route_app/features/auth/presentation/providers/states/auth.dart';
import 'package:smart_route_app/features/incident/domain/entities/incident.dart';
import 'package:smart_route_app/features/incident/presentation/extensions/incident_display_extensions.dart';
import 'package:smart_route_app/features/incident/presentation/providers/map_center_providers.dart';
import 'package:smart_route_app/features/incident/presentation/providers/states/report_page_notifier.dart';
import 'package:smart_route_app/features/incident/presentation/widgets/add_incident_bottom_sheet.dart';
import 'package:smart_route_app/features/incident/presentation/widgets/incident_type_widgets.dart';
import 'package:smart_route_app/features/incident/presentation/widgets/simmer/map_state_overlays.dart';

class ReportMapPage extends ConsumerStatefulWidget {
  const ReportMapPage({super.key, required this.scrollController});
  final ScrollController scrollController;

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _ReportMapPageState();
}

class _ReportMapPageState extends ConsumerState<ReportMapPage> {
  @override
  void initState() {
    super.initState();
    Future.microtask(() {
      final currentUser = ref.read(authProvider);
      ref
          .read(reportPageNotifierProvider.notifier)
          .fetchIncidents(currentUser: currentUser);
    });
  }

  @override
  Widget build(BuildContext context) {
    final user = ref.watch(authProvider);
    final reportState = ref.watch(reportPageNotifierProvider);

    return reportState.when(
      initial: () => const SizedBox.shrink(),
      loading: () => const MapLoadingOverlay(),
      loaded: (incidents) => _buildContent(context, user, incidents),
      submitting: (incidents) => Stack(
        children: [
          _buildContent(context, user, incidents),
          const MapSubmittingOverlay(),
        ],
      ),
      submitted: (incidents) => _buildContent(context, user, incidents),
      error: (failure, incidents) => Stack(
        children: [
          if (incidents != null) _buildContent(context, user, incidents),
          MapErrorOverlay(
            message: failure.technicalMessage!,
            onRetry: () => ref
                .read(reportPageNotifierProvider.notifier)
                .fetchIncidents(currentUser: user),
          ),
        ],
      ),
    );
  }

  Widget _buildContent(
    BuildContext context,
    AppUser user,
    List<Incident> incidents,
  ) {
    return ListView(
      controller: widget.scrollController,
      padding: const EdgeInsets.symmetric(horizontal: 20),
      children: [
        const SizedBox(height: 8),
        _buildHeader(),
        const SizedBox(height: 24),
        _ProfileCard(user: user),
        const SizedBox(height: 20),
        _QuickActionsSection(
          onAddIncident: () => _showAddIncidentSheet(context),
        ),
        const SizedBox(height: 24),
        _StatsCard(incidentCount: incidents.length),
        const SizedBox(height: 24),
        _MyIncidentsSection(incidents: incidents),
        const SizedBox(height: 100),
      ],
    );
  }

  Widget _buildHeader() {
    return Row(
      children: [
        Container(
          padding: const EdgeInsets.all(10),
          decoration: BoxDecoration(
            color: Colors.blue.shade50,
            borderRadius: BorderRadius.circular(12),
          ),
          child: Icon(
            Icons.volunteer_activism,
            color: Colors.blue.shade700,
            size: 24,
          ),
        ),
        const SizedBox(width: 12),
        const Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Đóng góp',
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
              Text(
                'Giúp cộng đồng cập nhật giao thông',
                style: TextStyle(color: Colors.grey, fontSize: 13),
              ),
            ],
          ),
        ),
      ],
    );
  }

  void _showAddIncidentSheet(BuildContext context) {
    final currentCenter = ref.read(mapCenterProvider.notifier).current();
    double targetLat = 12.2388;
    double targetLong = 109.1967;

    if (currentCenter != null) {
      targetLat = currentCenter.y;
      targetLong = currentCenter.x;
      AppLogger.ui("Map Center - report_page: $targetLat, $targetLong");
    }

    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      builder: (context) =>
          AddIncidentBottomSheet(latitude: targetLat, longitude: targetLong),
    );
  }
}

/// Profile Card
class _ProfileCard extends StatelessWidget {
  final AppUser user;
  const _ProfileCard({required this.user});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [Colors.blue.shade600, Colors.blue.shade800],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(
            color: Colors.blue.withValues(alpha: 0.3),
            blurRadius: 12,
            offset: const Offset(0, 6),
          ),
        ],
      ),
      child: Column(
        children: [
          Row(
            children: [
              Container(
                padding: const EdgeInsets.all(3),
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  border: Border.all(color: Colors.white, width: 2),
                ),
                child: CachedNetworkImage(
                  imageUrl: user.avatarUrl ?? '',
                  imageBuilder: (_, imageProvider) =>
                      CircleAvatar(radius: 28, backgroundImage: imageProvider),
                  placeholder: (_, __) => const CircleAvatar(
                    radius: 28,
                    child: CircularProgressIndicator(strokeWidth: 2),
                  ),
                  errorWidget: (_, __, ___) => CircleAvatar(
                    radius: 28,
                    backgroundColor: Colors.white24,
                    child: Icon(Icons.person, color: Colors.white),
                  ),
                ),
              ),
              const SizedBox(width: 16),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      user.displayName ?? 'Người dùng',
                      style: const TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 18,
                      ),
                    ),
                    const SizedBox(height: 4),
                    Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 10,
                        vertical: 4,
                      ),
                      decoration: BoxDecoration(
                        color: Colors.white24,
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: const Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Icon(Icons.star, color: Colors.amber, size: 14),
                          SizedBox(width: 4),
                          Text(
                            'Cấp 2',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 12,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              IconButton(
                onPressed: () {},
                icon: const Icon(
                  Icons.settings_outlined,
                  color: Colors.white70,
                ),
              ),
            ],
          ),
          const SizedBox(height: 20),
          // Progress
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    'Tiến độ lên cấp',
                    style: TextStyle(color: Colors.white70, fontSize: 12),
                  ),
                  Text(
                    '55/100 điểm',
                    style: TextStyle(
                      color: Colors.white.withValues(alpha: 0.9),
                      fontSize: 12,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 8),
              ClipRRect(
                borderRadius: BorderRadius.circular(4),
                child: LinearProgressIndicator(
                  value: 0.55,
                  minHeight: 6,
                  backgroundColor: Colors.white24,
                  valueColor: const AlwaysStoppedAnimation<Color>(Colors.amber),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

/// Quick Actions Section
class _QuickActionsSection extends StatelessWidget {
  final VoidCallback onAddIncident;
  const _QuickActionsSection({required this.onAddIncident});

  @override
  Widget build(BuildContext context) {
    final actions = [
      _QuickAction(
        icon: Icons.add_location_alt,
        label: 'Báo cáo\nsự cố',
        color: Colors.red,
        onTap: onAddIncident,
      ),
      _QuickAction(
        icon: Icons.edit_location_alt,
        label: 'Cập nhật\nđịa điểm',
        color: Colors.orange,
        onTap: () {},
      ),
      _QuickAction(
        icon: Icons.rate_review,
        label: 'Viết\nđánh giá',
        color: Colors.green,
        onTap: () {},
      ),
      _QuickAction(
        icon: Icons.add_a_photo,
        label: 'Thêm\nảnh',
        color: Colors.purple,
        onTap: () {},
      ),
    ];

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Hành động nhanh',
          style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 12),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: actions.map((action) => Expanded(child: action)).toList(),
        ),
      ],
    );
  }
}

class _QuickAction extends StatelessWidget {
  final IconData icon;
  final String label;
  final Color color;
  final VoidCallback onTap;

  const _QuickAction({
    required this.icon,
    required this.label,
    required this.color,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 4),
        padding: const EdgeInsets.symmetric(vertical: 16),
        decoration: BoxDecoration(
          color: color.withValues(alpha: 0.1),
          borderRadius: BorderRadius.circular(16),
          border: Border.all(color: color.withValues(alpha: 0.2)),
        ),
        child: Column(
          children: [
            Container(
              padding: const EdgeInsets.all(10),
              decoration: BoxDecoration(
                color: color.withValues(alpha: 0.15),
                shape: BoxShape.circle,
              ),
              child: Icon(icon, color: color, size: 22),
            ),
            const SizedBox(height: 8),
            Text(
              label,
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 11,
                fontWeight: FontWeight.w500,
                color: Colors.grey.shade700,
                height: 1.3,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

/// Stats Card
class _StatsCard extends StatelessWidget {
  final int incidentCount;
  const _StatsCard({required this.incidentCount});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: Colors.grey.shade200),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.04),
            blurRadius: 10,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Row(
        children: [
          _StatItem(
            value: '$incidentCount',
            label: 'Báo cáo',
            icon: Icons.flag_outlined,
            color: Colors.blue,
          ),
          _divider(),
          _StatItem(
            value: '12',
            label: 'Đánh giá',
            icon: Icons.star_outline,
            color: Colors.amber,
          ),
          _divider(),
          _StatItem(
            value: '5',
            label: 'Ảnh',
            icon: Icons.photo_outlined,
            color: Colors.green,
          ),
        ],
      ),
    );
  }

  Widget _divider() => Container(
    height: 40,
    width: 1,
    color: Colors.grey.shade200,
    margin: const EdgeInsets.symmetric(horizontal: 8),
  );
}

class _StatItem extends StatelessWidget {
  final String value;
  final String label;
  final IconData icon;
  final Color color;

  const _StatItem({
    required this.value,
    required this.label,
    required this.icon,
    required this.color,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Column(
        children: [
          Icon(icon, color: color, size: 24),
          const SizedBox(height: 8),
          Text(
            value,
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
              color: Colors.grey.shade800,
            ),
          ),
          Text(
            label,
            style: TextStyle(fontSize: 12, color: Colors.grey.shade500),
          ),
        ],
      ),
    );
  }
}

/// My Incidents Section
class _MyIncidentsSection extends StatelessWidget {
  final List<Incident> incidents;
  const _MyIncidentsSection({required this.incidents});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Text(
              'Báo cáo của tôi',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            if (incidents.isNotEmpty)
              TextButton(
                onPressed: () {},
                child: Text(
                  'Xem tất cả',
                  style: TextStyle(color: Colors.blue.shade600, fontSize: 13),
                ),
              ),
          ],
        ),
        const SizedBox(height: 12),
        if (incidents.isEmpty)
          _EmptyState()
        else
          ...incidents
              .take(5)
              .map((incident) => _IncidentListItem(incident: incident)),
      ],
    );
  }
}

class _EmptyState extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(32),
      decoration: BoxDecoration(
        color: Colors.grey.shade50,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: Colors.grey.shade200),
      ),
      child: Column(
        children: [
          Icon(Icons.inbox_outlined, size: 48, color: Colors.grey.shade300),
          const SizedBox(height: 12),
          Text(
            'Chưa có báo cáo nào',
            style: TextStyle(color: Colors.grey.shade500, fontSize: 14),
          ),
          const SizedBox(height: 4),
          Text(
            'Hãy bắt đầu đóng góp cho cộng đồng!',
            style: TextStyle(color: Colors.grey.shade400, fontSize: 12),
          ),
        ],
      ),
    );
  }
}

class _IncidentListItem extends StatelessWidget {
  final Incident incident;
  const _IncidentListItem({required this.incident});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 12),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: Colors.grey.shade200),
      ),
      child: Row(
        children: [
          Container(
            padding: const EdgeInsets.all(10),
            decoration: BoxDecoration(
              color: incident.backgroundColor,
              borderRadius: BorderRadius.circular(12),
            ),
            child: IncidentTypeIcon(
              typeId: incident.type,
              size: 28,
              showBackground: false,
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
                      incident.typeDisplayName,
                      style: const TextStyle(
                        fontWeight: FontWeight.w600,
                        fontSize: 14,
                      ),
                    ),
                    const SizedBox(width: 8),
                    _buildSeverityDot(incident.severity),
                  ],
                ),
                const SizedBox(height: 4),
                Text(
                  incident.description,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(color: Colors.grey.shade600, fontSize: 13),
                ),
                const SizedBox(height: 4),
                Text(
                  incident.formatCustomDate(
                    incident.editDate ?? incident.reportedTime,
                  ),
                  style: TextStyle(color: Colors.grey.shade400, fontSize: 11),
                ),
              ],
            ),
          ),
          Icon(Icons.chevron_right, color: Colors.grey.shade400),
        ],
      ),
    );
  }

  Widget _buildSeverityDot(String severity) {
    final color = switch (severity.toLowerCase()) {
      'high' => Colors.red,
      'medium' => Colors.orange,
      'low' => Colors.green,
      _ => Colors.grey,
    };
    return Container(
      width: 8,
      height: 8,
      decoration: BoxDecoration(color: color, shape: BoxShape.circle),
    );
  }
}
