import 'package:dio/dio.dart';
import 'package:elevate_super_fitness/core/api_result/api_result.dart';
import 'package:elevate_super_fitness/data/data_source/profile_local_data_source.dart';
import 'package:elevate_super_fitness/data/data_source/profile_remote_data_source.dart';
import 'package:elevate_super_fitness/data/repo/profile_repo_impl.dart';
import 'package:elevate_super_fitness/domain/entites/change_password_response_entity.dart';
import 'package:elevate_super_fitness/domain/repo/profile_repo.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import '../../dummy/profile_dummy_data.dart';
import 'profile_repo_impl_test.mocks.dart';

@GenerateMocks([ProfileRemoteDataSource, ProfileLocalDataSource])
void main() {
  group("test profile info repo implementation", () {
    late ProfileRemoteDataSource dataSource;
    late ProfileLocalDataSource localDataSource;
    late ProfileRepo profileRepo;
    final entityResponse = ProfileDummyData.dummyChangePasswordResponseEntity;
    final entityRequest = ProfileDummyData.dummyChangePasswordRequestEntity;
    final DioException dioException = ProfileDummyData.dummyDioException;
    final Exception exception = ProfileDummyData.dummyException;
    setUpAll(() {
      dataSource = MockProfileRemoteDataSource();
      localDataSource = MockProfileLocalDataSource();
      profileRepo = ProfileRepoImpl(dataSource, localDataSource);
      provideDummy<ApiResult<ChangePasswordResponseEntity>>(
        ApiSuccessResult<ChangePasswordResponseEntity>(entityResponse),
      );
      provideDummy<ApiResult<ChangePasswordResponseEntity>>(
        ApiErrorResult<ChangePasswordResponseEntity>(dioException),
      );
    });
    test("test repo function changePassword() success data", () async {
      //Arrange
      final expectResult = ApiSuccessResult<ChangePasswordResponseEntity>(
        entityResponse,
      );
      when(
        dataSource.changePassword(request: entityRequest),
      ).thenAnswer((_) async => expectResult);
      //Act
      final result = await profileRepo.changePassword(request: entityRequest);
      //Assert
      verify(dataSource.changePassword(request: entityRequest)).called(1);

      expect(result, isA<ApiSuccessResult<ChangePasswordResponseEntity>>());
      verify(
        localDataSource.saveUserToken(token: entityResponse.token!),
      ).called(1);
      expect(
        (result as ApiSuccessResult<ChangePasswordResponseEntity>).data.message,
        entityResponse.message,
      );
      expect(result.data.message, equals(entityResponse.message));
      expect(result.data.token, equals(entityResponse.token));
    });
    test("test repo function changePassword() DioError", () async {
      //Arrange
      final expectResult = ApiErrorResult<ChangePasswordResponseEntity>(
        dioException,
      );
      when(
        dataSource.changePassword(request: entityRequest),
      ).thenAnswer((_) async => expectResult);
      //Act
      final result = await profileRepo.changePassword(request: entityRequest);
      //Assert
      verify(dataSource.changePassword(request: entityRequest)).called(1);
      expect(result, isA<ApiErrorResult<ChangePasswordResponseEntity>>());
      verifyNever(
        localDataSource.saveUserToken(token: entityResponse.token!),
      ).called(0);
      expect(
        (result as ApiErrorResult<ChangePasswordResponseEntity>).errorMessage,
        equals(contains(dioException.message)),
      );
    });
    test("test repo function changePassword() Exception", () async {
      //Arrange
      final expectResult = ApiErrorResult<ChangePasswordResponseEntity>(
        exception,
      );
      when(
        dataSource.changePassword(request: entityRequest),
      ).thenAnswer((_) async => expectResult);
      //Act
      final result = await profileRepo.changePassword(request: entityRequest);
      //Assert
      verify(dataSource.changePassword(request: entityRequest)).called(1);
      expect(result, isA<ApiErrorResult<ChangePasswordResponseEntity>>());
      verifyNever(
        localDataSource.saveUserToken(token: entityResponse.token!),
      ).called(0);
      expect(
        (result as ApiErrorResult<ChangePasswordResponseEntity>).error,
        equals(exception),
      );
    });
  });
}
