import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:smart_route_app/features/incident/presentation/providers/states/report_incident_notifier.dart';
import 'horizontal_incident_selector.dart';
import 'incident_type_chips.dart';

class ReportingBottomSheet extends ConsumerStatefulWidget {
  const ReportingBottomSheet({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _ReportingBottomSheetState();
}

class _ReportingBottomSheetState extends ConsumerState<ReportingBottomSheet> {
  int _selectedSeverity = 0; // 0: Nhẹ, 1: Trung bình, 2: Nghiêm trọng
  String _selectedType = 'crash'; // Mặc định map với Enum
  final TextEditingController _descController = TextEditingController();
  DateTime? _selectedExpiresAt;

  @override
  void dispose() {
    _descController.dispose();
    super.dispose();
  }

  Future<void> _selectDateTime(BuildContext context) async {
    final DateTime? pickedDate = await showDatePicker(
      context: context,
      initialDate: _selectedExpiresAt ?? DateTime.now(),
      firstDate: DateTime.now(), // Không cho chọn ngày quá khứ
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

  // Helper hiển thị chuỗi thời gian đẹp mắt
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

    final state = ref.watch(reportIncidentProvider);

    ref.listen(reportIncidentProvider, (previous, next) {
      if (next.isSuccess) {
        Navigator.pop(context); // Đóng BottomSheet
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text('Báo cáo của bạn đã được ghi nhận. Cảm ơn bạn!'),
          ),
        );
        // Refresh bản đồ (tuỳ setup)
        // ref.read(incidentsProvider.notifier).fetchIncidents();
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

    return Container(
      decoration: BoxDecoration(
        color: cs.surfaceContainerLowest,
        borderRadius: const BorderRadius.vertical(top: Radius.circular(24.0)),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.1),
            blurRadius: 24,
            offset: const Offset(0, -4),
          ),
        ],
      ),
      child: SafeArea(
        bottom: false,
        child: SingleChildScrollView(
          padding: const EdgeInsets.fromLTRB(0, 8, 0, 24),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              // Drag Handle
              Center(
                child: Container(
                  width: 48,
                  height: 4,
                  margin: const EdgeInsets.only(bottom: 16),
                  decoration: BoxDecoration(
                    color: cs.outlineVariant,
                    borderRadius: BorderRadius.circular(2),
                  ),
                ),
              ),

              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 24.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Báo cáo sự cố',
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
                        hoverColor: cs.surfaceVariant,
                      ),
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 16),

              // Location Header
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 24.0),
                child: Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 12,
                    vertical: 8,
                  ),
                  decoration: BoxDecoration(
                    color: cs.surfaceContainerLow,
                    borderRadius: BorderRadius.circular(8),
                    border: Border.all(
                      color: cs.outlineVariant.withOpacity(0.3),
                    ),
                  ),
                  child: Row(
                    children: [
                      Icon(Icons.location_on, color: cs.primary),
                      const SizedBox(width: 8),
                      Expanded(
                        child: state.isLoadingAddress
                            ? Row(
                                children: [
                                  SizedBox(
                                    width: 14,
                                    height: 14,
                                    child: CircularProgressIndicator(
                                      strokeWidth: 2,
                                      color: cs.primary,
                                    ),
                                  ),
                                  const SizedBox(width: 8),
                                  Text(
                                    'Đang xác định vị trí...',
                                    style: textTheme.labelLarge?.copyWith(
                                      color: cs.primary,
                                    ),
                                  ),
                                ],
                              )
                            : Text(
                                'Đang báo cáo tại: ${state.address ?? "Vị trí hiện tại của bạn"}',
                                style: textTheme.labelLarge?.copyWith(
                                  color: cs.primary,
                                ),
                                maxLines: 2,
                                overflow: TextOverflow.ellipsis,
                              ),
                      ),
                    ],
                  ),
                ),
              ),

              const SizedBox(height: 24),

              // Type Selection
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 24.0),
                child: Text(
                  'Loại sự cố',
                  style: textTheme.titleMedium?.copyWith(
                    fontWeight: FontWeight.w500,
                    color: cs.onSurface,
                  ),
                ),
              ),
              const SizedBox(height: 8),
              HorizontalIncidentSelector(
                initialSelection: IncidentType.crash,
                onTypeSelected: (type) {
                  _selectedType = type.name;
                },
              ),

              const SizedBox(height: 24),

              // Severity
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 24.0),
                child: Text(
                  'Mức độ',
                  style: textTheme.titleMedium?.copyWith(
                    fontWeight: FontWeight.w500,
                    color: cs.onSurface,
                  ),
                ),
              ),
              const SizedBox(height: 8),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 24.0),
                child: Row(
                  children: [
                    _buildSeverityChip(context, 0, 'Nhẹ', textTheme, cs),
                    const SizedBox(width: 8),
                    _buildSeverityChip(context, 1, 'Trung bình', textTheme, cs),
                    const SizedBox(width: 8),
                    _buildSeverityChip(
                      context,
                      2,
                      'Nghiêm trọng',
                      textTheme,
                      cs,
                      isError: true,
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 24),

              // Expiration Time
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 24.0),
                child: Row(
                  children: [
                    Text(
                      'Thời gian dự kiến kết thúc',
                      style: textTheme.titleMedium?.copyWith(
                        fontWeight: FontWeight.w500,
                        color: cs.onSurface,
                      ),
                    ),
                    const SizedBox(width: 4),
                    // Tooltip giải thích
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
                          'Thời gian dự kiến sự cố sẽ được khắc phục (như sửa đường xong, hết kẹt xe). Nếu không chắc chắn, bạn có thể để trống.',
                      child: Icon(
                        Icons.info_outline,
                        size: 18,
                        color: cs.outline,
                      ),
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 8),

              // Button set time
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 24.0),
                child: InkWell(
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
                            onTap: () => setState(
                              () => _selectedExpiresAt = null,
                            ), // Nút xóa thời gian
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
              ),

              const SizedBox(height: 24),

              // Description
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 24.0),
                child: Row(
                  children: [
                    Text(
                      'Mô tả chi tiết ',
                      style: textTheme.titleMedium?.copyWith(
                        fontWeight: FontWeight.w500,
                        color: cs.onSurface,
                      ),
                    ),
                    Text(
                      '(Không bắt buộc)',
                      style: textTheme.bodyMedium?.copyWith(
                        color: cs.onSurfaceVariant,
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 8),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 24.0),
                child: TextField(
                  controller: _descController,
                  maxLines: 3,
                  style: textTheme.bodyMedium?.copyWith(color: cs.onSurface),
                  decoration: InputDecoration(
                    hintText: 'Ví dụ: Tai nạn giữa xe tải và xe máy...',
                    hintStyle: textTheme.bodyMedium?.copyWith(
                      color: cs.onSurfaceVariant,
                    ),
                    filled: true,
                    fillColor: cs.surfaceContainer,
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8.0),
                      borderSide: BorderSide(color: cs.outlineVariant),
                    ),
                    contentPadding: const EdgeInsets.all(12),
                  ),
                ),
              ),

              const SizedBox(height: 24),

              // Submit Button
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 24.0),
                child: FilledButton(
                  // Vô hiệu hóa nút nếu đang lấy tọa độ hoặc đang gửi API
                  onPressed: (state.isLoadingAddress || state.isSubmitting)
                      ? null
                      : () {
                          ref
                              .read(reportIncidentProvider.notifier)
                              .submitReport(
                                type: _selectedType,
                                severityIndex: _selectedSeverity,
                                description: _descController.text,
                                expiresAt: _selectedExpiresAt,
                              );
                        },
                  style: FilledButton.styleFrom(
                    backgroundColor: const Color(
                      0xFF00488D,
                    ), // Match the primary brand blue
                    padding: const EdgeInsets.symmetric(vertical: 16),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(9999),
                    ),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'GỬI BÁO CÁO (3s)',
                        style: textTheme.labelLarge?.copyWith(
                          color: cs.onPrimary,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(width: 8),
                      Icon(Icons.send, color: cs.onPrimary, size: 18),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildSeverityChip(
    BuildContext context,
    int index,
    String label,
    TextTheme textTheme,
    ColorScheme cs, {
    bool isError = false,
  }) {
    final isSelected = _selectedSeverity == index;

    Color bgColor;
    Color textColor;
    BorderSide border;

    if (isSelected) {
      if (isError) {
        bgColor = cs.errorContainer;
        textColor = cs.onErrorContainer;
        border = BorderSide(color: cs.error.withOpacity(0.2));
      } else {
        bgColor = cs.primaryFixed;
        textColor = cs.onPrimaryFixedVariant;
        border = const BorderSide(color: Colors.transparent);
      }
    } else {
      bgColor = cs.surfaceContainer;
      textColor = cs.onSurfaceVariant;
      border = const BorderSide(color: Colors.transparent);
    }

    return Expanded(
      child: GestureDetector(
        onTap: () {
          setState(() {
            _selectedSeverity = index;
          });
        },
        child: Container(
          padding: const EdgeInsets.symmetric(vertical: 8),
          decoration: BoxDecoration(
            color: bgColor,
            borderRadius: BorderRadius.circular(9999),
            border: Border.fromBorderSide(border),
          ),
          alignment: Alignment.center,
          child: Text(
            label,
            style: textTheme.labelLarge?.copyWith(color: textColor),
          ),
        ),
      ),
    );
  }
}
