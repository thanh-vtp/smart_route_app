import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:smart_route_app/core/network/network_info.dart';

part 'network_info_providers.g.dart';

// Provider để kiểm tra kết nối Internet
@Riverpod(keepAlive: true)
InternetConnectionChecker internetConnectionChecker(Ref ref) {
  return InternetConnectionChecker.createInstance(
    checkInterval: const Duration(seconds: 5), // Kiểm tra mỗi 5s
    checkTimeout: const Duration(seconds: 3), // Timeout sau 3s
  );
}

// Provider để cung cấp NetworkInfo
@Riverpod(keepAlive: true)
NetworkInfo networkInfo(Ref ref) {
  final checker = ref.watch(internetConnectionCheckerProvider);
  return NetworkInfoImpl(checker);
}

// Provider để cung cấp stream kết nối Internet
@riverpod
Stream<bool> internetConnectionStream(Ref ref) {
  final networkInfo = ref.watch(networkInfoProvider);
  return networkInfo.onStatusChange;
}
