import 'package:flutter_test/flutter_test.dart';
import 'package:fpdart/fpdart.dart';
import 'package:smart_route_app/core/errors/failures.dart';
import 'package:smart_route_app/features/incident/domain/entities/incident.dart'
    as entity;
import 'package:smart_route_app/features/incident/domain/repositories/incident_repository.dart';
import 'package:smart_route_app/features/incident/domain/usecases/get_incidents_usecase.dart';
import 'package:mockito/mockito.dart';
import 'package:mockito/annotations.dart';

import 'get_incidents_usecase_test.mocks.dart';

@GenerateMocks([IncidentRepository])
void main() {
  late GetIncidentsUsecase usecase;
  late MockIncidentRepository mockIncidentRepository;

  setUp(() {
    mockIncidentRepository = MockIncidentRepository();
    // Provide dummy value for Either type
    provideDummy<Either<Failure, List<entity.Incident>>>(
      right(<entity.Incident>[]),
    );
    usecase = GetIncidentsUsecase(mockIncidentRepository);
  });

  final tReportedTime = DateTime(2025, 12, 20, 10, 0, 0);

  final tIncidentArGIS = entity.Incident(
    id: 'incident_1',
    latitude: (10.762622).toString(),
    longitude: (106.660172).toString(),
    type: 'accident',
    severity: 'high',
    description: 'A major accident on the highway.',
    reportedTime: tReportedTime,
    reportedBy: 'User A',
  );

  test('shoud get incidents for ArcGIS from the repository', () async {
    // arrange
    when(mockIncidentRepository.getIncidentsFormArcGis()).thenAnswer(
      (_) async => Right<Failure, List<entity.Incident>>([tIncidentArGIS]),
    );
    // act
    final result = await usecase.call(
      GetIncidentsParams(
        source: IncidentDataSourceType.arcGIS,
        userUid: 'user_1',
      ),
    );

    // assert
    result.fold((failure) => fail('Expected Right but got Left: $failure'), (
      incidents,
    ) {
      expect(incidents, [tIncidentArGIS]);
    });
    verify(mockIncidentRepository.getIncidentsFormArcGis());
    verifyNoMoreInteractions(mockIncidentRepository);
  });
}
