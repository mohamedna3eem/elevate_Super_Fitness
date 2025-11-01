import 'package:elevate_super_fitness/api/client/api_client.dart';
import 'package:elevate_super_fitness/api/mapper/workout_mapper.dart';
import 'package:elevate_super_fitness/api/models/workout_response/muscles_by_id.dart';
import 'package:elevate_super_fitness/api/models/workout_response/workout_response.dart';
import 'package:elevate_super_fitness/core/api_result/api_result.dart';
import 'package:elevate_super_fitness/core/api_result/safe_api_call.dart';
import 'package:elevate_super_fitness/domain/entites/workout_response/muscles_by_id.dart';
import 'package:elevate_super_fitness/domain/entites/workout_response/workout_response.dart';
import 'package:injectable/injectable.dart';
import '../../data/data_source/workout_remote_data_source.dart';

@Injectable(as: WorkoutRemoteDataSource)
class WorkoutRemoteDataSourceImpl implements WorkoutRemoteDataSource {
  ApiClient _apiClient;
  WorkoutRemoteDataSourceImpl(this._apiClient);
  @override
  Future<ApiResult<WorkoutResponseEntity>> workout() async {
    // TODO: implement workout
    return safeApiCall<WorkoutResponseDto, WorkoutResponseEntity>(() async {
      final response = await _apiClient.workout();
      return response;
    }, (response) => response.toEntity());
  }

  @override
  Future<ApiResult<MusclesByIdEntity>> getAllMuscles(String id) {

      return safeApiCall<MusclesByIdDto, MusclesByIdEntity>(() async {
        final response = await _apiClient.getAllMucsles(id);
        return response;
      }, (response) => response.toEntity());
  }
}
