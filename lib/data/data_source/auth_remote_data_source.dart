import 'package:elevate_super_fitness/core/api_result/api_result.dart';
import 'package:elevate_super_fitness/domain/entites/login_entity.dart';
import 'package:elevate_super_fitness/domain/entites/requests/login_request_entity.dart';
import '../../domain/entites/requests/register_request_entity.dart';
import '../../domain/entites/requests/email_verification_request_entity.dart';
import '../../domain/entites/requests/forget_password_request_entity.dart';
import '../../domain/entites/requests/reset_password_request_entity.dart';
import '../../domain/entites/email_verification_entity.dart';
import '../../domain/entites/forget_password_response_entity.dart';
import '../../domain/entites/reset_password_response_entity.dart';

abstract interface class AuthRemoteDataSource {
  Future<ApiResult<LoginResponseEntity>> login({
    required LoginRequestEntity request,
  });Future<ApiResult<String>> register(RegisterRequestEntity request);
  Future<ApiResult<ForgetPasswordResponseEntity>>forgetPassword(
      ForgetPasswordRequestEntity request,
      );

  Future<ApiResult<EmailVerificationEntity>> verifyResetCode(
      EmailVerificationRequestEntity request,
      );

  Future<ApiResult<ResetPasswordResponseEntity>> resetPassword(
      ResetPasswordRequestEntity request,
      );

  Future<ApiResult<String>> logout();
}
