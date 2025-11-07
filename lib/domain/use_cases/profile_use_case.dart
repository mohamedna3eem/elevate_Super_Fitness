
import 'package:elevate_super_fitness/core/api_result/api_result.dart';
import 'package:elevate_super_fitness/domain/entites/profile/profile_response_entity.dart';
import 'package:elevate_super_fitness/domain/repo/profile_repo.dart';
import 'package:injectable/injectable.dart';

@injectable
class ProfileUseCase {
  final ProfileRepo _profileRepo;

  ProfileUseCase(this._profileRepo);
  Future<ApiResult<ProfileResponseEntity>> call(

      ) async {
    return _profileRepo.getProfileData();
  }
}
