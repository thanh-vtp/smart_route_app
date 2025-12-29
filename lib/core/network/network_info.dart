import 'package:internet_connection_checker/internet_connection_checker.dart';

abstract class NetworkInfo {
  /// Trả về true nếu thiết bị có kết nối internet thực tế
  Future<bool> get isConnected;

  /// Stream để lắng nghe thay đổi trạng thái mạng (tùy chọn)
  Stream<bool> get onStatusChange;
}

class NetworkInfoImpl implements NetworkInfo {
  final InternetConnectionChecker connectionChecker;

  NetworkInfoImpl(this.connectionChecker);

  @override
  Future<bool> get isConnected => connectionChecker.hasConnection;

  @override
  Stream<bool> get onStatusChange => connectionChecker.onStatusChange.map(
    (status) => status == InternetConnectionStatus.connected,
  );
}
