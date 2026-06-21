import 'dart:async';
import 'dart:io';
import 'package:arcgis_maps/arcgis_maps.dart' as arcgis;
import 'package:fpdart/fpdart.dart';
import 'package:smart_route_app/core/errors/failures.dart';
import 'package:smart_route_app/common/app_logger.dart';
import 'package:smart_route_app/features/incident/data/datasources/arcgis_remote_data_source.dart';
import 'package:smart_route_app/features/incident/data/datasources/supabase_remote_data_source.dart';
import 'package:smart_route_app/features/incident/data/models/incident_supabase_model.dart';
import 'package:smart_route_app/features/incident/domain/entities/incident.dart';
import 'package:smart_route_app/features/incident/domain/repositories/incident_repository.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class IncidentRepositoryImpl implements IncidentRepository {
  final SupabaseRemoteDataSource supabaseDataSource;
  final ArcGISRemoteDataSource arcgisDataSource;

  IncidentRepositoryImpl(this.supabaseDataSource, this.arcgisDataSource);

  @override
  Future<Either<Failure, Incident>> createIncident(Incident incident) async {
    try {
      final modelToInsert = IncidentSupabaseModel.fromEntity(incident);
      final session = Supabase.instance.client.auth.currentSession;
      AppLogger.data('Current Supabase Token: ${session?.accessToken}');
      final createdModel = await supabaseDataSource.createIncident(
        modelToInsert,
      );
      return Right(createdModel.toEntity());
    } on SocketException {
      return const Left(NetworkFailure('Không có kết nối mạng.'));
    } catch (e) {
      return Left(ServerFailure('Lỗi khi gửi báo cáo: ${e.toString()}'));
    }
  }

  @override
  Future<Either<Failure, void>> deleteIncident(String id, String userId) async {
    try {
      await supabaseDataSource.deleteIncident(id, userId);
      return const Right(null);
    } on SocketException {
      return const Left(NetworkFailure('Không có kết nối mạng.'));
    } catch (e) {
      return Left(ServerFailure('Lỗi khi xóa báo cáo: ${e.toString()}'));
    }
  }

  @override
  Future<Either<Failure, Incident>> getIncidentDetail(String id) async {
    try {
      final model = await supabaseDataSource.getIncidentById(id);

      if (model == null) {
        return const Left(
          ServerFailure('Không tìm thấy sự cố này. Có thể đã bị xóa.'),
        );
      }

      return Right(model.toEntity());
    } on SocketException {
      return const Left(NetworkFailure('Không có kết nối mạng.'));
    } catch (e) {
      return Left(ServerFailure('Lỗi khi tải chi tiết: ${e.toString()}'));
    }
  }

  @override
  Future<Either<Failure, List<Incident>>> getIncidentsForMap({
    arcgis.Geometry? visibleExtent,
  }) async {
    try {
      final arcgisModels = await arcgisDataSource.getIncidents(
        visibleExtent: visibleExtent,
      );

      final entities = arcgisModels.map((model) => model.toEntity()).toList();

      AppLogger.debug(
        'incidents.length = ${entities.length}',
        name: 'IncidentRepositoryImpl',
      );

      return Right(entities);
    } on SocketException {
      return const Left(
        NetworkFailure('Không có kết nối mạng. Vui lòng kiểm tra lại.'),
      );
    } catch (e) {
      return Left(ServerFailure('Lỗi tải bản đồ: ${e.toString()}'));
    }
  }

  @override
  Future<Either<Failure, List<Incident>>> getMyIncidents(String userId) async {
    try {
      final models = await supabaseDataSource.getMyIncidents(userId);
      final entities = models.map((m) => m.toEntity()).toList();
      return Right(entities);
    } on SocketException {
      return const Left(NetworkFailure('Không có kết nối mạng.'));
    } catch (e) {
      return Left(ServerFailure('Lỗi khi tải lịch sử: ${e.toString()}'));
    }
  }

  @override
  Future<Either<Failure, Incident>> updateIncident(Incident incident) async {
    try {
      final modelToUpdate = IncidentSupabaseModel.fromEntity(incident);
      final updatedModel = await supabaseDataSource.updateIncident(
        modelToUpdate,
      );
      return Right(updatedModel.toEntity());
    } on SocketException {
      return const Left(NetworkFailure('Không có kết nối mạng.'));
    } catch (e) {
      return Left(ServerFailure('Lỗi khi cập nhật báo cáo: ${e.toString()}'));
    }
  }
}
