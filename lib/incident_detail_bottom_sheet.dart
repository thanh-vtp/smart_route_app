import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:smart_route_app/edit_incident_bottom_sheet.dart';
import 'package:smart_route_app/features/incident/domain/entities/incident.dart';
import 'package:smart_route_app/features/incident/presentation/providers/states/edit_incident_notifier.dart';
import 'package:smart_route_app/features/incident/presentation/providers/states/incident_detail_notifier.dart';
import 'package:smart_route_app/features/incident/presentation/providers/states/incident_detail_state.dart';

class IncidentDetailBottomSheet extends ConsumerWidget {
  final String incidentId;

  const IncidentDetailBottomSheet({super.key, required this.incidentId});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final theme = Theme.of(context);
    final cs = theme.colorScheme;
    final textTheme = theme.textTheme;

    final state = ref.watch(incidentDetailNotifierProvider(incidentId));

    ref.listen(incidentDetailNotifierProvider(incidentId), (previous, next) {
      if (next.isResolveSuccess) {
        Navigator.pop(context);
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Đã đánh dấu giải quyết sự cố!')),
        );
      }
      if (next.errorMessage != null &&
          next.errorMessage != previous?.errorMessage) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(next.errorMessage!),
            backgroundColor: cs.error,
          ),
        );
      }
    });

    ref.listen(editIncidentNotifierProvider, (previous, next) {
      if (next.isDeleteSuccess) {
        Navigator.pop(context); // Đóng BottomSheet Chi tiết khi xóa xong
        ScaffoldMessenger.of(
          context,
        ).showSnackBar(const SnackBar(content: Text('Đã xóa báo cáo sự cố!')));
      }
      if (next.errorMessage != null &&
          next.errorMessage != previous?.errorMessage &&
          next.isDeleting == false) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(next.errorMessage!),
            backgroundColor: cs.error,
          ),
        );
      }
    });

    return Container(
      decoration: BoxDecoration(
        color: cs.surfaceContainerLowest,
        borderRadius: const BorderRadius.vertical(top: Radius.circular(24.0)),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.2),
            blurRadius: 24,
            offset: const Offset(0, -4),
          ),
        ],
      ),
      child: SafeArea(
        top: false,
        child: Padding(
          padding: const EdgeInsets.fromLTRB(24, 16, 24, 40),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              // Drag Handle
              Center(
                child: Container(
                  width: 40,
                  height: 4,
                  margin: const EdgeInsets.only(bottom: 24),
                  decoration: BoxDecoration(
                    color: cs.outlineVariant,
                    borderRadius: BorderRadius.circular(2),
                  ),
                ),
              ),

              if (state.isLoading)
                const Padding(
                  padding: EdgeInsets.symmetric(vertical: 40),
                  child: Center(child: CircularProgressIndicator()),
                )
              else if (state.incident == null)
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 40),
                  child: Center(
                    child: Text(
                      state.errorMessage ?? 'Không tìm thấy thông tin sự cố.',
                    ),
                  ),
                )
              else ...[
                // banner Báo cáo nếu status = fake
                if (state.incident!.status == 'fake')
                  _buildFakeBanner(textTheme),

                // Header Section
                _buildHeader(cs, textTheme, context, state.incident!),

                const SizedBox(height: 16),

                // Reporter Info
                _buildReporterInfo(cs, textTheme, state),

                const SizedBox(height: 24),

                // Expiration Time
                _buildExpirationTime(textTheme, cs, state.incident!),

                const SizedBox(height: 24),

                // Description
                _buildDescription(textTheme, cs, state.incident!),

                const SizedBox(height: 24),
                Divider(height: 1, color: cs.outlineVariant),
                const SizedBox(height: 24),

                // Actions
                if (state.isOwner)
                  _buildOwnerActions(
                    context,
                    cs,
                    textTheme,
                    ref,
                    state.isResolving,
                    state.incident!,
                  )
                else
                  _buildCommunityActions(context, cs, textTheme, state, ref),
              ],
            ],
          ),
        ),
      ),
    );
  }

  Container _buildFakeBanner(TextTheme textTheme) {
    return Container(
      margin: const EdgeInsets.only(bottom: 16),
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: Colors.orange.withOpacity(0.15),
        border: Border.all(color: Colors.orange),
        borderRadius: BorderRadius.circular(8),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Icon(Icons.warning_rounded, color: Colors.orange),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Báo cáo không đáng tin cậy',
                  style: textTheme.titleSmall?.copyWith(
                    color: Colors.orange[800],
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  'Cộng đồng đã đánh giá sự cố này không có thật hoặc thông tin bị sai lệch.',
                  style: textTheme.bodySmall?.copyWith(
                    color: Colors.orange[900],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Column _buildDescription(
    TextTheme textTheme,
    ColorScheme cs,
    Incident incident,
  ) {
    final bool hasDescription =
        incident.description != null && incident.description!.trim().isNotEmpty;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Mô tả chi tiết',
          style: textTheme.titleMedium?.copyWith(
            fontWeight: FontWeight.bold,
            color: cs.onSurface,
          ),
        ),
        const SizedBox(height: 8),
        Text(
          hasDescription
              ? incident.description!
              : 'Không có mô tả chi tiết cho sự cố này.',
          style: textTheme.bodyLarge?.copyWith(
            color: hasDescription ? cs.onSurfaceVariant : cs.outline,
            fontStyle: hasDescription ? FontStyle.normal : FontStyle.italic,
            height: 1.5,
          ),
        ),
      ],
    );
  }

  Column _buildExpirationTime(
    TextTheme textTheme,
    ColorScheme cs,
    Incident incident,
  ) {
    final bool hasExpiration = incident.expiresAt != null;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Text(
              'Thời gian dự kiến kết thúc',
              style: textTheme.titleMedium?.copyWith(
                fontWeight: FontWeight.bold,
                color: cs.onSurface,
              ),
            ),
            const SizedBox(width: 4),
            Tooltip(
              triggerMode: TooltipTriggerMode.tap,
              showDuration: const Duration(seconds: 4),
              padding: const EdgeInsets.all(12),
              margin: const EdgeInsets.symmetric(horizontal: 16),
              decoration: BoxDecoration(
                color: cs.inverseSurface,
                borderRadius: BorderRadius.circular(8),
              ),
              textStyle: textTheme.bodySmall?.copyWith(
                color: cs.onInverseSurface,
              ),
              message:
                  'Thời gian dự kiến sự cố sẽ được khắc phục (như sửa đường xong, hết kẹt xe).',
              child: Icon(Icons.info_outline, size: 18, color: cs.outline),
            ),
          ],
        ),
        const SizedBox(height: 8),
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
          decoration: BoxDecoration(
            color: cs.surfaceContainerLow,
            borderRadius: BorderRadius.circular(8),
            border: Border.all(color: cs.outlineVariant.withOpacity(0.3)),
          ),
          child: Row(
            children: [
              Icon(
                hasExpiration ? Icons.update : Icons.history_toggle_off,
                color: hasExpiration ? cs.primary : cs.onSurfaceVariant,
                size: 20,
              ),
              const SizedBox(width: 12),
              Expanded(
                child: Text(
                  hasExpiration
                      ? _formatDateTimeExact(incident.expiresAt!)
                      : 'Không xác định',
                  style: textTheme.bodyLarge?.copyWith(
                    color: hasExpiration ? cs.primary : cs.onSurfaceVariant,
                    fontWeight: hasExpiration
                        ? FontWeight.bold
                        : FontWeight.normal,
                    fontStyle: hasExpiration
                        ? FontStyle.normal
                        : FontStyle.italic,
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  Container _buildReporterInfo(
    ColorScheme cs,
    TextTheme textTheme,
    IncidentDetailState state,
  ) {
    final bool hasAvatar =
        state.reporterAvatarUrl != null && state.reporterAvatarUrl!.isNotEmpty;

    final String displayName = state.isOwner
        ? 'Báo cáo bởi Bạn'
        : 'Báo cáo bởi ${state.reporterName ?? 'Cộng đồng'}';

    final String formattedScore = state.reporterReputationScore
        .toString()
        .replaceAllMapped(
          RegExp(r'(\d{1,3})(?=(\d{3})+(?!\d))'),
          (Match m) => '${m[1]},',
        );

    return Container(
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: cs.surfaceContainer,
        borderRadius: BorderRadius.circular(8),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Flexible(
            child: Row(
              children: [
                Container(
                  width: 32,
                  height: 32,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    border: Border.all(color: cs.outlineVariant),
                    color: cs.surfaceVariant,
                    image: hasAvatar
                        ? DecorationImage(
                            image: NetworkImage(state.reporterAvatarUrl!),
                            fit: BoxFit.cover,
                          )
                        : null,
                  ),
                  child: hasAvatar
                      ? null
                      : Icon(
                          Icons.person,
                          size: 20,
                          color: cs.onSurfaceVariant,
                        ),
                ),
                const SizedBox(width: 12),
                Flexible(
                  child: Text(
                    displayName,
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    style: textTheme.labelLarge?.copyWith(color: cs.onSurface),
                  ),
                ),
              ],
            ),
          ),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
            decoration: BoxDecoration(
              color: cs.tertiaryContainer.withOpacity(0.2),
              border: Border.all(color: cs.tertiary.withOpacity(0.1)),
              borderRadius: BorderRadius.circular(9999),
            ),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                const Text('⭐', style: TextStyle(fontSize: 14)),
                const SizedBox(width: 4),
                Text(
                  '$formattedScore uy tín',
                  style: textTheme.labelLarge?.copyWith(
                    color: cs.tertiary,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Row _buildHeader(
    ColorScheme cs,
    TextTheme textTheme,
    BuildContext context,
    Incident incident,
  ) {
    // Helper lấy màu và icon theo loại và mức độ
    final Color iconBgColor = _getSeverityColor(incident.severity, cs);
    final Color iconColor = _getSeverityOnColor(incident.severity, cs);
    final IconData icon = _getTypeIcon(incident.type);
    final String title = _getTypeName(incident.type);
    final String timeAgoText = incident.createdAt != null
        ? 'Báo cáo ${_getTimeAgo(incident.createdAt!)}'
        : 'Thời gian báo cáo không xác định';

    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          width: 48,
          height: 48,
          decoration: BoxDecoration(
            // color: cs.errorContainer,
            color: iconBgColor,
            shape: BoxShape.circle,
          ),
          child: Icon(icon, color: iconColor, size: 24),
        ),
        const SizedBox(width: 16),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style: textTheme.titleLarge?.copyWith(
                  fontWeight: FontWeight.bold,
                  color: cs.onSurface,
                  height: 1.2,
                ),
              ),
              const SizedBox(height: 4),
              Text(
                timeAgoText,
                style: textTheme.bodyMedium?.copyWith(color: cs.outline),
              ),
            ],
          ),
        ),
        IconButton(
          onPressed: () => Navigator.pop(context),
          icon: Icon(Icons.close, color: cs.onSurfaceVariant),
          style: IconButton.styleFrom(
            backgroundColor: Colors.transparent,
            hoverColor: cs.surfaceContainer,
          ),
        ),
      ],
    );
  }

  Widget _buildCommunityActions(
    BuildContext context,
    ColorScheme cs,
    TextTheme textTheme,
    IncidentDetailState state,
    WidgetRef ref,
  ) {
    final incident = state.incident!;
    final isUpvoted = state.currentVote == UserVoteType.upvote;
    final isDownvoted = state.currentVote == UserVoteType.downvote;

    // Kiểm tra trạng thái sự cố
    final bool isResolved = incident.status == 'resolved';

    final bool isActionDisabled = state.isVoting || isResolved;

    return Row(
      children: [
        Expanded(
          child: isUpvoted
              // Nút đổi thành màu Xanh nổi bật
              ? FilledButton.icon(
                  onPressed: (isActionDisabled)
                      ? null
                      : () {
                          // TODO: Upvote (đánh giá sự cố vẫn còn tồn tại)
                          ref
                              .read(
                                incidentDetailNotifierProvider(
                                  incident.id,
                                ).notifier,
                              )
                              .submitVote(UserVoteType.upvote);
                        },
                  style: FilledButton.styleFrom(
                    backgroundColor: cs.primary,
                    foregroundColor: cs.onPrimary,
                    padding: const EdgeInsets.symmetric(vertical: 16),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(9999),
                    ),
                  ),
                  icon: state.isVoting
                      ? const SizedBox(
                          width: 18,
                          height: 18,
                          child: CircularProgressIndicator(
                            strokeWidth: 2,
                            color: Colors.white,
                          ),
                        )
                      : const Text('👍', style: TextStyle(fontSize: 18)),
                  label: Text(
                    'Vẫn còn (${incident.upvotes})',
                    style: textTheme.labelLarge?.copyWith(color: cs.onPrimary),
                  ),
                )
              :
                // Nút viền bình thường
                OutlinedButton.icon(
                  onPressed: isActionDisabled
                      ? null
                      : () {
                          ref
                              .read(
                                incidentDetailNotifierProvider(
                                  incident.id,
                                ).notifier,
                              )
                              .submitVote(UserVoteType.upvote);
                        },
                  style: OutlinedButton.styleFrom(
                    side: BorderSide(
                      color: isActionDisabled
                          ? cs.outlineVariant.withOpacity(0.5)
                          : cs.outlineVariant,
                    ),
                    foregroundColor: cs.onSurfaceVariant,
                    padding: const EdgeInsets.symmetric(vertical: 16),
                  ),
                  icon: state.isVoting
                      ? const SizedBox(
                          width: 18,
                          height: 18,
                          child: CircularProgressIndicator(strokeWidth: 2),
                        )
                      : const Text('👍', style: TextStyle(fontSize: 18)),
                  label: Text(
                    'Vẫn còn (${incident.upvotes})',
                    style: textTheme.labelLarge?.copyWith(
                      color: isActionDisabled
                          ? cs.outline
                          : cs.onSurfaceVariant,
                    ),
                  ),
                ),
        ),

        const SizedBox(width: 16),

        Expanded(
          child: isDownvoted
              ?
                //  Nút đổi thành màu Đỏ nổi bật
                FilledButton.icon(
                  onPressed: isActionDisabled
                      ? null
                      : () => ref
                            .read(
                              incidentDetailNotifierProvider(
                                incident.id,
                              ).notifier,
                            )
                            .submitVote(UserVoteType.downvote),
                  style: FilledButton.styleFrom(
                    backgroundColor: cs.errorContainer,
                    foregroundColor: cs.onErrorContainer,
                    padding: const EdgeInsets.symmetric(vertical: 16),
                  ),
                  icon: state.isVoting
                      ? const SizedBox(
                          width: 18,
                          height: 18,
                          child: CircularProgressIndicator(strokeWidth: 2),
                        )
                      : const Text('👎', style: TextStyle(fontSize: 18)),
                  label: Text(
                    'Đã hết (${incident.downvotes})',
                    style: textTheme.labelLarge?.copyWith(
                      color: cs.onErrorContainer,
                    ),
                  ),
                )
              :
                // Nút viền bình thường
                OutlinedButton.icon(
                  onPressed: (isActionDisabled)
                      ? null
                      : () {
                          // TODO: Downvote (đánh giá sự cố đã được giải quyết)
                          ref
                              .read(
                                incidentDetailNotifierProvider(
                                  incident.id,
                                ).notifier,
                              )
                              .submitVote(UserVoteType.downvote);
                        },
                  style: OutlinedButton.styleFrom(
                    side: BorderSide(
                      color: isActionDisabled
                          ? cs.outlineVariant.withOpacity(0.5)
                          : cs.outlineVariant,
                    ),
                    foregroundColor: cs.onSurfaceVariant,
                    padding: const EdgeInsets.symmetric(vertical: 16),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(9999),
                    ),
                  ),
                  icon: state.isVoting
                      ? const SizedBox(
                          width: 18,
                          height: 18,
                          child: CircularProgressIndicator(strokeWidth: 2),
                        )
                      : const Text('👎', style: TextStyle(fontSize: 18)),
                  label: Text(
                    'Đã hết (${incident.downvotes})',
                    style: textTheme.labelLarge?.copyWith(
                      color: isActionDisabled
                          ? cs.outline
                          : cs.onSurfaceVariant,
                    ),
                  ),
                ),
        ),
      ],
    );
  }

  Widget _buildOwnerActions(
    BuildContext context,
    ColorScheme cs,
    TextTheme textTheme,
    WidgetRef ref,
    bool isResolving,
    Incident incident,
  ) {
    // Kiểm tra xem sự cố đã được giải quyết chưa
    final bool isResolved = incident.status == 'resolved';
    final bool isFake = incident.status == 'fake';

    // Nếu status = fake, chỉ hiển thị nút Xóa, không cho phép Edit hay Resolve nữa
    if (isFake) {
      // Tận dụng State của EditNotifier để lấy trạng thái Loading khi xóa
      final editState = ref.watch(editIncidentNotifierProvider);

      return SizedBox(
        width: double.infinity,
        height: 48,
        child: OutlinedButton.icon(
          onPressed: editState.isDeleting
              ? null
              : () {
                  _showDeleteConfirmation(
                    context,
                    cs,
                    textTheme,
                    ref,
                    incident,
                  );
                },
          style: OutlinedButton.styleFrom(
            side: BorderSide(
              color: editState.isDeleting ? cs.outlineVariant : cs.error,
            ),
            foregroundColor: cs.error,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(100),
            ),
          ),
          icon: editState.isDeleting
              ? SizedBox(
                  height: 20,
                  width: 20,
                  child: CircularProgressIndicator(
                    color: cs.error,
                    strokeWidth: 2,
                  ),
                )
              : const Icon(Icons.delete_rounded, size: 20),
          label: const Text(
            'XÓA BÁO CÁO NÀY',
            style: TextStyle(fontWeight: FontWeight.bold, letterSpacing: 1.1),
          ),
        ),
      );
    }

    final bool isActionDisabled = isResolving || isResolved;

    return Row(
      children: [
        Expanded(
          child: OutlinedButton.icon(
            onPressed: (isActionDisabled)
                ? null
                : () {
                    // TODO: Edit
                    _showIncidentEdit(context, incident);
                  },
            style: OutlinedButton.styleFrom(
              side: BorderSide(
                color: isResolved
                    ? cs.outlineVariant.withOpacity(0.5)
                    : cs.primary,
              ),
              foregroundColor: cs.primary,
              padding: const EdgeInsets.symmetric(vertical: 16),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(9999),
              ),
            ),
            icon: Icon(
              Icons.edit,
              size: 20,
              color: isActionDisabled ? cs.outline : cs.primary,
            ),
            label: Text(
              'Chỉnh sửa',
              style: textTheme.labelLarge?.copyWith(
                color: isActionDisabled ? cs.outline : cs.primary,
              ),
            ),
          ),
        ),
        const SizedBox(width: 16),
        Expanded(
          child: FilledButton.icon(
            onPressed: (isActionDisabled)
                ? null
                : () {
                    ref
                        .read(
                          incidentDetailNotifierProvider(incidentId).notifier,
                        )
                        .resolveIncident();
                  },
            style: FilledButton.styleFrom(
              backgroundColor: isResolved
                  ? cs.secondaryContainer
                  : cs.surfaceContainer,
              disabledBackgroundColor: isResolved
                  ? cs.secondaryContainer
                  : cs.surfaceContainer.withOpacity(0.5),
              foregroundColor: cs.secondary,
              padding: const EdgeInsets.symmetric(vertical: 16),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(9999),
              ),
            ),
            icon: isResolving
                ? SizedBox(
                    height: 20,
                    width: 20,
                    child: CircularProgressIndicator(
                      color: cs.secondary,
                      strokeWidth: 2,
                    ),
                  )
                : Icon(
                    isResolved ? Icons.verified : Icons.check_circle,
                    size: 20,
                    color: isResolved ? cs.onSecondaryContainer : cs.secondary,
                  ),
            label: Text(
              isResolved ? 'Đã khắc phục' : 'Đã giải quyết',
              style: textTheme.labelLarge?.copyWith(
                color: isResolved ? cs.onSecondaryContainer : cs.secondary,
                fontWeight: isResolved ? FontWeight.bold : FontWeight.normal,
              ),
            ),
          ),
        ),
      ],
    );
  }

  Future<dynamic> _showDeleteConfirmation(
    BuildContext context,
    ColorScheme cs,
    TextTheme textTheme,
    WidgetRef ref,
    Incident incident,
  ) {
    return showDialog(
      context: context,
      builder: (BuildContext dialogContext) {
        return AlertDialog(
          backgroundColor: cs.surface,
          surfaceTintColor: Colors.transparent,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(24),
          ),
          title: Row(
            children: [
              Icon(Icons.warning_amber_rounded, color: cs.error, size: 28),
              const SizedBox(width: 12),
              Text(
                'Xóa báo cáo?',
                style: textTheme.titleLarge?.copyWith(
                  color: cs.onSurface,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
          content: Text(
            'Báo cáo này sẽ bị xóa vĩnh viễn khỏi hệ thống và bản đồ. Bạn có chắc chắn muốn tiếp tục?',
            style: textTheme.bodyMedium?.copyWith(
              color: cs.onSurfaceVariant,
              height: 1.5,
            ),
          ),
          actionsPadding: const EdgeInsets.only(
            bottom: 16,
            right: 16,
            left: 16,
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(dialogContext),
              style: TextButton.styleFrom(foregroundColor: cs.onSurfaceVariant),
              child: const Text(
                'HỦY',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
            ),
            FilledButton(
              onPressed: () {
                Navigator.pop(dialogContext); // Đóng dialog
                // Gọi API xóa từ Edit Notifier
                ref
                    .read(editIncidentNotifierProvider.notifier)
                    .deleteIncident(incident.id);
              },
              style: FilledButton.styleFrom(
                backgroundColor: cs.error,
                foregroundColor: cs.onError,
              ),
              child: const Text(
                'XÓA NGAY',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
            ),
          ],
        );
      },
    );
  }

  Future<dynamic> _showIncidentEdit(BuildContext context, Incident incident) {
    return showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      builder: (context) => EditIncidentBottomSheet(incident: incident),
    );
  }
}

Color _getSeverityColor(String severity, ColorScheme cs) {
  switch (severity) {
    case 'high':
      return cs.errorContainer;
    case 'medium':
      return cs.tertiaryContainer;
    case 'low':
    default:
      return cs.primaryContainer;
  }
}

Color _getSeverityOnColor(String severity, ColorScheme cs) {
  switch (severity) {
    case 'high':
      return cs.onErrorContainer;
    case 'medium':
      return cs.onTertiaryContainer;
    case 'low':
    default:
      return cs.onPrimaryContainer;
  }
}

IconData _getTypeIcon(String type) {
  switch (type) {
    case 'crash':
      return Icons.car_crash;
    case 'traffic':
      return Icons.traffic;
    case 'police':
      return Icons.local_police;
    case 'hazard':
      return Icons.warning_amber_rounded;
    case 'camera':
      return Icons.camera_alt;
    case 'closure':
      return Icons.remove_road;
    default:
      return Icons.info;
  }
}

String _getTypeName(String type) {
  switch (type) {
    case 'crash':
      return 'Tai nạn giao thông';
    case 'traffic':
      return 'Kẹt xe / Ùn tắc';
    case 'police':
      return 'Chốt CSGT';
    case 'hazard':
      return 'Chướng ngại vật / Nguy hiểm';
    case 'camera':
      return 'Camera giao thông';
    case 'closure':
      return 'Đường đang phong tỏa';
    default:
      return 'Sự cố khác';
  }
}

String _getTimeAgo(DateTime date) {
  final diff = DateTime.now().difference(date);
  if (diff.inDays > 0) return '${diff.inDays} ngày trước';
  if (diff.inHours > 0) return '${diff.inHours} giờ trước';
  if (diff.inMinutes > 0) return '${diff.inMinutes} phút trước';
  return 'Vừa xong';
}

String _formatDateTimeExact(DateTime date) {
  final String hour = date.hour.toString().padLeft(2, '0');
  final String minute = date.minute.toString().padLeft(2, '0');
  final String day = date.day.toString().padLeft(2, '0');
  final String month = date.month.toString().padLeft(2, '0');
  return '$hour:$minute - $day/$month/${date.year}';
}
