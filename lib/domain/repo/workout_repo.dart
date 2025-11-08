import 'package:elevate_super_fitness/core/api_result/api_result.dart';
import 'package:elevate_super_fitness/domain/entites/workout_response/workout_response.dart';
import '../entites/workout_response/muscles_by_id.dart';

abstract interface class WorkoutRepo {
  Future<ApiResult<WorkoutResponseEntity>> workout();

  Future<ApiResult<MusclesByIdEntity>> getAllMuscles(String id);
}
