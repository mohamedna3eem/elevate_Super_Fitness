import 'package:elevate_super_fitness/core/api_result/api_result.dart';
import 'package:elevate_super_fitness/domain/entites/meals_categories_response_entity.dart';
import 'package:elevate_super_fitness/domain/entites/muscle_group_details_entity.dart';
import 'package:elevate_super_fitness/domain/entites/muscles_group_response_entity.dart';
import 'package:elevate_super_fitness/domain/entites/muscles_response_entity.dart';

abstract interface class ExploreRemoteDataSource {
  Future<ApiResult<MusclesResponseEntity>> getRandomMuscles();
  Future<ApiResult<MusclesGroupResponseEntity>> getAllMusclesGroups();
  Future<ApiResult<MuscleGroupDetailsEntity>> getAllMusclesByMuscleGroupId({
    required String id,
  });
  Future<ApiResult<MealsCategoriesResponseEntity>> getAllMealsCategories();
}
