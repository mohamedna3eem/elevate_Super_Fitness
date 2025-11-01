import 'package:elevate_super_fitness/domain/entites/workout_response/muscles_by_id.dart';

import '../../core/api_result/api_result.dart';
import '../../domain/entites/workout_response/workout_response.dart';

abstract interface class WorkoutRemoteDataSource {
  Future <ApiResult<WorkoutResponseEntity>> workout();

  Future <ApiResult<MusclesByIdEntity>> getAllMuscles(String id);

}