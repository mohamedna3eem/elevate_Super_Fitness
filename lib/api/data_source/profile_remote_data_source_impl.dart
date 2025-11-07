import 'package:elevate_super_fitness/api/client/api_client.dart';
import 'package:elevate_super_fitness/api/mapper/profile_mapper.dart';
import 'package:elevate_super_fitness/api/models/responses/user_info_dto.dart';
import 'package:elevate_super_fitness/core/api_result/api_result.dart';
import 'package:elevate_super_fitness/core/api_result/safe_api_call.dart';
import 'package:elevate_super_fitness/data/data_source/profile_remote_data_source.dart';
import 'package:elevate_super_fitness/domain/entites/profile/profile_response_entity.dart';
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
      (response) => UserInfoEntity(),
    );
  }

  @override
  Future<ApiResult<ProfileResponseEntity>> getProfileData()async {
    return await safeApiCall(
        () => _apiClient.getProfileData(),
        (response)=>response.toEntity()
    );
  }
}
