import 'package:elevate_super_fitness/core/api_result/api_result.dart';
import 'package:elevate_super_fitness/domain/entites/exercise_difficulty_level_entity.dart';
import 'package:elevate_super_fitness/domain/entites/get_selected_exercise_entity.dart';

abstract interface class ExerciseRemoteDataSource {

  Future<ApiResult<List<ExerciseDifficultyLevelEntity>>>
  getAllDifficultyLevelsByPrimeMoverMuscle({
    required String primeMoverMuscleId,
  });

  Future<ApiResult<List<GetSelectedExerciseEntity>>> getExercisesByPrimeMoverMuscleandDifficultyLevel({
    required String primeMoverMuscleId,
    required String difficultyLevelId,
  });
}
