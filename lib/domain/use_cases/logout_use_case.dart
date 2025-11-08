import 'package:elevate_super_fitness/domain/repo/auth_repo.dart';
import 'package:injectable/injectable.dart';

import '../../core/api_result/api_result.dart';

@injectable
class LogoutUseCase {
  final AuthRepo _authRepo;

  LogoutUseCase(this._authRepo);

  Future<ApiResult<String>> call() async {
    return await _authRepo.logout();
  }
}
