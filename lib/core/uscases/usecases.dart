import 'package:fpdart/fpdart.dart';
import 'package:smart_route_app/core/errors/failures.dart';

/// Định nghĩa lớp UseCase chung để các UseCase cụ thể kế thừa:
/// [Type] là kiểu dữ liệu trả về, [Params] là kiểu dữ liệu tham số truyền vào
abstract class UseCase<Type, Params> {
  Future<Either<Failure, Type>> call(Params params);
}
