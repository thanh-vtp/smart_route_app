import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:smart_route_app/common/theme/theme_provider.dart';
import 'package:smart_route_app/features/auth/presentation/providers/uscases/use_case_providers.dart';
import 'package:smart_route_app/features/profile/presentation/state/profile_notifier.dart';
import 'package:smart_route_app/features/profile/presentation/state/profile_state.dart';

class AccountManagementScreen extends ConsumerWidget {
  const AccountManagementScreen({super.key});

  Future<void> _handleLogout(BuildContext context, WidgetRef ref) async {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (context) => const Center(child: CircularProgressIndicator()),
    );

    final signOutUseCase = ref.read(signOutUsecaseProvider);
    final result = await signOutUseCase();

    if (context.mounted) {
      Navigator.pop(context); // Tắt loading sau khi có kết quả
    }
    result.fold((failure) {
      if (context.mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('Lỗi đăng xuất: ${failure.message}'),
            backgroundColor: Theme.of(context).colorScheme.error,
          ),
        );
      }
    }, (_) {});
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final theme = Theme.of(context);
    final cs = theme.colorScheme;
    final textTheme = theme.textTheme;

    // Lấy thông tin user hiện tại
    final currentUser = ref.watch(getCurrentUserUsecaseProvider).call();

    final profileState = ref.watch(profileProvider);
    final profileNotifier = ref.read(profileProvider.notifier);

    ref.listen(profileProvider, (previous, next) {
      if (next.errorMessage != null &&
          next.errorMessage != previous?.errorMessage) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(next.errorMessage!),
            backgroundColor: cs.error,
          ),
        );
      }

      if (next.successMessage != null &&
          next.successMessage != previous?.successMessage) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(next.successMessage!),
            backgroundColor: cs.primary,
          ),
        );
      }
    });

    return Scaffold(
      backgroundColor: cs.surfaceContainerLow,
      appBar: AppBar(
        backgroundColor: cs.surface,
        surfaceTintColor: Colors.transparent,
        centerTitle: true,
        title: Text(
          'Quản lý tài khoản',
          style: textTheme.titleLarge?.copyWith(fontWeight: FontWeight.bold),
        ),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () => context.pop(),
        ),
        bottom: PreferredSize(
          preferredSize: const Size.fromHeight(1.0),
          child: Container(
            color: cs.outlineVariant.withOpacity(0.5),
            height: 1.0,
          ),
        ),
      ),
      body: profileState.isLoading
          ? const Center(child: CircularProgressIndicator())
          : SingleChildScrollView(
              padding: const EdgeInsets.symmetric(
                horizontal: 16.0,
                vertical: 24.0,
              ),
              child: Column(
                children: [
                  // 1. THẺ HỒ SƠ (Profile Card)
                  _buildProfileCard(context, cs, textTheme, currentUser, ref),
                  const SizedBox(height: 16),

                  // 2. THẺ CÀI ĐẶT ỨNG DỤNG (Preferences Card)
                  _buildPreferencesCard(
                    cs,
                    textTheme,
                    profileState,
                    profileNotifier,
                  ),
                  const SizedBox(height: 32),

                  // 3. KHU VỰC NGUY HIỂM (Danger Zone)
                  _buildDangerZone(context, ref, cs, textTheme),
                ],
              ),
            ),
    );
  }

  // ==========================================
  // WIDGET BUILDERS
  // ==========================================

  Widget _buildProfileCard(
    BuildContext context,
    ColorScheme cs,
    TextTheme textTheme,
    dynamic user,
    WidgetRef ref,
  ) {
    final bool hasAvatar =
        user.avatarUrl != null && user.avatarUrl.toString().isNotEmpty;

    return Container(
      padding: const EdgeInsets.all(24.0),
      decoration: BoxDecoration(
        color: cs.surface,
        borderRadius: BorderRadius.circular(16.0),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            blurRadius: 8,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Column(
        children: [
          // Avatar + Badge Camera
          Stack(
            alignment: Alignment.bottomRight,
            children: [
              Container(
                width: 80,
                height: 80,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: cs.surfaceVariant,
                  border: Border.all(color: cs.surfaceContainerHigh, width: 3),
                  image: hasAvatar
                      ? DecorationImage(
                          image: NetworkImage(user.avatarUrl),
                          fit: BoxFit.cover,
                        )
                      : null,
                ),
                child: hasAvatar
                    ? null
                    : Icon(Icons.person, size: 40, color: cs.onSurfaceVariant),
              ),
              Container(
                width: 32,
                height: 32,
                decoration: BoxDecoration(
                  color: cs.primary,
                  shape: BoxShape.circle,
                  border: Border.all(color: cs.surface, width: 2),
                ),
                child: Icon(Icons.photo_camera, size: 16, color: cs.onPrimary),
              ),
            ],
          ),
          const SizedBox(height: 16),

          // Tên & Email
          Text(
            user.displayName ?? 'Người dùng',
            style: textTheme.titleLarge?.copyWith(
              fontWeight: FontWeight.bold,
              color: cs.onSurface,
            ),
          ),
          const SizedBox(height: 4),
          Text(
            user.email ?? 'Chưa có email',
            style: textTheme.bodyMedium?.copyWith(color: cs.outline),
          ),
          const SizedBox(height: 24),

          // Nút cập nhật thông tin
          SizedBox(
            width: double.infinity,
            height: 48,
            child: OutlinedButton.icon(
              onPressed: () {
                // TODO: Mở bottom sheet sửa Tên hiển thị
                _showEditNameBottomSheet(context, user.displayName ?? '', ref);
              },
              style: OutlinedButton.styleFrom(
                side: BorderSide(color: cs.outline),
              ),
              icon: Icon(Icons.edit, color: cs.primary, size: 20),
              label: Text(
                'Cập nhật thông tin',
                style: textTheme.labelLarge?.copyWith(
                  color: cs.primary,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildPreferencesCard(
    ColorScheme cs,
    TextTheme textTheme,
    ProfileState state,
    ProfileNotifier notifier,
  ) {
    return Container(
      decoration: BoxDecoration(
        color: cs.surface,
        borderRadius: BorderRadius.circular(16.0),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            blurRadius: 8,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Column(
        children: [
          // Item 1: Phương tiện mặc định
          ListTile(
            contentPadding: const EdgeInsets.symmetric(
              horizontal: 16.0,
              vertical: 8.0,
            ),
            leading: Icon(
              Icons.navigation_outlined,
              color: cs.onSurfaceVariant,
            ),
            title: Text(
              'Phương tiện mặc định',
              style: textTheme.titleMedium?.copyWith(
                fontWeight: FontWeight.w500,
              ),
            ),
            trailing: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  '🚗 ${state.vehicleType}',
                  style: textTheme.bodyMedium?.copyWith(
                    color: cs.primary,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(width: 4),
                Icon(Icons.chevron_right, color: cs.outline),
              ],
            ),
            onTap: () {
              // TODO: Mở hộp thoại chọn xe
            },
          ),
          Divider(
            height: 1,
            indent: 56,
            color: cs.outlineVariant.withOpacity(0.5),
          ),

          // Item 2: Thông báo đẩy
          ListTile(
            contentPadding: const EdgeInsets.symmetric(
              horizontal: 16.0,
              vertical: 8.0,
            ),
            leading: Icon(
              Icons.notifications_outlined,
              color: cs.onSurfaceVariant,
            ),
            title: Text(
              'Nhận thông báo sự cố',
              style: textTheme.titleMedium?.copyWith(
                fontWeight: FontWeight.w500,
              ),
            ),
            trailing: Switch(
              value: state.isPushEnabled,
              onChanged: (val) {
                notifier.togglePushNotification(val); // update state
              },
              activeColor: cs.onPrimary,
              activeTrackColor: cs.primary,
            ),
          ),
          Divider(
            height: 1,
            indent: 56,
            color: cs.outlineVariant.withOpacity(0.5),
          ),

          // Item 3: Theme Mode (Giao diện)
          Consumer(
            builder: (context, ref, child) {
              final currentThemeMode = ref.watch(themeProvider);
              final themeNotifier = ref.read(themeProvider.notifier);

              return ListTile(
                contentPadding: const EdgeInsets.symmetric(
                  horizontal: 16.0,
                  vertical: 8.0,
                ),
                leading: Icon(
                  _getThemeIcon(currentThemeMode),
                  color: cs.onSurfaceVariant,
                ),
                title: Text(
                  'Giao diện ứng dụng',
                  style: textTheme.titleMedium?.copyWith(
                    fontWeight: FontWeight.w500,
                  ),
                ),
                trailing: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      _getThemeLabel(currentThemeMode),
                      style: textTheme.bodyMedium?.copyWith(
                        color: cs.primary,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(width: 4),
                    Icon(Icons.chevron_right, color: cs.outline),
                  ],
                ),
                onTap: () {
                  _showThemeSelectionBottomSheet(
                    context,
                    currentThemeMode,
                    themeNotifier,
                  );
                },
              );
            },
          ),
        ],
      ),
    );
  }

  Widget _buildDangerZone(
    BuildContext context,
    WidgetRef ref,
    ColorScheme cs,
    TextTheme textTheme,
  ) {
    return Column(
      children: [
        // Nút Đăng xuất
        SizedBox(
          width: double.infinity,
          height: 48,
          child: FilledButton(
            onPressed: () => _handleLogout(context, ref),
            style: FilledButton.styleFrom(
              backgroundColor:
                  cs.surfaceContainerHigh, // Nền xám nhạt theo thiết kế
              foregroundColor: cs.onSurfaceVariant,
              elevation: 0,
            ),
            child: const Text(
              'ĐĂNG XUẤT',
              style: TextStyle(fontWeight: FontWeight.bold, letterSpacing: 1.2),
            ),
          ),
        ),
        const SizedBox(height: 16),

        // Nút Xóa tài khoản
        TextButton(
          onPressed: () {
            // TODO: Hiện hộp thoại cảnh báo nguy hiểm trước khi xóa
          },
          style: TextButton.styleFrom(foregroundColor: cs.error),
          child: const Text(
            'Xóa tài khoản vĩnh viễn',
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
        ),
      ],
    );
  }

  void _showEditNameBottomSheet(
    BuildContext context,
    String currentName,
    WidgetRef ref,
  ) {
    final TextEditingController nameController = TextEditingController(
      text: currentName,
    );
    final theme = Theme.of(context);
    final cs = theme.colorScheme;

    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      builder: (dialogContext) {
        return Padding(
          padding: EdgeInsets.only(
            bottom: MediaQuery.of(context).viewInsets.bottom,
          ),
          child: Container(
            padding: const EdgeInsets.all(24.0),
            decoration: BoxDecoration(
              color: cs.surfaceContainerLowest,
              borderRadius: const BorderRadius.vertical(
                top: Radius.circular(24.0),
              ),
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
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
                Text(
                  'Cập nhật thông tin',
                  style: theme.textTheme.titleLarge?.copyWith(
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 24),
                Text(
                  'Tên hiển thị',
                  style: theme.textTheme.labelLarge?.copyWith(
                    color: cs.onSurfaceVariant,
                  ),
                ),
                const SizedBox(height: 8),
                TextField(
                  controller: nameController,
                  decoration: InputDecoration(
                    hintText: 'Nhập tên của bạn',
                    filled: true,
                    fillColor: cs.surfaceContainer,
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                      borderSide: BorderSide.none,
                    ),
                  ),
                ),
                const SizedBox(height: 32),

                // Dùng Consumer để lắng nghe trạng thái Loading riêng của nút Lưu
                Consumer(
                  builder: (context, ref, child) {
                    final isUpdating = ref
                        .watch(profileProvider)
                        .isUpdatingProfile;
                    return SizedBox(
                      width: double.infinity,
                      height: 48,
                      child: FilledButton(
                        onPressed: isUpdating
                            ? null
                            : () async {
                                final newName = nameController.text.trim();
                                if (newName.isEmpty) return;

                                // Gọi API
                                await ref
                                    .read(profileProvider.notifier)
                                    .updateName(newName);
                                if (dialogContext.mounted) {
                                  Navigator.pop(dialogContext);
                                }
                              },
                        style: FilledButton.styleFrom(
                          backgroundColor: cs.primary,
                        ),
                        child: isUpdating
                            ? const SizedBox(
                                width: 24,
                                height: 24,
                                child: CircularProgressIndicator(
                                  color: Colors.white,
                                  strokeWidth: 2,
                                ),
                              )
                            : const Text(
                                'LƯU THAY ĐỔI',
                                style: TextStyle(fontWeight: FontWeight.bold),
                              ),
                      ),
                    );
                  },
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  // Helper methods cho theme
  IconData _getThemeIcon(ThemeMode mode) {
    switch (mode) {
      case ThemeMode.light:
        return Icons.light_mode;
      case ThemeMode.dark:
        return Icons.dark_mode;
      case ThemeMode.system:
        return Icons.brightness_auto;
    }
  }

  String _getThemeLabel(ThemeMode mode) {
    switch (mode) {
      case ThemeMode.light:
        return 'Sáng';
      case ThemeMode.dark:
        return 'Tối';
      case ThemeMode.system:
        return 'Hệ thống';
    }
  }

  void _showThemeSelectionBottomSheet(
    BuildContext context,
    ThemeMode currentMode,
    ThemeNotifier notifier,
  ) {
    final theme = Theme.of(context);
    final cs = theme.colorScheme;

    showModalBottomSheet(
      context: context,
      backgroundColor: Colors.transparent,
      builder: (dialogContext) {
        return Container(
          padding: const EdgeInsets.all(24.0),
          decoration: BoxDecoration(
            color: cs.surfaceContainerLowest,
            borderRadius: const BorderRadius.vertical(
              top: Radius.circular(24.0),
            ),
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
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
              Text(
                'Chọn giao diện',
                style: theme.textTheme.titleLarge?.copyWith(
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 24),

              // Option: Light Mode
              _buildThemeOption(
                context: dialogContext,
                cs: cs,
                textTheme: theme.textTheme,
                icon: Icons.light_mode,
                title: 'Giao diện sáng',
                subtitle: 'Luôn sử dụng giao diện sáng',
                isSelected: currentMode == ThemeMode.light,
                onTap: () {
                  notifier.setLightMode();
                  Navigator.pop(dialogContext);
                },
              ),
              const SizedBox(height: 12),

              // Option: Dark Mode
              _buildThemeOption(
                context: dialogContext,
                cs: cs,
                textTheme: theme.textTheme,
                icon: Icons.dark_mode,
                title: 'Giao diện tối',
                subtitle: 'Luôn sử dụng giao diện tối',
                isSelected: currentMode == ThemeMode.dark,
                onTap: () {
                  notifier.setDarkMode();
                  Navigator.pop(dialogContext);
                },
              ),
              const SizedBox(height: 12),

              // Option: System Default
              _buildThemeOption(
                context: dialogContext,
                cs: cs,
                textTheme: theme.textTheme,
                icon: Icons.brightness_auto,
                title: 'Theo hệ thống',
                subtitle: 'Tự động điều chỉnh theo cài đặt thiết bị',
                isSelected: currentMode == ThemeMode.system,
                onTap: () {
                  notifier.setSystemMode();
                  Navigator.pop(dialogContext);
                },
              ),
              const SizedBox(height: 16),
            ],
          ),
        );
      },
    );
  }

  Widget _buildThemeOption({
    required BuildContext context,
    required ColorScheme cs,
    required TextTheme textTheme,
    required IconData icon,
    required String title,
    required String subtitle,
    required bool isSelected,
    required VoidCallback onTap,
  }) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(12),
      child: Container(
        padding: const EdgeInsets.all(16.0),
        decoration: BoxDecoration(
          color: isSelected
              ? cs.primaryContainer.withOpacity(0.3)
              : cs.surfaceContainer,
          borderRadius: BorderRadius.circular(12),
          border: Border.all(
            color: isSelected ? cs.primary : cs.outlineVariant,
            width: isSelected ? 2 : 1,
          ),
        ),
        child: Row(
          children: [
            Container(
              padding: const EdgeInsets.all(8),
              decoration: BoxDecoration(
                color: isSelected ? cs.primary : cs.surfaceVariant,
                borderRadius: BorderRadius.circular(8),
              ),
              child: Icon(
                icon,
                color: isSelected ? cs.onPrimary : cs.onSurfaceVariant,
                size: 24,
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
                      color: isSelected ? cs.primary : cs.onSurface,
                    ),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    subtitle,
                    style: textTheme.bodySmall?.copyWith(
                      color: cs.onSurfaceVariant,
                    ),
                  ),
                ],
              ),
            ),
            if (isSelected)
              Icon(Icons.check_circle, color: cs.primary, size: 24),
          ],
        ),
      ),
    );
  }
}
