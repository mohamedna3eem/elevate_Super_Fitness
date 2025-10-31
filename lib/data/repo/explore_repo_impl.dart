import 'package:elevate_super_fitness/core/api_result/api_result.dart';
import 'package:elevate_super_fitness/data/data_source/explore_remote_data_source.dart';
import 'package:elevate_super_fitness/domain/entites/meals_categories_response_entity.dart';
import 'package:elevate_super_fitness/domain/entites/muscle_group_details_entity.dart';
import 'package:elevate_super_fitness/domain/entites/muscles_group_response_entity.dart';
import 'package:elevate_super_fitness/domain/entites/muscles_response_entity.dart';
import 'package:elevate_super_fitness/domain/repo/explore_repo.dart';
import 'package:injectable/injectable.dart';

@Injectable(as: ExploreRepo)
class ExploreRepoImpl implements ExploreRepo {
  final ExploreRemoteDataSource remoteDataSource;

  ExploreRepoImpl(this.remoteDataSource);
  @override
  Future<ApiResult<MealsCategoriesResponseEntity>>
  getAllMealsCategories() async {
    return await remoteDataSource.getAllMealsCategories();
  }

  @override
  Future<ApiResult<MuscleGroupDetailsEntity>> getAllMusclesByMuscleGroupId({
    required String id,
  }) async {
    return await remoteDataSource.getAllMusclesByMuscleGroupId(id: id);
  }

  @override
  Future<ApiResult<MusclesGroupResponseEntity>> getAllMusclesGroups() async {
    return await remoteDataSource.getAllMusclesGroups();
  }

  @override
  Future<ApiResult<MusclesResponseEntity>> getRandomMuscles() async {
    return await remoteDataSource.getRandomMuscles();
  }
}
