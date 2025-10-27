import 'package:elevate_super_fitness/core/api_result/api_result.dart';
import 'package:elevate_super_fitness/data/data_source/exercise_remote_data_source.dart';
import 'package:elevate_super_fitness/domain/entites/excercise_difficulty_level_entity.dart';
import 'package:elevate_super_fitness/domain/entites/get_selected_exercise_entity.dart';
import 'package:elevate_super_fitness/domain/repo/exercise_repo.dart';
import 'package:injectable/injectable.dart';

@Injectable(as: ExerciseRepo)
class ExerciseRepoImpl implements ExerciseRepo {
  final ExerciseRemoteDataSource _exerciseRemoteDataSource;
  ExerciseRepoImpl(this._exerciseRemoteDataSource);

  @override
  Future<ApiResult<List<ExcerciseDifficultyLevelEntity>>>
  getAllDifficultyLevelsByPrimeMoverMuscle({
    required String primeMoverMuscleId,
  }) {
    return _exerciseRemoteDataSource.getAllDifficultyLevelsByPrimeMoverMuscle(
      primeMoverMuscleId: primeMoverMuscleId,
    );
  }

  @override
  Future<ApiResult<List<GetSelectedExerciseEntity>>>
  getExercisesByPrimeMoverMuscleandDifficultyLevel({
    required String primeMoverMuscleId,
    required String difficultyLevelId,
  }) {
    return _exerciseRemoteDataSource
        .getExercisesByPrimeMoverMuscleandDifficultyLevel(
          primeMoverMuscleId: primeMoverMuscleId,
          difficultyLevelId: difficultyLevelId,
        );
  }
}
