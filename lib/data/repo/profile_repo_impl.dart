import 'package:elevate_super_fitness/core/api_result/api_result.dart';
import 'package:elevate_super_fitness/data/data_source/profile_remote_data_source.dart';
import 'package:elevate_super_fitness/domain/entites/user_info_entity.dart';
import 'package:elevate_super_fitness/domain/repo/profile_repo.dart';
import 'package:injectable/injectable.dart';

@Injectable(as: ProfileRepo)
class ProfileRepoImpl implements ProfileRepo {
  final ProfileRemoteDataSource dataSource;

  ProfileRepoImpl(this.dataSource);
  @override
  Future<ApiResult<UserInfoEntity>> getUserLoggedData() async {
    return await dataSource.getUserLoggedData();
  }
}
