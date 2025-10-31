import 'package:dio/dio.dart';
import 'package:elevate_super_fitness/api/client/api_client.dart';
import 'package:elevate_super_fitness/api/data_source/profile_remote_data_source_impl.dart';
import 'package:elevate_super_fitness/core/api_result/api_result.dart';
import 'package:elevate_super_fitness/data/data_source/profile_remote_data_source.dart';
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
}
