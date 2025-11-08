import 'package:elevate_super_fitness/core/api_result/api_result.dart';
import 'package:elevate_super_fitness/data/data_source/auth_local_data_source.dart';
import 'package:elevate_super_fitness/data/data_source/auth_remote_data_source.dart';
import 'package:elevate_super_fitness/domain/entites/login_entity.dart';
import 'package:elevate_super_fitness/domain/entites/requests/login_request_entity.dart';
import 'package:elevate_super_fitness/domain/entites/requests/register_request_entity.dart';
import 'package:injectable/injectable.dart';
import '../../domain/entites/requests/email_verification_request_entity.dart';
import '../../domain/entites/requests/forget_password_request_entity.dart';
import '../../domain/entites/requests/reset_password_request_entity.dart';
import '../../domain/entites/email_verification_entity.dart';
import '../../domain/entites/forget_password_response_entity.dart';
import '../../domain/entites/reset_password_response_entity.dart';
import '../../domain/repo/auth_repo.dart';

@Injectable(as: AuthRepo)
class AuthRepoImpl implements AuthRepo {
  final AuthRemoteDataSource _authRemoteDataSource;
  final AuthLocalDataSource _authLocalDataSource;

  AuthRepoImpl(this._authRemoteDataSource, this._authLocalDataSource);
  @override
  Future<ApiResult<LoginResponseEntity>> login({
    required LoginRequestEntity request,
  }) async {
    final responseEntity = await _authRemoteDataSource.login(request: request);
    if (responseEntity is ApiSuccessResult<LoginResponseEntity>) {
      final loginData = responseEntity.data;
      final token = loginData.token ?? '';
      await _authLocalDataSource.saveLoginData(
        rememberMe: request.rememberMe,
        token: token,
      );
    }
    return responseEntity;
  }

  @override
  Future<ApiResult<String>> register(RegisterRequestEntity request) {
    return _authRemoteDataSource.register(request);
  }
    @override
  Future<ApiResult<ForgetPasswordResponseEntity>>
  forgetPassword(ForgetPasswordRequestEntity request) {
    return _authRemoteDataSource.forgetPassword(request);
  }
  @override
  Future<ApiResult<EmailVerificationEntity>> verifyResetCode(
      EmailVerificationRequestEntity request,
      ) {
    return _authRemoteDataSource.verifyResetCode(request);
  }

  @override
  Future<ApiResult<ResetPasswordResponseEntity>> resetPassword(
      ResetPasswordRequestEntity request,
      ) {
    return _authRemoteDataSource.resetPassword(request);
  }

  @override
  Future<ApiResult<String>> logout() async {
    await _authLocalDataSource.clearUserToken();
    return _authRemoteDataSource.logout();
  }
}
