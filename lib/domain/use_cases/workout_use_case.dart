import 'package:elevate_super_fitness/core/api_result/api_result.dart';
import 'package:elevate_super_fitness/domain/repo/workout_repo.dart';
import 'package:injectable/injectable.dart';
import '../entites/workout_response/workout_response.dart';

@injectable
class WorkoutUseCase {
  final WorkoutRepo _repo;
  WorkoutUseCase(this._repo);
  Future<ApiResult<WorkoutResponseEntity>> call() async {
    return _repo.workout();
  }
}
