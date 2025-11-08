import 'package:elevate_super_fitness/core/api_result/api_result.dart';
import 'package:elevate_super_fitness/domain/entites/user_info_entity.dart';
import 'package:elevate_super_fitness/domain/repo/profile_repo.dart';
import 'package:injectable/injectable.dart';

@lazySingleton
class GetUserLoggedDataUseCase {
  final ProfileRepo _profileRepo;

  GetUserLoggedDataUseCase(this._profileRepo);
  Future<ApiResult<UserInfoEntity>> call() async {
    return await _profileRepo.getUserLoggedData();
  }
}
