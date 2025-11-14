import 'package:elevate_super_fitness/core/api_result/api_result.dart';
import 'package:elevate_super_fitness/domain/entites/security_roles_config_entity.dart';
import 'package:elevate_super_fitness/domain/repo/profile_repo.dart';
import 'package:injectable/injectable.dart';

@injectable
class GetSecurityRolesConfigData {
  final ProfileRepo _profileRepo;

  GetSecurityRolesConfigData(this._profileRepo);
  Future<ApiResult<SecurityRolesConfigResponseEntity>> call() async {
    return await _profileRepo.getSecurityRolesConfigData();
  }
}
