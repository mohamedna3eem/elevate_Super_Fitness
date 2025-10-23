import 'package:elevate_super_fitness/core/api_result/api_result.dart';
import 'package:elevate_super_fitness/domain/entites/login_entity.dart';
import 'package:elevate_super_fitness/domain/repo/auth_repo.dart';
import 'package:elevate_super_fitness/domain/use_cases/login_use_case.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import '../../dummy/login_dummy_data.dart';
import 'login_use_case_test.mocks.dart';

@GenerateMocks([AuthRepo])
void main() {
  group("test Login use case", () {
    final requestEntity = LoginDummyData.dummyLoginRequestEntity;
    final responseEntity = LoginDummyData.dummyLoginResponseEntity;
    final dioError = LoginDummyData.dummyDioException;
    final exception = LoginDummyData.dummyException;
    late MockAuthRepo mockAuthRepo;
    late LoginUseCase loginUseCase;
    setUp(() {
      mockAuthRepo = MockAuthRepo();
      loginUseCase = LoginUseCase(mockAuthRepo);
      provideDummy<ApiResult<LoginResponseEntity>>(
        ApiSuccessResult(responseEntity),
      );
      provideDummy<ApiResult<LoginResponseEntity>>(ApiErrorResult(dioError));
    });

    test("test use case success result", () async {
      //Arrange
      final expectResult = ApiSuccessResult(responseEntity);
      when(
        mockAuthRepo.login(request: requestEntity),
      ).thenAnswer((_) async => expectResult);
      //Act
      final result = await loginUseCase.call(request: requestEntity);
      //Assert
      expect(result, isA<ApiSuccessResult>());
      expect(
        (result as ApiSuccessResult<LoginResponseEntity>).data.email,
        equals(responseEntity.email),
      );
      expect(result.data.firstName, equals(responseEntity.firstName));
      verify(mockAuthRepo.login(request: requestEntity)).called(1);
    });
    test("test use case dioError", () async {
      //Arrange
      final expectResult = ApiErrorResult<LoginResponseEntity>(dioError);
      when(
        mockAuthRepo.login(request: requestEntity),
      ).thenAnswer((_) async => expectResult);
      //Act
      final result = await loginUseCase.call(request: requestEntity);
      //Assert
      expect(result, isA<ApiErrorResult>());
      expect(
        (result as ApiErrorResult<LoginResponseEntity>).errorMessage,
        equals(contains(dioError.message)),
      );

      verify(mockAuthRepo.login(request: requestEntity)).called(1);
    });
    test("test use case Exception", () async {
      //Arrange
      final expectResult = ApiErrorResult<LoginResponseEntity>(exception);
      when(
        mockAuthRepo.login(request: requestEntity),
      ).thenAnswer((_) async => expectResult);
      //Act
      final result = await mockAuthRepo.login(request: requestEntity);
      //Assert
      expect(result, isA<ApiErrorResult>());
      expect(
        (result as ApiErrorResult<LoginResponseEntity>).error,
        equals(exception),
      );
      verify(mockAuthRepo.login(request: requestEntity)).called(1);
    });
  });
}
