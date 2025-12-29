import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

class NetworkDiagnosticWidget extends HookWidget {
  const NetworkDiagnosticWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final isTestingDNS = useState(false);
    final dnsResults = useState<Map<String, bool>>({});

    Future<void> testDNSLookup() async {
      isTestingDNS.value = true;
      final results = <String, bool>{};

      final hosts = [
        'google.com',
        'geocode-api.arcgis.com',
        'basemapstyles-api.arcgis.com',
        'cdn.arcgis.com',
        'services.arcgisonline.com',
      ];

      for (final host in hosts) {
        try {
          final addresses = await InternetAddress.lookup(host);
          results[host] = addresses.isNotEmpty;
        } catch (e) {
          results[host] = false;
        }
      }

      dnsResults.value = results;
      isTestingDNS.value = false;
    }

    return Card(
      margin: const EdgeInsets.all(16),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                const Icon(Icons.network_check, color: Colors.blue),
                const SizedBox(width: 8),
                const Text(
                  'Kiểm tra mạng',
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                ),
                const Spacer(),
                ElevatedButton(
                  onPressed: isTestingDNS.value ? null : testDNSLookup,
                  child: isTestingDNS.value
                      ? const SizedBox(
                          width: 16,
                          height: 16,
                          child: CircularProgressIndicator(strokeWidth: 2),
                        )
                      : const Text('Test DNS'),
                ),
              ],
            ),

            if (dnsResults.value.isNotEmpty) ...[
              const SizedBox(height: 16),
              const Text(
                'Kết quả DNS lookup:',
                style: TextStyle(fontWeight: FontWeight.w500),
              ),
              const SizedBox(height: 8),
              ...dnsResults.value.entries.map((entry) {
                return Padding(
                  padding: const EdgeInsets.symmetric(vertical: 2),
                  child: Row(
                    children: [
                      Icon(
                        entry.value ? Icons.check_circle : Icons.error,
                        color: entry.value ? Colors.green : Colors.red,
                        size: 16,
                      ),
                      const SizedBox(width: 8),
                      Expanded(
                        child: Text(
                          entry.key,
                          style: const TextStyle(fontSize: 14),
                        ),
                      ),
                      Text(
                        entry.value ? 'OK' : 'FAIL',
                        style: TextStyle(
                          color: entry.value ? Colors.green : Colors.red,
                          fontWeight: FontWeight.bold,
                          fontSize: 12,
                        ),
                      ),
                    ],
                  ),
                );
              }),

              if (dnsResults.value.values.any((v) => !v)) ...[
                const SizedBox(height: 12),
                Container(
                  padding: const EdgeInsets.all(12),
                  decoration: BoxDecoration(
                    color: Colors.orange[50],
                    borderRadius: BorderRadius.circular(8),
                    border: Border.all(color: Colors.orange[200]!),
                  ),
                  child: const Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Gợi ý khắc phục:',
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      SizedBox(height: 4),
                      Text('• Kiểm tra kết nối internet'),
                      Text('• Thử đổi DNS (8.8.8.8, 1.1.1.1)'),
                      Text('• Sử dụng VPN nếu bị chặn'),
                      Text('• Kiểm tra tường lửa/proxy'),
                    ],
                  ),
                ),
              ],
            ],
          ],
        ),
      ),
    );
  }
}
