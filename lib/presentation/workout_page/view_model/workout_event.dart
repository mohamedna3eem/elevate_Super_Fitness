sealed class WorkoutEvents {}

class WorkoutEvent extends WorkoutEvents {}
class MusclesEvent extends WorkoutEvents {
  final String id;

   MusclesEvent({required this.id});
}
