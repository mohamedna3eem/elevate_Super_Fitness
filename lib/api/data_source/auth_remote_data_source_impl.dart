import 'package:elevate_super_fitness/mapper/auth.dart';
import 'package:injectable/injectable.dart';

import '../../core/api_result/api_result.dart';
import '../../core/api_result/safe_api_call.dart';
import '../../data/data_source/auth_remote_data_source.dart';
import '../../domain/entites/forget_password_request/email_verification_request_entity.dart';
import '../../domain/entites/forget_password_request/forget_password_request_entity.dart';
import '../../domain/entites/forget_password_request/reset_password_request_entity.dart';
import '../../domain/entites/forget_password_response/email_verification_entity.dart';
import '../../domain/entites/forget_password_response/forget_password_response_entity.dart';
import '../../domain/entites/forget_password_response/reset_password_response_entity.dart';
import '../client/api_client.dart';

@Injectable(as: AuthRemoteDataSource)
class AuthRemoteDataSourceImpl implements AuthRemoteDataSource{
  ApiClient apiClient;
  AuthRemoteDataSourceImpl(this.apiClient);

  @override
  Future<ApiResult<ForgetPasswordResponseEntity>>
  forgetPassword(ForgetPasswordRequestEntity request) {
    // TODO: implement forgetPassword
    return safeApiCall(
          () =>apiClient.forgetPassword(request.fromDomain()) ,
          (response) => response.toEntity(),
    );
  }

  @override
  Future<ApiResult<EmailVerificationEntity>> verifyResetCode(
      EmailVerificationRequestEntity request,
      ) async {
    return safeApiCall(
          () =>apiClient.emailVerification(request.fromDomain()) ,
          (response) => response.toEntity(),
    );
  }

  @override
  Future<ApiResult<ResetPasswordResponseEntity>> resetPassword(
      ResetPasswordRequestEntity request,
      ) async {
    return safeApiCall(
          () => apiClient.resetPassword(request.fromDomain()),
          (response) => response.toEntity(),
    );
  }
}