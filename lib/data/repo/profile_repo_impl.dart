import 'package:elevate_super_fitness/core/api_result/api_result.dart';
import 'package:elevate_super_fitness/data/data_source/profile_remote_data_source.dart';
import 'package:elevate_super_fitness/domain/entites/profile/profile_response_entity.dart';
import 'package:elevate_super_fitness/domain/repo/profile_repo.dart';
import 'package:injectable/injectable.dart';

@Injectable(as: ProfileRepo)
class ProfileRepoImpl implements ProfileRepo {
  ProfileRemoteDataSource _profileRemoteDataSource;
  ProfileRepoImpl(this._profileRemoteDataSource);
  @override
  Future<ApiResult<ProfileResponseEntity>> getProfileData() async {
    final response = await _profileRemoteDataSource.getProfileData();
    return response;
  }
}
