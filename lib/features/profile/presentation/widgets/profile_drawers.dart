import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:smart_route_app/features/auth/presentation/auth_controller_provider.dart';
import 'package:smart_route_app/features/auth/presentation/auth_session_provider.dart';
import 'package:smart_route_app/features/profile/domain/entities/user_profile.dart';
import 'package:smart_route_app/features/profile/presentation/providers/state/profile_providers.dart';

/// Left Drawer - Hiển thị thông tin Profile
class ProfileDrawer extends ConsumerWidget {
  const ProfileDrawer({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final profileAsync = ref.watch(profileNotifierProvider);

    return Drawer(
      child: SafeArea(
        child: Column(
          children: [
            // Header với avatar và thông tin user
            _buildDrawerHeader(context, ref, profileAsync),

            const Divider(height: 1),

            // Body content
            Expanded(
              child: profileAsync.when(
                loading: () => const Center(child: CircularProgressIndicator()),
                error: (error, _) => _buildErrorContent(ref, error),
                data: (profile) => _buildProfileContent(context, ref, profile),
              ),
            ),

            // Footer actions
            _buildFooterActions(context, ref),
          ],
        ),
      ),
    );
  }

  Widget _buildDrawerHeader(
    BuildContext context,
    WidgetRef ref,
    AsyncValue<UserProfile> profileAsync,
  ) {
    final profile = profileAsync.valueOrNull ?? UserProfile.empty;

    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [Colors.blue.shade600, Colors.blue.shade400],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
      ),
      child: Column(
        children: [
          // Avatar
          GestureDetector(
            onTap: () {
              // Mở drawer phải để edit profile
              Scaffold.of(context).openEndDrawer();
            },
            child: Stack(
              children: [
                CachedNetworkImage(
                  imageUrl: profile.avatarUrl ?? '',
                  imageBuilder: (_, imageProvider) =>
                      CircleAvatar(radius: 45, backgroundImage: imageProvider),
                  placeholder: (_, __) => const CircleAvatar(
                    radius: 45,
                    child: CircularProgressIndicator(strokeWidth: 2),
                  ),
                  errorWidget: (_, __, ___) => CircleAvatar(
                    radius: 45,
                    backgroundColor: Colors.white24,
                    child: const Icon(
                      Icons.person,
                      size: 45,
                      color: Colors.white,
                    ),
                  ),
                ),
                Positioned(
                  bottom: 0,
                  right: 0,
                  child: Container(
                    padding: const EdgeInsets.all(4),
                    decoration: const BoxDecoration(
                      color: Colors.white,
                      shape: BoxShape.circle,
                    ),
                    child: Icon(
                      Icons.edit,
                      size: 16,
                      color: Colors.blue.shade600,
                    ),
                  ),
                ),
              ],
            ),
          ),

          const SizedBox(height: 12),

          // Name
          Text(
            profile.displayName ?? '',
            style: const TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),

          const SizedBox(height: 4),

          // Email
          Text(
            profile.email,
            style: TextStyle(
              fontSize: 14,
              color: Colors.white.withOpacity(0.9),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildProfileContent(
    BuildContext context,
    WidgetRef ref,
    UserProfile profile,
  ) {
    return ListView(
      padding: const EdgeInsets.symmetric(vertical: 8),
      children: [
        // Info Section
        const Padding(
          padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
          child: Text(
            'THÔNG TIN',
            style: TextStyle(
              fontSize: 12,
              fontWeight: FontWeight.bold,
              color: Colors.grey,
            ),
          ),
        ),

        _buildListTile(
          icon: Icons.person_outline,
          title: 'Tên hiển thị',
          subtitle: profile.displayName ?? 'Chưa đặt',
        ),

        _buildListTile(
          icon: Icons.email_outlined,
          title: 'Email',
          subtitle: profile.email.isNotEmpty ? profile.email : 'Chưa có email',
        ),

        _buildListTile(
          icon: Icons.calendar_today_outlined,
          title: 'Ngày tham gia',
          subtitle: profile.createdAt != null
              ? '${profile.createdAt!.day}/${profile.createdAt!.month}/${profile.createdAt!.year}'
              : 'Không rõ',
        ),

        const Divider(height: 24),

        // Settings Section
        const Padding(
          padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
          child: Text(
            'CÀI ĐẶT',
            style: TextStyle(
              fontSize: 12,
              fontWeight: FontWeight.bold,
              color: Colors.grey,
            ),
          ),
        ),

        _buildNavigationTile(
          icon: Icons.notifications_outlined,
          title: 'Thông báo',
          onTap: () {
            // TODO: Navigate to notifications
          },
        ),

        _buildNavigationTile(
          icon: Icons.security_outlined,
          title: 'Bảo mật',
          onTap: () {
            // TODO: Navigate to security
          },
        ),

        _buildNavigationTile(
          icon: Icons.help_outline,
          title: 'Trợ giúp',
          onTap: () {
            // TODO: Navigate to help
          },
        ),

        _buildNavigationTile(
          icon: Icons.info_outline,
          title: 'Về ứng dụng',
          onTap: () => _showAboutDialog(context),
        ),
      ],
    );
  }

  Widget _buildListTile({
    required IconData icon,
    required String title,
    required String subtitle,
  }) {
    return ListTile(
      leading: Icon(icon, color: Colors.blue),
      title: Text(
        title,
        style: const TextStyle(fontSize: 12, color: Colors.grey),
      ),
      subtitle: Text(
        subtitle,
        style: const TextStyle(fontSize: 14, fontWeight: FontWeight.w500),
      ),
      dense: true,
    );
  }

  Widget _buildNavigationTile({
    required IconData icon,
    required String title,
    required VoidCallback onTap,
  }) {
    return ListTile(
      leading: Icon(icon),
      title: Text(title),
      trailing: const Icon(Icons.chevron_right, size: 20),
      onTap: onTap,
    );
  }

  Widget _buildErrorContent(WidgetRef ref, Object error) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(24),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(Icons.error_outline, size: 48, color: Colors.red.shade300),
            const SizedBox(height: 12),
            const Text('Không thể tải hồ sơ'),
            const SizedBox(height: 12),
            ElevatedButton(
              onPressed: () =>
                  ref.read(profileNotifierProvider.notifier).refresh(),
              child: const Text('Thử lại'),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildFooterActions(BuildContext context, WidgetRef ref) {
    return Container(
      padding: const EdgeInsets.all(16),
      child: Column(
        children: [
          const Divider(),
          ListTile(
            leading: const Icon(Icons.logout, color: Colors.red),
            title: const Text('Đăng xuất', style: TextStyle(color: Colors.red)),
            onTap: () async {
              Navigator.pop(context); // Close drawer
              await ref.read(authControllerProvider.notifier).signOut();
            },
          ),
        ],
      ),
    );
  }

  void _showAboutDialog(BuildContext context) {
    showAboutDialog(
      context: context,
      applicationName: 'Smart Route',
      applicationVersion: '1.0.0',
      applicationIcon: const Icon(Icons.map, size: 48, color: Colors.blue),
      children: [const Text('Ứng dụng điều hướng thông minh')],
    );
  }
}

/// Right Drawer - Edit Profile
class EditProfileDrawer extends ConsumerStatefulWidget {
  const EditProfileDrawer({super.key});

  @override
  ConsumerState<EditProfileDrawer> createState() => _EditProfileDrawerState();
}

class _EditProfileDrawerState extends ConsumerState<EditProfileDrawer> {
  final _formKey = GlobalKey<FormState>();
  final _nameController = TextEditingController();
  bool _isLoading = false;

  @override
  void initState() {
    super.initState();
    _loadCurrentProfile();
  }

  void _loadCurrentProfile() {
    final profile = ref.read(profileNotifierProvider).valueOrNull;
    _nameController.text = profile?.displayName ?? '';
  }

  @override
  void dispose() {
    _nameController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final profile =
        ref.watch(profileNotifierProvider).valueOrNull ?? UserProfile.empty;

    return Drawer(
      child: SafeArea(
        child: Column(
          children: [
            // Header
            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(20),
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [Colors.green.shade600, Colors.green.shade400],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                ),
              ),
              child: Column(
                children: [
                  const Icon(Icons.edit, size: 48, color: Colors.white),
                  const SizedBox(height: 12),
                  const Text(
                    'Chỉnh sửa hồ sơ',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                ],
              ),
            ),

            // Form
            Expanded(
              child: SingleChildScrollView(
                padding: const EdgeInsets.all(20),
                child: Form(
                  key: _formKey,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // Avatar preview
                      Center(
                        child: Stack(
                          children: [
                            CachedNetworkImage(
                              imageUrl: profile.avatarUrl ?? '',
                              imageBuilder: (_, imageProvider) => CircleAvatar(
                                radius: 50,
                                backgroundImage: imageProvider,
                              ),
                              placeholder: (_, __) => const CircleAvatar(
                                radius: 50,
                                child: CircularProgressIndicator(
                                  strokeWidth: 2,
                                ),
                              ),
                              errorWidget: (_, __, ___) => const CircleAvatar(
                                radius: 50,
                                child: Icon(Icons.person, size: 50),
                              ),
                            ),
                            Positioned(
                              bottom: 0,
                              right: 0,
                              child: Container(
                                padding: const EdgeInsets.all(8),
                                decoration: BoxDecoration(
                                  color: Colors.green.shade600,
                                  shape: BoxShape.circle,
                                ),
                                child: const Icon(
                                  Icons.camera_alt,
                                  size: 20,
                                  color: Colors.white,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),

                      const SizedBox(height: 32),

                      // Name field
                      const Text(
                        'Tên hiển thị',
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      const SizedBox(height: 8),
                      TextFormField(
                        controller: _nameController,
                        decoration: InputDecoration(
                          hintText: 'Nhập tên của bạn',
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(12),
                          ),
                          prefixIcon: const Icon(Icons.person_outline),
                        ),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Vui lòng nhập tên';
                          }
                          return null;
                        },
                      ),

                      const SizedBox(height: 20),

                      // Email (read-only)
                      const Text(
                        'Email',
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      const SizedBox(height: 8),
                      TextFormField(
                        initialValue: profile.email,
                        enabled: false,
                        decoration: InputDecoration(
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(12),
                          ),
                          prefixIcon: const Icon(Icons.email_outlined),
                          filled: true,
                          fillColor: Colors.grey.shade100,
                        ),
                      ),

                      const SizedBox(height: 32),

                      // Save button
                      SizedBox(
                        width: double.infinity,
                        child: ElevatedButton(
                          onPressed: _isLoading ? null : _saveProfile,
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.green.shade600,
                            foregroundColor: Colors.white,
                            padding: const EdgeInsets.symmetric(vertical: 16),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(12),
                            ),
                          ),
                          child: _isLoading
                              ? const SizedBox(
                                  height: 20,
                                  width: 20,
                                  child: CircularProgressIndicator(
                                    strokeWidth: 2,
                                    color: Colors.white,
                                  ),
                                )
                              : const Text(
                                  'Lưu thay đổi',
                                  style: TextStyle(fontSize: 16),
                                ),
                        ),
                      ),

                      const SizedBox(height: 12),

                      // Cancel button
                      SizedBox(
                        width: double.infinity,
                        child: TextButton(
                          onPressed: () => Navigator.pop(context),
                          child: const Text('Hủy'),
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
    );
  }

  Future<void> _saveProfile() async {
    if (!_formKey.currentState!.validate()) return;

    setState(() => _isLoading = true);

    try {
      final currentProfile = ref.read(profileNotifierProvider).valueOrNull;
      if (currentProfile != null) {
        final updatedProfile = currentProfile.copyWith(
          displayName: _nameController.text.trim(),
        );
        await ref
            .read(profileNotifierProvider.notifier)
            .updateProfile(updatedProfile);
      }

      if (mounted) {
        Navigator.pop(context);
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text('Đã cập nhật hồ sơ'),
            backgroundColor: Colors.green,
          ),
        );
      }
    } catch (e) {
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Lỗi: $e'), backgroundColor: Colors.red),
        );
      }
    } finally {
      if (mounted) {
        setState(() => _isLoading = false);
      }
    }
  }
}
