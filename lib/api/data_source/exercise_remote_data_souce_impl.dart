import 'package:elevate_super_fitness/api/client/api_client.dart';
import 'package:elevate_super_fitness/api/mapper/exercise_mapper.dart';
import 'package:elevate_super_fitness/core/api_result/api_result.dart';
import 'package:elevate_super_fitness/core/api_result/safe_api_call.dart';
import 'package:elevate_super_fitness/data/data_source/exercise_remote_data_source.dart';
import 'package:elevate_super_fitness/domain/entites/exercise_difficulty_level_entity.dart';
import 'package:elevate_super_fitness/domain/entites/get_selected_exercise_entity.dart';
import 'package:injectable/injectable.dart';

@Injectable(as: ExerciseRemoteDataSource)
class ExerciseRemoteDataSouceImpl implements ExerciseRemoteDataSource {
  final ApiClient _apiClient;
  ExerciseRemoteDataSouceImpl(this._apiClient);

  @override
  Future<ApiResult<List<ExerciseDifficultyLevelEntity>>>
  getAllDifficultyLevelsByPrimeMoverMuscle({
    required String primeMoverMuscleId,
  }) {
    return safeApiCall(
      () => _apiClient.getAllDifficultyLevelsByPrimeMoverMuscle(
        primeMoverMuscleId,
      ),
      (response) =>
          response.difficultyLevels!.map((e) => e.toEntity()).toList(),
    );
  }

  @override
  Future<ApiResult<List<GetSelectedExerciseEntity>>>
  getExercisesByPrimeMoverMuscleandDifficultyLevel({
    required String primeMoverMuscleId,
    required String difficultyLevelId,
  }) {
    return safeApiCall(
      () => _apiClient.getExercisesByPrimeMoverMuscleAndDifficultyLevel(
        primeMoverMuscleId,
        difficultyLevelId,
      ),
      (response) => response.exercises!.map((e) => e.toEntity()).toList(),
    );
  }
}
