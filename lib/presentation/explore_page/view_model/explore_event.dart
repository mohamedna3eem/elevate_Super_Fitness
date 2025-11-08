sealed class ExploreEvent {}

class ExploreGetAllDataEvent extends ExploreEvent {}

class ExploreGetMusclesByMuscleGroupIdEvent extends ExploreEvent {
  final String id;

  ExploreGetMusclesByMuscleGroupIdEvent(this.id);
}
