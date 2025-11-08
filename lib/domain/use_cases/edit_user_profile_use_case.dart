import 'package:injectable/injectable.dart';

import '../../core/api_result/api_result.dart';
import '../entites/requests/edit_profile_request_entity.dart';
import '../entites/user_info_entity.dart';
import '../repo/profile_repo.dart';

@injectable
class EditUserProfileUseCase {
  final ProfileRepo _profileRepo;

  EditUserProfileUseCase(this._profileRepo);

  Future<ApiResult<UserInfoEntity>> call({
    required EditProfileRequestEntity request,
  }) {
    return _profileRepo.editUserProfile(request);
  }
}
