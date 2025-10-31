import 'package:dio/dio.dart';
import 'package:elevate_super_fitness/core/api_result/api_result.dart';
import 'package:elevate_super_fitness/domain/entites/user_info_entity.dart';
import 'package:elevate_super_fitness/domain/repo/profile_repo.dart';
import 'package:elevate_super_fitness/domain/use_cases/get_user_logged_data_use_case.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import '../../dummy/profile_dummy_data.dart';
import 'get_user_logged_data_use_case_test.mocks.dart';

@GenerateMocks([ProfileRepo])
void main() {
  group("test profile info repo implementation", () {
    late ProfileRepo profileRepo;
    late GetUserLoggedDataUseCase useCase;
    final entityResponse = ProfileDummyData.dummyUserInfoEntity;
    final DioException dioException = ProfileDummyData.dummyDioException;
    final Exception exception = ProfileDummyData.dummyException;
    setUpAll(() {
      profileRepo = MockProfileRepo();
      useCase = GetUserLoggedDataUseCase(profileRepo);
      provideDummy<ApiResult<UserInfoEntity>>(
        ApiSuccessResult<UserInfoEntity>(entityResponse),
      );
      provideDummy<ApiResult<UserInfoEntity>>(
        ApiErrorResult<UserInfoEntity>(dioException),
      );
    });
    test("test use case function getUserLoggedData() success data", () async {
      //Arrange
      final expectResult = ApiSuccessResult<UserInfoEntity>(entityResponse);
      when(
        profileRepo.getUserLoggedData(),
      ).thenAnswer((_) async => expectResult);
      //Act
      final result = await useCase.call();
      //Assert
      verify(profileRepo.getUserLoggedData()).called(1);
      expect(result, isA<ApiSuccessResult<UserInfoEntity>>());
      expect(
        (result as ApiSuccessResult<UserInfoEntity>).data.message,
        entityResponse.message,
      );
      expect(result.data.age, equals(entityResponse.age));
      expect(result.data.firstName, equals(entityResponse.firstName));
    });
    test("test use case function getUserLoggedData() DioError", () async {
      //Arrange
      final expectResult = ApiErrorResult<UserInfoEntity>(dioException);
      when(
        profileRepo.getUserLoggedData(),
      ).thenAnswer((_) async => expectResult);
      //Act
      final result = await useCase.call();
      //Assert
      verify(profileRepo.getUserLoggedData()).called(1);
      expect(result, isA<ApiErrorResult<UserInfoEntity>>());
      expect(
        (result as ApiErrorResult<UserInfoEntity>).errorMessage,
        equals(contains(dioException.message)),
      );
    });
    test("test use case function getUserLoggedData() Exception", () async {
      //Arrange
      final expectResult = ApiErrorResult<UserInfoEntity>(exception);
      when(
        profileRepo.getUserLoggedData(),
      ).thenAnswer((_) async => expectResult);
      //Act
      final result = await useCase.call();
      //Assert
      verify(profileRepo.getUserLoggedData()).called(1);
      expect(result, isA<ApiErrorResult<UserInfoEntity>>());
      expect(
        (result as ApiErrorResult<UserInfoEntity>).error,
        equals(exception),
      );
    });
  });
}
