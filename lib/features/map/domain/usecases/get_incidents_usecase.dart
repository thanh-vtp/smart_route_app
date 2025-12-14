import 'package:smart_route_app/core/errors/failures.dart';
import 'package:smart_route_app/features/map/domain/entities/incident.dart';
import 'package:smart_route_app/features/map/domain/repositories/incident_repository.dart';
import 'package:fpdart/fpdart.dart';

/// Enum để định nghĩa nguồn dữ liệu muốn lấy
enum IncidentDataSourceType {
  arcGIS, // Lấy để hiển thị lên bản đồ (Tối ưu visual)
  supabase, // Lấy để hiển thị danh sách/lịch sử (Tối ưu lọc, sort)
}

class GetIncidentsUsecase {
  final IncidentRepository repository;

  GetIncidentsUsecase(this.repository);

  Future<Either<Failure, List<Incident>>> call({
    IncidentDataSourceType source = IncidentDataSourceType.arcGIS,
    required String userUid,
  }) async {
    switch (source) {
      case IncidentDataSourceType.arcGIS:
        final repositoryArcgisResult = await repository
            .getIncidentsFormArcGis();
        return repositoryArcgisResult.fold(
          (failure) {
            return left(failure);
          },
          (result) {
            return right(result);
          },
        );
      case IncidentDataSourceType.supabase:
        final repositorySupabaseResult = await repository
            .getIncidentsFromSupabase(userUid: userUid);
        return repositorySupabaseResult.fold(
          (failure) {
            return left(failure);
          },
          (result) {
            return right(result);
          },
        );
    }
  }
}
