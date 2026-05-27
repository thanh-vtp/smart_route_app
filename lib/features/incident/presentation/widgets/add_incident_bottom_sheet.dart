import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:smart_route_app/features/auth/domain/entities/app_user.dart';
import 'package:smart_route_app/features/auth/presentation/auth_session_provider.dart';
import 'package:smart_route_app/shared/widgets/btn_child.dart';
import 'package:smart_route_app/core/utils/app_logger.dart';
import 'package:smart_route_app/features/incident/presentation/models/add_incident_form_data.dart';
import 'package:smart_route_app/features/incident/presentation/providers/states/map_page_notifier.dart';
import 'package:smart_route_app/features/incident/presentation/widgets/incident_type_widgets.dart';
import 'package:smart_route_app/features/incident/presentation/widgets/location_picker_map_widget.dart';

/// Bottom sheet để thêm incident mới
class AddIncidentBottomSheet extends HookConsumerWidget {
  final double latitude;
  final double longitude;

  const AddIncidentBottomSheet({
    super.key,
    required this.latitude,
    required this.longitude,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // Sử dụng AddIncidentFormData để quản lý state
    final formData = useState(
      AddIncidentFormData(latitude: latitude, longitude: longitude),
    );
    final descriptionController = useTextEditingController();
    final isSubmitting = useState(false);

    return Container(
      padding: EdgeInsets.only(
        bottom: MediaQuery.of(context).viewInsets.bottom,
      ),
      decoration: const BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      child: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(24.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Header
              Row(
                children: [
                  Container(
                    padding: const EdgeInsets.all(8),
                    decoration: BoxDecoration(
                      color: Colors.red.shade50,
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Icon(
                      Icons.warning_rounded,
                      color: Colors.red.shade700,
                      size: 28,
                    ),
                  ),
                  const SizedBox(width: 12),
                  const Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Báo cáo sự cố',
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Text(
                          'Giúp cộng đồng cập nhật tình hình giao thông',
                          style: TextStyle(fontSize: 12, color: Colors.grey),
                        ),
                      ],
                    ),
                  ),
                  IconButton(
                    onPressed: () => Navigator.pop(context),
                    icon: const Icon(Icons.close),
                  ),
                ],
              ),

              const SizedBox(height: 24),

              // Location info với khả năng chọn lại vị trí
              InkWell(
                onTap: () async {
                  final result = await Navigator.push<Map<String, double>>(
                    context,
                    MaterialPageRoute(
                      builder: (context) => LocationPickerMapWidget(
                        initialLatitude: formData.value.latitude,
                        initialLongitude: formData.value.longitude,
                      ),
                    ),
                  );

                  if (result != null) {
                    formData.value = formData.value.copyWith(
                      latitude: result['latitude']!,
                      longitude: result['longitude']!,
                    );
                    AppLogger.ui(
                      "User picked: ${formData.value.latitude}, ${formData.value.longitude}",
                    );
                  }
                },
                borderRadius: BorderRadius.circular(12),
                child: Container(
                  padding: const EdgeInsets.all(12),
                  decoration: BoxDecoration(
                    color: Colors.blue.shade50,
                    borderRadius: BorderRadius.circular(12),
                    border: Border.all(color: Colors.blue.shade200, width: 1),
                  ),
                  child: Row(
                    children: [
                      Icon(Icons.location_on, color: Colors.blue.shade700),
                      const SizedBox(width: 8),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text(
                              'Vị trí sự cố',
                              style: TextStyle(
                                fontSize: 12,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                            Text(
                              'Lat: ${formData.value.latitude.toStringAsFixed(6)}, Lng: ${formData.value.longitude.toStringAsFixed(6)}',
                              style: TextStyle(
                                fontSize: 11,
                                color: Colors.grey.shade700,
                              ),
                            ),
                          ],
                        ),
                      ),
                      Icon(
                        Icons.edit_location_alt,
                        color: Colors.blue.shade700,
                        size: 20,
                      ),
                      const SizedBox(width: 4),
                      Icon(Icons.chevron_right, color: Colors.blue.shade700),
                    ],
                  ),
                ),
              ),

              const SizedBox(height: 20),

              // Loại sự cố - Sử dụng widget mới
              IncidentTypeSelector(
                selectedType: formData.value.typeId,
                onTypeChanged: (type) {
                  formData.value = formData.value.copyWith(
                    typeId: type,
                    // Reset custom description khi đổi type
                    customTypeDescription: type != 'other' ? '' : null,
                  );
                },
                customTypeDescription:
                    formData.value.customTypeDescription.isEmpty
                    ? null
                    : formData.value.customTypeDescription,
                onCustomDescriptionChanged: (value) {
                  formData.value = formData.value.copyWith(
                    customTypeDescription: value,
                  );
                },
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
                  Expanded(
                    child: _SeverityOption(
                      label: 'Thấp',
                      icon: Icons.check_circle_outline,
                      color: Colors.green,
                      value: 'low',
                      groupValue: formData.value.severityId,
                      onSelected: (val) => formData.value = formData.value
                          .copyWith(severityId: val),
                    ),
                  ),
                  const SizedBox(width: 8),
                  Expanded(
                    child: _SeverityOption(
                      label: 'Trung bình',
                      icon: Icons.warning_amber_outlined,
                      color: Colors.orange,
                      value: 'medium',
                      groupValue: formData.value.severityId,
                      onSelected: (val) => formData.value = formData.value
                          .copyWith(severityId: val),
                    ),
                  ),
                  const SizedBox(width: 8),
                  Expanded(
                    child: _SeverityOption(
                      label: 'Cao',
                      icon: Icons.error_outline,
                      color: Colors.red,
                      value: 'high',
                      groupValue: formData.value.severityId,
                      onSelected: (val) => formData.value = formData.value
                          .copyWith(severityId: val),
                    ),
                  ),
                ],
              ),

              const SizedBox(height: 20),

              // Mô tả
              const Text(
                'Mô tả chi tiết (tùy chọn)',
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
              ),
              const SizedBox(height: 12),
              TextField(
                controller: descriptionController,
                maxLines: 3,
                maxLength: 200,
                decoration: InputDecoration(
                  hintText: 'VD: Đường bị ngập nước sau mưa...',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                  filled: true,
                  fillColor: Colors.grey.shade50,
                ),
              ),

              const SizedBox(height: 24),

              // Submit button
              SizedBox(
                width: double.infinity,
                height: 52,
                child: ElevatedButton(
                  onPressed: isSubmitting.value
                      ? null
                      : () async {
                          final currentUser =
                              ref.read(authSessionProvider).asData?.value ??
                              AppUser.empty();

                          if (currentUser.isEmpty) {
                            if (context.mounted) {
                              ScaffoldMessenger.of(context).showSnackBar(
                                const SnackBar(
                                  content: Text(
                                    'Bạn cần đăng nhập để báo cáo sự cố',
                                  ),
                                  backgroundColor: Colors.red,
                                ),
                              );
                            }
                            return;
                          }

                          // Cập nhật description từ controller vào formData
                          final finalFormData = formData.value.copyWith(
                            description: descriptionController.text,
                          );

                          // Validate form
                          if (!finalFormData.isValid) {
                            if (context.mounted) {
                              ScaffoldMessenger.of(context).showSnackBar(
                                SnackBar(
                                  content: Text(
                                    finalFormData.validationError ??
                                        'Dữ liệu không hợp lệ',
                                  ),
                                  backgroundColor: Colors.red,
                                ),
                              );
                            }
                            return;
                          }

                          isSubmitting.value = true;

                          // Chuyển formData thành Incident entity
                          final incident = finalFormData.toIncident();

                          AppLogger.ui(
                            'Creating incident - Lat: ${finalFormData.latitude}, Lng: ${finalFormData.longitude}',
                          );

                          final failure = await ref
                              .read(mapPageNotifierProvider.notifier)
                              .addIncident(incident, currentUser);

                          isSubmitting.value = false;

                          if (context.mounted) {
                            if (failure == null) {
                              Navigator.pop(context);
                              ScaffoldMessenger.of(context).showSnackBar(
                                SnackBar(
                                  content: Text('Đã báo cáo sự cố thành công!'),
                                  backgroundColor: Colors.green,
                                  behavior: SnackBarBehavior.floating,
                                ),
                              );
                            } else {
                              ScaffoldMessenger.of(context).showSnackBar(
                                SnackBar(
                                  content: Text(
                                    // failure.technicalMessage ??
                                    'Không thể báo cáo. Vui lòng thử lại.',
                                  ),
                                  backgroundColor: Colors.red,
                                  behavior: SnackBarBehavior.floating,
                                ),
                              );
                            }
                          }
                        },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.red.shade600,
                    foregroundColor: Colors.white,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                    elevation: 0,
                  ),
                  child: BtnChild(
                    loading: isSubmitting.value,
                    child: const Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(Icons.send_rounded),
                        SizedBox(width: 8),
                        Text(
                          'Gửi báo cáo',
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _SeverityOption extends StatelessWidget {
  final String label;
  final IconData icon;
  final Color color;
  final String value;
  final String groupValue;
  final ValueChanged<String> onSelected;

  const _SeverityOption({
    required this.label,
    required this.icon,
    required this.color,
    required this.value,
    required this.groupValue,
    required this.onSelected,
  });

  @override
  Widget build(BuildContext context) {
    final isSelected = value == groupValue;

    return InkWell(
      onTap: () => onSelected(value),
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
    );
  }
}
