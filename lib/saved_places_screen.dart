import 'package:flutter/material.dart';

class SavedPlacesScreen extends StatelessWidget {
  const SavedPlacesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final cs = theme.colorScheme;
    final textTheme = theme.textTheme;

    return Scaffold(
      backgroundColor: cs.surface,
      appBar: AppBar(
        title: Text(
          'Địa điểm đã lưu',
          style: textTheme.titleLarge?.copyWith(fontWeight: FontWeight.bold),
        ),
        backgroundColor: cs.surface,
        surfaceTintColor: Colors.transparent,
      ),
      body: ListView(
        padding: const EdgeInsets.all(16.0),
        children: [
          // Primary Locations
          Text(
            'Địa điểm chính',
            style: textTheme.titleMedium?.copyWith(
              fontWeight: FontWeight.bold,
              color: cs.onSurface,
            ),
          ),
          const SizedBox(height: 16),
          _buildSavedItem(
            context,
            icon: Icons.home,
            title: 'Nhà riêng',
            subtitle: '456 Lê Lợi, Quận 1, TP. HCM',
            isFilled: true,
          ),
          const SizedBox(height: 16),
          _buildSavedItem(
            context,
            icon: Icons.work,
            title: 'Cơ quan',
            subtitle: 'Chưa thiết lập - Thêm ngay',
            isFilled: false,
          ),
          const SizedBox(height: 24),

          Divider(color: cs.outlineVariant.withOpacity(0.5)),
          const SizedBox(height: 24),

          // Smart Feature Promotion Card
          Container(
            padding: const EdgeInsets.all(24.0),
            decoration: BoxDecoration(
              color: const Color(0xFF003265), // Dark Blue promotion card
              borderRadius: BorderRadius.circular(24.0),
            ),
            child: Row(
              children: [
                Container(
                  padding: const EdgeInsets.all(12),
                  decoration: BoxDecoration(
                    color: Colors.white.withOpacity(0.1),
                    shape: BoxShape.circle,
                  ),
                  child: const Icon(Icons.route, color: Colors.white, size: 32),
                ),
                const SizedBox(width: 16),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Tối ưu lộ trình',
                        style: textTheme.titleMedium?.copyWith(
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                      const SizedBox(height: 4),
                      Text(
                        'Dự đoán thời điểm khởi hành tốt nhất tới Cơ quan.',
                        style: textTheme.bodyMedium?.copyWith(
                          color: Colors.white.withOpacity(0.8),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 24),

          // Favorites
          Text(
            'Yêu thích',
            style: textTheme.titleMedium?.copyWith(
              fontWeight: FontWeight.bold,
              color: cs.onSurface,
            ),
          ),
          const SizedBox(height: 16),
          _buildFavoriteItem(
            context,
            icon: Icons.restaurant,
            title: 'Nhà hàng chay Bồ Đề',
            subtitle: 'Số 12 Nguyễn Đình Chiểu...',
          ),
          const SizedBox(height: 12),
          _buildFavoriteItem(
            context,
            icon: Icons.local_cafe,
            title: 'Highlands Coffee',
            subtitle: 'KĐT Sala, Quận 2...',
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton.extended(
        backgroundColor: cs.primary,
        foregroundColor: cs.onPrimary,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(9999),
        ),
        onPressed: () {},
        icon: const Icon(Icons.add),
        label: Text(
          'THÊM MỚI',
          style: textTheme.labelLarge?.copyWith(
            fontWeight: FontWeight.bold,
            color: cs.onPrimary,
            letterSpacing: 1.1,
          ),
        ),
      ),
    );
  }

  Widget _buildSavedItem(
    BuildContext context, {
    required IconData icon,
    required String title,
    required String subtitle,
    required bool isFilled,
  }) {
    final cs = Theme.of(context).colorScheme;
    final textTheme = Theme.of(context).textTheme;

    return Container(
      padding: const EdgeInsets.all(16.0),
      decoration: BoxDecoration(
        color: cs.surfaceContainerLowest,
        borderRadius: BorderRadius.circular(16.0),
        border: Border.all(color: cs.outlineVariant.withOpacity(0.3)),
      ),
      child: Row(
        children: [
          Container(
            padding: const EdgeInsets.all(12),
            decoration: BoxDecoration(
              color: isFilled ? cs.primaryContainer : cs.surfaceVariant,
              shape: BoxShape.circle,
            ),
            child: Icon(
              icon,
              color: isFilled ? cs.onPrimaryContainer : cs.onSurfaceVariant,
            ),
          ),
          const SizedBox(width: 16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: textTheme.titleMedium?.copyWith(
                    fontWeight: FontWeight.bold,
                    color: cs.onSurface,
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  subtitle,
                  style: textTheme.bodyMedium?.copyWith(
                    color: isFilled ? cs.onSurfaceVariant : cs.primary,
                    fontWeight: isFilled ? FontWeight.normal : FontWeight.bold,
                  ),
                ),
              ],
            ),
          ),
          Icon(Icons.more_vert, color: cs.onSurfaceVariant),
        ],
      ),
    );
  }

  Widget _buildFavoriteItem(
    BuildContext context, {
    required IconData icon,
    required String title,
    required String subtitle,
  }) {
    final cs = Theme.of(context).colorScheme;
    final textTheme = Theme.of(context).textTheme;

    return Row(
      children: [
        Container(
          padding: const EdgeInsets.all(10),
          decoration: BoxDecoration(
            color: cs.surfaceContainerHigh,
            shape: BoxShape.circle,
          ),
          child: Icon(icon, color: cs.onSurfaceVariant, size: 20),
        ),
        const SizedBox(width: 16),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style: textTheme.titleMedium?.copyWith(
                  fontWeight: FontWeight.w600,
                  color: cs.onSurface,
                ),
              ),
              const SizedBox(height: 4),
              Text(
                subtitle,
                style: textTheme.bodyMedium?.copyWith(
                  color: cs.onSurfaceVariant,
                ),
              ),
            ],
          ),
        ),
        Icon(Icons.more_vert, color: cs.onSurfaceVariant),
      ],
    );
  }
}
