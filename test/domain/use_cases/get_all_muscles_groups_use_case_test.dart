import 'package:dio/dio.dart';
import 'package:elevate_super_fitness/core/api_result/api_result.dart';
import 'package:elevate_super_fitness/domain/entites/muscles_group_response_entity.dart';
import 'package:elevate_super_fitness/domain/repo/explore_repo.dart';
import 'package:elevate_super_fitness/domain/use_cases/get_all_muscles_groups_use_case.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import '../../dummy/explore_dummy_data.dart';
import 'get_all_muscles_groups_use_case_test.mocks.dart';

@GenerateMocks([ExploreRepo])
void main() {
  group("test all muscles groups use case", () {
    late ExploreRepo exploreRepo;
    late GetAllMusclesGroupsUseCase useCase;
    final entityResponse = ExploreDummyData.dummyMusclesGroupResponseEntity;
    final DioException dioException = ExploreDummyData.dummyDioException;
    final Exception exception = ExploreDummyData.dummyException;
    setUpAll(() {
      exploreRepo = MockExploreRepo();
      useCase = GetAllMusclesGroupsUseCase(exploreRepo);
      provideDummy<ApiResult<MusclesGroupResponseEntity>>(
        ApiSuccessResult<MusclesGroupResponseEntity>(entityResponse),
      );
      provideDummy<ApiResult<MusclesGroupResponseEntity>>(
        ApiErrorResult<MusclesGroupResponseEntity>(dioException),
      );
    });
    test("test use case function getAllMusclesGroups() success data", () async {
      //Arrange
      final expectResult = ApiSuccessResult<MusclesGroupResponseEntity>(
        entityResponse,
      );
      when(
        exploreRepo.getAllMusclesGroups(),
      ).thenAnswer((_) async => expectResult);
      //Act
      final result = await useCase.call();
      //Assert
      verify(exploreRepo.getAllMusclesGroups()).called(1);
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
    test("test use case function getAllMusclesGroups() DioError", () async {
      //Arrange
      final expectResult = ApiErrorResult<MusclesGroupResponseEntity>(
        dioException,
      );
      when(
        exploreRepo.getAllMusclesGroups(),
      ).thenAnswer((_) async => expectResult);
      //Act
      final result = await useCase.call();
      //Assert
      verify(exploreRepo.getAllMusclesGroups()).called(1);
      expect(result, isA<ApiErrorResult<MusclesGroupResponseEntity>>());
      expect(
        (result as ApiErrorResult<MusclesGroupResponseEntity>).errorMessage,
        equals(contains(dioException.message)),
      );
    });
    test("test use case function getAllMusclesGroups() Exception", () async {
      //Arrange
      final expectResult = ApiErrorResult<MusclesGroupResponseEntity>(
        exception,
      );
      when(
        exploreRepo.getAllMusclesGroups(),
      ).thenAnswer((_) async => expectResult);
      //Act
      final result = await useCase.call();
      //Assert
      verify(exploreRepo.getAllMusclesGroups()).called(1);
      expect(result, isA<ApiErrorResult<MusclesGroupResponseEntity>>());
      expect(
        (result as ApiErrorResult<MusclesGroupResponseEntity>).error,
        equals(exception),
      );
    });
  });
}
