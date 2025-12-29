import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:smart_route_app/features/map/presentation/providers/usecase/use_case_providers.dart';

class SimpleConnectionTest extends HookConsumerWidget {
  const SimpleConnectionTest({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final isLoading = useState(false);
    final result = useState<String>('');

    Future<void> testSimpleConnection() async {
      isLoading.value = true;
      result.value = '';

      try {
        final useCase = ref.read(geocodeAddressUseCaseProvider);
        final response = await useCase('Hanoi');

        response.fold(
          (error) => result.value = 'Lỗi: $error',
          (addresses) =>
              result.value = 'Thành công! Tìm thấy ${addresses.length} địa chỉ',
        );
      } catch (e) {
        result.value = 'Exception: ${e.toString()}';
      } finally {
        isLoading.value = false;
      }
    }

    return Card(
      margin: const EdgeInsets.all(16),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Test kết nối ArcGIS',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 16),

            ElevatedButton(
              onPressed: isLoading.value ? null : testSimpleConnection,
              child: isLoading.value
                  ? const SizedBox(
                      width: 20,
                      height: 20,
                      child: CircularProgressIndicator(strokeWidth: 2),
                    )
                  : const Text('Test geocoding "Hanoi"'),
            ),

            const SizedBox(height: 16),

            if (result.value.isNotEmpty)
              Container(
                width: double.infinity,
                padding: const EdgeInsets.all(12),
                decoration: BoxDecoration(
                  color: result.value.startsWith('Thành công')
                      ? Colors.green[50]
                      : Colors.red[50],
                  borderRadius: BorderRadius.circular(8),
                  border: Border.all(
                    color: result.value.startsWith('Thành công')
                        ? Colors.green[200]!
                        : Colors.red[200]!,
                  ),
                ),
                child: Text(
                  result.value,
                  style: TextStyle(
                    color: result.value.startsWith('Thành công')
                        ? Colors.green[800]
                        : Colors.red[800],
                  ),
                ),
              ),
          ],
        ),
      ),
    );
  }
}
