// Map cần:
// selected marker
// highlighted route
// focused object
// navigation target
class InteractionState {
  final String? selectedIncidentId;

  const InteractionState({this.selectedIncidentId});

  factory InteractionState.initial() {
    return const InteractionState();
  }

  InteractionState copyWith({String? selectedIncidentId}) {
    return InteractionState(selectedIncidentId: selectedIncidentId);
  }
}
