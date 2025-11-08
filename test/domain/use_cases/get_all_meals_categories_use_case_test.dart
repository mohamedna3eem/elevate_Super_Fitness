import 'package:dio/dio.dart';
import 'package:elevate_super_fitness/core/api_result/api_result.dart';
import 'package:elevate_super_fitness/domain/entites/meals_categories_response_entity.dart';
import 'package:elevate_super_fitness/domain/repo/explore_repo.dart';
import 'package:elevate_super_fitness/domain/use_cases/get_all_meals_categories_use_case.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import '../../dummy/explore_dummy_data.dart';
import 'get_all_meals_categories_use_case_test.mocks.dart';

@GenerateMocks([ExploreRepo])
void main() {
  group("test all muscles groups use case", () {
    late ExploreRepo exploreRepo;
    late GetAllMealsCategoriesUseCase useCase;
    final entityResponse = ExploreDummyData.dummyMealsCategoriesResponseEntity;
    final DioException dioException = ExploreDummyData.dummyDioException;
    final Exception exception = ExploreDummyData.dummyException;
    setUpAll(() {
      exploreRepo = MockExploreRepo();
      useCase = GetAllMealsCategoriesUseCase(exploreRepo);
      provideDummy<ApiResult<MealsCategoriesResponseEntity>>(
        ApiSuccessResult<MealsCategoriesResponseEntity>(entityResponse),
      );
      provideDummy<ApiResult<MealsCategoriesResponseEntity>>(
        ApiErrorResult<MealsCategoriesResponseEntity>(dioException),
      );
    });
    test(
      "test use case function getAllMealsCategories() success data",
      () async {
        //Arrange
        final expectResult = ApiSuccessResult<MealsCategoriesResponseEntity>(
          entityResponse,
        );
        when(
          exploreRepo.getAllMealsCategories(),
        ).thenAnswer((_) async => expectResult);
        //Act
        final result = await useCase.call();
        //Assert
        verify(exploreRepo.getAllMealsCategories()).called(1);
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
      },
    );
    test("test use case function getAllMealsCategories() DioError", () async {
      //Arrange
      final expectResult = ApiErrorResult<MealsCategoriesResponseEntity>(
        dioException,
      );
      when(
        exploreRepo.getAllMealsCategories(),
      ).thenAnswer((_) async => expectResult);
      //Act
      final result = await useCase.call();
      //Assert
      verify(exploreRepo.getAllMealsCategories()).called(1);
      expect(result, isA<ApiErrorResult<MealsCategoriesResponseEntity>>());
      expect(
        (result as ApiErrorResult<MealsCategoriesResponseEntity>).errorMessage,
        equals(contains(dioException.message)),
      );
    });
    test("test use case function getAllMealsCategories() Exception", () async {
      //Arrange
      final expectResult = ApiErrorResult<MealsCategoriesResponseEntity>(
        exception,
      );
      when(
        exploreRepo.getAllMealsCategories(),
      ).thenAnswer((_) async => expectResult);
      //Act
      final result = await useCase.call();
      //Assert
      verify(exploreRepo.getAllMealsCategories()).called(1);
      expect(result, isA<ApiErrorResult<MealsCategoriesResponseEntity>>());
      expect(
        (result as ApiErrorResult<MealsCategoriesResponseEntity>).error,
        equals(exception),
      );
    });
  });
}
