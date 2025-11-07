import 'package:elevate_super_fitness/core/api_result/api_result.dart';
import 'package:elevate_super_fitness/domain/entites/meals_categories_response_entity.dart';
import 'package:elevate_super_fitness/domain/repo/explore_repo.dart';
import 'package:injectable/injectable.dart';

@lazySingleton
class GetAllMealsCategoriesUseCase {
  final ExploreRepo _exploreRepo;

  GetAllMealsCategoriesUseCase(this._exploreRepo);
  Future<ApiResult<MealsCategoriesResponseEntity>> call() async {
    return await _exploreRepo.getAllMealsCategories();
  }
}
