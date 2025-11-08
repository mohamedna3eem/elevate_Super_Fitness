import 'package:elevate_super_fitness/core/api_result/api_result.dart';
import 'package:elevate_super_fitness/domain/entites/logout_entity.dart';
import 'package:elevate_super_fitness/domain/repo/logout_repo.dart';
import 'package:elevate_super_fitness/domain/use_cases/logout_use_case.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'logout_use_case_test.mocks.dart';


@GenerateMocks([LogoutRepo])
void main() {
  late MockLogoutRepo mockLogoutRepo;
  late LogoutUseCase logoutUseCase;

  setUp(() {
    mockLogoutRepo = MockLogoutRepo();
    logoutUseCase = LogoutUseCase(mockLogoutRepo);

    provideDummy<ApiResult<LogOutResponseEntity>>(
      ApiSuccessResult(LogOutResponseEntity(message: "Logged out successfully")),
    );
  });

  final successEntity = LogOutResponseEntity(message: "Logged out successfully");

  test("should return ApiSuccessResult when repo returns success", () async {
    // Arrange
    when(mockLogoutRepo.logout())
        .thenAnswer((_) async => ApiSuccessResult(successEntity));

    // Act
    final result = await logoutUseCase();

    // Assert
    expect(result, isA<ApiSuccessResult<LogOutResponseEntity>>());
    expect((result as ApiSuccessResult).data.message, successEntity.message);
    verify(mockLogoutRepo.logout()).called(1);
  });

  test("should return ApiErrorResult when repo returns error", () async {
    // Arrange
    final exception = Exception("Logout failed");
    when(mockLogoutRepo.logout())
        .thenAnswer((_) async => ApiErrorResult(exception));

    // Act
    final result = await logoutUseCase();

    // Assert
    expect(result, isA<ApiErrorResult<LogOutResponseEntity>>());
    expect((result as ApiErrorResult).error, exception);
    verify(mockLogoutRepo.logout()).called(1);
  });
}
