import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:smart_route_app/core/resources/extensions/build_context.dart';
import 'package:smart_route_app/core/utils/app_logger.dart';
import 'package:smart_route_app/features/auth/domain/entities/app_user.dart';
import 'package:smart_route_app/features/auth/presentation/auth_session_provider.dart';
import 'package:smart_route_app/features/incident/domain/entities/incident.dart';
import 'package:smart_route_app/features/incident/presentation/extensions/incident_display_extensions.dart';
import 'package:smart_route_app/features/incident/presentation/providers/location_info_provider.dart';
import 'package:smart_route_app/features/incident/presentation/providers/map_center_providers.dart';
import 'package:smart_route_app/core/common/screens/map_page_notifier.dart';
import 'package:smart_route_app/features/incident/presentation/widgets/edit_incident_bottom_sheet.dart';
import 'package:smart_route_app/features/incident/presentation/widgets/incident_type_widgets.dart';
import 'package:smart_route_app/features/search/presentation/providers/selected_address.dart';

/// DraggableScrollableSheet hiển thị chi tiết incident
class IncidentDetailDraggableSheet extends HookConsumerWidget {
  final Incident incident;

  const IncidentDetailDraggableSheet({super.key, required this.incident});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // Tính maxChildSize để không che status bar
    final statusBarHeight =
        context.padding.top; // hoặc MediaQuery.of(context).padding.top
    final screenHeight = context.height;
    final maxSize = (screenHeight - statusBarHeight) / screenHeight;

    // Controller để control DraggableScrollableSheet programmatically
    final sheetController = useMemoized(() => DraggableScrollableController());

    // Flag để track khi đã sẵn sàng listen map center changes
    final isReadyToListen = useState(false);

    // Dispose controller khi widget unmount
    useEffect(() {
      return sheetController.dispose;
    }, [sheetController]);

    // Setup listener cho map center changes và expand sheet khi tap incident mới
    useEffect(() {
      isReadyToListen.value = false;

      // Expand sheet về initialChildSize khi tap incident mới
      _expandSheet(sheetController);

      // Delay để đợi zoom/recenter animation hoàn tất
      Future.delayed(const Duration(milliseconds: 800), () {
        isReadyToListen.value = true;
      });
      return null;
    }, [incident.id]);

    // Listen mapCenterProvider để thu nhỏ sheet khi map di chuyển
    ref.listen(mapCenterProvider, (previous, next) {
      if (!isReadyToListen.value) return;
      if (previous != null && next != null) {
        _minimizeSheet(sheetController);
      }
    });

    return SafeArea(
      top: true,
      bottom: false,
      child: DraggableScrollableSheet(
        controller: sheetController,
        initialChildSize: 0.45,
        minChildSize: 0.12,
        maxChildSize: maxSize - 0.4, // >= 50% screen height
        builder: (context, scrollController) => _IncidentDetailContent(
          incident: incident,
          scrollController: scrollController,
          sheetController: sheetController,
        ),
      ),
    );
  }

  void _minimizeSheet(DraggableScrollableController controller) {
    try {
      if (controller.isAttached) {
        controller.animateTo(
          0.12,
          duration: const Duration(milliseconds: 100),
          curve: Curves.easeInOut,
        );
      }
    } catch (e) {
      AppLogger.ui('Error minimizing sheet: $e', error: e);
    }
  }

  void _expandSheet(DraggableScrollableController controller) {
    try {
      // Delay nhỏ để đảm bảo controller đã attached
      Future.delayed(const Duration(milliseconds: 50), () {
        if (controller.isAttached) {
          controller.animateTo(
            0.45, // initialChildSize
            duration: const Duration(milliseconds: 200),
            curve: Curves.easeOutCubic,
          );
        }
      });
    } catch (e) {
      AppLogger.ui('Error expanding sheet: $e', error: e);
    }
  }
}

class _IncidentDetailContent extends HookConsumerWidget {
  final Incident incident;
  final ScrollController scrollController;
  final DraggableScrollableController sheetController;

  const _IncidentDetailContent({
    required this.incident,
    required this.scrollController,
    required this.sheetController,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final currentUser =
        ref.watch(authSessionProvider).asData?.value ?? AppUser.empty();
    final isOwner =
        currentUser.isNotEmpty &&
        incident.reportedByUid != null &&
        currentUser.id == incident.reportedByUid;

    return ClipRRect(
      borderRadius: const BorderRadius.vertical(top: Radius.circular(20)),
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: const BorderRadius.vertical(top: Radius.circular(20)),
          boxShadow: const [
            BoxShadow(color: Colors.black12, blurRadius: 10, spreadRadius: 2),
          ],
        ),
        child: CustomScrollView(
          controller: scrollController,
          slivers: [
            // Pinned Header
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
              flexibleSpace: _buildHeader(context, ref, isOwner),
            ),
            // Content
            SliverToBoxAdapter(
              child: Padding(
                padding: const EdgeInsets.fromLTRB(16, 0, 16, 16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Description
                    _buildInfoCard(
                      icon: Icons.description_outlined,
                      title: 'Mô tả',
                      content: incident.description,
                    ),
                    const SizedBox(height: 12),

                    // Time info
                    Row(
                      children: [
                        Expanded(
                          child: _buildInfoCard(
                            icon: Icons.access_time_outlined,
                            title: 'Báo cáo',
                            content: incident.formattedReportedTime,
                            compact: true,
                          ),
                        ),
                        const SizedBox(width: 12),
                        Expanded(
                          child: _buildInfoCard(
                            icon: Icons.update_outlined,
                            title: 'Cập nhật',
                            content: incident.formattedEditTime,
                            compact: true,
                          ),
                        ),
                      ],
                    ),

                    if (incident.reportedBy != null) ...[
                      const SizedBox(height: 12),
                      _buildInfoCard(
                        icon: Icons.person_outline,
                        title: 'Người báo cáo',
                        content: incident.reportedBy!,
                      ),
                    ],

                    // Owner actions
                    if (isOwner) ...[
                      const SizedBox(height: 20),
                      _buildOwnerActions(context, ref),
                    ],

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

  Widget _buildHeader(BuildContext context, WidgetRef ref, bool isOwner) {
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          // colors: [incident.color.withValues(alpha: 0.1), Colors.white],
          colors: [Colors.white],
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
              margin: const EdgeInsets.only(top: 10, bottom: 10),
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
                Container(
                  padding: const EdgeInsets.all(12),
                  decoration: BoxDecoration(
                    // color: incident.backgroundColor,
                    borderRadius: BorderRadius.circular(12),
                    border: Border.all(
                      // color: incident.color.withValues(alpha: 0.3),
                    ),
                  ),
                  child: IncidentTypeIcon(
                    typeId: incident.type,
                    size: 32,
                    showBackground: false,
                  ),
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        incident.typeDisplayName,
                        style: const TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 4),
                      _buildSeverityChip(incident.severity),
                    ],
                  ),
                ),
                IconButton(
                  icon: Icon(Icons.close, size: 20, color: Colors.grey[600]),
                  onPressed: () {
                    ref.read(mapBottomSheetProvider.notifier).hide();
                  },
                  padding: EdgeInsets.zero,
                  constraints: const BoxConstraints(
                    minWidth: 32,
                    minHeight: 32,
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 8),
          const Divider(height: 1),
        ],
      ),
    );
  }

  Widget _buildSeverityChip(String severity) {
    final (color, icon, label) = switch (severity.toLowerCase()) {
      'high' => (Colors.red, Icons.error, 'Nghiêm trọng'),
      'medium' => (Colors.orange, Icons.warning_amber, 'Trung bình'),
      'low' => (Colors.green, Icons.check_circle, 'Nhẹ'),
      _ => (Colors.grey, Icons.help_outline, severity),
    };

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
      decoration: BoxDecoration(
        color: color.withValues(alpha: 0.1),
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: color.withValues(alpha: 0.3)),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(icon, size: 14, color: color),
          const SizedBox(width: 4),
          Text(
            label,
            style: TextStyle(
              color: color,
              fontWeight: FontWeight.w600,
              fontSize: 12,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildInfoCard({
    required IconData icon,
    required String title,
    required String content,
    bool compact = false,
  }) {
    return Container(
      padding: EdgeInsets.all(compact ? 12 : 16),
      decoration: BoxDecoration(
        color: Colors.grey.shade50,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: Colors.grey.shade200),
      ),
      child: Row(
        crossAxisAlignment: compact
            ? CrossAxisAlignment.center
            : CrossAxisAlignment.start,
        children: [
          Icon(icon, size: compact ? 18 : 20, color: Colors.grey.shade600),
          SizedBox(width: compact ? 8 : 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: TextStyle(
                    fontSize: compact ? 11 : 12,
                    color: Colors.grey.shade500,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                SizedBox(height: compact ? 2 : 4),
                Text(
                  content,
                  style: TextStyle(
                    fontSize: compact ? 13 : 14,
                    fontWeight: FontWeight.w500,
                    color: Colors.grey.shade800,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildOwnerActions(BuildContext context, WidgetRef ref) {
    return Row(
      children: [
        Expanded(
          child: OutlinedButton.icon(
            onPressed: () => _showEditSheet(context, ref),
            icon: const Icon(Icons.edit_outlined, size: 20),
            label: const Text('Chỉnh sửa'),
            style: OutlinedButton.styleFrom(
              padding: const EdgeInsets.symmetric(vertical: 14),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),
              side: BorderSide(color: Colors.blue.shade300),
              foregroundColor: Colors.blue.shade700,
            ),
          ),
        ),
        const SizedBox(width: 12),
        Expanded(
          child: OutlinedButton.icon(
            onPressed: () => _showDeleteConfirm(context, ref),
            icon: const Icon(Icons.delete_outline, size: 20),
            label: const Text('Xóa'),
            style: OutlinedButton.styleFrom(
              padding: const EdgeInsets.symmetric(vertical: 14),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),
              side: BorderSide(color: Colors.red.shade300),
              foregroundColor: Colors.red.shade700,
            ),
          ),
        ),
      ],
    );
  }

  void _showEditSheet(BuildContext context, WidgetRef ref) {
    ref.read(mapBottomSheetProvider.notifier).hide();
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      builder: (context) => EditIncidentBottomSheet(incident: incident),
    );
  }

  void _showDeleteConfirm(BuildContext context, WidgetRef ref) {
    showDialog(
      context: context,
      builder: (dialogContext) => AlertDialog(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
        title: const Row(
          children: [
            Icon(Icons.warning_amber_rounded, color: Colors.red),
            SizedBox(width: 12),
            Text('Xác nhận xóa'),
          ],
        ),
        content: const Text(
          'Bạn có chắc muốn xóa sự cố này?\nHành động này không thể hoàn tác.',
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(dialogContext),
            child: const Text('Hủy'),
          ),
          ElevatedButton(
            onPressed: () async {
              Navigator.pop(dialogContext);
              ref.read(mapBottomSheetProvider.notifier).hide();

              final currentUser =
                  ref.read(authSessionProvider).asData?.value ??
                  AppUser.empty();
              final failure = await ref
                  .read(mapPageNotifierProvider.notifier)
                  .deleteIncident(incident.id, currentUser);

              if (context.mounted) {
                if (failure == null) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: Text('Đã xóa sự cố!'),
                      backgroundColor: Colors.green,
                      behavior: SnackBarBehavior.floating,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                    ),
                  );
                } else {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: Text('Không thể xóa. Vui lòng thử lại.'),
                      backgroundColor: Colors.red,
                      behavior: SnackBarBehavior.floating,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                    ),
                  );
                }
              }
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.red,
              foregroundColor: Colors.white,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8),
              ),
            ),
            child: const Text('Xóa'),
          ),
        ],
      ),
    );
  }
}
