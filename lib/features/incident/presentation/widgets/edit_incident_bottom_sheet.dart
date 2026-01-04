import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:smart_route_app/core/ui/widgets/btn_child.dart';
import 'package:smart_route_app/features/auth/presentation/providers/states/auth.dart';
import 'package:smart_route_app/features/incident/domain/entities/incident.dart';
import 'package:smart_route_app/features/incident/presentation/providers/states/map_page_notifier.dart';
import 'package:smart_route_app/features/incident/presentation/widgets/incident_type_widgets.dart';

/// Bottom sheet để chỉnh sửa incident
class EditIncidentBottomSheet extends HookConsumerWidget {
  final Incident incident;

  const EditIncidentBottomSheet({super.key, required this.incident});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final selectedType = useState(incident.type);
    final selectedSeverity = useState(incident.severity);
    final descriptionController = useTextEditingController(
      text: incident.description,
    );
    final isSubmitting = useState(false);

    return Container(
      padding: EdgeInsets.only(
        bottom: MediaQuery.of(context).viewInsets.bottom,
      ),
      decoration: const BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.vertical(top: Radius.circular(24)),
      ),
      child: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(24.0),
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
                    color: Colors.grey.shade300,
                    borderRadius: BorderRadius.circular(2),
                  ),
                ),
              ),
              const SizedBox(height: 20),
              // Header
              Row(
                children: [
                  Container(
                    padding: const EdgeInsets.all(10),
                    decoration: BoxDecoration(
                      color: Colors.blue.shade50,
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Icon(
                      Icons.edit_outlined,
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
                          'Chỉnh sửa sự cố',
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Text(
                          'Cập nhật thông tin sự cố',
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
              const SizedBox(height: 24),

              // Loại sự cố
              IncidentTypeSelector(
                selectedType: selectedType.value,
                onTypeChanged: (type) => selectedType.value = type,
              ),
              const SizedBox(height: 20),

              // Mức độ
              const Text(
                'Mức độ nghiêm trọng',
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
              ),
              const SizedBox(height: 12),
              Row(
                children: [
                  _buildSeverityOption(
                    'low',
                    'Thấp',
                    Icons.check_circle_outline,
                    Colors.green,
                    selectedSeverity,
                  ),
                  const SizedBox(width: 8),
                  _buildSeverityOption(
                    'medium',
                    'Trung bình',
                    Icons.warning_amber_outlined,
                    Colors.orange,
                    selectedSeverity,
                  ),
                  const SizedBox(width: 8),
                  _buildSeverityOption(
                    'high',
                    'Cao',
                    Icons.error_outline,
                    Colors.red,
                    selectedSeverity,
                  ),
                ],
              ),
              const SizedBox(height: 20),

              // Mô tả
              const Text(
                'Mô tả chi tiết',
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
              ),
              const SizedBox(height: 12),
              TextField(
                controller: descriptionController,
                maxLines: 3,
                maxLength: 200,
                decoration: InputDecoration(
                  hintText: 'Mô tả sự cố...',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                  filled: true,
                  fillColor: Colors.grey.shade50,
                ),
              ),
              const SizedBox(height: 24),

              // Buttons
              Row(
                children: [
                  Expanded(
                    child: OutlinedButton(
                      onPressed: () => Navigator.pop(context),
                      style: OutlinedButton.styleFrom(
                        padding: const EdgeInsets.symmetric(vertical: 14),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                      ),
                      child: const Text('Hủy'),
                    ),
                  ),
                  const SizedBox(width: 12),
                  Expanded(
                    flex: 2,
                    child: ElevatedButton(
                      onPressed: isSubmitting.value
                          ? null
                          : () => _handleUpdate(
                              context,
                              ref,
                              isSubmitting,
                              selectedType.value,
                              selectedSeverity.value,
                              descriptionController.text,
                            ),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.blue.shade600,
                        foregroundColor: Colors.white,
                        padding: const EdgeInsets.symmetric(vertical: 14),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                      ),
                      child: BtnChild(
                        loading: isSubmitting.value,
                        child: const Text(
                          'Lưu thay đổi',
                          style: TextStyle(fontWeight: FontWeight.w600),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildSeverityOption(
    String value,
    String label,
    IconData icon,
    Color color,
    ValueNotifier<String> selected,
  ) {
    final isSelected = selected.value == value;
    return Expanded(
      child: InkWell(
        onTap: () => selected.value = value,
        borderRadius: BorderRadius.circular(12),
        child: Container(
          padding: const EdgeInsets.symmetric(vertical: 12),
          decoration: BoxDecoration(
            color: isSelected
                ? color.withValues(alpha: 0.1)
                : Colors.grey.shade50,
            borderRadius: BorderRadius.circular(12),
            border: Border.all(
              color: isSelected ? color : Colors.grey.shade300,
              width: isSelected ? 2 : 1,
            ),
          ),
          child: Column(
            children: [
              Icon(
                icon,
                color: isSelected ? color : Colors.grey.shade600,
                size: 28,
              ),
              const SizedBox(height: 4),
              Text(
                label,
                style: TextStyle(
                  fontSize: 12,
                  fontWeight: isSelected ? FontWeight.w600 : FontWeight.normal,
                  color: isSelected ? color : Colors.grey.shade700,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Future<void> _handleUpdate(
    BuildContext context,
    WidgetRef ref,
    ValueNotifier<bool> isSubmitting,
    String type,
    String severity,
    String description,
  ) async {
    final currentUser = ref.read(authProvider);
    if (currentUser.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Bạn cần đăng nhập'),
          backgroundColor: Colors.red,
        ),
      );
      return;
    }

    isSubmitting.value = true;

    final updatedIncident = incident.copyWith(
      type: type,
      severity: severity,
      description: description.isEmpty ? 'Không có mô tả' : description,
    );

    final success = await ref
        .read(mapPageNotifierProvider.notifier)
        .updateIncident(updatedIncident, currentUser);

    isSubmitting.value = false;

    if (context.mounted) {
      Navigator.pop(context, success); // Return result
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(
            success
                ? 'Đã cập nhật sự cố!'
                : 'Không thể cập nhật. Vui lòng thử lại.',
          ),
          backgroundColor: success ? Colors.green : Colors.red,
          behavior: SnackBarBehavior.floating,
        ),
      );
    }
  }
}
