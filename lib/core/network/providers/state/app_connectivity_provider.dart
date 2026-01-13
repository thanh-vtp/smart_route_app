import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:smart_route_app/core/network/providers/network_info_providers.dart';

part 'app_connectivity_provider.g.dart';

enum ConnectivityStatus { loading, online, offline }

@Riverpod(keepAlive: true)
class AppConnectivity extends _$AppConnectivity {
  @override
  ConnectivityStatus build() {
    // 1. Lắng nghe Stream từ provider bạn đã tạo
    final streamAsync = ref.watch(internetConnectionStreamProvider);

    // 2. Xử lý AsyncValue
    return streamAsync.when(
      data: (isConnected) {
        return isConnected
            ? ConnectivityStatus.online
            : ConnectivityStatus.offline;
      },
      error: (_, __) =>
          ConnectivityStatus.offline, // Lỗi stream coi như offline
      loading: () => ConnectivityStatus.loading,
    );
  }
}
