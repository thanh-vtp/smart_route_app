import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:smart_route_app/features/navigation/presentation/providers/data/remote_datasource_providers.dart';
import 'offline_demo_widget.dart';

class ConnectionStatusWidget extends HookConsumerWidget {
  final VoidCallback? onRetry;

  const ConnectionStatusWidget({super.key, this.onRetry});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final isTestingConnection = useState(false);
    final connectionStatus = useState<bool?>(null);

    Future<void> testConnection() async {
      isTestingConnection.value = true;
      try {
        final dataSource = ref.read(arcgisGeocodingRemoteDataSourceProvider);
        final isConnected = await dataSource.testConnection();
        connectionStatus.value = isConnected;
      } catch (e) {
        connectionStatus.value = false;
      } finally {
        isTestingConnection.value = false;
      }
    }

    useEffect(() {
      // Test connection when widget is first built
      WidgetsBinding.instance.addPostFrameCallback((_) {
        testConnection();
      });
      return null;
    }, []);

    if (isTestingConnection.value) {
      return Container(
        padding: const EdgeInsets.all(16),
        margin: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: Colors.blue[50],
          borderRadius: BorderRadius.circular(12),
          border: Border.all(color: Colors.blue[200]!),
        ),
        child: const Row(
          children: [
            SizedBox(
              width: 20,
              height: 20,
              child: CircularProgressIndicator(strokeWidth: 2),
            ),
            SizedBox(width: 12),
            Text('Đang kiểm tra kết nối ArcGIS...'),
          ],
        ),
      );
    }

    if (connectionStatus.value == false) {
      return Container(
        padding: const EdgeInsets.all(16),
        margin: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: Colors.red[50],
          borderRadius: BorderRadius.circular(12),
          border: Border.all(color: Colors.red[200]!),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Icon(Icons.error_outline, color: Colors.red[700]),
                const SizedBox(width: 8),
                const Text(
                  'Lỗi kết nối ArcGIS',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Colors.red,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 8),
            const Text(
              'Không thể kết nối đến server ArcGIS. Vui lòng kiểm tra:\n'
              '• Kết nối internet\n'
              '• Tường lửa hoặc proxy\n'
              '• ArcGIS API key',
              style: TextStyle(fontSize: 14),
            ),
            const SizedBox(height: 12),
            Row(
              children: [
                ElevatedButton.icon(
                  onPressed: testConnection,
                  icon: const Icon(Icons.refresh),
                  label: const Text('Thử lại'),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.red,
                    foregroundColor: Colors.white,
                  ),
                ),
                const SizedBox(width: 8),
                TextButton(
                  onPressed: () {
                    Navigator.of(context).pushReplacement(
                      MaterialPageRoute(
                        builder: (context) => const OfflineDemoWidget(),
                      ),
                    );
                  },
                  child: const Text('Xem demo offline'),
                ),
              ],
            ),
          ],
        ),
      );
    }

    if (connectionStatus.value == true) {
      return Container(
        padding: const EdgeInsets.all(12),
        margin: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: Colors.green[50],
          borderRadius: BorderRadius.circular(12),
          border: Border.all(color: Colors.green[200]!),
        ),
        child: Row(
          children: [
            Icon(Icons.check_circle, color: Colors.green[700]),
            const SizedBox(width: 8),
            const Text(
              'Kết nối ArcGIS thành công',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                color: Colors.green,
              ),
            ),
          ],
        ),
      );
    }

    return const SizedBox.shrink();
  }
}
