import 'package:elevate_super_fitness/core/api_result/api_result.dart';
import 'package:elevate_super_fitness/domain/entites/exercise_difficulty_level_entity.dart';
import 'package:elevate_super_fitness/domain/repo/exercise_repo.dart';
import 'package:injectable/injectable.dart';

@injectable
class GetAllDifficultyLevelsByPrimeMoverMuscleUseCase {
  final ExerciseRepo _exerciseRepo;
  GetAllDifficultyLevelsByPrimeMoverMuscleUseCase(this._exerciseRepo);

  Future<ApiResult<List<ExerciseDifficultyLevelEntity>>>
  call ({
    required String primeMoverMuscleId,
  }) {
    return _exerciseRepo.getAllDifficultyLevelsByPrimeMoverMuscle(
      primeMoverMuscleId: primeMoverMuscleId,
    );
  }
}