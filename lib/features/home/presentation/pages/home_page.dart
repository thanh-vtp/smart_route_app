import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:smart_route_app/core/core.dart';
import 'package:smart_route_app/core/network/presentation/widgets/global_connection_wrapper.dart';
import 'package:smart_route_app/features/home/presentation/widgets/map_search_top_bar.dart';
import 'package:smart_route_app/features/incident/presentation/pages/map_page.dart';
import 'package:smart_route_app/features/incident/presentation/pages/report_page.dart';
import 'package:smart_route_app/features/incident/presentation/widgets/map_bottom_sheet_container.dart';
import 'package:smart_route_app/features/profile/presentation/widgets/profile_drawers.dart';

class HomePage extends ConsumerStatefulWidget {
  static const String route = '/';
  const HomePage({super.key});

  @override
  ConsumerState<HomePage> createState() => _HomePageState();
}

class _HomePageState extends ConsumerState<HomePage> {
  int _selectedIndex = 0;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,

      drawer: const ProfileDrawer(),
      endDrawer: const EditProfileDrawer(),
      resizeToAvoidBottomInset: false, //<-- caused the extra space
      body: Stack(
        fit: StackFit.expand,
        children: [
          const MapPage(),
          Positioned(
            top: 0,
            left: 0,
            right: 0,
            child: _buildSearchWithProfileBar(),
          ),

          if (_selectedIndex == 1)
            Positioned.fill(child: _buildPersistentSheet(context)),

          // Bottom Sheet Container (hiển thị LocationInfo hoặc IncidentDetail)
          // Đặt ở đây để ngang cấp với ReportMapPage và có thể tương tác map bên dưới
          const Positioned.fill(child: MapBottomSheetContainer()),
          const Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            child: GlobalConnectionWrapper(),
          ),
        ],
      ),

      floatingActionButton: FloatingActionButton.extended(
        onPressed: () => context.go('/arcgis-demo'),
        backgroundColor: Colors.blue,
        foregroundColor: Colors.white,
        icon: const Icon(Icons.map),
        label: const Text('ArcGIS Demo'),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.endTop,

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

  Widget _buildSearchWithProfileBar() {
    return const MapSearchTopBar();
  }

  Widget _buildPersistentSheet(BuildContext context) {
    return context.buildDraggableScrollableSheet(
      builder: (scrollController) =>
          ReportMapPage(scrollController: scrollController),
    );
  }
}
