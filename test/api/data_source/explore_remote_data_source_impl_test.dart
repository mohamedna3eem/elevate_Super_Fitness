import 'package:dio/dio.dart';
import 'package:elevate_super_fitness/api/client/api_client.dart';
import 'package:elevate_super_fitness/api/client/meals_api_client.dart';
import 'package:elevate_super_fitness/api/data_source/explore_remote_data_source_impl.dart';
import 'package:elevate_super_fitness/core/api_result/api_result.dart';
import 'package:elevate_super_fitness/data/data_source/explore_remote_data_source.dart';
import 'package:elevate_super_fitness/domain/entites/meals_categories_response_entity.dart';
import 'package:elevate_super_fitness/domain/entites/muscle_group_details_entity.dart';
import 'package:elevate_super_fitness/domain/entites/muscles_group_response_entity.dart';
import 'package:elevate_super_fitness/domain/entites/muscles_response_entity.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import '../../dummy/explore_dummy_data.dart';
import 'explore_remote_data_source_impl_test.mocks.dart';

@GenerateMocks([ApiClient, MealsApiClient])
void main() {
  late ApiClient apiClient;
  late MealsApiClient mealsApiClient;
  late ExploreRemoteDataSource dataSource;
  setUpAll(() {
    apiClient = MockApiClient();
    mealsApiClient = MockMealsApiClient();
    dataSource = ExploreRemoteDataSourceImpl(apiClient, mealsApiClient);
  });
  group("test random muscles", () {
    final dtoResponse = ExploreDummyData.dummyMusclesResponseDto;
    final entityResponse = ExploreDummyData.dummyMusclesResponseEntity;
    final DioException dioException = ExploreDummyData.dummyDioException;
    final Exception exception = ExploreDummyData.dummyException;
    test("test getRandomMuscles() success data", () async {
      //Arrange
      when(apiClient.getRandomMuscles()).thenAnswer((_) async => dtoResponse);
      //Act
      final result = await dataSource.getRandomMuscles();
      //Assert
      verify(apiClient.getRandomMuscles()).called(1);
      expect(result, isA<ApiSuccessResult<MusclesResponseEntity>>());
      expect(
        (result as ApiSuccessResult<MusclesResponseEntity>).data.message,
        entityResponse.message,
      );
      expect(
        result.data.muscles?.length,
        equals(entityResponse.muscles?.length),
      );
      expect(
        result.data.muscles?.first.name,
        equals(entityResponse.muscles?.first.name),
      );
    });
    test("test getRandomMuscles() DioError", () async {
      //Arrange
      when(apiClient.getRandomMuscles()).thenThrow(dioException);
      //Act
      final result = await dataSource.getRandomMuscles();
      //Assert
      verify(apiClient.getRandomMuscles()).called(1);
      expect(result, isA<ApiErrorResult<MusclesResponseEntity>>());
      expect(
        (result as ApiErrorResult<MusclesResponseEntity>).errorMessage,
        equals(contains(dioException.message)),
      );
    });
    test("test getRandomMuscles() Exception", () async {
      //Arrange
      when(apiClient.getRandomMuscles()).thenThrow(exception);
      //Act
      final result = await dataSource.getRandomMuscles();
      //Assert
      verify(apiClient.getRandomMuscles()).called(1);
      expect(result, isA<ApiErrorResult<MusclesResponseEntity>>());
      expect(
        (result as ApiErrorResult<MusclesResponseEntity>).error,
        equals(exception),
      );
    });
  });
  group("test all muscles groups", () {
    final dtoResponse = ExploreDummyData.dummyMusclesGroupResponseDto;
    final entityResponse = ExploreDummyData.dummyMusclesGroupResponseEntity;
    final DioException dioException = ExploreDummyData.dummyDioException;
    final Exception exception = ExploreDummyData.dummyException;
    test("test getAllMusclesGroups() success data", () async {
      //Arrange
      when(
        apiClient.getAllMusclesGroups(),
      ).thenAnswer((_) async => dtoResponse);
      //Act
      final result = await dataSource.getAllMusclesGroups();
      //Assert
      verify(apiClient.getAllMusclesGroups()).called(1);
      expect(result, isA<ApiSuccessResult<MusclesGroupResponseEntity>>());
      expect(
        (result as ApiSuccessResult<MusclesGroupResponseEntity>).data.message,
        entityResponse.message,
      );
      expect(
        result.data.musclesGroup?.length,
        equals(entityResponse.musclesGroup?.length),
      );
      expect(
        result.data.musclesGroup?.first.name,
        equals(entityResponse.musclesGroup?.first.name),
      );
    });
    test("test getAllMusclesGroups() DioError", () async {
      //Arrange
      when(apiClient.getAllMusclesGroups()).thenThrow(dioException);
      //Act
      final result = await dataSource.getAllMusclesGroups();
      //Assert
      verify(apiClient.getAllMusclesGroups()).called(1);
      expect(result, isA<ApiErrorResult<MusclesGroupResponseEntity>>());
      expect(
        (result as ApiErrorResult<MusclesGroupResponseEntity>).errorMessage,
        equals(contains(dioException.message)),
      );
    });
    test("test getAllMusclesGroups() Exception", () async {
      //Arrange
      when(apiClient.getAllMusclesGroups()).thenThrow(exception);
      //Act
      final result = await dataSource.getAllMusclesGroups();
      //Assert
      verify(apiClient.getAllMusclesGroups()).called(1);
      expect(result, isA<ApiErrorResult<MusclesGroupResponseEntity>>());
      expect(
        (result as ApiErrorResult<MusclesGroupResponseEntity>).error,
        equals(exception),
      );
    });
  });
  group("test all muscles groups by id", () {
    final dtoResponse = ExploreDummyData.dummyMuscleGroupDetailsDto;
    final entityResponse = ExploreDummyData.dummyMuscleGroupDetailsEntity;
    final DioException dioException = ExploreDummyData.dummyDioException;
    final fakeId = ExploreDummyData.groupId;
    final Exception exception = ExploreDummyData.dummyException;
    test("test getAllMusclesGroups() success data", () async {
      //Arrange
      when(
        apiClient.getAllMusclesByMuscleGroupId(fakeId),
      ).thenAnswer((_) async => dtoResponse);
      //Act
      final result = await dataSource.getAllMusclesByMuscleGroupId(id: fakeId);
      //Assert
      verify(apiClient.getAllMusclesByMuscleGroupId(fakeId)).called(1);
      expect(result, isA<ApiSuccessResult<MuscleGroupDetailsEntity>>());
      expect(
        (result as ApiSuccessResult<MuscleGroupDetailsEntity>).data.message,
        entityResponse.message,
      );
      expect(
        result.data.musclesEntity?.length,
        equals(entityResponse.musclesEntity?.length),
      );
      expect(
        result.data.musclesEntity?.first.name,
        equals(entityResponse.musclesEntity?.first.name),
      );
    });
    test("test getAllMusclesByMuscleGroupId() DioError", () async {
      //Arrange
      when(
        apiClient.getAllMusclesByMuscleGroupId(fakeId),
      ).thenThrow(dioException);
      //Act
      final result = await dataSource.getAllMusclesByMuscleGroupId(id: fakeId);
      //Assert
      verify(apiClient.getAllMusclesByMuscleGroupId(fakeId)).called(1);
      expect(result, isA<ApiErrorResult<MuscleGroupDetailsEntity>>());
      expect(
        (result as ApiErrorResult<MuscleGroupDetailsEntity>).errorMessage,
        equals(contains(dioException.message)),
      );
    });
    test("test getAllMusclesByMuscleGroupId() Exception", () async {
      //Arrange
      when(apiClient.getAllMusclesByMuscleGroupId(fakeId)).thenThrow(exception);
      //Act
      final result = await dataSource.getAllMusclesByMuscleGroupId(id: fakeId);
      //Assert
      verify(apiClient.getAllMusclesByMuscleGroupId(fakeId)).called(1);
      expect(result, isA<ApiErrorResult<MuscleGroupDetailsEntity>>());
      expect(
        (result as ApiErrorResult<MuscleGroupDetailsEntity>).error,
        equals(exception),
      );
    });
  });
  group("test all meals categories", () {
    final dtoResponse = ExploreDummyData.dummyMealsCategoriesResponseDto;
    final entityResponse = ExploreDummyData.dummyMealsCategoriesResponseEntity;
    final DioException dioException = ExploreDummyData.dummyDioException;
    final Exception exception = ExploreDummyData.dummyException;
    test("test getAllMealsCategories() success data", () async {
      //Arrange
      when(
        mealsApiClient.getAllMealsCategories(),
      ).thenAnswer((_) async => dtoResponse);
      //Act
      final result = await dataSource.getAllMealsCategories();
      //Assert
      verify(mealsApiClient.getAllMealsCategories()).called(1);
      expect(result, isA<ApiSuccessResult<MealsCategoriesResponseEntity>>());
      expect(
        (result as ApiSuccessResult<MealsCategoriesResponseEntity>)
            .data
            .categories
            ?.length,
        equals(entityResponse.categories?.length),
      );
      expect(
        result.data.categories?.first.strCategory,
        equals(entityResponse.categories?.first.strCategory),
      );
    });
    test("test getAllMealsCategories() DioError", () async {
      //Arrange
      when(mealsApiClient.getAllMealsCategories()).thenThrow(dioException);
      //Act
      final result = await dataSource.getAllMealsCategories();
      //Assert
      verify(mealsApiClient.getAllMealsCategories()).called(1);
      expect(result, isA<ApiErrorResult<MealsCategoriesResponseEntity>>());
      expect(
        (result as ApiErrorResult<MealsCategoriesResponseEntity>).errorMessage,
        equals(contains(dioException.message)),
      );
    });
    test("test getAllMealsCategories() Exception", () async {
      //Arrange
      when(mealsApiClient.getAllMealsCategories()).thenThrow(exception);
      //Act
      final result = await dataSource.getAllMealsCategories();
      //Assert
      verify(mealsApiClient.getAllMealsCategories()).called(1);
      expect(result, isA<ApiErrorResult<MealsCategoriesResponseEntity>>());
      expect(
        (result as ApiErrorResult<MealsCategoriesResponseEntity>).error,
        equals(exception),
      );
    });
  });
}
