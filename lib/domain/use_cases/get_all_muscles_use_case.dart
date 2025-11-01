import 'package:elevate_super_fitness/core/api_result/api_result.dart';
import 'package:elevate_super_fitness/domain/entites/workout_response/muscles_by_id.dart';
import 'package:elevate_super_fitness/domain/repo/workout_repo.dart';
import 'package:injectable/injectable.dart';

@injectable
class GetAllMusclesUseCase {
  final WorkoutRepo _repo;
  GetAllMusclesUseCase(this._repo);
  Future<ApiResult<MusclesByIdEntity>> call(String id) async {
    return _repo.getAllMuscles(id);
  }
}
