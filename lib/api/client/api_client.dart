import 'package:dio/dio.dart';
import 'package:elevate_super_fitness/api/models/requests/login_request_dto.dart';
import 'package:elevate_super_fitness/api/models/responses/login_response_dto.dart';
import 'package:elevate_super_fitness/core/constants/end_points.dart';
import 'package:injectable/injectable.dart';
import 'package:retrofit/retrofit.dart';

import '../models/requests/auth/register/register_request.dart';
import '../models/responses/auth/register/register_response.dart';

part 'api_client.g.dart';

@injectable
@RestApi()
abstract class ApiClient {
  @factoryMethod
  factory ApiClient(Dio dio) = _ApiClient;
  @POST(Endpoints.signIn)
  Future<LoginResponseDto> login(@Body()LoginRequestDto request);

  @POST(Endpoints.signUp)
  Future<RegisterResponse> register(@Body() RegisterRequest request);
}
