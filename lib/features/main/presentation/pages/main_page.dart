import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:smart_route_app/features/auth/presentation/states/auth.dart';
import 'package:smart_route_app/features/map/presentation/pages/map_page.dart';
import 'package:smart_route_app/features/map/presentation/pages/report_page.dart';

class MainPage extends ConsumerStatefulWidget {
  static const String route = '/';
  const MainPage({super.key});

  @override
  ConsumerState<MainPage> createState() => _MainPageState();
}

class _MainPageState extends ConsumerState<MainPage> {
  int _selectedIndex = 0;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black87,

      body: Stack(
        children: [
          MapPage(),
          if (_selectedIndex == 0) _ExploreLayer(),
          if (_selectedIndex == 1) _buildPersistentSheet(),
        ],
      ),

      bottomNavigationBar: Theme(
        data: Theme.of(context).copyWith(
          splashColor: Colors.transparent,
          highlightColor: Colors.transparent,
        ),
        child: BottomNavigationBar(
          currentIndex: _selectedIndex,
          onTap: _onItemTapped,
          backgroundColor: Colors.white,
          type: BottomNavigationBarType.fixed,
          showSelectedLabels: true,
          showUnselectedLabels: true,
          selectedItemColor: Colors.blue,
          unselectedItemColor: Colors.grey,
          // set default
          iconSize: 24, // Cỡ biểu tượng
          selectedFontSize: 14, // Cỡ chữ nhãn khi chọn
          unselectedFontSize: 12, // Cỡ chữ nhãn khi không chọn
          selectedLabelStyle: const TextStyle(fontWeight: FontWeight.bold),
          unselectedLabelStyle: const TextStyle(fontWeight: FontWeight.normal),
          elevation: 8, // Độ đổ bóng
          items: const [
            BottomNavigationBarItem(
              icon: Icon(Icons.location_on_outlined),
              activeIcon: Icon(Icons.location_on),
              label: "Location",
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.add_circle_outline),
              activeIcon: Icon(Icons.add_circle),
              label: "Report Issue",
            ),
          ],
        ),
      ),
    );
  }
}

// Widget tùy chỉnh để hiển thị avatar và logout
class _ExploreLayer extends ConsumerWidget {
  const _ExploreLayer();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final user = ref.watch(authProvider);

    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Container(
          height: 50,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(30),
            boxShadow: [BoxShadow(color: Colors.black12, blurRadius: 10)],
          ),
          child: Row(
            children: [
              SizedBox(width: 16),
              Icon(Icons.location_pin, color: Colors.red),
              Expanded(child: Text("   Tìm kiếm ở đây")),
              Icon(Icons.mic),
              SizedBox(width: 8),
              // User avatar với popup menu
              PopupMenuButton<void>(
                offset: Offset(0, 50),
                child: CircleAvatar(
                  backgroundImage: user.photoUrl != null
                      ? NetworkImage(user.photoUrl!)
                      : null,
                  child: user.photoUrl == null ? Icon(Icons.person) : null,
                ),
                itemBuilder: (context) => <PopupMenuEntry<void>>[
                  PopupMenuItem(
                    enabled: false,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Text(
                          user.displayName ?? 'User',
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                        Text(
                          user.email,
                          style: TextStyle(fontSize: 12, color: Colors.grey),
                        ),
                      ],
                    ),
                  ),
                  PopupMenuDivider(),
                  PopupMenuItem(
                    child: Row(
                      children: [
                        Icon(Icons.logout, size: 20),
                        SizedBox(width: 8),
                        Text('Đăng xuất'),
                      ],
                    ),
                    onTap: () async {
                      await ref.read(authProvider.notifier).signOut();
                    },
                  ),
                ],
              ),
              SizedBox(width: 16),
            ],
          ),
        ),
      ),
    );
  }
}

Widget _buildPersistentSheet() {
  return DraggableScrollableSheet(
    initialChildSize: 0.95, // Mở lên ban đầu 95% màn hình
    minChildSize: 0.25, // Thu nhỏ tối đa 40%
    maxChildSize: 0.95, // Kéo lên tối đa 95%
    builder: (context, scrollController) => Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
        boxShadow: [
          BoxShadow(color: Colors.black12, blurRadius: 10, spreadRadius: 2),
        ],
      ),
      child: Column(
        children: [
          Center(
            child: Container(
              margin: EdgeInsets.only(top: 10, bottom: 10),
              width: 40,
              height: 4,
              decoration: BoxDecoration(
                color: Colors.grey[300],
                borderRadius: BorderRadius.circular(2),
              ),
            ),
          ),
          Expanded(child: ReportMapPage(scrollController: scrollController)),
        ],
      ),
    ),
  );
}
