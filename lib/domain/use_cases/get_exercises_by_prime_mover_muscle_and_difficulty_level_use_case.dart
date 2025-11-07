import 'package:elevate_super_fitness/core/api_result/api_result.dart';
import 'package:elevate_super_fitness/domain/entites/get_selected_exercise_entity.dart';
import 'package:elevate_super_fitness/domain/repo/exercise_repo.dart';
import 'package:injectable/injectable.dart';

@injectable
class GetExercisesByPrimeMoverMuscleAndDifficultyLevelUseCase {
  final ExerciseRepo _exerciseRepo;
  GetExercisesByPrimeMoverMuscleAndDifficultyLevelUseCase(this._exerciseRepo);

  Future<ApiResult<List<GetSelectedExerciseEntity>>>
  call({
    required String primeMoverMuscleId,
    required String difficultyLevelId,
  }) {
    return  _exerciseRepo.getExercisesByPrimeMoverMuscleandDifficultyLevel(
      primeMoverMuscleId: primeMoverMuscleId,
      difficultyLevelId: difficultyLevelId,
    );
  }
}
