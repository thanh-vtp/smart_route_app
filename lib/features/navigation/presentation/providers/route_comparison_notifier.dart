import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:smart_route_app/core/errors/failures.dart';
import 'package:smart_route_app/core/utils/utils.dart';
import 'package:smart_route_app/features/incident/domain/entities/incident.dart';
import 'package:smart_route_app/features/navigation/domain/entities/route_point.dart';
import 'package:smart_route_app/features/navigation/domain/entities/route_result.dart';
import 'package:smart_route_app/features/navigation/presentation/models/smart_route_result.dart';
import 'package:smart_route_app/features/navigation/presentation/providers/states/route_comparison_state.dart';
import 'package:smart_route_app/features/navigation/presentation/providers/usecase/use_case_providers.dart';

part 'route_comparison_notifier.g.dart';

@Riverpod(keepAlive: true)
class RouteComparisonNotifier extends _$RouteComparisonNotifier {
  @override
  RouteComparisonState build() => const RouteComparisonState.initial();

  Future<void> compareRoutes({
    required List<Map<String, double>> stops,
    required List<Incident> incidents,
  }) async {
    if (stops.length < 2) return;

    state = const RouteComparisonState.loading();

    // Mặc định bật Smart Mode nếu có sự cố
    final initialMode = incidents.isNotEmpty;

    try {
      final useCase = ref.read(calculateRouteUseCaseProvider);

      // --- CHIẾN THUẬT TỐI ƯU CHI PHÍ ---
      RouteResult? normalRouteData;
      SmartRouteResult? smartRouteData;

      // TRƯỜNG HỢP 1: Không có incidents nào
      // -> Chỉ gọi 1 API Normal, Smart Route chính là Normal Route

      AppLogger.info(
        'Total incidents to avoid: ${incidents.length} ',
        name: 'RouteComparisonNotifier',
      );

      if (incidents.isEmpty) {
        final result = await useCase(stops: stops, incidentsToAvoid: null);
        result.fold((l) => throw l, (r) {
          normalRouteData = r;
          smartRouteData = SmartRouteResult(
            route: r,
            avoidedIncidents: [],
            isOptimized: false,
          );
        });
      }
      // TRƯỜNG HỢP 2: Có incidents
      // -> Gọi 2 API song song (Future.wait) để lấy kết quả nhanh nhất
      else {
        AppLogger.info('Location incident: ', name: 'RouteComparisonNotifier');
        // for (var i = 0; i < incidents.length; i++) {
        //   AppLogger.info(
        //     '[$i] Loại sự cố: ${incidents[i].type}'
        //     ' Tọa độ: ${incidents[i].longitude}, ${incidents[i].latitude} ',
        //     name: 'RouteComparisonNotifier',
        //   );
        // }
        AppLogger.info(
          incidents
              .map((incident) {
                return '${incident.longitude},${incident.latitude}';
              })
              .join(';'),
          name: 'RouteComparisonNotifier',
        );

        // Gọi song song để tiết kiệm thời gian chờ
        final results = await Future.wait([
          // Request 1: Normal (Không barriers)
          useCase(stops: stops, incidentsToAvoid: null),
          // Request 2: Smart (Có barriers)
          useCase(stops: stops, incidentsToAvoid: incidents),
        ]);

        // Xử lý kết quả Normal
        results[0].fold((l) => throw l, (r) => normalRouteData = r);

        // Xử lý kết quả Smart
        results[1].fold(
          (l) => throw l, // Nếu tính smart lỗi thì coi như lỗi chung
          (r) {
            final avoidedIncidents = _findAvoidedIncidents(
              r.confirmedBarriers,
              incidents,
            );

            return smartRouteData = SmartRouteResult(
              route: r,
              avoidedIncidents: avoidedIncidents, // Danh sách sự cố đã được né
              isOptimized: true,
            );
          },
        );
      }

      // Lưu cả 2 vào State
      state = RouteComparisonState.loaded(
        normalRoute: normalRouteData!,
        smartRoute: smartRouteData!,
        isSmartMode: initialMode,
      );
    } catch (e) {
      // Xử lý lỗi mapping failure...
      state = RouteComparisonState.error(ArcGISFailure.unknown());
    }
  }

  // Hàm Toggle chuyển đổi tức thì (Không gọi API)
  void toggleMode() {
    state.mapOrNull(
      loaded: (s) {
        state = s.copyWith(isSmartMode: !s.isSmartMode);
      },
    );
  }

  List<Incident> _findAvoidedIncidents(
    List<RoutePoint> confirmedBarriers,
    List<Incident> allIncidents,
  ) {
    if (confirmedBarriers.isEmpty) return [];

    final avoidedList = <Incident>[];

    // Với mỗi barrier API trả về, tìm incident tương ứng trong list gốc
    // (So sánh tọa độ gần đúng vì API có thể làm tròn số)
    for (final barrier in confirmedBarriers) {
      try {
        // Tìm incident gần nhất với barrier này (khoảng cách < 5m)
        final match = allIncidents.firstWhere((incident) {
          final lat = incident.latitude;
          final lon = incident.longitude;

          return (lat - barrier.latitude).abs() < 0.0001 &&
              (lon - barrier.longitude).abs() < 0.0001;
        });
        avoidedList.add(match);
      } catch (e) {
        // Không tìm thấy match (hiếm khi xảy ra nếu data chuẩn)
      }
    }
    return avoidedList;
  }
}
