import 'package:elevate_super_fitness/core/api_result/api_result.dart';
import 'package:elevate_super_fitness/domain/entites/help_response_entity.dart';
import 'package:elevate_super_fitness/domain/repo/profile_repo.dart';
import 'package:injectable/injectable.dart';

@injectable
class GetHelpDataUseCase {
  final ProfileRepo _profileRepo;

  GetHelpDataUseCase(this._profileRepo);
  Future<ApiResult<HelpResponseEntity>> call() async {
    return await _profileRepo.getHelpData();
  }
}
