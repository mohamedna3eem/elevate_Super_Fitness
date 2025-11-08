import 'package:dio/src/multipart_file.dart';
import 'package:elevate_super_fitness/core/api_result/api_result.dart';
import 'package:elevate_super_fitness/data/data_source/profile_remote_data_source.dart';
import 'package:elevate_super_fitness/domain/entites/requests/edit_profile_request_entity.dart';
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
  Future<ApiResult<UserInfoEntity>> editUserProfile(EditProfileRequestEntity request) {
    return _profileRemoteDataSource.editUserProfile(request);
  }

  @override
  Future<ApiResult<String>> uploadUserPhoto(MultipartFile photo) {
    return _profileRemoteDataSource.uploadUserPhoto(photo);
  }
}
