import 'package:elevate_super_fitness/core/api_result/api_result.dart';
import 'package:elevate_super_fitness/data/data_source/auth_local_data_source.dart';
import 'package:elevate_super_fitness/data/data_source/auth_remote_data_source.dart';
import 'package:elevate_super_fitness/data/repo/auth_repo_impl.dart';
import 'package:elevate_super_fitness/domain/entites/login_entity.dart';
import 'package:elevate_super_fitness/domain/repo/auth_repo.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import '../../dummy/login_dummy_data.dart';
import 'auth_repo_impl_test.mocks.dart';

@GenerateMocks([AuthRemoteDataSource, AuthLocalDataSource])
void main() {
  group("test AuthRepo to function Login", () {
    final requestEntity = LoginDummyData.dummyLoginRequestEntity;
    final responseEntity = LoginDummyData.dummyLoginResponseEntity;
    final dioError = LoginDummyData.dummyDioException;
    final exception = LoginDummyData.dummyException;
    late MockAuthRemoteDataSource mockAuthRemoteDataSource;
    late MockAuthLocalDataSource mockAuthLocalDataSource;
    late AuthRepo authRepo;
    setUp(() {
      mockAuthLocalDataSource = MockAuthLocalDataSource();
      mockAuthRemoteDataSource = MockAuthRemoteDataSource();
      authRepo = AuthRepoImpl(
        mockAuthRemoteDataSource,
        mockAuthLocalDataSource,
      );
      provideDummy<ApiResult<LoginResponseEntity>>(
        ApiSuccessResult(responseEntity),
      );
      provideDummy<ApiResult<LoginResponseEntity>>(ApiErrorResult(dioError));
    });

    test("test login success result", () async {
      //Arrange
      final expectResult = ApiSuccessResult(responseEntity);
      when(
        mockAuthRemoteDataSource.login(request: requestEntity),
      ).thenAnswer((_) async => expectResult);
      //Act
      final result = await authRepo.login(request: requestEntity);
      //Assert
      expect(result, isA<ApiSuccessResult>());
      expect(
        (result as ApiSuccessResult<LoginResponseEntity>).data.email,
        equals(responseEntity.email),
      );
      expect(result.data.firstName, equals(responseEntity.firstName));
      verify(
        mockAuthLocalDataSource.saveLoginData(
          token: result.data.token,
          rememberMe: requestEntity.rememberMe,
        ),
      ).called(1);
      verify(mockAuthRemoteDataSource.login(request: requestEntity)).called(1);
    });
    test("test login dioError", () async {
      //Arrange
      final expectResult = ApiErrorResult<LoginResponseEntity>(dioError);
      when(
        mockAuthRemoteDataSource.login(request: requestEntity),
      ).thenAnswer((_) async => expectResult);
      //Act
      final result = await authRepo.login(request: requestEntity);
      //Assert
      expect(result, isA<ApiErrorResult>());
      expect(
        (result as ApiErrorResult<LoginResponseEntity>).errorMessage,
        equals(contains(dioError.message)),
      );
      verifyNever(
        mockAuthLocalDataSource.saveLoginData(
          token: responseEntity.token,
          rememberMe: requestEntity.rememberMe,
        ),
      ).called(0);
      verify(mockAuthRemoteDataSource.login(request: requestEntity)).called(1);
    });
    test("test login Exception", () async {
      //Arrange
      final expectResult = ApiErrorResult<LoginResponseEntity>(exception);
      when(
        mockAuthRemoteDataSource.login(request: requestEntity),
      ).thenAnswer((_) async => expectResult);
      //Act
      final result = await authRepo.login(request: requestEntity);
      //Assert
      expect(result, isA<ApiErrorResult>());
      expect(
        (result as ApiErrorResult<LoginResponseEntity>).error,
        equals(exception),
      );
      verifyNever(
        mockAuthLocalDataSource.saveLoginData(
          token: responseEntity.token,
          rememberMe: requestEntity.rememberMe,
        ),
      ).called(0);
      verify(mockAuthRemoteDataSource.login(request: requestEntity)).called(1);
    });
  });
}
