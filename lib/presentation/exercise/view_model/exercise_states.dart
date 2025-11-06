import 'package:elevate_super_fitness/domain/entites/exercise_difficulty_level_entity.dart';
import 'package:elevate_super_fitness/domain/entites/get_selected_exercise_entity.dart';
import 'package:equatable/equatable.dart';

class ExerciseStates extends Equatable {
  final bool difficultyLevelsLoading;
  final List<ExerciseDifficultyLevelEntity> difficultyLevelsSuccess;
  final String? difficultyLevelsErrorMessage;
  final bool exercisesListLoading;
  final List<GetSelectedExerciseEntity> exercisesListSuccess;
  final String? exercisesListErrorMessage;
  const ExerciseStates({
    this.difficultyLevelsLoading = false,
    this.difficultyLevelsSuccess = const [],
    this.difficultyLevelsErrorMessage,
    this.exercisesListLoading = false,
    this.exercisesListSuccess = const [],
    this.exercisesListErrorMessage
  });

  ExerciseStates copyWith({
    bool? difficultyLevelsLoading,
    List<ExerciseDifficultyLevelEntity>? difficultyLevelsSuccess,
    String? difficultyLevelsErrorMessage,
    bool? exercisesListLoading,
    List<GetSelectedExerciseEntity>? exercisesListSuccess,
    String? exercisesListErrorMessage

  }) {
    return ExerciseStates(
      difficultyLevelsLoading:
          difficultyLevelsLoading ?? this.difficultyLevelsLoading,
      difficultyLevelsSuccess:
          difficultyLevelsSuccess ?? this.difficultyLevelsSuccess,
      difficultyLevelsErrorMessage: difficultyLevelsErrorMessage,
      exercisesListLoading: exercisesListLoading ?? this.exercisesListLoading,
      exercisesListSuccess: exercisesListSuccess ?? this.exercisesListSuccess,
      exercisesListErrorMessage: exercisesListErrorMessage
    );
  }

  @override
  List<Object?> get props => [
    difficultyLevelsLoading,
    difficultyLevelsSuccess,
    difficultyLevelsErrorMessage,
    exercisesListLoading,
    exercisesListSuccess,
    exercisesListErrorMessage
  ];
}
