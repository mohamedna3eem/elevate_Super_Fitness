import 'package:elevate_super_fitness/core/api_result/api_result.dart';

import '../../domain/entites/meal_category_entity.dart';
import '../../domain/entites/meal_details_entity.dart';
import '../../domain/entites/meal_entity.dart';

abstract interface class MealsRemoteDataSource {
  Future<ApiResult<List<MealCategoryEntity>>> getMealsCategories();

  Future<ApiResult<List<MealEntity>>> getMealsByCategory(String category);

  Future<ApiResult<List<MealDetailsEntity>>> getMealDetailsById(String id);
}
