import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:smart_route_app/features/navigation/domain/usecases/calculate_route_usecase.dart';
import 'package:smart_route_app/features/navigation/presentation/providers/repositories/repository_providers.dart';

part 'use_case_providers.g.dart';

@riverpod
CalculateRouteUseCase calculateRouteUseCase(CalculateRouteUseCaseRef ref) {
  final repository = ref.watch(routingRepositoryProvider);
  return CalculateRouteUseCase(repository);
}
