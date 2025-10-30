import 'package:dio/dio.dart';
import 'package:elevate_super_fitness/api/models/responses/meals_categories_response.dart';
import 'package:elevate_super_fitness/api/models/responses/meals_details_response.dart';
import 'package:elevate_super_fitness/core/constants/const_keys.dart';
import 'package:injectable/injectable.dart';
import 'package:retrofit/retrofit.dart';

import '../../core/constants/end_points.dart';
import '../models/responses/meals_response.dart';

part 'api_client.g.dart';

@injectable
@RestApi()
abstract class ApiClient {
  @factoryMethod
  factory ApiClient(@Named(ConstKeys.mainDio) Dio dio) = _ApiClient;
}

@injectable
@RestApi()
abstract class ApiClient2 {
  @factoryMethod
  factory ApiClient2(@Named(ConstKeys.secondDio) Dio dio) = _ApiClient2;

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
