import 'package:elevate_super_fitness/core/api_result/api_result.dart';

import '../entites/meal_category_entity.dart';
import '../entites/meal_details_entity.dart';
import '../entites/meal_entity.dart';

abstract interface class MealsRepository {
  Future<ApiResult<List<MealCategoryEntity>>> getMealsCategories();

  Future<ApiResult<List<MealEntity>>> getMealsByCategory(String category);

  Future<ApiResult<List<MealDetailsEntity>>> getMealDetailsById(String id);
}
