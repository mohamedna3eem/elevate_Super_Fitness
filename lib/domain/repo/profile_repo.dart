import 'package:elevate_super_fitness/core/api_result/api_result.dart';
import 'package:elevate_super_fitness/domain/entites/user_info_entity.dart';
import 'package:elevate_super_fitness/domain/entites/change_password_response_entity.dart';
import 'package:elevate_super_fitness/domain/entites/requests/change_password_request_entity.dart';
import 'package:elevate_super_fitness/domain/entites/profile/profile_response_entity.dart';

abstract interface class ProfileRepo {
  Future<ApiResult<UserInfoEntity>> getUserLoggedData();
  Future<ApiResult<ProfileResponseEntity>>getProfileData();
  Future<ApiResult<ChangePasswordResponseEntity>> changePassword({
    required ChangePasswordRequestEntity request,
  });
}


