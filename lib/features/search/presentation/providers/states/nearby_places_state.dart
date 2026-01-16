import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:smart_route_app/core/errors/failures.dart';
import 'package:smart_route_app/features/search/domain/entities/emergency_category.dart';
import 'package:smart_route_app/features/search/domain/entities/nearby_place.dart';

part 'nearby_places_state.freezed.dart';

@freezed
class NearbyPlacesState with _$NearbyPlacesState {
  const factory NearbyPlacesState.initial() = _Initial;

  const factory NearbyPlacesState.loading() = _Loading;

  const factory NearbyPlacesState.loaded({
    required List<NearbyPlace> places,
    required List<NearbyPlace> filteredPlaces,
    required EmergencyCategory? selectedCategory,
  }) = _Loaded;

  const factory NearbyPlacesState.error({required Failure failure}) = _Error;
}
