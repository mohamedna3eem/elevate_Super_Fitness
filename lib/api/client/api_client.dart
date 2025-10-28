import 'package:dio/dio.dart';
import 'package:elevate_super_fitness/api/models/responses/exercise_difficulty_levels_response_dto/exercise_difficulty_levels_response_dto.dart';
import 'package:elevate_super_fitness/api/models/responses/get_selected_exercises_reponse_dto/get_selected_exercises_reponse_dto.dart';
import 'package:elevate_super_fitness/core/constants/end_points.dart';
import 'package:injectable/injectable.dart';
import 'package:retrofit/retrofit.dart';

part 'api_client.g.dart';

@injectable
@RestApi()
abstract class ApiClient {
  @factoryMethod
  factory ApiClient(Dio dio) = _ApiClient;

  @GET(Endpoints.getAllDifficultyLevelsByPrimeMoverMuscle)
  Future<ExerciseDifficultyLevelsResponseDto> getAllDifficultyLevelsByPrimeMoverMuscle(
      @Query("primeMoverMuscleId") String primeMoverMuscleId
  );

  @GET(Endpoints.getExercisesByPrimeMoverMuscleandDifficultyLevel)
  Future<GetSelectedExercisesReponseDto> getExercisesByPrimeMoverMuscleandDifficultyLevel(
      @Query("primeMoverMuscleId") String primeMoverMuscleId,
      @Query("difficultyLevelId") String difficultyLevelId
  );

}
