import 'package:dio/dio.dart';
import 'package:elevate_super_fitness/core/api_result/api_result.dart';
import 'package:elevate_super_fitness/data/data_source/explore_remote_data_source.dart';
import 'package:elevate_super_fitness/data/repo/explore_repo_impl.dart';
import 'package:elevate_super_fitness/domain/entites/meals_categories_response_entity.dart';
import 'package:elevate_super_fitness/domain/entites/muscle_group_details_entity.dart';
import 'package:elevate_super_fitness/domain/entites/muscles_group_response_entity.dart';
import 'package:elevate_super_fitness/domain/entites/muscles_response_entity.dart';
import 'package:elevate_super_fitness/domain/repo/explore_repo.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import '../../dummy/explore_dummy_data.dart';
import 'explore_repo_impl_test.mocks.dart';

@GenerateMocks([ExploreRemoteDataSource])
void main() {
  group("test random muscles repo implementation", () {
    late ExploreRemoteDataSource dataSource;
    late ExploreRepo exploreRepo;
    final entityResponse = ExploreDummyData.dummyMusclesResponseEntity;
    final DioException dioException = ExploreDummyData.dummyDioException;
    final Exception exception = ExploreDummyData.dummyException;
    setUpAll(() {
      dataSource = MockExploreRemoteDataSource();
      exploreRepo = ExploreRepoImpl(dataSource);
      provideDummy<ApiResult<MusclesResponseEntity>>(
        ApiSuccessResult<MusclesResponseEntity>(entityResponse),
      );
      provideDummy<ApiResult<MusclesResponseEntity>>(
        ApiErrorResult<MusclesResponseEntity>(dioException),
      );
    });
    test("test repo function getRandomMuscles() success data", () async {
      //Arrange
      final expectResult = ApiSuccessResult<MusclesResponseEntity>(
        entityResponse,
      );
      when(dataSource.getRandomMuscles()).thenAnswer((_) async => expectResult);
      //Act
      final result = await exploreRepo.getRandomMuscles();
      //Assert
      verify(dataSource.getRandomMuscles()).called(1);
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
      expect(
        result.data.muscles?.first.image,
        equals(entityResponse.muscles?.first.image),
      );
    });
    test("test repo function getRandomMuscles() DioError", () async {
      //Arrange
      final expectResult = ApiErrorResult<MusclesResponseEntity>(dioException);
      when(dataSource.getRandomMuscles()).thenAnswer((_) async => expectResult);
      //Act
      final result = await exploreRepo.getRandomMuscles();
      //Assert
      verify(dataSource.getRandomMuscles()).called(1);
      expect(result, isA<ApiErrorResult<MusclesResponseEntity>>());
      expect(
        (result as ApiErrorResult<MusclesResponseEntity>).errorMessage,
        equals(contains(dioException.message)),
      );
    });
    test("test repo function getRandomMuscles() Exception", () async {
      //Arrange
      final expectResult = ApiErrorResult<MusclesResponseEntity>(exception);
      when(dataSource.getRandomMuscles()).thenAnswer((_) async => expectResult);
      //Act
      final result = await exploreRepo.getRandomMuscles();
      //Assert
      verify(dataSource.getRandomMuscles()).called(1);
      expect(result, isA<ApiErrorResult<MusclesResponseEntity>>());
      expect(
        (result as ApiErrorResult<MusclesResponseEntity>).error,
        equals(exception),
      );
    });
  });
  group("test all muscles groups repo implementation", () {
    late ExploreRemoteDataSource dataSource;
    late ExploreRepo exploreRepo;
    final entityResponse = ExploreDummyData.dummyMusclesGroupResponseEntity;
    final DioException dioException = ExploreDummyData.dummyDioException;
    final Exception exception = ExploreDummyData.dummyException;
    setUpAll(() {
      dataSource = MockExploreRemoteDataSource();
      exploreRepo = ExploreRepoImpl(dataSource);
      provideDummy<ApiResult<MusclesGroupResponseEntity>>(
        ApiSuccessResult<MusclesGroupResponseEntity>(entityResponse),
      );
      provideDummy<ApiResult<MusclesGroupResponseEntity>>(
        ApiErrorResult<MusclesGroupResponseEntity>(dioException),
      );
    });
    test("test repo function getAllMusclesGroups() success data", () async {
      //Arrange
      final expectResult = ApiSuccessResult<MusclesGroupResponseEntity>(
        entityResponse,
      );
      when(
        dataSource.getAllMusclesGroups(),
      ).thenAnswer((_) async => expectResult);
      //Act
      final result = await exploreRepo.getAllMusclesGroups();
      //Assert
      verify(dataSource.getAllMusclesGroups()).called(1);
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
      expect(
        result.data.musclesGroup?.first.id,
        equals(entityResponse.musclesGroup?.first.id),
      );
    });
    test("test repo function getAllMusclesGroups() DioError", () async {
      //Arrange
      final expectResult = ApiErrorResult<MusclesGroupResponseEntity>(
        dioException,
      );
      when(
        dataSource.getAllMusclesGroups(),
      ).thenAnswer((_) async => expectResult);
      //Act
      final result = await exploreRepo.getAllMusclesGroups();
      //Assert
      verify(dataSource.getAllMusclesGroups()).called(1);
      expect(result, isA<ApiErrorResult<MusclesGroupResponseEntity>>());
      expect(
        (result as ApiErrorResult<MusclesGroupResponseEntity>).errorMessage,
        equals(contains(dioException.message)),
      );
    });
    test("test repo function getAllMusclesGroups() Exception", () async {
      //Arrange
      final expectResult = ApiErrorResult<MusclesGroupResponseEntity>(
        exception,
      );
      when(
        dataSource.getAllMusclesGroups(),
      ).thenAnswer((_) async => expectResult);
      //Act
      final result = await exploreRepo.getAllMusclesGroups();
      //Assert
      verify(dataSource.getAllMusclesGroups()).called(1);
      expect(result, isA<ApiErrorResult<MusclesGroupResponseEntity>>());
      expect(
        (result as ApiErrorResult<MusclesGroupResponseEntity>).error,
        equals(exception),
      );
    });
  });
  group("test all muscles groups by id repo implementation", () {
    late ExploreRemoteDataSource dataSource;
    late ExploreRepo exploreRepo;
    final entityResponse = ExploreDummyData.dummyMuscleGroupDetailsEntity;
    final fakeId = ExploreDummyData.groupId;
    final DioException dioException = ExploreDummyData.dummyDioException;
    final Exception exception = ExploreDummyData.dummyException;
    setUpAll(() {
      dataSource = MockExploreRemoteDataSource();
      exploreRepo = ExploreRepoImpl(dataSource);
      provideDummy<ApiResult<MuscleGroupDetailsEntity>>(
        ApiSuccessResult<MuscleGroupDetailsEntity>(entityResponse),
      );
      provideDummy<ApiResult<MuscleGroupDetailsEntity>>(
        ApiErrorResult<MuscleGroupDetailsEntity>(dioException),
      );
    });
    test("test repo function getAllMusclesByMuscleGroupId() success data", () async {
      //Arrange
      final expectResult = ApiSuccessResult<MuscleGroupDetailsEntity>(
        entityResponse,
      );
      when(
        dataSource.getAllMusclesByMuscleGroupId(id: fakeId),
      ).thenAnswer((_) async => expectResult);
      //Act
      final result = await exploreRepo.getAllMusclesByMuscleGroupId(id: fakeId);
      //Assert
      verify(dataSource.getAllMusclesByMuscleGroupId(id: fakeId)).called(1);
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
      expect(
        result.data.musclesEntity?.first.id,
        equals(entityResponse.musclesEntity?.first.id),
      );
    });
    test("test repo function getAllMusclesByMuscleGroupId() DioError", () async {
      //Arrange
      final expectResult = ApiErrorResult<MuscleGroupDetailsEntity>(
        dioException,
      );
      when(
        dataSource.getAllMusclesByMuscleGroupId(id: fakeId),
      ).thenAnswer((_) async => expectResult);
      //Act
      final result = await exploreRepo.getAllMusclesByMuscleGroupId(id: fakeId);
      //Assert
      verify(dataSource.getAllMusclesByMuscleGroupId(id: fakeId)).called(1);
      expect(result, isA<ApiErrorResult<MuscleGroupDetailsEntity>>());
      expect(
        (result as ApiErrorResult<MuscleGroupDetailsEntity>).errorMessage,
        equals(contains(dioException.message)),
      );
    });
    test("test repo function getAllMusclesByMuscleGroupId() Exception", () async {
      //Arrange
      final expectResult = ApiErrorResult<MuscleGroupDetailsEntity>(
        exception,
      );
      when(
        dataSource.getAllMusclesByMuscleGroupId(id: fakeId),
      ).thenAnswer((_) async => expectResult);
      //Act
      final result = await exploreRepo.getAllMusclesByMuscleGroupId(id: fakeId);
      //Assert
      verify(dataSource.getAllMusclesByMuscleGroupId(id: fakeId)).called(1);
      expect(result, isA<ApiErrorResult<MuscleGroupDetailsEntity>>());
      expect(
        (result as ApiErrorResult<MuscleGroupDetailsEntity>).error,
        equals(exception),
      );
    });
  });
  group("test all muscles groups repo implementation", () {
    late ExploreRemoteDataSource dataSource;
    late ExploreRepo exploreRepo;
    final entityResponse = ExploreDummyData.dummyMealsCategoriesResponseEntity;
    final DioException dioException = ExploreDummyData.dummyDioException;
    final Exception exception = ExploreDummyData.dummyException;
    setUpAll(() {
      dataSource = MockExploreRemoteDataSource();
      exploreRepo = ExploreRepoImpl(dataSource);
      provideDummy<ApiResult<MealsCategoriesResponseEntity>>(
        ApiSuccessResult<MealsCategoriesResponseEntity>(entityResponse),
      );
      provideDummy<ApiResult<MealsCategoriesResponseEntity>>(
        ApiErrorResult<MealsCategoriesResponseEntity>(dioException),
      );
    });
    test("test repo function getAllMealsCategories() success data", () async {
      //Arrange
      final expectResult = ApiSuccessResult<MealsCategoriesResponseEntity>(
        entityResponse,
      );
      when(
        dataSource.getAllMealsCategories(),
      ).thenAnswer((_) async => expectResult);
      //Act
      final result = await exploreRepo.getAllMealsCategories();
      //Assert
      verify(dataSource.getAllMealsCategories()).called(1);
      expect(result, isA<ApiSuccessResult<MealsCategoriesResponseEntity>>());
      expect(
        (result as ApiSuccessResult<MealsCategoriesResponseEntity>)
            .data
            .categories
            ?.length,
        equals(entityResponse.categories?.length),
      );

      expect(
        result.data.categories?.first.idCategory,
        equals(entityResponse.categories?.first.idCategory),
      );
      expect(
        result.data.categories?.first.strCategory,
        equals(entityResponse.categories?.first.strCategory),
      );
    });
    test("test repo function getAllMealsCategories() DioError", () async {
      //Arrange
      final expectResult = ApiErrorResult<MealsCategoriesResponseEntity>(
        dioException,
      );
      when(
        dataSource.getAllMealsCategories(),
      ).thenAnswer((_) async => expectResult);
      //Act
      final result = await exploreRepo.getAllMealsCategories();
      //Assert
      verify(dataSource.getAllMealsCategories()).called(1);
      expect(result, isA<ApiErrorResult<MealsCategoriesResponseEntity>>());
      expect(
        (result as ApiErrorResult<MealsCategoriesResponseEntity>).errorMessage,
        equals(contains(dioException.message)),
      );
    });
    test("test repo function getAllMealsCategories() Exception", () async {
      //Arrange
      final expectResult = ApiErrorResult<MealsCategoriesResponseEntity>(
        exception,
      );
      when(
        dataSource.getAllMealsCategories(),
      ).thenAnswer((_) async => expectResult);
      //Act
      final result = await exploreRepo.getAllMealsCategories();
      //Assert
      verify(dataSource.getAllMealsCategories()).called(1);
      expect(result, isA<ApiErrorResult<MealsCategoriesResponseEntity>>());
      expect(
        (result as ApiErrorResult<MealsCategoriesResponseEntity>).error,
        equals(exception),
      );
    });
  });
}
