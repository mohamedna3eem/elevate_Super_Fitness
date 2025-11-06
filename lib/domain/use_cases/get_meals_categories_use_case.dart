import 'package:elevate_super_fitness/core/api_result/api_result.dart';
import 'package:injectable/injectable.dart';

import '../entites/meal_category_entity.dart';
import '../repo/meals_repo.dart';

@injectable
class GetMealsCategoriesUseCase {
  final MealsRepository _repository;

  GetMealsCategoriesUseCase(this._repository);

  Future<ApiResult<List<MealCategoryEntity>>> call() async {
    return await _repository.getMealsCategories();
  }
}
