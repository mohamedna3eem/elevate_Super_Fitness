import 'package:dio/dio.dart';
import 'package:elevate_super_fitness/core/api_result/api_result.dart';
import 'package:elevate_super_fitness/domain/entites/change_password_response_entity.dart';
import 'package:elevate_super_fitness/domain/entites/logout_response_entity.dart';
import 'package:elevate_super_fitness/domain/entites/requests/change_password_request_entity.dart';
import 'package:elevate_super_fitness/domain/entites/user_info_entity.dart';

import '../../domain/entites/requests/edit_profile_request_entity.dart';

abstract interface class ProfileRemoteDataSource {
  Future<ApiResult<UserInfoEntity>> getUserLoggedData();

  Future<ApiResult<ChangePasswordResponseEntity>> changePassword({
    required ChangePasswordRequestEntity request,
  });

  Future<ApiResult<UserInfoEntity>> editUserProfile(
    EditProfileRequestEntity request,
  );

  Future<ApiResult<String>> uploadUserPhoto(MultipartFile photo);
  Future<ApiResult<LogoutResponseEntity>> logout();
}
