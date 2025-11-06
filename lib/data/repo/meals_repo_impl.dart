import 'package:elevate_super_fitness/core/api_result/api_result.dart';
import 'package:injectable/injectable.dart';

import '../../domain/entites/meal_category_entity.dart';
import '../../domain/entites/meal_details_entity.dart';
import '../../domain/entites/meal_entity.dart';
import '../../domain/repo/meals_repo.dart';
import '../data_source/meals_remote_data_source.dart';

@Injectable(as: MealsRepository)
class MealsRepositoryImpl implements MealsRepository {
  final MealsRemoteDataSource _dataSource;

  MealsRepositoryImpl(this._dataSource);

  @override
  Future<ApiResult<List<MealCategoryEntity>>> getMealsCategories() async {
    return await _dataSource.getMealsCategories();
  }

  @override
  Future<ApiResult<List<MealEntity>>> getMealsByCategory(
    String category,
  ) async {
    return await _dataSource.getMealsByCategory(category);
  }

  @override
  Future<ApiResult<List<MealDetailsEntity>>> getMealDetailsById(
    String id,
  ) async {
    return await _dataSource.getMealDetailsById(id);
  }
}
