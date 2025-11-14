import 'package:elevate_super_fitness/core/api_result/api_result.dart';
import 'package:elevate_super_fitness/domain/entites/logout_response_entity.dart';
import 'package:elevate_super_fitness/domain/repo/profile_repo.dart';
import 'package:injectable/injectable.dart';

@injectable
class LogoutUseCase {
  final ProfileRepo _profileRepo;
  LogoutUseCase(this._profileRepo);

  Future<ApiResult<LogoutResponseEntity>> call() async {
    return await _profileRepo.logout();
  }
}
