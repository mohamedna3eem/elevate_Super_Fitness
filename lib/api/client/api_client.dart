import 'package:dio/dio.dart';
import 'package:elevate_super_fitness/api/models/requests/login_request_dto.dart';
import 'package:elevate_super_fitness/api/models/responses/login_response_dto.dart';
import 'package:elevate_super_fitness/api/models/workout_response/muscles_by_id.dart';
import 'package:elevate_super_fitness/api/models/workout_response/workout_response.dart';
import 'package:elevate_super_fitness/core/constants/end_points.dart';
import 'package:injectable/injectable.dart';
import 'package:retrofit/retrofit.dart';

part 'api_client.g.dart';

@injectable
@RestApi()
abstract class ApiClient {
  @factoryMethod
  factory ApiClient(Dio dio) = _ApiClient;
  @POST(Endpoints.signIn)
  Future<LoginResponseDto> login(@Body()LoginRequestDto request);

  @GET(Endpoints.workouts)
  Future<WorkoutResponseDto> workout();

  @GET(Endpoints.muscles)
  Future<MusclesByIdDto> getAllMucsles( @Path("id") String id );
}
