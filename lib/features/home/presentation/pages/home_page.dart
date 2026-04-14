import 'dart:convert';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:http/http.dart' as http;
import 'package:smart_route_app/core/app/message.dart';
import 'package:smart_route_app/core/app/message_list.dart';
import 'package:smart_route_app/core/app/permissions.dart';
import 'package:smart_route_app/core/app/set_up_notification.dart';
import 'package:smart_route_app/core/app/token_monitor.dart';
import 'package:smart_route_app/core/core.dart';
import 'package:smart_route_app/shared/widgets/global_connection_wrapper.dart';
import 'package:smart_route_app/features/auth/presentation/providers/states/auth.dart';
import 'package:smart_route_app/features/search/presentation/providers/selected_address.dart';
import 'package:smart_route_app/features/search/presentation/widgets/map_search_top_bar.dart';
import 'package:smart_route_app/features/incident/presentation/pages/map_page.dart';
import 'package:smart_route_app/features/incident/presentation/pages/report_page.dart';
import 'package:smart_route_app/features/incident/presentation/widgets/map_bottom_sheet_container.dart';
import 'package:smart_route_app/features/profile/presentation/widgets/profile_drawers.dart';

// Crude counter to make messages unique
int _messageCount = 0;

/// The API endpoint here accepts a raw FCM payload for demonstration purposes.
String constructFCMPayload(String? token) {
  _messageCount++;
  return jsonEncode({
    'token': token,
    'data': {
      'via': 'FlutterFire Cloud Messaging!!!',
      'count': _messageCount.toString(),
    },
    'notification': {
      'title': 'Hello FlutterFire!',
      'body': 'This notification (#$_messageCount) was created via FCM!',
    },
  });
}

class HomePage extends ConsumerStatefulWidget {
  static const String route = '/';
  const HomePage({super.key});

  @override
  ConsumerState<HomePage> createState() => _HomePageState();
}

class _HomePageState extends ConsumerState<HomePage> {
  int _selectedIndex = 0;

  String? _token;
  String? initialMessage;
  bool _resolved = false;

  @override
  void initState() {
    super.initState();

    _requestPermissions();

    // Delay getInitialMessage call by 3 seconds
    Future.delayed(const Duration(seconds: 3), () {
      FirebaseMessaging.instance.getInitialMessage().then(
        (value) => setState(() {
          _resolved = true;
          initialMessage = value?.data.toString();
        }),
      );
    });

    // Xử lý tin nhắn khi app đang mở (foreground)
    FirebaseMessaging.onMessage.listen(showFlutterNotification);

    // Xử lý khi nhấn vào thông báo (App đang chạy ngầm),
    // được kích hoạt để bạn điều hướng (Navigate).
    FirebaseMessaging.onMessageOpenedApp.listen((RemoteMessage message) {
      print('A new onMessageOpenedApp event was published!');
      context.pushNamed('message', extra: MessageArguments(message, true));
    });
  }

  Future<void> _requestPermissions() async {
    // Xin quyền hiện thông báo
    NotificationSettings settings = await FirebaseMessaging.instance
        .requestPermission(
          announcement: true,
          carPlay: true,
          criticalAlert: true,
        );

    if (settings.authorizationStatus == AuthorizationStatus.authorized ||
        settings.authorizationStatus == AuthorizationStatus.provisional) {
      await FirebaseMessaging.instance.setAutoInitEnabled(true);
      AppLogger.info('On FCM: ${settings.authorizationStatus}');
    }
  }

  Future<void> sendPushMessage() async {
    if (_token == null) {
      print('Unable to send FCM message, no token exists.');
      return;
    }

    try {
      await http.post(
        Uri.parse('https://api.rnfirebase.io/messaging/send'),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
        body: constructFCMPayload(_token),
      );
      print('FCM request for device sent!');
    } catch (e) {
      print(e);
    }
  }

  Future<void> onActionSelected(String value) async {
    switch (value) {
      case 'subscribe':
        {
          print(
            'FlutterFire Messaging Example: Subscribing to topic "fcm_test".',
          );
          await FirebaseMessaging.instance.subscribeToTopic('fcm_test');
          print(
            'FlutterFire Messaging Example: Subscribing to topic "fcm_test" successful.',
          );
        }
        break;
      case 'unsubscribe':
        {
          print(
            'FlutterFire Messaging Example: Unsubscribing from topic "fcm_test".',
          );
          await FirebaseMessaging.instance.unsubscribeFromTopic('fcm_test');
          print(
            'FlutterFire Messaging Example: Unsubscribing from topic "fcm_test" successful.',
          );
        }
        break;
      case 'get_apns_token':
        {
          if (defaultTargetPlatform == TargetPlatform.iOS ||
              defaultTargetPlatform == TargetPlatform.macOS) {
            print('FlutterFire Messaging Example: Getting APNs token...');
            String? token = await FirebaseMessaging.instance.getAPNSToken();
            print('FlutterFire Messaging Example: Got APNs token: $token');
          } else {
            print(
              'FlutterFire Messaging Example: Getting an APNs token is only supported on iOS and macOS platforms.',
            );
          }
        }
        break;
      default:
        break;
    }
  }

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
          // Positioned.fill(
          //   child: SingleChildScrollView(
          //     child: Column(
          //       children: [
          //         MetaCard('Permissions', Permissions()),
          //         MetaCard(
          //           'Initial Message',
          //           Column(
          //             children: [
          //               Text(_resolved ? 'Resolved' : 'Resolving'),
          //               Text(initialMessage ?? 'None'),
          //             ],
          //           ),
          //         ),
          //         MetaCard(
          //           'FCM Token',
          //           TokenMonitor((token) {
          //             _token = token;
          //             return token == null
          //                 ? const CircularProgressIndicator()
          //                 : SelectableText(
          //                     token,
          //                     style: const TextStyle(fontSize: 12),
          //                   );
          //           }),
          //         ),
          //         ElevatedButton(
          //           onPressed: () {
          //             FirebaseMessaging.instance.getInitialMessage().then((
          //               RemoteMessage? message,
          //             ) {
          //               if (message != null) {
          //                 context.pushNamed(
          //                   'message',
          //                   extra: MessageArguments(message, true),
          //                 );
          //               }
          //             });
          //           },
          //           child: const Text('getInitialMessage()'),
          //         ),
          //         MetaCard('Message Stream', MessageList()),
          //       ],
          //     ),
          //   ),
          // ),
          // Positioned(
          //   top: 50,
          //   right: 20,
          //   child: PopupMenuButton(
          //     onSelected: onActionSelected,
          //     itemBuilder: (BuildContext context) {
          //       return [
          //         const PopupMenuItem(
          //           value: 'subscribe',
          //           child: Text('Subscribe to topic'),
          //         ),
          //         const PopupMenuItem(
          //           value: 'unsubscribe',
          //           child: Text('Unsubscribe to topic'),
          //         ),
          //         const PopupMenuItem(
          //           value: 'get_apns_token',
          //           child: Text('Get APNs token (Apple only)'),
          //         ),
          //       ];
          //     },
          //   ),
          // ),
          // Positioned(
          //   bottom: 20,
          //   right: 20,
          //   child: Builder(
          //     builder: (context) => FloatingActionButton(
          //       onPressed: sendPushMessage,
          //       backgroundColor: Colors.white,
          //       child: const Icon(Icons.send),
          //     ),
          //   ),
          // ),
        ],
      ),

      // floatingActionButton: FloatingActionButton.extended(
      //   onPressed: () => context.push('/arcgis-demo'),
      //   backgroundColor: Colors.blue,
      //   foregroundColor: Colors.white,
      //   icon: const Icon(Icons.map),
      //   label: const Text('ArcGIS Demo'),
      // ),
      // floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
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
    final user = ref.watch(authProvider);
    final selectedAddress = ref.watch(selectedAddressProvider);

    final titleText =
        selectedAddress?.fullAddress.split('\n').first ?? "Tìm kiếm ở đây";
    return GestureDetector(
      onTap: () => context.push('/search'), // or context.pushNamed('search');
      child: MapSearchTopBar(
        leadingIcon: Icon(Icons.location_pin, color: Colors.red),
        title: Expanded(
          child: Padding(
            padding: EdgeInsetsGeometry.only(left: 12),
            child: Text(
              titleText,
              style: TextStyle(
                color: selectedAddress != null
                    ? Colors.black87
                    : Colors.grey[600],
                fontSize: 16,
              ),
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
            ),
          ),
        ),
        trailingIcon: selectedAddress == null
            ? Row(
                children: [
                  Icon(Icons.mic),
                  SizedBox(width: 8),
                  // User avatar - tap to open profile drawer
                  Builder(
                    builder: (context) {
                      return GestureDetector(
                        onTap: () {
                          Scaffold.of(context).openDrawer();
                        },
                        child: CachedNetworkImage(
                          imageUrl: user.avatarUrl ?? '',
                          imageBuilder: (context, imageProvider) =>
                              CircleAvatar(backgroundImage: imageProvider),
                          placeholder: (context, url) => const CircleAvatar(
                            child: CircularProgressIndicator(),
                          ),
                          errorWidget: (context, url, error) =>
                              CircleAvatar(child: Icon(Icons.person)),
                        ),
                      );
                    },
                  ),
                ],
              )
            : GestureDetector(
                onTap: () {
                  ref.read(selectedAddressProvider.notifier).clear();
                },
                child: Icon(Icons.clear),
              ),
      ),
    );
  }

  Widget _buildPersistentSheet(BuildContext context) {
    return context.buildDraggableScrollableSheet(
      builder: (scrollController) =>
          ReportMapPage(scrollController: scrollController),
    );
  }
}

/// UI Widget for displaying metadata.
class MetaCard extends StatelessWidget {
  final String _title;
  final Widget _children;

  // ignore: public_member_api_docs
  MetaCard(this._title, this._children);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      margin: const EdgeInsets.only(left: 8, right: 8, top: 8),
      child: Card(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            children: [
              Container(
                margin: const EdgeInsets.only(bottom: 16),
                child: Text(_title, style: const TextStyle(fontSize: 18)),
              ),
              _children,
            ],
          ),
        ),
      ),
    );
  }
}
