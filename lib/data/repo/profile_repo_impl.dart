import 'package:dio/dio.dart';
import 'package:elevate_super_fitness/core/api_result/api_result.dart';
import 'package:elevate_super_fitness/core/constants/const_keys.dart';
import 'package:elevate_super_fitness/data/data_source/profile_remote_data_source.dart';
import 'package:elevate_super_fitness/domain/entites/help_response_entity.dart';
import 'package:elevate_super_fitness/domain/entites/logout_response_entity.dart';
import 'package:elevate_super_fitness/domain/entites/privacy_policy_response_entity.dart';
import 'package:elevate_super_fitness/domain/entites/requests/edit_profile_request_entity.dart';
import 'package:elevate_super_fitness/domain/entites/security_roles_config_entity.dart';
import 'package:elevate_super_fitness/domain/entites/user_info_entity.dart';
import 'package:elevate_super_fitness/data/data_source/profile_local_data_source.dart';
import 'package:elevate_super_fitness/domain/entites/change_password_response_entity.dart';
import 'package:elevate_super_fitness/domain/entites/requests/change_password_request_entity.dart';
import 'package:elevate_super_fitness/domain/repo/profile_repo.dart';
import 'package:injectable/injectable.dart';

@Injectable(as: ProfileRepo)
class ProfileRepoImpl implements ProfileRepo {
  final ProfileRemoteDataSource _profileRemoteDataSource;
  final ProfileLocalDataSource _profileLocalDataSource;

  ProfileRepoImpl(this._profileRemoteDataSource, this._profileLocalDataSource);
  @override
  Future<ApiResult<UserInfoEntity>> getUserLoggedData() async {
    return await _profileRemoteDataSource.getUserLoggedData();
  }

  @override
  Future<ApiResult<ChangePasswordResponseEntity>> changePassword({
    required ChangePasswordRequestEntity request,
  }) async {
    final response = await _profileRemoteDataSource.changePassword(
      request: request,
    );
    if (response is ApiSuccessResult<ChangePasswordResponseEntity>) {
      _profileLocalDataSource.saveUserToken(
        token: response.data.token ?? "null",
      );
    }
    return response;
  }

  @override
  Future<ApiResult<UserInfoEntity>> editUserProfile(
    EditProfileRequestEntity request,
  ) {
    return _profileRemoteDataSource.editUserProfile(request);
  }

  @override
  Future<ApiResult<String>> uploadUserPhoto(MultipartFile photo) {
    return _profileRemoteDataSource.uploadUserPhoto(photo);
  }

  @override
  Future<ApiResult<LogoutResponseEntity>> logout() async {
    final response = await _profileRemoteDataSource.logout();
    if (response is ApiSuccessResult<LogoutResponseEntity>) {
      await _profileLocalDataSource.deleteTokenToken(
        key: ConstKeys.keyUserToken,
      );
      await _profileLocalDataSource.deleteRememberMe(
        key: ConstKeys.keyRememberMe,
      );
    }
    return response;
  }

  @override
  Future<ApiResult<HelpResponseEntity>> getHelpData() async {
    return await _profileLocalDataSource.getHelpData();
  }

  @override
  Future<ApiResult<PrivacyPolicyResponseEntity>>
  getPrivacyAndPolicyData() async {
    return await _profileLocalDataSource.getPrivacyAndPolicyData();
  }

  @override
  Future<ApiResult<SecurityRolesConfigResponseEntity>>
  getSecurityRolesConfigData() async {
    return await _profileLocalDataSource.getSecurityRolesConfigData();
  }
}
