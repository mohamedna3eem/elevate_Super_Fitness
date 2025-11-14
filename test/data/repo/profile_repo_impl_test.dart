import 'package:dio/dio.dart';
import 'package:elevate_super_fitness/core/api_result/api_result.dart';
import 'package:elevate_super_fitness/core/constants/const_keys.dart';
import 'package:elevate_super_fitness/data/data_source/profile_local_data_source.dart';
import 'package:elevate_super_fitness/data/data_source/profile_remote_data_source.dart';
import 'package:elevate_super_fitness/data/repo/profile_repo_impl.dart';
import 'package:elevate_super_fitness/domain/entites/change_password_response_entity.dart';
import 'package:elevate_super_fitness/domain/entites/logout_response_entity.dart';
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
  group("test change password repo impl", () {
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
  group("test logout repo", () {
    late ProfileRemoteDataSource remoteDataSource;
    late ProfileLocalDataSource localDataSource;
    late ProfileRepo profileRepo;
    final fakeLogoutResponseEntity = ProfileDummyData.dummyLogoutResponseEntity;
    final DioException fakeDioException = DioException(
      requestOptions: RequestOptions(),
      message: "fake_message",
    );
    final Exception fakeException = Exception();
    setUp(() {
      remoteDataSource = MockProfileRemoteDataSource();
      localDataSource = MockProfileLocalDataSource();
      profileRepo = ProfileRepoImpl(remoteDataSource, localDataSource);

      provideDummy<ApiResult<LogoutResponseEntity>>(
        ApiSuccessResult<LogoutResponseEntity>(fakeLogoutResponseEntity),
      );
      provideDummy<ApiResult<LogoutResponseEntity>>(
        ApiErrorResult<LogoutResponseEntity>(fakeException),
      );
    });
    test("logout success ApiResult LogoutResponseEntity", () async {
      final expectResult = ApiSuccessResult<LogoutResponseEntity>(
        fakeLogoutResponseEntity,
      );
      when(remoteDataSource.logout()).thenAnswer((_) async => expectResult);

      final result = await profileRepo.logout();
      expect(result, isA<ApiSuccessResult<LogoutResponseEntity>>());
      expect(
        (result as ApiSuccessResult<LogoutResponseEntity>).data.message,
        equals(fakeLogoutResponseEntity.message),
      );

      verify(remoteDataSource.logout()).called(1);
      verify(
        localDataSource.deleteTokenToken(key: ConstKeys.keyUserToken),
      ).called(1);
      verify(
        localDataSource.deleteRememberMe(key: ConstKeys.keyRememberMe),
      ).called(1);
    });
    test("logout failure ApiResult DioError", () async {
      final expectResult = ApiErrorResult<LogoutResponseEntity>(
        fakeDioException,
      );
      when(remoteDataSource.logout()).thenAnswer((_) async => expectResult);

      final result = await profileRepo.logout();
      expect(result, isA<ApiErrorResult<LogoutResponseEntity>>());
      expect(
        (result as ApiErrorResult<LogoutResponseEntity>).errorMessage,
        contains(fakeDioException.message),
      );

      verify(remoteDataSource.logout()).called(1);
      verifyNever(
        localDataSource.deleteTokenToken(key: ConstKeys.keyUserToken),
      ).called(0);
      verifyNever(
        localDataSource.deleteRememberMe(key: ConstKeys.keyRememberMe),
      ).called(0);
    });
    test("logout failure ApiResult Exception", () async {
      final expectResult = ApiErrorResult<LogoutResponseEntity>(fakeException);
      when(remoteDataSource.logout()).thenAnswer((_) async => expectResult);

      final result = await profileRepo.logout();
      expect(result, isA<ApiErrorResult<LogoutResponseEntity>>());
      expect(
        (result as ApiErrorResult<LogoutResponseEntity>).error,
        equals(fakeException),
      );

      verify(remoteDataSource.logout()).called(1);
      verifyNever(
        localDataSource.deleteTokenToken(key: ConstKeys.keyUserToken),
      ).called(0);
      verifyNever(
        localDataSource.deleteRememberMe(key: ConstKeys.keyRememberMe),
      ).called(0);
    });
  });
}
