import 'package:dio/dio.dart';
import 'package:elevate_super_fitness/api/client/api_client.dart';
import 'package:elevate_super_fitness/api/mapper/profile_mapper.dart';
import 'package:elevate_super_fitness/api/models/responses/change_password_response_dto.dart';
import 'package:elevate_super_fitness/api/models/responses/logout_response_dto.dart';
import 'package:elevate_super_fitness/api/models/responses/user_info_dto.dart';
import 'package:elevate_super_fitness/core/api_result/api_result.dart';
import 'package:elevate_super_fitness/core/api_result/safe_api_call.dart';
import 'package:elevate_super_fitness/data/data_source/profile_remote_data_source.dart';
import 'package:elevate_super_fitness/domain/entites/change_password_response_entity.dart';
import 'package:elevate_super_fitness/domain/entites/logout_response_entity.dart';
import 'package:elevate_super_fitness/domain/entites/requests/change_password_request_entity.dart';
import 'package:elevate_super_fitness/domain/entites/requests/edit_profile_request_entity.dart';
import 'package:elevate_super_fitness/domain/entites/user_info_entity.dart';
import 'package:injectable/injectable.dart';

@Injectable(as: ProfileRemoteDataSource)
class ProfileRemoteDataSourceImpl implements ProfileRemoteDataSource {
  final ApiClient _apiClient;

  ProfileRemoteDataSourceImpl(this._apiClient);

  @override
  Future<ApiResult<UserInfoEntity>> getUserLoggedData() async {
    return await safeApiCall<UserInfoDto, UserInfoEntity>(
      () => _apiClient.getGetLoggedUserData(),
      (response) => response.toEntity(),
    );
  }

  @override
  Future<ApiResult<ChangePasswordResponseEntity>> changePassword({
    required ChangePasswordRequestEntity request,
  }) async {
    return await safeApiCall<
      ChangePasswordResponseDto,
      ChangePasswordResponseEntity
    >(
      () => _apiClient.changePassword(request.toDto()),
      (response) => response.toEntity(),
    );
  }

  @override
  Future<ApiResult<UserInfoEntity>> editUserProfile(
    EditProfileRequestEntity request,
  ) {
    return safeApiCall(
      () => _apiClient.editUserProfile(request.mapper.convert(request)),
      (response) {
        return response.toEntity();
      },
    );
  }

  @override
  Future<ApiResult<String>> uploadUserPhoto(MultipartFile photo) {
    return safeApiCall(() => _apiClient.uploadUserPhoto(photo), (response) {
      return response.message ?? "";
    });
  }

  @override
  Future<ApiResult<LogoutResponseEntity>> logout() {
    return safeApiCall<LogoutResponseDto, LogoutResponseEntity>(
      () => _apiClient.logout(),
      (response) => response.toEntity(),
    );
  }
}
