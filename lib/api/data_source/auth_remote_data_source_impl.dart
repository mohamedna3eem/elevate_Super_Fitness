import 'package:elevate_super_fitness/api/client/api_client.dart';
import 'package:elevate_super_fitness/api/mapper/login_mapper.dart';
import 'package:elevate_super_fitness/api/models/requests/login_request_dto.dart';
import 'package:elevate_super_fitness/api/models/responses/login_response_dto.dart';
import 'package:elevate_super_fitness/core/api_result/api_result.dart';
import 'package:elevate_super_fitness/core/api_result/safe_api_call.dart';
import 'package:elevate_super_fitness/domain/entites/login_entity.dart';
import 'package:elevate_super_fitness/domain/entites/requests/login_request_entity.dart';
import 'package:elevate_super_fitness/api/mapper/register_mapper.dart';
import 'package:elevate_super_fitness/domain/entites/requests/register_request_entity.dart';
import 'package:elevate_super_fitness/api/mapper/forget_mapper.dart';
import 'package:injectable/injectable.dart';
import '../../data/data_source/auth_remote_data_source.dart';
import '../../domain/entites/requests/email_verification_request_entity.dart';
import '../../domain/entites/requests/forget_password_request_entity.dart';
import '../../domain/entites/requests/reset_password_request_entity.dart';
import '../../domain/entites/email_verification_entity.dart';
import '../../domain/entites/forget_password_response_entity.dart';
import '../../domain/entites/reset_password_response_entity.dart';

@Injectable(as: AuthRemoteDataSource)
class AuthRemoteDataSourceImpl implements AuthRemoteDataSource {
  final ApiClient _apiClient;

  AuthRemoteDataSourceImpl(this._apiClient);
  @override
  Future<ApiResult<LoginResponseEntity>> login({
    required LoginRequestEntity request,
  }) async {
    return safeApiCall<LoginResponseDto, LoginResponseEntity>(() {
      final LoginRequestDto requestDto = request.toDto();
      return _apiClient.login(requestDto);
    }, (response) => response.toEntity());
  }

  @override
  Future<ApiResult<String>> register(RegisterRequestEntity request) {
    return safeApiCall(
      () => _apiClient.register(request.toRequest()),
      (response) => response.message ?? "",
    );
  }
    @override
  Future<ApiResult<ForgetPasswordResponseEntity>>
  forgetPassword(ForgetPasswordRequestEntity request) {
    return safeApiCall(
          () =>_apiClient.forgetPassword(request.fromDomain()) ,
          (response) => response.toEntity(),
    );
  }

  @override
  Future<ApiResult<EmailVerificationEntity>> verifyResetCode(
      EmailVerificationRequestEntity request,
      ) async {
    return safeApiCall(
          () =>_apiClient.emailVerification(request.fromDomain()) ,
          (response) => response.toEntity(),
    );
  }

  @override
  Future<ApiResult<ResetPasswordResponseEntity>> resetPassword(
      ResetPasswordRequestEntity request,
      ) async {
    return safeApiCall(
          () => _apiClient.resetPassword(request.fromDomain()),
          (response) => response.toEntity(),
    );
  }
}
