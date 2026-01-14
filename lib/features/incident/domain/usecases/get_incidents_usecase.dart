import 'package:smart_route_app/core/errors/failures.dart';
import 'package:smart_route_app/core/uscases/usecases.dart';
import 'package:smart_route_app/features/incident/domain/entities/incident.dart';
import 'package:smart_route_app/features/incident/domain/repositories/incident_repository.dart';
import 'package:fpdart/fpdart.dart';

/// Enum để định nghĩa nguồn dữ liệu muốn lấy
enum IncidentDataSourceType {
  arcGIS, // Lấy để hiển thị lên bản đồ (Tối ưu visual)
  supabase, // Lấy để hiển thị danh sách/lịch sử (Tối ưu lọc, sort)
}

// Tạo lớp Params nhận 2 tham số source, userUid
class GetIncidentsParams {
  final IncidentDataSourceType source;
  final String userUid;

  const GetIncidentsParams({
    this.source = IncidentDataSourceType.arcGIS,
    required this.userUid,
  });
}

// Tạo lớp GetIncidentsUsecase thực hiện UseCase đã định nghĩa
// Truyền vào 2 tham số: danh sách trả về Incident và GetIncidentsParams
class GetIncidentsUsecase
    implements UseCase<List<Incident>, GetIncidentsParams> {
  final IncidentRepository repository;

  GetIncidentsUsecase(this.repository);
  @override
  Future<Either<Failure, List<Incident>>> call(
    GetIncidentsParams params,
  ) async {
    switch (params.source) {
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
            .getIncidentsFromSupabase(userUid: params.userUid);
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
