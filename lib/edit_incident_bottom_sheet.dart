import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:smart_route_app/features/incident/domain/entities/incident.dart';
import 'package:smart_route_app/features/incident/presentation/providers/states/edit_incident_notifier.dart';
import 'package:smart_route_app/features/incident/presentation/providers/states/edit_incident_state.dart';
import 'package:smart_route_app/features/incident/presentation/providers/states/incident_detail_notifier.dart';

// Enum quản lý trạng thái mức độ sự cố
enum IncidentSeverity { low, medium, high }

class EditIncidentBottomSheet extends ConsumerStatefulWidget {
  final Incident incident;
  const EditIncidentBottomSheet({super.key, required this.incident});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _EditIncidentBottomSheetState();
}

class _EditIncidentBottomSheetState
    extends ConsumerState<EditIncidentBottomSheet> {
  late IncidentSeverity _selectedSeverity;
  late TextEditingController _descController;
  DateTime? _selectedExpiresAt;

  @override
  void initState() {
    super.initState();
    _selectedSeverity = _mapStringToSeverity(widget.incident.severity);
    _descController = TextEditingController(
      text: widget.incident.description ?? '',
    );
    _selectedExpiresAt = widget.incident.expiresAt;

    _descController.addListener(() {
      setState(() {});
    });
  }

  @override
  void dispose() {
    _descController.dispose();
    super.dispose();
  }

  // Helper map String -> Enum
  IncidentSeverity _mapStringToSeverity(String sev) {
    if (sev == 'high') return IncidentSeverity.high;
    if (sev == 'medium') return IncidentSeverity.medium;
    return IncidentSeverity.low;
  }

  // Helper map Enum -> Index để truyền cho Notifier
  int _getSeverityIndex(IncidentSeverity sev) {
    if (sev == IncidentSeverity.high) return 2;
    if (sev == IncidentSeverity.medium) return 1;
    return 0;
  }

  bool get _hasChanges {
    final originalSeverity = _mapStringToSeverity(widget.incident.severity);
    final originalDesc = widget.incident.description ?? '';
    final currentDesc = _descController.text.trim();

    return _selectedSeverity != originalSeverity ||
        currentDesc != originalDesc ||
        _selectedExpiresAt != widget.incident.expiresAt;
  }

  Future<void> _selectDateTime(BuildContext context) async {
    final DateTime? pickedDate = await showDatePicker(
      context: context,
      initialDate: _selectedExpiresAt ?? DateTime.now(),
      firstDate: DateTime.now().subtract(
        const Duration(days: 1),
      ), // Cho phép ngày hiện tại
      lastDate: DateTime.now().add(const Duration(days: 30)),
    );

    if (pickedDate != null) {
      if (!context.mounted) return;
      final TimeOfDay? pickedTime = await showTimePicker(
        context: context,
        initialTime: TimeOfDay.fromDateTime(
          _selectedExpiresAt ?? DateTime.now().add(const Duration(hours: 1)),
        ),
      );

      if (pickedTime != null) {
        setState(() {
          _selectedExpiresAt = DateTime(
            pickedDate.year,
            pickedDate.month,
            pickedDate.day,
            pickedTime.hour,
            pickedTime.minute,
          );
        });
      }
    }
  }

  String _formatDateTime(DateTime date) {
    final String hour = date.hour.toString().padLeft(2, '0');
    final String minute = date.minute.toString().padLeft(2, '0');
    final String day = date.day.toString().padLeft(2, '0');
    final String month = date.month.toString().padLeft(2, '0');
    return '$hour:$minute - $day/$month/${date.year}';
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final cs = theme.colorScheme;
    final textTheme = theme.textTheme;

    final editState = ref.watch(editIncidentNotifierProvider);

    // Xử lý sự kiện Thành công / Thất bại
    ref.listen(editIncidentNotifierProvider, (previous, next) {
      if (next.isSuccess) {
        // Đóng màn hình Chỉnh sửa
        Navigator.pop(context);
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Đã cập nhật sự cố thành công!')),
        );

        // Refresh lại dữ liệu ở màn hình Chi tiết bên dưới
        ref
            .read(incidentDetailNotifierProvider(widget.incident.id).notifier)
            .fetchIncidentDetail();
      }

      // Nếu xóa thành công
      if (next.isDeleteSuccess) {
        // Đóng cả màn hình Edit và màn hình Detail bên dưới nó để quay về Map
        Navigator.popUntil(context, (route) => route.isFirst);
        ScaffoldMessenger.of(
          context,
        ).showSnackBar(const SnackBar(content: Text('Đã xóa báo cáo sự cố!')));
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

    return Padding(
      // Quan trọng: Đẩy Bottom Sheet lên khi bàn phím ảo xuất hiện
      padding: EdgeInsets.only(
        bottom: MediaQuery.of(context).viewInsets.bottom,
      ),
      child: Container(
        padding: const EdgeInsets.fromLTRB(24, 16, 24, 32),
        decoration: BoxDecoration(
          color: cs.surface, // Tương đương bg-surface-container-lowest
          borderRadius: const BorderRadius.vertical(top: Radius.circular(24.0)),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.15),
              blurRadius: 20,
              offset: const Offset(0, -5),
            ),
          ],
        ),
        child: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.min, // Tự động co giãn theo nội dung
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // 1. Drag Handle (Thanh ngang xám ở trên cùng)
              Center(
                child: Container(
                  width: 32,
                  height: 4,
                  margin: const EdgeInsets.only(bottom: 24),
                  decoration: BoxDecoration(
                    color: cs.outlineVariant,
                    borderRadius: BorderRadius.circular(2),
                  ),
                ),
              ),

              // 2. Header (Title + Close Button)
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Chỉnh sửa sự cố',
                    style: textTheme.titleLarge?.copyWith(
                      fontWeight: FontWeight.bold,
                      color: cs.onSurface,
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
              ),
              const SizedBox(height: 24),

              // 3. Severity Selection (Mức độ)
              Text(
                'Mức độ',
                style: textTheme.labelLarge?.copyWith(
                  color: cs.onSurfaceVariant,
                ),
              ),
              const SizedBox(height: 8),
              Row(
                children: [
                  _buildSeverityChip(
                    label: 'Nhẹ',
                    value: IncidentSeverity.low,
                    cs: cs,
                    textTheme: textTheme,
                  ),
                  const SizedBox(width: 8),
                  _buildSeverityChip(
                    label: 'Trung bình',
                    value: IncidentSeverity.medium,
                    cs: cs,
                    textTheme: textTheme,
                  ),
                  const SizedBox(width: 8),
                  _buildSeverityChip(
                    label: 'Nghiêm trọng',
                    value: IncidentSeverity.high,
                    cs: cs,
                    textTheme: textTheme,
                  ),
                ],
              ),
              const SizedBox(height: 24),

              // 4. Expiry Date Selection (Thời gian dự kiến kết thúc)
              Row(
                children: [
                  Text(
                    'Thời gian dự kiến kết thúc',
                    style: textTheme.titleMedium?.copyWith(
                      fontWeight: FontWeight.w500,
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
                        'Thời gian dự kiến sự cố sẽ được khắc phục. Nếu không chắc chắn, bạn có thể để trống.',
                    child: Icon(
                      Icons.info_outline,
                      size: 18,
                      color: cs.outline,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 8),
              InkWell(
                onTap: () => _selectDateTime(context),
                borderRadius: BorderRadius.circular(8),
                child: Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 16,
                    vertical: 12,
                  ),
                  decoration: BoxDecoration(
                    color: cs.surfaceContainer,
                    borderRadius: BorderRadius.circular(8),
                    border: Border.all(
                      color: _selectedExpiresAt != null
                          ? cs.primary
                          : cs.outlineVariant,
                    ),
                  ),
                  child: Row(
                    children: [
                      Icon(
                        Icons.access_time,
                        color: _selectedExpiresAt != null
                            ? cs.primary
                            : cs.onSurfaceVariant,
                      ),
                      const SizedBox(width: 12),
                      Expanded(
                        child: Text(
                          _selectedExpiresAt != null
                              ? _formatDateTime(_selectedExpiresAt!)
                              : 'Không xác định',
                          style: textTheme.bodyLarge?.copyWith(
                            color: _selectedExpiresAt != null
                                ? cs.primary
                                : cs.onSurfaceVariant,
                            fontWeight: _selectedExpiresAt != null
                                ? FontWeight.w600
                                : FontWeight.normal,
                          ),
                        ),
                      ),
                      if (_selectedExpiresAt != null)
                        GestureDetector(
                          onTap: () =>
                              setState(() => _selectedExpiresAt = null),
                          child: Icon(
                            Icons.cancel,
                            size: 20,
                            color: cs.outline,
                          ),
                        )
                      else
                        Icon(Icons.chevron_right, color: cs.outline),
                    ],
                  ),
                ),
              ),

              const SizedBox(height: 24),

              // 4. Description Field (Mô tả chi tiết)
              Text(
                'Mô tả chi tiết',
                style: textTheme.labelLarge?.copyWith(
                  color: cs.onSurfaceVariant,
                ),
              ),
              const SizedBox(height: 8),
              TextField(
                controller: _descController,
                maxLines: 4,
                style: textTheme.bodyMedium?.copyWith(color: cs.onSurface),
                decoration: InputDecoration(
                  hintText: 'Nhập mô tả sự cố...',
                  hintStyle: textTheme.bodyMedium?.copyWith(color: cs.outline),
                  filled: true,
                  fillColor: cs.surfaceContainer, // Nền xám nhạt
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8.0),
                    borderSide: BorderSide(
                      color: cs.outlineVariant,
                    ), // Viền xám nhạt
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8.0),
                    borderSide: BorderSide(color: cs.primary, width: 2),
                  ),
                  contentPadding: const EdgeInsets.all(16),
                ),
              ),
              const SizedBox(height: 16),

              // 5. Warning Message (Cảnh báo đỏ)
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Icon(Icons.warning_rounded, color: cs.error, size: 20),
                  const SizedBox(width: 8),
                  Expanded(
                    child: Text(
                      'Lưu ý: Chỉ có thể thay đổi mức độ hoặc mô tả. Nếu sai vị trí, vui lòng xóa sự cố và báo cáo lại.',
                      style: textTheme.labelSmall?.copyWith(
                        color: cs.error,
                        height: 1.4, // Tạo khoảng cách dòng dễ đọc
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 32),

              // 6. Action Button (LƯU THAY ĐỔI)
              _saveReportButton(editState, cs),
              const SizedBox(height: 12),

              // 7. Action Button (XÓA BÁO CÁO)
              _deleteReportButton(editState, context, cs, textTheme),
            ],
          ),
        ),
      ),
    );
  }

  SizedBox _deleteReportButton(
    EditIncidentState editState,
    BuildContext context,
    ColorScheme cs,
    TextTheme textTheme,
  ) {
    return SizedBox(
      width: double.infinity,
      height: 48,
      child: OutlinedButton(
        onPressed: (editState.isUpdating || editState.isDeleting)
            ? null
            : () {
                _showDeleteConfirmationDialog(context, cs, textTheme);
              },
        style: OutlinedButton.styleFrom(
          side: BorderSide(
            color: editState.isDeleting ? cs.outlineVariant : cs.error,
          ), // Viền đỏ
          foregroundColor: cs.error, // Chữ đỏ
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(100),
          ),
        ),
        child: editState.isDeleting
            ? SizedBox(
                height: 20,
                width: 20,
                child: CircularProgressIndicator(
                  color: cs.error,
                  strokeWidth: 2,
                ),
              )
            : const Text(
                'XÓA BÁO CÁO',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  letterSpacing: 1.1,
                ),
              ),
      ),
    );
  }

  Future<dynamic> _showDeleteConfirmationDialog(
    BuildContext context,
    ColorScheme cs,
    TextTheme textTheme,
  ) {
    return showDialog(
      context: context,
      builder: (BuildContext dialogContext) {
        return AlertDialog(
          backgroundColor: cs.surface,
          surfaceTintColor: Colors.transparent, // Chuẩn Material 3
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
              onPressed: () => Navigator.pop(dialogContext), // Đóng dialog
              style: TextButton.styleFrom(foregroundColor: cs.onSurfaceVariant),
              child: const Text(
                'HỦY',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
            ),
            FilledButton(
              onPressed: () {
                Navigator.pop(dialogContext); // 1. Đóng Dialog trước

                // 2. Gọi hàm xóa ở Notifier
                ref
                    .read(editIncidentNotifierProvider.notifier)
                    .deleteIncident(widget.incident.id);
              },
              style: FilledButton.styleFrom(
                backgroundColor: cs.error, // Nút xóa màu đỏ
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

  SizedBox _saveReportButton(EditIncidentState editState, ColorScheme cs) {
    final bool canSave =
        _hasChanges && !editState.isUpdating && !editState.isDeleting;

    return SizedBox(
      width: double.infinity,
      height: 48,
      child: FilledButton(
        onPressed: (!canSave)
            ? null
            : () {
                // TODO: Cập nhật báo cáo
                ref
                    .read(editIncidentNotifierProvider.notifier)
                    .submitUpdate(
                      currentIncident: widget.incident,
                      severityIndex: _getSeverityIndex(_selectedSeverity),
                      description: _descController.text,
                      expiresAt: _selectedExpiresAt,
                    );
              },
        style: FilledButton.styleFrom(
          backgroundColor: cs.primary,
          foregroundColor: cs.onPrimary,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(100), // Pill-shaped
          ),
          elevation: 2,
        ),
        child: editState.isUpdating
            ? const SizedBox(
                height: 20,
                width: 20,
                child: CircularProgressIndicator(
                  color: Colors.white,
                  strokeWidth: 2,
                ),
              )
            : const Text(
                'LƯU THAY ĐỔI',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  letterSpacing: 1.1, // Tracking-wider
                ),
              ),
      ),
    );
  }

  // Helper Widget để render từng Chip Mức độ
  Widget _buildSeverityChip({
    required String label,
    required IncidentSeverity value,
    required ColorScheme cs,
    required TextTheme textTheme,
  }) {
    final isSelected = _selectedSeverity == value;

    return Expanded(
      child: GestureDetector(
        onTap: () {
          setState(() {
            _selectedSeverity = value;
          });
        },
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 200),
          curve: Curves.easeInOut,
          padding: const EdgeInsets.symmetric(vertical: 10),
          decoration: BoxDecoration(
            color: isSelected ? cs.primaryContainer : cs.surfaceContainer,
            borderRadius: BorderRadius.circular(8),
            border: Border.all(
              color: isSelected ? cs.primary : Colors.transparent,
              width: 1,
            ),
          ),
          alignment: Alignment.center,
          child: Text(
            label,
            style: textTheme.labelLarge?.copyWith(
              color: isSelected ? cs.primary : cs.onSurfaceVariant,
              fontWeight: isSelected ? FontWeight.w600 : FontWeight.w500,
            ),
          ),
        ),
      ),
    );
  }
}
