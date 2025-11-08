import 'package:elevate_super_fitness/core/api_result/api_result.dart';
import 'package:elevate_super_fitness/domain/entites/muscle_group_details_entity.dart';
import 'package:elevate_super_fitness/domain/repo/explore_repo.dart';
import 'package:injectable/injectable.dart';

@lazySingleton
class GetAllMusclesByMuscleGroupIdUseCase {
  final ExploreRepo _exploreRepo;

  GetAllMusclesByMuscleGroupIdUseCase(this._exploreRepo);
  Future<ApiResult<MuscleGroupDetailsEntity>> call(String id) async {
    return await _exploreRepo.getAllMusclesByMuscleGroupId(id: id);
  }
}
