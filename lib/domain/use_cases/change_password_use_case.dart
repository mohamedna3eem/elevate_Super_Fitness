import 'package:elevate_super_fitness/core/api_result/api_result.dart';
import 'package:elevate_super_fitness/domain/entites/change_password_response_entity.dart';
import 'package:elevate_super_fitness/domain/entites/requests/change_password_request_entity.dart';
import 'package:elevate_super_fitness/domain/repo/profile_repo.dart';
import 'package:injectable/injectable.dart';

@injectable
class ChangePasswordUseCase {
  final ProfileRepo _profileRepo;

  ChangePasswordUseCase(this._profileRepo);
  Future<ApiResult<ChangePasswordResponseEntity>> call(
    ChangePasswordRequestEntity request,
  ) async {
    return await _profileRepo.changePassword(request: request);
  }
}
