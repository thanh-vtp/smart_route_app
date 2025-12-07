import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:smart_route_app/core/utils/app_logger.dart';
import 'package:smart_route_app/features/auth/domain/entities/app_user.dart';
import 'package:smart_route_app/features/auth/presentation/states/auth.dart';
import 'package:smart_route_app/features/map/domain/entities/incident.dart';
import 'package:smart_route_app/features/map/presentation/models/incident_button_action.dart';
import 'package:smart_route_app/features/map/presentation/providers/current_location_providers.dart';
import 'package:smart_route_app/features/map/presentation/providers/states/report_page_notifier.dart';
import 'package:smart_route_app/features/map/presentation/widgets/action_button_item.dart';
import 'package:smart_route_app/features/map/presentation/widgets/add_incident_bottom_sheet.dart';
import 'package:smart_route_app/features/map/presentation/widgets/map_state_overlays.dart';
import 'package:smart_route_app/features/map/presentation/widgets/review_loaction_card_widget.dart';

class ReportMapPage extends ConsumerStatefulWidget {
  const ReportMapPage({super.key, required this.scrollController});
  final ScrollController scrollController;

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _ReportMapPageState();
}

class _ReportMapPageState extends ConsumerState<ReportMapPage> {
  @override
  void initState() {
    super.initState();
    Future.microtask(() {
      final currentUser = ref.read(authProvider);
      ref
          .read(reportPageNotifierProvider.notifier)
          .fetchIncidents(currentUser: currentUser);
    });
  }

  @override
  Widget build(BuildContext context) {
    final user = ref.watch(authProvider);
    final reportState = ref.watch(reportPageNotifierProvider);
    return reportState.when(
      initial: () => const SizedBox.shrink(),
      loading: () => const MapLoadingOverlay(),
      loaded: (incidents) {
        return _buildStateUI(context, user, incidents);
      },

      submitting: (incidents) {
        return Stack(
          children: [
            _buildStateUI(context, user, incidents),
            const MapSubmittingOverlay(),
          ],
        );
      },
      submitted: (incidents) {
        return _buildStateUI(context, user, incidents);
      },
      error: (failure, incidents) => Stack(
        children: [
          if (incidents != null) _buildStateUI(context, user, incidents),
          MapErrorOverlay(
            message: failure.message,
            onRetry: () =>
                ref.read(reportPageNotifierProvider.notifier).fetchIncidents(),
          ),
        ],
      ),
    );
  }

  Widget _buildStateUI(
    BuildContext context,
    AppUser user,
    List<Incident> incidents,
  ) {
    final actions = [
      IncidentButtonAction(
        icon: Icons.add_location_alt,
        label: "Thêm địa điểm",
        onTap: () {
          // Lấy vị trí GPS hiện tại nếu có, nếu không thì dùng vị trí mặc định
          final currentLocation = ref.read(currentLocationProviderProvider);
          final double latitude;
          final double longitude;

          if (currentLocation != null) {
            // Ưu tiên sử dụng vị trí GPS
            latitude = currentLocation.position.y;
            longitude = currentLocation.position.x;
            AppLogger.ui('Report: Using GPS location: $latitude, $longitude');
          } else {
            // Vị trí mặc định (Nha Trang)
            latitude = 12.2259317;
            longitude = 109.1954123;
            AppLogger.ui('Report: Using default location (GPS not ready)');
          }

          showModalBottomSheet(
            context: context,
            isScrollControlled: true,
            backgroundColor: Colors.transparent,
            builder: (context) => AddIncidentBottomSheet(
              latitude: latitude,
              longitude: longitude,
            ),
          );
        },
      ),
      IncidentButtonAction(
        icon: Icons.edit_location_alt,
        label: "Cập nhật địa điểm",
        onTap: () => print("Cập nhật địa điểm"),
      ),
      IncidentButtonAction(
        icon: Icons.rate_review,
        label: "Viết bài đánh giá",
        onTap: () => print("Viết bài đánh giá"),
      ),
      IncidentButtonAction(
        icon: Icons.add_a_photo,
        label: "Thêm ảnh",
        onTap: () => print("Thêm ảnh"),
      ),
    ];

    return ListView(
      controller: widget.scrollController,
      padding: EdgeInsets.symmetric(horizontal: 16),
      children: [
        // Tiêu đề
        Text(
          "Đóng góp",
          style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
        ),
        SizedBox(height: 20),
        _buildProfileSection(context, user),
        SizedBox(height: 20),
        _buildActionButtons(actions),
        SizedBox(height: 20),
        _buildBadgeCard(),
        SizedBox(height: 24),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 4.0),
          child: Text(
            "Chúng tôi liệt kê các địa điểm dựa trên nội dung bạn tìm kiếm, vị trí của bạn và các yếu tố khác.",
            style: TextStyle(color: Colors.grey[600], fontSize: 13),
          ),
        ),

        SizedBox(height: 12),
        _incidentListView(incidents),
        SizedBox(height: 80),
      ],
    );
  }

  Widget _incidentListView(List<Incident> incidents) {
    return Column(
      children: incidents.map((incident) {
        return ReviewLocationCard(
          // name: 'Hẻm A2/2 Vũ Ngọc Nhạ, Hòn Nghê,...',
          // info: 'Bạn đã ghé thăm 3 ngày trước · Khu vực đường địa...',
          name:
              'Vị trí: Latitude${incident.latitude}, Longitude${incident.longitude}',
          info: incident.description,
        );
      }).toList(),
    );
  }
}

Widget _buildProfileSection(BuildContext context, AppUser user) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Row(
        children: [
          CircleAvatar(
            radius: 24,
            backgroundImage: NetworkImage(user.photoUrl!),
          ),
          SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  user.displayName ?? "User",
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                ),
                Text(
                  "Local Guide Cấp 2",
                  style: TextStyle(color: Colors.grey[600], fontSize: 13),
                ),
              ],
            ),
          ),
          TextButton(
            onPressed: () {
              showModalBottomSheet(
                context: context,
                isScrollControlled: true,
                builder: (context) {
                  return Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Hồ sơ Local Guide",
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        SizedBox(height: 10),
                        Text(
                          "Xem và quản lý các đóng góp của bạn với tư cách là Local Guide.",
                        ),
                        SizedBox(height: 20),
                        ElevatedButton(
                          onPressed: () {
                            Navigator.pop(context);
                          },
                          child: Text("Đóng"),
                        ),
                      ],
                    ),
                  );
                },
              );
            },
            child: Text("Xem hồ sơ", style: TextStyle(color: Colors.blue)),
          ),
        ],
      ),
      SizedBox(height: 10),
      // Thanh tiến trình (Progress Bar)
      ClipRRect(
        borderRadius: BorderRadius.circular(4),
        child: LinearProgressIndicator(
          value: 0.7, // 70%
          minHeight: 6,
          backgroundColor: Colors.orange[100],
          valueColor: AlwaysStoppedAnimation<Color>(Colors.orange),
        ),
      ),
      SizedBox(height: 6),
      Text(
        "Còn 45 điểm nữa là lên Cấp 3",
        style: TextStyle(color: Colors.grey, fontSize: 12),
      ),
    ],
  );
}

Widget _buildActionButtons(List<IncidentButtonAction> items) {
  return SingleChildScrollView(
    scrollDirection: Axis.horizontal,
    child: Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: items.map((item) {
        return ActionButtonItem(item: item);
      }).toList(),
    ),
  );
}

Widget _buildBadgeCard() {
  return Card(
    elevation: 2,
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
    child: Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Expanded(
                child: Text(
                  "Nhận huy hiệu Người đóng góp mới của bạn",
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
                ),
              ),
              Icon(Icons.verified, size: 40, color: Colors.green), // Icon mẫu
            ],
          ),
          SizedBox(height: 10),
          Text(
            "Bắt đầu bằng cách đóng góp những nội dung...",
            style: TextStyle(color: Colors.grey[600]),
          ),
          SizedBox(height: 16),
          _buildTaskItem("Đăng 2 ảnh", "0/2"),
          Divider(),
          _buildTaskItem("Viết 2 bài đánh giá", "1/2"),
          Divider(),
          Container(
            padding: EdgeInsets.symmetric(vertical: 12),
            decoration: BoxDecoration(
              color: Colors.green[50],
              borderRadius: BorderRadius.circular(8),
            ),
            child: Row(
              children: [
                SizedBox(width: 16),
                Text(
                  "Trả lời 2 câu hỏi",
                  style: TextStyle(fontWeight: FontWeight.w500),
                ),
                Spacer(),
                Icon(Icons.check, color: Colors.green),
                SizedBox(width: 16),
              ],
            ),
          ),
        ],
      ),
    ),
  );
}

Widget _buildTaskItem(String title, String progress) {
  return Padding(
    padding: const EdgeInsets.symmetric(vertical: 12.0),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(title, style: TextStyle(fontWeight: FontWeight.w500)),
        Row(
          children: [
            Text(progress, style: TextStyle(color: Colors.grey)),
            SizedBox(width: 8),
            Icon(Icons.chevron_right, color: Colors.grey),
          ],
        ),
      ],
    ),
  );
}
