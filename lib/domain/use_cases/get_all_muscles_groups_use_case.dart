import 'package:elevate_super_fitness/core/api_result/api_result.dart';
import 'package:elevate_super_fitness/domain/entites/muscles_group_response_entity.dart';
import 'package:elevate_super_fitness/domain/repo/explore_repo.dart';
import 'package:injectable/injectable.dart';

@lazySingleton
class GetAllMusclesGroupsUseCase {
  final ExploreRepo _exploreRepo;

  GetAllMusclesGroupsUseCase(this._exploreRepo);
  Future<ApiResult<MusclesGroupResponseEntity>> call() async {
    return await _exploreRepo.getAllMusclesGroups();
  }
}
