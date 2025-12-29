import 'package:flutter/material.dart';

class OfflineDemoWidget extends StatelessWidget {
  const OfflineDemoWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('ArcGIS Demo (Offline)'),
        backgroundColor: Colors.orange,
        foregroundColor: Colors.white,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: Colors.orange[50],
                borderRadius: BorderRadius.circular(12),
                border: Border.all(color: Colors.orange[200]!),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Icon(Icons.wifi_off, color: Colors.orange[700]),
                      const SizedBox(width: 8),
                      const Text(
                        'Chế độ Offline',
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: Colors.orange,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 8),
                  const Text(
                    'Không thể kết nối đến ArcGIS services. Đây là demo các tính năng sẽ có khi online:',
                    style: TextStyle(fontSize: 14),
                  ),
                ],
              ),
            ),

            const SizedBox(height: 24),

            const Text(
              'Tính năng ArcGIS Geocoding Service:',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),

            const SizedBox(height: 16),

            Expanded(
              child: ListView(
                children: [
                  _buildFeatureCard(
                    icon: Icons.search,
                    title: 'Tìm kiếm địa chỉ (Geocoding)',
                    description:
                        'Chuyển đổi địa chỉ thành tọa độ lat/long với độ chính xác cao',
                    examples: [
                      '123 Nguyễn Huệ, Quận 1, TP.HCM',
                      'Hồ Gươm, Hà Nội',
                      'Times Square, New York',
                    ],
                  ),

                  _buildFeatureCard(
                    icon: Icons.location_on,
                    title: 'Reverse Geocoding',
                    description:
                        'Chuyển đổi tọa độ thành thông tin địa chỉ chi tiết',
                    examples: [
                      'Tên đường, khu vực',
                      'Quận/huyện, thành phố',
                      'Tỉnh/thành, quốc gia',
                    ],
                  ),

                  _buildFeatureCard(
                    icon: Icons.directions,
                    title: 'Tính toán đường đi',
                    description:
                        'Route planning với khoảng cách và thời gian di chuyển',
                    examples: [
                      'Đường đi tối ưu giữa nhiều điểm',
                      'Khoảng cách và thời gian chính xác',
                      'Hỗ trợ nhiều phương tiện',
                    ],
                  ),

                  _buildFeatureCard(
                    icon: Icons.satellite,
                    title: 'Hình ảnh vệ tinh',
                    description:
                        'Lấy hình ảnh vệ tinh chất lượng cao tại vị trí cụ thể',
                    examples: [
                      'World Imagery từ ArcGIS',
                      'Tùy chỉnh kích thước và zoom',
                      'Metadata và copyright info',
                    ],
                  ),

                  _buildFeatureCard(
                    icon: Icons.place,
                    title: 'Địa điểm gần đó',
                    description:
                        'Tìm kiếm các địa điểm quan trọng xung quanh vị trí',
                    examples: [
                      'Nhà hàng, bệnh viện, trường học',
                      'Tính khoảng cách chính xác',
                      'Lọc theo danh mục',
                    ],
                  ),
                ],
              ),
            ),

            const SizedBox(height: 16),

            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: Colors.blue[50],
                borderRadius: BorderRadius.circular(12),
                border: Border.all(color: Colors.blue[200]!),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'Để test các tính năng:',
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                  ),
                  const SizedBox(height: 8),
                  const Text('1. Kiểm tra kết nối internet'),
                  const Text('2. Đảm bảo ArcGIS API key hợp lệ'),
                  const Text('3. Thử lại kết nối'),
                  const SizedBox(height: 12),
                  ElevatedButton.icon(
                    onPressed: () => Navigator.of(context).pop(),
                    icon: const Icon(Icons.arrow_back),
                    label: const Text('Quay lại'),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildFeatureCard({
    required IconData icon,
    required String title,
    required String description,
    required List<String> examples,
  }) {
    return Card(
      margin: const EdgeInsets.only(bottom: 16),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Icon(icon, color: Colors.blue),
                const SizedBox(width: 12),
                Expanded(
                  child: Text(
                    title,
                    style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 8),
            Text(description, style: const TextStyle(fontSize: 14)),
            const SizedBox(height: 12),
            const Text(
              'Ví dụ:',
              style: TextStyle(fontWeight: FontWeight.w500, fontSize: 14),
            ),
            const SizedBox(height: 4),
            ...examples.map(
              (example) => Padding(
                padding: const EdgeInsets.only(left: 8, top: 2),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text('• ', style: TextStyle(color: Colors.grey)),
                    Expanded(
                      child: Text(
                        example,
                        style: const TextStyle(
                          fontSize: 13,
                          color: Colors.grey,
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
    );
  }
}
