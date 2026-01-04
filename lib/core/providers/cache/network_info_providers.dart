import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:smart_route_app/core/network/network_info.dart';

part 'network_info_providers.g.dart';

@Riverpod(keepAlive: true)
InternetConnectionChecker internetConnectionChecker(
  InternetConnectionCheckerRef ref,
) {
  return InternetConnectionChecker.createInstance(
    checkInterval: const Duration(seconds: 5), // Kiểm tra mỗi 5s
    checkTimeout: const Duration(seconds: 3), // Timeout sau 3s
  );
}

@Riverpod(keepAlive: true)
NetworkInfo networkInfo(NetworkInfoRef ref) {
  final checker = ref.watch(internetConnectionCheckerProvider);
  return NetworkInfoImpl(checker);
}

@riverpod
Stream<bool> internetConnectionStream(InternetConnectionStreamRef ref) {
  final networkInfo = ref.watch(networkInfoProvider);
  return networkInfo.onStatusChange;
}
