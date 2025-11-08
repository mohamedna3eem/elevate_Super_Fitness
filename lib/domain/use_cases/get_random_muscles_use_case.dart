import 'package:elevate_super_fitness/core/api_result/api_result.dart';
import 'package:elevate_super_fitness/domain/entites/muscles_response_entity.dart';
import 'package:elevate_super_fitness/domain/repo/explore_repo.dart';
import 'package:injectable/injectable.dart';

@lazySingleton
class GetRandomMusclesUseCase {
  final ExploreRepo _exploreRepo;

  GetRandomMusclesUseCase(this._exploreRepo);
  Future<ApiResult<MusclesResponseEntity>> call() async {
    return await _exploreRepo.getRandomMuscles();
  }
}
