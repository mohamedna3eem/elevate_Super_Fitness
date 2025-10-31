import 'package:elevate_super_fitness/api/client/api_client.dart';
import 'package:elevate_super_fitness/api/client/meals_api_client.dart';
import 'package:elevate_super_fitness/api/mapper/explore_mapper.dart';
import 'package:elevate_super_fitness/api/models/responses/meals_categories_response_dto.dart';
import 'package:elevate_super_fitness/api/models/responses/muscle_group_details_dto.dart';
import 'package:elevate_super_fitness/api/models/responses/muscles_group_response_dto.dart';
import 'package:elevate_super_fitness/api/models/responses/muscles_response_dto.dart';
import 'package:elevate_super_fitness/core/api_result/api_result.dart';
import 'package:elevate_super_fitness/core/api_result/safe_api_call.dart';
import 'package:elevate_super_fitness/data/data_source/explore_remote_data_source.dart';
import 'package:elevate_super_fitness/domain/entites/meals_categories_response_entity.dart';
import 'package:elevate_super_fitness/domain/entites/muscle_group_details_entity.dart';
import 'package:elevate_super_fitness/domain/entites/muscles_group_response_entity.dart';
import 'package:elevate_super_fitness/domain/entites/muscles_response_entity.dart';
import 'package:injectable/injectable.dart';

@Injectable(as: ExploreRemoteDataSource)
class ExploreRemoteDataSourceImpl implements ExploreRemoteDataSource {
  final ApiClient _apiClient;
  final MealsApiClient _mealsApiClient;

  ExploreRemoteDataSourceImpl(this._apiClient, this._mealsApiClient);
  @override
  Future<ApiResult<MusclesResponseEntity>> getRandomMuscles() async {
    return await safeApiCall<MusclesResponseDto, MusclesResponseEntity>(
      () => _apiClient.getRandomMuscles(),
      (response) => response.toEntity(),
    );
  }

  @override
  Future<ApiResult<MusclesGroupResponseEntity>> getAllMusclesGroups() async {
    return await safeApiCall<
      MusclesGroupResponseDto,
      MusclesGroupResponseEntity
    >(
      () => _apiClient.getAllMusclesGroups(),
      (response) => response.toEntity(),
    );
  }

  @override
  Future<ApiResult<MuscleGroupDetailsEntity>> getAllMusclesByMuscleGroupId({
    required String id,
  }) async {
    return await safeApiCall<MuscleGroupDetailsDto, MuscleGroupDetailsEntity>(
      () => _apiClient.getAllMusclesByMuscleGroupId(id),
      (response) => response.toEntity(),
    );
  }

  @override
  Future<ApiResult<MealsCategoriesResponseEntity>>
  getAllMealsCategories() async {
    return await safeApiCall<
      MealsCategoriesResponseDto,
      MealsCategoriesResponseEntity
    >(
      () => _mealsApiClient.getAllMealsCategories(),
      (response) => response.toEntity(),
    );
  }
}
