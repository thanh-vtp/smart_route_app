import 'dart:async';
import 'dart:io';

import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'connectivity_provider.g.dart';

/// Enum trạng thái kết nối internet
enum InternetStatus { connected, disconnected, unknown }

/// Provider theo dõi trạng thái internet realtime
@riverpod
class InternetStatusNotifier extends _$InternetStatusNotifier {
  StreamSubscription<List<ConnectivityResult>>? _subscription;

  @override
  InternetStatus build() {
    // Khởi tạo với trạng thái unknown
    _startListening();

    // Cleanup khi provider bị dispose
    ref.onDispose(() {
      _subscription?.cancel();
    });

    return InternetStatus.unknown;
  }

  void _startListening() {
    // Kiểm tra trạng thái ban đầu
    _checkInitialStatus();

    // Lắng nghe thay đổi connectivity
    _subscription = Connectivity().onConnectivityChanged.listen((
      results,
    ) async {
      // results là List<ConnectivityResult>
      final hasConnection = results.any((r) => r != ConnectivityResult.none);

      if (hasConnection) {
        // Có kết nối mạng, kiểm tra thực sự có internet không
        final hasInternet = await _hasRealInternet();
        state = hasInternet
            ? InternetStatus.connected
            : InternetStatus.disconnected;
      } else {
        state = InternetStatus.disconnected;
      }
    });
  }

  Future<void> _checkInitialStatus() async {
    final results = await Connectivity().checkConnectivity();
    final hasConnection = results.any((r) => r != ConnectivityResult.none);

    if (hasConnection) {
      final hasInternet = await _hasRealInternet();
      state = hasInternet
          ? InternetStatus.connected
          : InternetStatus.disconnected;
    } else {
      state = InternetStatus.disconnected;
    }
  }

  /// Kiểm tra thực sự có internet bằng cách ping DNS
  Future<bool> _hasRealInternet() async {
    try {
      final result = await InternetAddress.lookup(
        'google.com',
      ).timeout(const Duration(seconds: 3));
      return result.isNotEmpty && result[0].rawAddress.isNotEmpty;
    } on SocketException catch (_) {
      return false;
    } on TimeoutException catch (_) {
      return false;
    } catch (_) {
      return false;
    }
  }

  /// Kiểm tra lại trạng thái internet (manual refresh)
  Future<void> refresh() async {
    await _checkInitialStatus();
  }
}
