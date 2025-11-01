import 'package:elevate_super_fitness/core/api_result/api_result.dart';
import 'package:elevate_super_fitness/data/data_source/workout_remote_data_source.dart';
import 'package:elevate_super_fitness/domain/entites/workout_response/muscles_by_id.dart';

import 'package:elevate_super_fitness/domain/entites/workout_response/workout_response.dart';
import 'package:injectable/injectable.dart';

import '../../domain/repo/workout_repo.dart';

@Injectable(as: WorkoutRepo)
class WorkoutRepoImpl implements WorkoutRepo{
  final WorkoutRemoteDataSource _workoutRemoteDataSource;

  WorkoutRepoImpl(this._workoutRemoteDataSource);

  @override
  Future<ApiResult<WorkoutResponseEntity>> workout() async{

    final response= await _workoutRemoteDataSource.workout();

    return response;
  }

  @override
  Future<ApiResult<MusclesByIdEntity>> getAllMuscles(String id) async {
    final response= await _workoutRemoteDataSource.getAllMuscles(id);

    return response;
  }

}