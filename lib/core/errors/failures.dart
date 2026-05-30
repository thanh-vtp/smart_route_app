import 'package:equatable/equatable.dart';

abstract class Failure extends Equatable {
  final String message;

  const Failure(this.message);

  @override
  List<Object> get props => [message];
}

// Lỗi do Server (Supabase/ArcGIS)
class ServerFailure extends Failure {
  const ServerFailure(super.message);
}

// Lỗi do mất mạng
class NetworkFailure extends Failure {
  const NetworkFailure(super.message);
}
