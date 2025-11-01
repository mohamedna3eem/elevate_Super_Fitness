import 'package:elevate_super_fitness/core/api_result/api_result.dart';
import 'package:injectable/injectable.dart';

import '../entites/meal_details_entity.dart';
import '../repo/meals_repo.dart';

@injectable
class GetMealDetailsByIdUseCase {
  final MealsRepository _repository;

  GetMealDetailsByIdUseCase(this._repository);

  Future<ApiResult<List<MealDetailsEntity>>> call(String id) async {
    return await _repository.getMealDetailsById(id);
  }
}
