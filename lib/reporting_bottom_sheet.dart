import 'package:flutter/material.dart';
import 'horizontal_incident_selector.dart';
import 'incident_type_chips.dart';

class ReportingBottomSheet extends StatefulWidget {
  const ReportingBottomSheet({super.key});

  @override
  State<ReportingBottomSheet> createState() => _ReportingBottomSheetState();
}

class _ReportingBottomSheetState extends State<ReportingBottomSheet> {
  int _selectedSeverity = 0; // 0: Nhẹ, 1: Trung bình, 2: Nghiêm trọng

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final cs = theme.colorScheme;
    final textTheme = theme.textTheme;

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
        top: false,
        child: Padding(
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
                        child: Text(
                          'Đang báo cáo tại: Vị trí hiện tại của bạn',
                          style: textTheme.labelLarge?.copyWith(
                            color: cs.primary,
                          ),
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
                onTypeSelected: (type) {},
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
                      borderSide: BorderSide.none,
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
                  onPressed: () {
                    Navigator.pop(context);
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
