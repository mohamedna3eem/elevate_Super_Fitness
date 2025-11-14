import 'package:elevate_super_fitness/core/api_result/api_result.dart';
import 'package:elevate_super_fitness/domain/entites/privacy_policy_response_entity.dart';
import 'package:elevate_super_fitness/domain/repo/profile_repo.dart';
import 'package:injectable/injectable.dart';

@injectable
class GetPrivacyAndPolicyData {
  final ProfileRepo _profileRepo;

  GetPrivacyAndPolicyData(this._profileRepo);
  Future<ApiResult<PrivacyPolicyResponseEntity>> call() async {
    return await _profileRepo.getPrivacyAndPolicyData();
  }
}
