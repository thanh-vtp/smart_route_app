import 'package:flutter/material.dart';

class OfflineGeocodingDemo extends StatelessWidget {
  const OfflineGeocodingDemo({super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.all(16),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                const Icon(Icons.offline_bolt, color: Colors.green),
                const SizedBox(width: 8),
                const Text(
                  'Demo Offline (Mock Data)',
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                ),
              ],
            ),
            const SizedBox(height: 12),

            const Text(
              'Khi không có kết nối, đây là ví dụ kết quả sẽ trả về:',
              style: TextStyle(fontSize: 14),
            ),

            const SizedBox(height: 16),

            _buildMockResult('Geocoding: "Hanoi"', [
              'Hà Nội, Việt Nam (21.0285, 105.8542) - 95%',
              'Hanoi, Vietnam (21.0245, 105.8412) - 92%',
              'Hà Nội, Hoàn Kiếm (21.0285, 105.8542) - 88%',
            ]),

            const SizedBox(height: 12),

            _buildMockResult('Reverse Geocoding: (21.0285, 105.8542)', [
              'Địa chỉ: Phố Hàng Khay, Hoàn Kiếm, Hà Nội',
              'Tên đường: Phố Hàng Khay',
              'Quận: Hoàn Kiếm',
              'Thành phố: Hà Nội',
              'Quốc gia: Việt Nam',
            ]),

            const SizedBox(height: 12),

            _buildMockResult('Route Planning: Hà Nội → TP.HCM', [
              'Khoảng cách: 1,720 km',
              'Thời gian: 18h 30m (driving)',
              'Tuyến đường: Quốc lộ 1A',
            ]),

            const SizedBox(height: 16),

            Container(
              padding: const EdgeInsets.all(12),
              decoration: BoxDecoration(
                color: Colors.blue[50],
                borderRadius: BorderRadius.circular(8),
                border: Border.all(color: Colors.blue[200]!),
              ),
              child: const Row(
                children: [
                  Icon(Icons.info, color: Colors.blue),
                  SizedBox(width: 8),
                  Expanded(
                    child: Text(
                      'Đây chỉ là dữ liệu mẫu. Khi có kết nối internet, '
                      'sẽ sử dụng ArcGIS API thực tế.',
                      style: TextStyle(fontSize: 12),
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

  Widget _buildMockResult(String title, List<String> results) {
    return Container(
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: Colors.grey[50],
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: Colors.grey[300]!),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 14),
          ),
          const SizedBox(height: 8),
          ...results.map(
            (result) => Padding(
              padding: const EdgeInsets.only(left: 8, top: 2),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text('• ', style: TextStyle(color: Colors.green)),
                  Expanded(
                    child: Text(result, style: const TextStyle(fontSize: 13)),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
