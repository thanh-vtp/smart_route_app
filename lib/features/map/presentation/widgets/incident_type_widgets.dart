import 'package:flutter/material.dart';
import 'package:smart_route_app/features/map/presentation/models/incident_type_config.dart';

/// Widget hiển thị icon của incident type
/// Nhận typeId (String) vì widget này dùng cho cả form (chưa có entity) và display
class IncidentTypeIcon extends StatelessWidget {
  final String typeId; // id từ incident.type hoặc config.id
  final double size;
  final bool showBackground;

  const IncidentTypeIcon({
    super.key,
    required this.typeId,
    this.size = 40,
    this.showBackground = true,
  });

  @override
  Widget build(BuildContext context) {
    final config = IncidentTypes.getById(typeId);

    if (showBackground) {
      return Stack(
        children: [
          Container(
            width: size,
            height: size,
            decoration: BoxDecoration(
              color: config.backgroundColor,
              borderRadius: BorderRadius.circular(12),
              border: Border.all(
                color: config.color.withValues(alpha: 0.3),
                width: 1,
              ),
            ),
          ),
          Image.asset(
            config.assetPath,
            width: size,
            height: size,
            fit: BoxFit.cover,
          ),
        ],
      );
    }
    return Image.asset(
      config.assetPath,
      width: size,
      height: size,
      fit: BoxFit.cover,
    );
  }
}

/// Widget hiển thị chip với icon và tên incident type
class IncidentTypeChip extends StatelessWidget {
  final String typeId;
  final bool isSelected;
  final VoidCallback? onTap;

  const IncidentTypeChip({
    super.key,
    required this.typeId,
    this.isSelected = false,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final config = IncidentTypes.getById(typeId);

    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(12),
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
        decoration: BoxDecoration(
          color: isSelected ? config.color : config.backgroundColor,
          borderRadius: BorderRadius.circular(12),
          border: Border.all(color: config.color, width: isSelected ? 2 : 1),
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            IncidentTypeIcon(typeId: typeId, size: 20, showBackground: false),
            const SizedBox(width: 8),
            Text(
              config.displayName,
              style: TextStyle(
                color: isSelected ? Colors.white : config.color,
                fontWeight: isSelected ? FontWeight.bold : FontWeight.w500,
                fontSize: 14,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

/// Widget selector cho incident type (dùng trong bottom sheet)
class IncidentTypeSelector extends StatelessWidget {
  final String selectedType;
  final ValueChanged<String> onTypeChanged;
  final String? customTypeDescription;
  final ValueChanged<String>? onCustomDescriptionChanged;

  const IncidentTypeSelector({
    super.key,
    required this.selectedType,
    required this.onTypeChanged,
    this.customTypeDescription,
    this.onCustomDescriptionChanged,
  });

  @override
  Widget build(BuildContext context) {
    final isOtherSelected =
        selectedType == 'other' ||
        IncidentTypes.getById(selectedType).id == 'other';

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Loại sự cố',
          style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 12),
        SizedBox(
          height: 50,
          child: ListView.separated(
            scrollDirection: Axis.horizontal,
            itemCount: IncidentTypes.all.length,
            physics: const BouncingScrollPhysics(),
            itemBuilder: (_, i) {
              final config = IncidentTypes.all[i];
              final isSelected =
                  selectedType == config.id ||
                  IncidentTypes.getById(selectedType).id == config.id;

              return IncidentTypeChip(
                typeId: config.id,
                isSelected: isSelected,
                onTap: () => onTypeChanged(config.id),
              );
            },
            separatorBuilder: (_, __) => SizedBox(width: 8),
          ),
        ),
        // Wrap(
        //   spacing: 8,
        //   runSpacing: 8,
        //   children: IncidentTypes.all.map((config) {
        //     final isSelected =
        //         selectedType == config.id ||
        //         IncidentTypes.getByDisplayName(selectedType).id == config.id;

        //     return IncidentTypeChip(
        //       incidentType: config.id,
        //       isSelected: isSelected,
        //       onTap: () => onTypeChanged(config.id),
        //     );
        //   }).toList(),
        // ),
        // Hiển thị TextField khi chọn "Khác"
        if (isOtherSelected && onCustomDescriptionChanged != null) ...[
          const SizedBox(height: 16),
          TextField(
            key: const ValueKey('custom_type_description'),
            decoration: InputDecoration(
              labelText: 'Mô tả loại sự cố',
              hintText: 'VD: Cây đổ, Hố sâu, Ngập nước...',
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12),
              ),
              prefixIcon: const Icon(Icons.edit_note),
              filled: true,
              fillColor: Colors.grey.shade50,
            ),
            maxLines: 2,
            maxLength: 100,
            onChanged: onCustomDescriptionChanged,
          ),
          const SizedBox(height: 8),
          Text(
            '💡 Mô tả chi tiết giúp người khác hiểu rõ hơn về sự cố',
            style: TextStyle(
              fontSize: 12,
              color: Colors.grey.shade600,
              fontStyle: FontStyle.italic,
            ),
          ),
        ],
      ],
    );
  }
}

/// Widget hiển thị severity level với màu và icon
class SeverityIndicator extends StatelessWidget {
  final String severity;
  final double size;

  const SeverityIndicator({super.key, required this.severity, this.size = 24});

  Color _getSeverityColor() {
    switch (severity.toLowerCase()) {
      case 'high':
      case 'cao':
        return Colors.red;
      case 'medium':
      case 'trung bình':
        return Colors.orange;
      case 'low':
      case 'thấp':
        return Colors.yellow.shade700;
      default:
        return Colors.grey;
    }
  }

  IconData _getSeverityIcon() {
    switch (severity.toLowerCase()) {
      case 'high':
      case 'cao':
        return Icons.error;
      case 'medium':
      case 'trung bình':
        return Icons.warning;
      case 'low':
      case 'thấp':
        return Icons.info;
      default:
        return Icons.help_outline;
    }
  }

  String _getSeverityText() {
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

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
      decoration: BoxDecoration(
        color: _getSeverityColor().withValues(alpha: 0.1),
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: _getSeverityColor(), width: 1),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(
            _getSeverityIcon(),
            color: _getSeverityColor(),
            size: size * 0.7,
          ),
          const SizedBox(width: 4),
          Text(
            _getSeverityText(),
            style: TextStyle(
              color: _getSeverityColor(),
              fontWeight: FontWeight.w600,
              fontSize: size * 0.5,
            ),
          ),
        ],
      ),
    );
  }
}
