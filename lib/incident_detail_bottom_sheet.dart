import 'package:flutter/material.dart';

class IncidentDetailBottomSheet extends StatelessWidget {
  final bool isOwner;

  const IncidentDetailBottomSheet({
    super.key,
    required this.isOwner,
  });

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

              // Header Section
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    width: 48,
                    height: 48,
                    decoration: BoxDecoration(
                      color: cs.errorContainer,
                      shape: BoxShape.circle,
                    ),
                    child: Icon(Icons.car_crash, color: cs.onErrorContainer, size: 24),
                  ),
                  const SizedBox(width: 16),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Tai nạn nghiêm trọng',
                          style: textTheme.titleLarge?.copyWith(
                            fontWeight: FontWeight.bold,
                            color: cs.onSurface,
                            height: 1.2,
                          ),
                        ),
                        const SizedBox(height: 4),
                        Text(
                          'Cập nhật 10 phút trước',
                          style: textTheme.bodyMedium?.copyWith(
                            color: cs.outline,
                          ),
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
              ),

              const SizedBox(height: 16),

              // Reporter Info
              Container(
                padding: const EdgeInsets.all(12),
                decoration: BoxDecoration(
                  color: cs.surfaceContainer,
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        Container(
                          width: 32,
                          height: 32,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            border: Border.all(color: cs.outlineVariant),
                            color: cs.surfaceVariant,
                          ),
                          child: Icon(Icons.person, size: 20, color: cs.onSurfaceVariant),
                        ),
                        const SizedBox(width: 12),
                        Text(
                          isOwner ? 'Báo cáo bởi Bạn' : 'Báo cáo bởi Nguyễn Văn B',
                          style: textTheme.labelLarge?.copyWith(color: cs.onSurface),
                        ),
                      ],
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
                            '2,450 uy tín',
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
              ),

              const SizedBox(height: 16),

              // Description
              Text(
                'Hai xe tải va chạm, hiện đang chiếm 2 làn đường ngoài cùng. Kẹt xe kéo dài.',
                style: textTheme.bodyLarge?.copyWith(
                  color: cs.onSurfaceVariant,
                  height: 1.5,
                ),
              ),

              const SizedBox(height: 24),
              Divider(height: 1, color: cs.outlineVariant),
              const SizedBox(height: 24),

              // Actions
              if (isOwner)
                _buildOwnerActions(context, cs, textTheme)
              else
                _buildCommunityActions(context, cs, textTheme),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildCommunityActions(BuildContext context, ColorScheme cs, TextTheme textTheme) {
    return Row(
      children: [
        Expanded(
          child: FilledButton.icon(
            onPressed: () {},
            style: FilledButton.styleFrom(
              backgroundColor: cs.primary,
              foregroundColor: cs.onPrimary,
              padding: const EdgeInsets.symmetric(vertical: 16),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(9999),
              ),
            ),
            icon: const Text('👍', style: TextStyle(fontSize: 18)),
            label: Text(
              'Vẫn còn',
              style: textTheme.labelLarge?.copyWith(color: cs.onPrimary),
            ),
          ),
        ),
        const SizedBox(width: 16),
        Expanded(
          child: OutlinedButton.icon(
            onPressed: () {},
            style: OutlinedButton.styleFrom(
              side: BorderSide(color: cs.outlineVariant),
              foregroundColor: cs.onSurfaceVariant,
              padding: const EdgeInsets.symmetric(vertical: 16),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(9999),
              ),
            ),
            icon: const Text('👎', style: TextStyle(fontSize: 18)),
            label: Text(
              'Đã hết',
              style: textTheme.labelLarge?.copyWith(color: cs.onSurfaceVariant),
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildOwnerActions(BuildContext context, ColorScheme cs, TextTheme textTheme) {
    return Row(
      children: [
        Expanded(
          child: OutlinedButton.icon(
            onPressed: () {},
            style: OutlinedButton.styleFrom(
              side: BorderSide(color: cs.primary),
              foregroundColor: cs.primary,
              padding: const EdgeInsets.symmetric(vertical: 16),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(9999),
              ),
            ),
            icon: Icon(Icons.edit, size: 20, color: cs.primary),
            label: Text(
              'Chỉnh sửa',
              style: textTheme.labelLarge?.copyWith(color: cs.primary),
            ),
          ),
        ),
        const SizedBox(width: 16),
        Expanded(
          child: FilledButton.icon(
            onPressed: () {},
            style: FilledButton.styleFrom(
              backgroundColor: cs.surfaceContainer,
              foregroundColor: cs.secondary,
              padding: const EdgeInsets.symmetric(vertical: 16),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(9999),
              ),
            ),
            icon: Icon(Icons.check_circle, size: 20, color: cs.secondary),
            label: Text(
              'Đã giải quyết',
              style: textTheme.labelLarge?.copyWith(color: cs.secondary),
            ),
          ),
        ),
      ],
    );
  }
}
