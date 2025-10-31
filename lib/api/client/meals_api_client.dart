import 'package:dio/dio.dart';
import 'package:elevate_super_fitness/api/models/responses/meals_categories_response_dto.dart';
import 'package:elevate_super_fitness/core/constants/end_points.dart';
import 'package:injectable/injectable.dart';
import 'package:retrofit/error_logger.dart';
import 'package:retrofit/http.dart';
part 'meals_api_client.g.dart';
@injectable
@RestApi()
abstract class MealsApiClient {
  @factoryMethod
  factory MealsApiClient(@Named(Endpoints.mealsDio) Dio dio) = _MealsApiClient;

  @GET(Endpoints.mealsCategories)
  Future<MealsCategoriesResponseDto> getAllMealsCategories();
}