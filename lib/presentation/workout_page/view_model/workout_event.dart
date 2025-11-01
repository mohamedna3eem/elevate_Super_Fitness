sealed class WorkoutEvents {}

class WorkoutEvent extends WorkoutEvents {}

class MusclesEvent extends WorkoutEvents {
  final String id;
  String? selectedTab;
  MusclesEvent({required this.id, this.selectedTab});
}
