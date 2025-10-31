sealed class ExerciseEvents {}

class OnLoadDifficultyLevelsEvent extends ExerciseEvents {
  final String primeMoverMuscleId;
  OnLoadDifficultyLevelsEvent({required this.primeMoverMuscleId});
}

class OnLoadExercisesEvent extends ExerciseEvents {
  final String primeMoverMuscleId;
  final String difficultyLevelId;
  OnLoadExercisesEvent({
    required this.primeMoverMuscleId,
    required this.difficultyLevelId,
  });
}
