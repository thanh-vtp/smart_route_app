import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:smart_route_app/core/resources/extensions/context_modal_extension.dart';
import 'package:smart_route_app/features/auth/presentation/providers/states/auth.dart';
import 'package:smart_route_app/features/incident/presentation/pages/map_page.dart';
import 'package:smart_route_app/features/incident/presentation/pages/report_page.dart';
import 'package:smart_route_app/features/incident/presentation/widgets/map_bottom_sheet_container.dart';
import 'package:smart_route_app/features/profile/presentation/widgets/profile_drawers.dart';

// class MainPage extends ConsumerStatefulWidget {
//   static const String route = '/';
//   const MainPage({super.key});

//   @override
//   ConsumerState<MainPage> createState() => _MainPageState();
// }

// class _MainPageState extends ConsumerState<MainPage> {
//   int _selectedIndex = 0;

//   void _onItemTapped(int index) {
//     setState(() {
//       _selectedIndex = index;
//     });
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Colors.white,

//       drawer: const ProfileDrawer(),
//       endDrawer: const EditProfileDrawer(),
//       resizeToAvoidBottomInset: false, //<-- caused the extra space
//       body: Stack(
//         fit: StackFit.expand,
//         children: [
//           const MapPage(),
//           const Positioned(top: 0, left: 0, right: 0, child: _ExploreLayer()),

//           if (_selectedIndex == 1)
//             Positioned.fill(child: _buildPersistentSheet(context)),

//           // Bottom Sheet Container (hiển thị LocationInfo hoặc IncidentDetail)
//           // Đặt ở đây để ngang cấp với ReportMapPage và có thể tương tác map bên dưới
//           const Positioned.fill(child: MapBottomSheetContainer()),
//         ],
//       ),

//       // floatingActionButton: FloatingActionButton.extended(
//       //   onPressed: () => context.go('/arcgis-demo'),
//       //   backgroundColor: Colors.blue,
//       //   foregroundColor: Colors.white,
//       //   icon: const Icon(Icons.map),
//       //   label: const Text('ArcGIS Demo'),
//       // ),
//       floatingActionButtonLocation: FloatingActionButtonLocation.endTop,

//       bottomNavigationBar: Theme(
//         data: Theme.of(context).copyWith(
//           splashColor: Colors.transparent,
//           highlightColor: Colors.transparent,
//         ),
//         child: BottomNavigationBar(
//           currentIndex: _selectedIndex,
//           onTap: _onItemTapped,
//           backgroundColor: Colors.white,
//           type: BottomNavigationBarType.fixed,
//           showSelectedLabels: true,
//           showUnselectedLabels: true,
//           selectedItemColor: Colors.blue,
//           unselectedItemColor: Colors.grey,
//           // set default
//           iconSize: 24, // Cỡ biểu tượng
//           selectedFontSize: 14, // Cỡ chữ nhãn khi chọn
//           unselectedFontSize: 12, // Cỡ chữ nhãn khi không chọn
//           selectedLabelStyle: const TextStyle(fontWeight: FontWeight.bold),
//           unselectedLabelStyle: const TextStyle(fontWeight: FontWeight.normal),
//           elevation: 8, // Độ đổ bóng
//           items: const [
//             BottomNavigationBarItem(
//               icon: Icon(Icons.location_on_outlined),
//               activeIcon: Icon(Icons.location_on),
//               label: "Location",
//             ),
//             BottomNavigationBarItem(
//               icon: Icon(Icons.add_circle_outline),
//               activeIcon: Icon(Icons.add_circle),
//               label: "Report Issue",
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }

// // Widget tùy chỉnh để hiển thị avatar và logout
// class _ExploreLayer extends ConsumerWidget {
//   const _ExploreLayer();

//   @override
//   Widget build(BuildContext context, WidgetRef ref) {
//     final user = ref.watch(authProvider);

//     return SafeArea(
//       child: Padding(
//         padding: const EdgeInsets.all(16.0),
//         child: Container(
//           height: 50,
//           decoration: BoxDecoration(
//             color: Colors.white,
//             borderRadius: BorderRadius.circular(30),
//             boxShadow: [BoxShadow(color: Colors.black12, blurRadius: 10)],
//           ),
//           child: Row(
//             children: [
//               SizedBox(width: 16),
//               Icon(Icons.location_pin, color: Colors.red),
//               Expanded(child: Text("   Tìm kiếm ở đây")),
//               Icon(Icons.mic),
//               SizedBox(width: 8),
//               // User avatar - tap to open profile drawer
//               GestureDetector(
//                 onTap: () {
//                   Scaffold.of(context).openDrawer();
//                 },
//                 child: CachedNetworkImage(
//                   imageUrl: user.avatarUrl ?? '',
//                   imageBuilder: (context, imageProvider) =>
//                       CircleAvatar(backgroundImage: imageProvider),
//                   placeholder: (context, url) =>
//                       const CircleAvatar(child: CircularProgressIndicator()),
//                   errorWidget: (context, url, error) =>
//                       CircleAvatar(child: Icon(Icons.person)),
//                 ),
//               ),
//               SizedBox(width: 16),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }

// Widget _buildPersistentSheet(BuildContext context) {
//   // return DraggableScrollableSheet(
//   //   initialChildSize: 1.0, // Mở lên ban đầu 100% màn hình
//   //   minChildSize: 0.14, // Thu nhỏ tối đa 14%
//   //   maxChildSize: 1.0, // Kéo lên tối đa 100%
//   //   builder: (context, scrollController) => Container(
//   //     decoration: BoxDecoration(
//   //       color: Colors.white,
//   //       borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
//   //       boxShadow: [
//   //         BoxShadow(color: Colors.black12, blurRadius: 10, spreadRadius: 2),
//   //       ],
//   //     ),
//   //     child: Column(
//   //       children: [
//   //         Center(
//   //           child: Container(
//   //             margin: EdgeInsets.only(top: 10, bottom: 10),
//   //             width: 40,
//   //             height: 4,
//   //             decoration: BoxDecoration(
//   //               color: Colors.grey[300],
//   //               borderRadius: BorderRadius.circular(2),
//   //             ),
//   //           ),
//   //         ),
//   //         Expanded(child: ReportMapPage(scrollController: scrollController)),
//   //       ],
//   //     ),
//   //   ),
//   // );

//   return context.buildDraggableScrollableSheet(
//     builder: (scrollController) =>
//         ReportMapPage(scrollController: scrollController),
//   );
// }
