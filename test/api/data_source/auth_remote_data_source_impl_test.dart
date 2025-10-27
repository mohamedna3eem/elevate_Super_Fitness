import 'package:dio/dio.dart';
import 'package:elevate_super_fitness/api/client/api_client.dart';
import 'package:elevate_super_fitness/api/data_source/auth_remote_data_source_impl.dart';
import 'package:elevate_super_fitness/api/mapper/login_mapper.dart';
import 'package:elevate_super_fitness/core/api_result/api_result.dart';
import 'package:elevate_super_fitness/data/data_source/auth_remote_data_source.dart';
import 'package:elevate_super_fitness/domain/entites/login_entity.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import '../../dummy/login_dummy_data.dart';
import 'auth_remote_data_source_impl_test.mocks.dart';

@GenerateMocks([ApiClient])
void main() {
  group("test Login Function", () {
    final requestEntity = LoginDummyData.dummyLoginRequestEntity;
    final responseDto = LoginDummyData.dummyLoginResponseDto;
    final responseEntity = responseDto.toEntity();
    final requestDto = requestEntity.toDto();
    final DioException dioError = LoginDummyData.dummyDioException;
    final exception = LoginDummyData.dummyException;
    late MockApiClient mockApiClient;
    late AuthRemoteDataSource authRemoteDataSource;
    setUp(() {
      mockApiClient = MockApiClient();
      authRemoteDataSource = AuthRemoteDataSourceImpl(mockApiClient);
    });
    test("test Login Success", () async {
      //Arrange
      when(
        mockApiClient.login(requestDto),
      ).thenAnswer((_) async => responseDto);
      //Act
      final result = await authRemoteDataSource.login(request: requestEntity);
      //Assert
      verify(mockApiClient.login(requestDto)).called(1);
      expect(result, isA<ApiSuccessResult>());
      expect(
        (result as ApiSuccessResult<LoginResponseEntity>).data.email,
        equals(responseEntity.email),
      );
    });
    test("test Login Success", () async {
      //Arrange
      when(
        mockApiClient.login(requestDto),
      ).thenAnswer((_) async => responseDto);
      //Act
      final result = await authRemoteDataSource.login(request: requestEntity);
      //Assert
      verify(mockApiClient.login(requestDto)).called(1);
      expect(result, isA<ApiSuccessResult>());
      expect(
        (result as ApiSuccessResult<LoginResponseEntity>).data.email,
        equals(responseEntity.email),
      );
    });
    test("test Login DioError", () async {
      //Arrange
      when(mockApiClient.login(requestDto)).thenThrow(dioError);
      //Act
      final result = await authRemoteDataSource.login(request: requestEntity);
      //Assert
      verify(mockApiClient.login(requestDto)).called(1);
      expect(result, isA<ApiErrorResult>());
      expect(
        (result as ApiErrorResult<LoginResponseEntity>).errorMessage,
        equals(contains(dioError.message)),
      );
    });
    test("test Login Exception", () async {
      //Arrange
      when(mockApiClient.login(requestDto)).thenThrow(exception);
      //Act
      final result = await authRemoteDataSource.login(request: requestEntity);
      //Assert
      verify(mockApiClient.login(requestDto)).called(1);
      expect(result, isA<ApiErrorResult>());
      expect(
        (result as ApiErrorResult<LoginResponseEntity>).error,
        equals(exception),
      );
    });
  });
}
