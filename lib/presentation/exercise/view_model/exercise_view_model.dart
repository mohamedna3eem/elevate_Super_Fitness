import 'package:elevate_super_fitness/core/api_result/api_result.dart';
import 'package:elevate_super_fitness/domain/entites/exercise_difficulty_level_entity.dart';
import 'package:elevate_super_fitness/domain/entites/get_selected_exercise_entity.dart';
import 'package:elevate_super_fitness/domain/use_cases/get_all_difficulty_levels_by_prime_mover_muscle_use_case.dart';
import 'package:elevate_super_fitness/domain/use_cases/get_exercises_by_prime_mover_muscle_and_difficulty_level_use_case.dart';
import 'package:elevate_super_fitness/presentation/exercise/view_model/exercise_events.dart';
import 'package:elevate_super_fitness/presentation/exercise/view_model/exercise_states.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

@injectable
class ExerciseViewModel extends Cubit<ExerciseStates> {
  final GetAllDifficultyLevelsByPrimeMoverMuscleUseCase
  _getAllDifficultyLevelsByPrimeMoverMuscleUseCase;
  final GetExercisesByPrimeMoverMuscleAndDifficultyLevelUseCase
  _getExercisesByPrimeMoverMuscleAndDifficultyLevelUseCase;

  ExerciseViewModel(
    this._getAllDifficultyLevelsByPrimeMoverMuscleUseCase,
    this._getExercisesByPrimeMoverMuscleAndDifficultyLevelUseCase,
  ) : super(const ExerciseStates());

  void doIntent(ExerciseEvents event) {
    switch (event) {
      case OnLoadDifficultyLevelsEvent():
        _getAllDifficultyLevelsByPrimeMoverMuscle(event.primeMoverMuscleId);
        break;
      case OnLoadExercisesEvent():
        _getExercisesByPrimeMoverMuscleandDifficultyLevel(
          event.primeMoverMuscleId,
          event.difficultyLevelId,
        );
    }
  }

  Future<void> _getAllDifficultyLevelsByPrimeMoverMuscle(
    String primeMoverMuscleId,
  ) async {
    emit(state.copyWith(difficultyLevelsLoading: true));
    final result = await _getAllDifficultyLevelsByPrimeMoverMuscleUseCase.call(
      primeMoverMuscleId: primeMoverMuscleId,
    );
    switch (result) {
      case ApiSuccessResult<List<ExerciseDifficultyLevelEntity>>():
        emit(
          state.copyWith(
            difficultyLevelsLoading: false,
            difficultyLevelsSuccess: result.data,
          ),
        );
      case ApiErrorResult<List<ExerciseDifficultyLevelEntity>>():
        emit(
          state.copyWith(
            difficultyLevelsLoading: false,
            difficultyLevelsErrorMessage: result.errorMessage,
          ),
        );
    }
  }

  Future<void> _getExercisesByPrimeMoverMuscleandDifficultyLevel(
    String primeMoverMuscleId,
    String difficultyLevelId,
  ) async {
    emit(state.copyWith(exercisesListLoading: true));
    final result =
        await _getExercisesByPrimeMoverMuscleAndDifficultyLevelUseCase.call(
          primeMoverMuscleId: primeMoverMuscleId,
          difficultyLevelId: difficultyLevelId,
        );
    switch (result) {
      case ApiSuccessResult<List<GetSelectedExerciseEntity>>():
        emit(
          state.copyWith(
            exercisesListLoading: false,
            exercisesListSuccess: result.data,
          ),
        );
      case ApiErrorResult<List<GetSelectedExerciseEntity>>():
        emit(
          state.copyWith(
            exercisesListLoading: false,
            exercisesListErrorMessage: result.errorMessage,
          ),
        );
    }
  }
}
