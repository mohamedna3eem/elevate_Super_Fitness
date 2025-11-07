import 'package:dio/dio.dart';
import 'package:elevate_super_fitness/core/api_result/api_result.dart';
import 'package:elevate_super_fitness/domain/entites/muscles_response_entity.dart';
import 'package:elevate_super_fitness/domain/repo/explore_repo.dart';
import 'package:elevate_super_fitness/domain/use_cases/get_random_muscles_use_case.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import '../../dummy/explore_dummy_data.dart';
import 'get_random_muscles_use_case_test.mocks.dart';

@GenerateMocks([ExploreRepo])
void main() {
  group("test random muscles use case", () {
    late ExploreRepo exploreRepo;
    late GetRandomMusclesUseCase useCase;
    final entityResponse = ExploreDummyData.dummyMusclesResponseEntity;
    final DioException dioException = ExploreDummyData.dummyDioException;
    final Exception exception = ExploreDummyData.dummyException;
    setUpAll(() {
      exploreRepo = MockExploreRepo();
      useCase = GetRandomMusclesUseCase(exploreRepo);
      provideDummy<ApiResult<MusclesResponseEntity>>(
        ApiSuccessResult<MusclesResponseEntity>(entityResponse),
      );
      provideDummy<ApiResult<MusclesResponseEntity>>(
        ApiErrorResult<MusclesResponseEntity>(dioException),
      );
    });
    test("test use case function getRandomMuscles() success data", () async {
      //Arrange
      final expectResult = ApiSuccessResult<MusclesResponseEntity>(
        entityResponse,
      );
      when(
        exploreRepo.getRandomMuscles(),
      ).thenAnswer((_) async => expectResult);
      //Act
      final result = await useCase.call();
      //Assert
      verify(exploreRepo.getRandomMuscles()).called(1);
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
    test("test use case function getRandomMuscles() DioError", () async {
      //Arrange
      final expectResult = ApiErrorResult<MusclesResponseEntity>(dioException);
      when(
        exploreRepo.getRandomMuscles(),
      ).thenAnswer((_) async => expectResult);
      //Act
      final result = await useCase.call();
      //Assert
      verify(exploreRepo.getRandomMuscles()).called(1);
      expect(result, isA<ApiErrorResult<MusclesResponseEntity>>());
      expect(
        (result as ApiErrorResult<MusclesResponseEntity>).errorMessage,
        equals(contains(dioException.message)),
      );
    });
    test("test use case function getRandomMuscles() Exception", () async {
      //Arrange
      final expectResult = ApiErrorResult<MusclesResponseEntity>(exception);
      when(
        exploreRepo.getRandomMuscles(),
      ).thenAnswer((_) async => expectResult);
      //Act
      final result = await useCase.call();
      //Assert
      verify(exploreRepo.getRandomMuscles()).called(1);
      expect(result, isA<ApiErrorResult<MusclesResponseEntity>>());
      expect(
        (result as ApiErrorResult<MusclesResponseEntity>).error,
        equals(exception),
      );
    });
  });
}
