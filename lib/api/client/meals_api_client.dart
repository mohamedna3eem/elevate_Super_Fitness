import 'package:dio/dio.dart';
import 'package:elevate_super_fitness/api/models/responses/meals_categories_response_dto.dart';
import 'package:elevate_super_fitness/core/constants/end_points.dart';
import 'package:injectable/injectable.dart';
import 'package:retrofit/retrofit.dart';

import '../models/responses/meals_categories_response.dart';
import '../models/responses/meals_details_response.dart';
import '../models/responses/meals_response.dart';

part 'meals_api_client.g.dart';

@injectable
@RestApi()
abstract class MealsApiClient {
  @factoryMethod
  factory MealsApiClient(@Named(Endpoints.mealsDio) Dio dio) = _MealsApiClient;

  @GET(Endpoints.mealsCategories)
  Future<MealsCategoriesResponseDto> getAllMealsCategories();

  @GET(Endpoints.mealsCategories)
  Future<MealsCategoriesResponse> getMealsCategories();

  @GET(Endpoints.mealsByCategory)
  Future<MealsResponse> getMealsByCategory(
    @Query(Endpoints.mealCategoryQuery) String c,
  );

  @GET(Endpoints.mealDetails)
  Future<MealsDetailsResponse> getMealDetailsById(
    @Query(Endpoints.mealIdQuery) String i,
  );
}
