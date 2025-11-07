import 'package:dio/dio.dart';
import 'package:elevate_super_fitness/core/api_result/api_result.dart';
import 'package:elevate_super_fitness/domain/entites/change_password_response_entity.dart';
import 'package:elevate_super_fitness/domain/repo/profile_repo.dart';
import 'package:elevate_super_fitness/domain/use_cases/change_password_use_case.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import '../../dummy/profile_dummy_data.dart';
import 'change_password_use_case_test.mocks.dart';

@GenerateMocks([ProfileRepo])
void main() {
  group("test profile change password repo implementation", () {
    late ProfileRepo profileRepo;
    late ChangePasswordUseCase useCase;
    final entityResponse = ProfileDummyData.dummyChangePasswordResponseEntity;
    final entityRequest = ProfileDummyData.dummyChangePasswordRequestEntity;
    final DioException dioException = ProfileDummyData.dummyDioException;
    final Exception exception = ProfileDummyData.dummyException;
    setUpAll(() {
      profileRepo = MockProfileRepo();
      useCase = ChangePasswordUseCase(profileRepo);
      provideDummy<ApiResult<ChangePasswordResponseEntity>>(
        ApiSuccessResult<ChangePasswordResponseEntity>(entityResponse),
      );
      provideDummy<ApiResult<ChangePasswordResponseEntity>>(
        ApiErrorResult<ChangePasswordResponseEntity>(dioException),
      );
    });
    test("test use case function ChangePassword() success data", () async {
      //Arrange
      final expectResult = ApiSuccessResult<ChangePasswordResponseEntity>(
        entityResponse,
      );
      when(
        profileRepo.changePassword(request: entityRequest),
      ).thenAnswer((_) async => expectResult);
      //Act
      final result = await useCase.call(entityRequest);
      //Assert
      verify(profileRepo.changePassword(request: entityRequest)).called(1);
      expect(result, isA<ApiSuccessResult<ChangePasswordResponseEntity>>());
      expect(
        (result as ApiSuccessResult<ChangePasswordResponseEntity>).data.message,
        entityResponse.message,
      );
      expect(result.data.message, equals(entityResponse.message));
      expect(result.data.token, equals(entityResponse.token));
    });
    test("test use case function ChangePassword() DioError", () async {
      //Arrange
      final expectResult = ApiErrorResult<ChangePasswordResponseEntity>(
        dioException,
      );
      when(
        profileRepo.changePassword(request: entityRequest),
      ).thenAnswer((_) async => expectResult);
      //Act
      final result = await useCase.call(entityRequest);
      //Assert
      verify(profileRepo.changePassword(request: entityRequest)).called(1);
      expect(result, isA<ApiErrorResult<ChangePasswordResponseEntity>>());
      expect(
        (result as ApiErrorResult<ChangePasswordResponseEntity>).errorMessage,
        equals(contains(dioException.message)),
      );
    });
    test("test use case function ChangePassword() Exception", () async {
      //Arrange
      final expectResult = ApiErrorResult<ChangePasswordResponseEntity>(
        exception,
      );
      when(
        profileRepo.changePassword(request: entityRequest),
      ).thenAnswer((_) async => expectResult);
      //Act
      final result = await useCase.call(entityRequest);
      //Assert
      verify(profileRepo.changePassword(request: entityRequest)).called(1);
      expect(result, isA<ApiErrorResult<ChangePasswordResponseEntity>>());
      expect(
        (result as ApiErrorResult<ChangePasswordResponseEntity>).error,
        equals(exception),
      );
    });
  });
}
