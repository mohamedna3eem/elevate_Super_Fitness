import '../../core/api_result/api_result.dart';
import '../entites/forget_password_request/email_verification_request_entity.dart';
import '../entites/forget_password_request/forget_password_request_entity.dart';
import '../entites/forget_password_request/reset_password_request_entity.dart';
import '../entites/forget_password_response/email_verification_entity.dart';
import '../entites/forget_password_response/forget_password_response_entity.dart';
import '../entites/forget_password_response/reset_password_response_entity.dart';

abstract interface class AuthRepo {

  Future <ApiResult<ForgetPasswordResponseEntity>>forgetPassword(
      ForgetPasswordRequestEntity request,
      );

  Future<ApiResult<EmailVerificationEntity>> verifyResetCode(
      EmailVerificationRequestEntity request,
      );

  Future<ApiResult<ResetPasswordResponseEntity>> resetPassword(
      ResetPasswordRequestEntity request,
      );
}