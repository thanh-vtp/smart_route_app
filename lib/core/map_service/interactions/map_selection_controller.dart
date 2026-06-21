import 'interaction_state.dart';

/// Quản lý selection state
class MapSelectionController {
  InteractionState _state = InteractionState.initial();

  InteractionState get state => _state;

  void selectIncident(String incidentId) {
    _state = _state.copyWith(selectedIncidentId: incidentId);
  }

  void clearSelection() {
    _state = InteractionState.initial();
  }
}
