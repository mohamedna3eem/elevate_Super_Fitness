import 'package:elevate_super_fitness/core/api_result/api_result.dart';
import 'package:injectable/injectable.dart';

import '../entites/meal_entity.dart';
import '../repo/meals_repo.dart';

@injectable
class GetMealsByCategoryUseCase {
  final MealsRepository _repository;

  GetMealsByCategoryUseCase(this._repository);

  Future<ApiResult<List<MealEntity>>> call(String category) async {
    return await _repository.getMealsByCategory(category);
  }
}
