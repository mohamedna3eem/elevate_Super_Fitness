import 'package:elevate_super_fitness/api/models/meal_category_dto.dart';
import 'package:elevate_super_fitness/core/api_result/api_result.dart';
import 'package:elevate_super_fitness/core/api_result/safe_api_call.dart';
import 'package:injectable/injectable.dart';

import '../../data/data_source/meals_remote_data_source.dart';
import '../../domain/entites/meal_category_entity.dart';
import '../../domain/entites/meal_details_entity.dart';
import '../../domain/entites/meal_entity.dart';
import '../client/meals_api_client.dart';
import '../models/meal_details_dto.dart';
import '../models/meal_dto.dart';

@Injectable(as: MealsRemoteDataSource)
class MealsRemoteDataSourceImpl implements MealsRemoteDataSource {
  final MealsApiClient apiClient;

  MealsRemoteDataSourceImpl(this.apiClient);

  @override
  Future<ApiResult<List<MealCategoryEntity>>> getMealsCategories() async {
    return safeApiCall(
      () => apiClient.getMealsCategories(),
      (response) => response.categories!
          .map(
            (category) => category.mapper
                .convert<MealCategoryDto, MealCategoryEntity>(category),
          )
          .toList(),
    );
  }

  @override
  Future<ApiResult<List<MealEntity>>> getMealsByCategory(
    String category,
  ) async {
    return safeApiCall(
      () => apiClient.getMealsByCategory(category),
      (response) => response.meals!
          .map((meal) => meal.mapper.convert<MealDTO, MealEntity>(meal))
          .toList(),
    );
  }

  @override
  Future<ApiResult<List<MealDetailsEntity>>> getMealDetailsById(
    String id,
  ) async {
    return safeApiCall(
      () => apiClient.getMealDetailsById(id),
      (response) => response.meals!
          .map(
            (meal) =>
                meal.mapper.convert<MealDetailsDTO, MealDetailsEntity>(meal),
          )
          .toList(),
    );
  }
}
