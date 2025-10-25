import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:retrofit/retrofit.dart';

import '../../core/constants/end_points.dart';
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
