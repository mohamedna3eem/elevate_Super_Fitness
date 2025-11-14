import 'package:dio/dio.dart';
import 'package:elevate_super_fitness/core/api_result/api_result.dart';
import 'package:elevate_super_fitness/domain/entites/logout_response_entity.dart';
import 'package:elevate_super_fitness/domain/repo/profile_repo.dart';
import 'package:elevate_super_fitness/domain/use_cases/logout_use_case.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import '../../dummy/profile_dummy_data.dart';
import 'change_password_use_case_test.mocks.dart';

@GenerateMocks([ProfileRepo])
void main() {
  group("Logout use case", () {
    final fakeLogoutResponseEntity = ProfileDummyData.dummyLogoutResponseEntity;
    late ProfileRepo profileRepo;
    late LogoutUseCase useCase;
    final DioException dioException = DioException(
      requestOptions: RequestOptions(),
      message: "fake_dio_message",
    );
    final Exception fakeException = Exception();
    setUp(() {
      profileRepo = MockProfileRepo();
      useCase = LogoutUseCase(profileRepo);
      provideDummy<ApiResult<LogoutResponseEntity>>(
        ApiSuccessResult<LogoutResponseEntity>(fakeLogoutResponseEntity),
      );
      provideDummy<ApiResult<LogoutResponseEntity>>(
        ApiErrorResult<LogoutResponseEntity>(fakeException),
      );
    });
    test("logout use case success ApiResult LogoutResponseEntity", () async {
      final expectResult = ApiSuccessResult<LogoutResponseEntity>(
        fakeLogoutResponseEntity,
      );
      when(profileRepo.logout()).thenAnswer((_) async => expectResult);

      final result = await useCase.call();
      expect(result, isA<ApiSuccessResult<LogoutResponseEntity>>());
      expect(
        (result as ApiSuccessResult<LogoutResponseEntity>).data.message,
        equals(fakeLogoutResponseEntity.message),
      );
      verify(profileRepo.logout()).called(1);
    });
    test("logout use case failure ApiResult DioError", () async {
      final expectResult = ApiErrorResult<LogoutResponseEntity>(dioException);
      when(profileRepo.logout()).thenAnswer((_) async => expectResult);

      final result = await useCase.call();
      expect(result, isA<ApiErrorResult<LogoutResponseEntity>>());
      expect(
        (result as ApiErrorResult<LogoutResponseEntity>).errorMessage,
        contains(dioException.message),
      );

      verify(profileRepo.logout()).called(1);
    });
    test("logout use case failure ApiResult Exception", () async {
      final expectResult = ApiErrorResult<LogoutResponseEntity>(fakeException);
      when(profileRepo.logout()).thenAnswer((_) async => expectResult);

      final result = await useCase.call();
      expect(result, isA<ApiErrorResult<LogoutResponseEntity>>());
      expect(
        (result as ApiErrorResult<LogoutResponseEntity>).error,
        equals(fakeException),
      );
      verify(profileRepo.logout()).called(1);
    });
  });
}
