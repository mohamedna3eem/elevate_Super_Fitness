import 'package:dio/dio.dart';
import 'package:elevate_super_fitness/api/client/api_client.dart';
import 'package:elevate_super_fitness/api/data_source/profile_remote_data_source_impl.dart';
import 'package:elevate_super_fitness/api/mapper/profile_mapper.dart';
import 'package:elevate_super_fitness/core/api_result/api_result.dart';
import 'package:elevate_super_fitness/data/data_source/profile_remote_data_source.dart';
import 'package:elevate_super_fitness/domain/entites/change_password_response_entity.dart';
import 'package:elevate_super_fitness/domain/entites/logout_response_entity.dart';
import 'package:elevate_super_fitness/domain/entites/user_info_entity.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import '../../dummy/profile_dummy_data.dart';
import 'profile_remote_data_source_impl_test.mocks.dart';

@GenerateMocks([ApiClient])
void main() {
  group("test profile info", () {
    late ApiClient apiClient;
    late ProfileRemoteDataSource dataSource;
    setUpAll(() {
      apiClient = MockApiClient();
      dataSource = ProfileRemoteDataSourceImpl(apiClient);
    });
    final dtoResponse = ProfileDummyData.dummyUserInfoDto;
    final entityResponse = ProfileDummyData.dummyUserInfoEntity;
    final DioException dioException = ProfileDummyData.dummyDioException;
    final Exception exception = ProfileDummyData.dummyException;
    test("test getUserLoggedData() success data", () async {
      //Arrange
      when(
        apiClient.getGetLoggedUserData(),
      ).thenAnswer((_) async => dtoResponse);
      //Act
      final result = await dataSource.getUserLoggedData();
      //Assert
      verify(apiClient.getGetLoggedUserData()).called(1);
      expect(result, isA<ApiSuccessResult<UserInfoEntity>>());
      expect(
        (result as ApiSuccessResult<UserInfoEntity>).data.message,
        entityResponse.message,
      );
      expect(result.data.age, equals(entityResponse.age));
      expect(result.data.firstName, equals(entityResponse.firstName));
    });
    test("test getUserLoggedData() DioError", () async {
      //Arrange
      when(apiClient.getGetLoggedUserData()).thenThrow(dioException);
      //Act
      final result = await dataSource.getUserLoggedData();
      //Assert
      verify(apiClient.getGetLoggedUserData()).called(1);
      expect(result, isA<ApiErrorResult<UserInfoEntity>>());
      expect(
        (result as ApiErrorResult<UserInfoEntity>).errorMessage,
        equals(contains(dioException.message)),
      );
    });
    test("test getUserLoggedData() Exception", () async {
      //Arrange
      when(apiClient.getGetLoggedUserData()).thenThrow(exception);
      //Act
      final result = await dataSource.getUserLoggedData();
      //Assert
      verify(apiClient.getGetLoggedUserData()).called(1);
      expect(result, isA<ApiErrorResult<UserInfoEntity>>());
      expect(
        (result as ApiErrorResult<UserInfoEntity>).error,
        equals(exception),
      );
    });
  });
  group("test profile change password", () {
    late ApiClient apiClient;
    late ProfileRemoteDataSource dataSource;
    setUpAll(() {
      apiClient = MockApiClient();
      dataSource = ProfileRemoteDataSourceImpl(apiClient);
    });
    final requestEntity = ProfileDummyData.dummyChangePasswordRequestEntity;
    final dtoResponse = ProfileDummyData.dummyChangePasswordResponseDto;
    final entityResponse = ProfileDummyData.dummyChangePasswordResponseEntity;
    final DioException dioException = ProfileDummyData.dummyDioException;
    final Exception exception = ProfileDummyData.dummyException;
    test("test changePassword() success data", () async {
      //Arrange
      when(
        apiClient.changePassword(requestEntity.toDto()),
      ).thenAnswer((_) async => dtoResponse);
      //Act
      final result = await dataSource.changePassword(request: requestEntity);
      //Assert
      verify(apiClient.changePassword(requestEntity.toDto())).called(1);
      expect(result, isA<ApiSuccessResult<ChangePasswordResponseEntity>>());
      expect(
        (result as ApiSuccessResult<ChangePasswordResponseEntity>).data.message,
        entityResponse.message,
      );
      expect(result.data.message, equals(entityResponse.message));
      expect(result.data.token, equals(entityResponse.token));
    });
    test("test changePassword()() DioError", () async {
      //Arrange
      when(
        apiClient.changePassword(requestEntity.toDto()),
      ).thenThrow(dioException);
      //Act
      final result = await dataSource.changePassword(request: requestEntity);
      //Assert
      verify(apiClient.changePassword(requestEntity.toDto())).called(1);
      expect(result, isA<ApiErrorResult<ChangePasswordResponseEntity>>());
      expect(
        (result as ApiErrorResult<ChangePasswordResponseEntity>).errorMessage,
        equals(contains(dioException.message)),
      );
    });
    test("test changePassword()() Exception", () async {
      //Arrange
      when(
        apiClient.changePassword(requestEntity.toDto()),
      ).thenThrow(exception);
      //Act
      final result = await dataSource.changePassword(request: requestEntity);
      //Assert
      verify(apiClient.changePassword(requestEntity.toDto())).called(1);
      expect(result, isA<ApiErrorResult<ChangePasswordResponseEntity>>());
      expect(
        (result as ApiErrorResult<ChangePasswordResponseEntity>).error,
        equals(exception),
      );
    });
  });
  group("test logout functionality", () {
    late MockApiClient mockApiClient;
    late ProfileRemoteDataSource dataSource;
    final fakeLogoutResponseDto = ProfileDummyData.dummyLogoutResponseDto;
    final DioException fakeDioException = DioException(
      requestOptions: RequestOptions(),
      message: "fake_message",
    );
    final Exception fakeException = Exception();
    setUp(() {
      mockApiClient = MockApiClient();
      dataSource = ProfileRemoteDataSourceImpl(mockApiClient);
    });
    test("logout success", () async {
      //ARRANGE
      when(
        mockApiClient.logout(),
      ).thenAnswer((_) async => fakeLogoutResponseDto);
      //ACT
      final result = await dataSource.logout();
      //ASSERT
      expect(result, isA<ApiSuccessResult<LogoutResponseEntity>>());
      expect(
        (result as ApiSuccessResult<LogoutResponseEntity>).data.message,
        equals(fakeLogoutResponseDto.message),
      );
      verify(mockApiClient.logout()).called(1);
    });
    test("logout dio exception", () async {
      //ARRANGE
      when(mockApiClient.logout()).thenThrow(fakeDioException);
      //ACT
      final result = await dataSource.logout();
      //ASSERT
      expect(result, isA<ApiErrorResult<LogoutResponseEntity>>());
      expect(
        (result as ApiErrorResult<LogoutResponseEntity>).errorMessage,
        equals(contains(fakeDioException.message)),
      );
      verify(mockApiClient.logout()).called(1);
    });
    test("logout exception", () async {
      //ARRANGE
      when(mockApiClient.logout()).thenThrow(fakeException);
      //ACT
      final result = await dataSource.logout();
      //ASSERT
      expect(result, isA<ApiErrorResult<LogoutResponseEntity>>());
      expect(
        (result as ApiErrorResult<LogoutResponseEntity>).error,
        equals(fakeException),
      );
      verify(mockApiClient.logout()).called(1);
    });
  });
}
