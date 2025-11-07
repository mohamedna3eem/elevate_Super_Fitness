
import 'package:elevate_super_fitness/core/api_result/api_result.dart';
import 'package:elevate_super_fitness/domain/entites/logout_entity.dart';
import 'package:elevate_super_fitness/domain/repo/logout_repo.dart';
import 'package:injectable/injectable.dart';

@injectable
class LogoutUseCase {
  final LogoutRepo _repo;

  LogoutUseCase(this._repo);
  Future<ApiResult<LogOutResponseEntity>> call(

      ) async {
    return _repo.logout();
  }
}
