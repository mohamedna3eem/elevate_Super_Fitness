import 'package:dio/dio.dart';
import 'package:elevate_super_fitness/api/models/requests/change_password_request_dto.dart';
import 'package:elevate_super_fitness/api/models/requests/login_request_dto.dart';
import 'package:elevate_super_fitness/api/models/responses/change_password_response_dto.dart';
import 'package:elevate_super_fitness/api/models/responses/login_response_dto.dart';
import 'package:elevate_super_fitness/api/models/responses/muscle_group_details_dto.dart';
import 'package:elevate_super_fitness/api/models/responses/muscles_group_response_dto.dart';
import 'package:elevate_super_fitness/api/models/responses/muscles_response_dto.dart';
import 'package:elevate_super_fitness/api/models/responses/user_info_dto.dart';
import 'package:elevate_super_fitness/core/constants/end_points.dart';
import 'package:injectable/injectable.dart';
import 'package:retrofit/retrofit.dart';
import '../models/requests/register_request.dart';
import '../models/responses/register_response.dart';

part 'api_client.g.dart';

@injectable
@RestApi()
abstract class ApiClient {
  @factoryMethod
  factory ApiClient(Dio dio) = _ApiClient;
  @POST(Endpoints.signIn)
  Future<LoginResponseDto> login(@Body() LoginRequestDto request);
  @GET(Endpoints.randomPrimeMoverMuscles)
  Future<MusclesResponseDto> getRandomMuscles();
  @GET(Endpoints.allMusclesGroups)
  Future<MusclesGroupResponseDto> getAllMusclesGroups();
  @GET("${Endpoints.musclesByMuscleGroupId}/{id}")
  Future<MuscleGroupDetailsDto> getAllMusclesByMuscleGroupId(
    @Path("id") String id,
  );
  @GET(Endpoints.loggedUserData)
  Future<UserInfoDto> getGetLoggedUserData();
  @PATCH(Endpoints.changePassword)
  Future<ChangePasswordResponseDto> changePassword(
    @Body() ChangePasswordRequestDto request,
  );

  @POST(Endpoints.signUp)
  Future<RegisterResponse> register(@Body() RegisterRequest request);
}
