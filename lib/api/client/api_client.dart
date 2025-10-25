import 'package:dio/dio.dart';
import 'package:elevate_super_fitness/api/models/requests/login_request_dto.dart';
import 'package:elevate_super_fitness/api/models/responses/login_response_dto.dart';
import 'package:elevate_super_fitness/core/constants/end_points.dart';
import 'package:injectable/injectable.dart';
import 'package:retrofit/retrofit.dart';
import '../models/requests/auth/register/register_request.dart';
import '../models/responses/auth/register/register_response.dart';
import '../models/forget_password_request/email_verification_request_dto.dart';
import '../models/forget_password_request/forget_password_request_dto.dart';
import '../models/forget_password_request/reset_password_request_dto.dart';
import '../models/forget_password_response/email_verification_dto.dart';
import '../models/forget_password_response/forget_password_dto.dart';
import '../models/forget_password_response/reset_password_response_dto.dart';

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

  @POST(Endpoints.forgetPassword)
  Future<ForgetPasswordResponseDto> forgetPassword(
      @Body() ForgetPasswordRequestDto body,
      );

  @POST(Endpoints.verifyResetCode)
  Future<EmailVerificationDto>emailVerification(
      @Body() EmailVerificationRequestDto body
      );

  @PUT(Endpoints.resetPassword)
  Future<ResetPasswordResponseDto>resetPassword(
      @Body() ResetPasswordRequestDto body
      );

}
