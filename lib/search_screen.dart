import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'route_setup_screen.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({super.key});

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  final TextEditingController _searchController = TextEditingController(
    text: 'Sân bay',
  );

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final cs = theme.colorScheme;
    final textTheme = theme.textTheme;

    return Scaffold(
      backgroundColor: cs.surfaceContainerLowest,
      body: SafeArea(
        child: Column(
          children: [
            // 1. Header with Search Input
            Padding(
              padding: const EdgeInsets.fromLTRB(8.0, 16.0, 16.0, 16.0),
              child: Row(
                children: [
                  IconButton(
                    icon: Icon(Icons.arrow_back, color: cs.onSurface),
                    onPressed: () => Navigator.pop(context),
                  ),
                  Expanded(
                    child: Container(
                      height: 48,
                      decoration: BoxDecoration(
                        color: cs.surfaceContainerHigh,
                        borderRadius: BorderRadius.circular(24.0),
                      ),
                      child: Row(
                        children: [
                          const SizedBox(width: 16),
                          Icon(Icons.search, color: cs.onSurfaceVariant),
                          const SizedBox(width: 8),
                          Expanded(
                            child: TextField(
                              controller: _searchController,
                              style: textTheme.bodyLarge?.copyWith(
                                color: cs.onSurface,
                              ),
                              decoration: InputDecoration(
                                hintText: 'Bạn muốn đi đâu?',
                                hintStyle: textTheme.bodyLarge?.copyWith(
                                  color: cs.onSurfaceVariant,
                                ),
                                border: InputBorder.none,
                                isDense: true,
                                contentPadding: EdgeInsets.zero,
                              ),
                            ),
                          ),
                          IconButton(
                            icon: Icon(Icons.close, color: cs.onSurfaceVariant),
                            onPressed: () {
                              _searchController.clear();
                            },
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),

            Divider(height: 1, color: cs.outlineVariant.withOpacity(0.5)),

            // 2. Quick Filters (Horizontal Scrollable)
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 16.0),
              child: SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                child: Row(
                  children: [
                    _buildQuickFilter(
                      context,
                      icon: Icons.local_gas_station,
                      label: 'Trạm xăng',
                      cs: cs,
                      textTheme: textTheme,
                    ),
                    const SizedBox(width: 12),
                    _buildQuickFilter(
                      context,
                      icon: Icons.local_parking,
                      label: 'Bãi đỗ xe',
                      cs: cs,
                      textTheme: textTheme,
                    ),
                    const SizedBox(width: 12),
                    _buildQuickFilter(
                      context,
                      icon: Icons.restaurant,
                      label: 'Quán ăn',
                      cs: cs,
                      textTheme: textTheme,
                    ),
                  ],
                ),
              ),
            ),

            Divider(height: 1, color: cs.outlineVariant.withOpacity(0.5)),

            // 3. Results List
            Expanded(
              child: ListView(
                children: [
                  _buildResultItem(
                    context,
                    icon: Icons.location_on,
                    iconColor: cs.primary,
                    iconBgColor: cs.primaryFixed,
                    title: 'Sân bay Quốc tế Tân Sơn Nhất',
                    subtitle: 'Đường Trường Sơn, Phường 2, Tân Bình, TP....',
                    distance: '5.2 km',
                  ),
                  Divider(height: 1, indent: 72, color: cs.surfaceVariant),
                  _buildResultItem(
                    context,
                    icon: Icons.schedule,
                    iconColor: cs.onSurfaceVariant,
                    iconBgColor: cs.surfaceContainerHigh,
                    title: 'Công ty (SmartRoute Office)',
                    subtitle: '123 Đường Điện Biên Phủ, Phường 15, Bình T...',
                    distance: '1.1 km',
                  ),
                  Divider(height: 1, indent: 72, color: cs.surfaceVariant),
                  _buildResultItem(
                    context,
                    icon: Icons.home,
                    iconColor: cs.onSurfaceVariant,
                    iconBgColor: cs.surfaceContainerHigh,
                    title: 'Nhà riêng',
                    subtitle: 'Đã lưu • 456 Lê Lợi, Quận 1, TP. HCM',
                    distance: '8.5 km',
                  ),
                  Divider(height: 1, indent: 72, color: cs.surfaceVariant),

                  // Decorative "Live Traffic" Map Card (Optional aesthetic from design)
                  Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Container(
                      height: 180,
                      decoration: BoxDecoration(
                        color: cs.surfaceContainerHigh,
                        borderRadius: BorderRadius.circular(16.0),
                        // Fallback background color if image isn't loaded
                      ),
                      child: Stack(
                        children: [
                          Positioned.fill(
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(16.0),
                              child: Image.network(
                                'https://lh3.googleusercontent.com/aida-public/AB6AXuCMkKtygbjWarW6nj1KkbpMjxxTBL9UlK9-_x6_vmmajIjy8xCtmiUmfYXSFlB01UHqVVhMKXbS7Cv3uosZAQb4Vz4MRwn1kJt2JUalqt8STw8swPhTx0IEXSQrE1ps8sfkduhSfjUGoXb5jrb-SRZQpdZy_k7ZnGTuIgaZlekYhsSA0ZH4h7C8XEDrriw4lWH8pD5rNXCRQup2-YQqVM99mwzHH8JeWTTiHtq471RiLPA6aXpc-oiodPv6eph7dKprF03YVG2BKfLM',
                                fit: BoxFit.cover,
                                color: Colors.black.withOpacity(0.5),
                                colorBlendMode: BlendMode.darken,
                              ),
                            ),
                          ),
                          Positioned(
                            bottom: 16,
                            left: 16,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Container(
                                  padding: const EdgeInsets.symmetric(
                                    horizontal: 8,
                                    vertical: 4,
                                  ),
                                  decoration: BoxDecoration(
                                    color: cs.primaryContainer,
                                    borderRadius: BorderRadius.circular(4.0),
                                  ),
                                  child: Text(
                                    'TRỰC TIẾP',
                                    style: textTheme.labelSmall?.copyWith(
                                      color: cs.onPrimaryContainer,
                                      fontWeight: FontWeight.bold,
                                      letterSpacing: 0.5,
                                    ),
                                  ),
                                ),
                                const SizedBox(height: 8),
                                Text(
                                  'Giao thông thông thoáng',
                                  style: textTheme.titleMedium?.copyWith(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Positioned(
                            bottom: 16,
                            right: 16,
                            child: CircleAvatar(
                              backgroundColor: cs.primary,
                              child: const Icon(
                                Icons.navigation,
                                color: Colors.white,
                                size: 20,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildQuickFilter(
    BuildContext context, {
    required IconData icon,
    required String label,
    required ColorScheme cs,
    required TextTheme textTheme,
  }) {
    return OutlinedButton.icon(
      onPressed: () {},
      icon: Icon(icon, size: 18, color: cs.onSurfaceVariant),
      label: Text(
        label,
        style: textTheme.labelLarge?.copyWith(color: cs.onSurfaceVariant),
      ),
      style: OutlinedButton.styleFrom(
        side: BorderSide(color: cs.outlineVariant),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(24.0),
        ),
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      ),
    );
  }

  Widget _buildResultItem(
    BuildContext context, {
    required IconData icon,
    required Color iconColor,
    required Color iconBgColor,
    required String title,
    required String subtitle,
    required String distance,
  }) {
    final cs = Theme.of(context).colorScheme;
    final textTheme = Theme.of(context).textTheme;

    return InkWell(
      onTap: () {
        /// TODO: Chuyển tới StatefulShellBranch (RouteSetupScreen)
        context.goNamed('go');
      },
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 16.0),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              width: 40,
              height: 40,
              decoration: BoxDecoration(
                color: iconBgColor,
                shape: BoxShape.circle,
              ),
              child: Icon(icon, color: iconColor, size: 24),
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
                      color: cs.onSurfaceVariant,
                    ),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                ],
              ),
            ),
            const SizedBox(width: 12),
            Text(
              distance,
              style: textTheme.labelMedium?.copyWith(
                color: cs.onSurfaceVariant,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
