import 'package:elevate_super_fitness/core/api_result/api_result.dart';
import 'package:elevate_super_fitness/domain/entites/profile/profile_response_entity.dart';
import 'package:elevate_super_fitness/domain/repo/profile_repo.dart';
import 'package:elevate_super_fitness/domain/use_cases/profile_use_case.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import '../../dummy/profile_dummy_data.dart';
import 'change_password_use_case_test.mocks.dart';

@GenerateMocks([ProfileRepo])
void main() {
  late MockProfileRepo mockProfileRepo;
  late ProfileUseCase profileUseCase;

  setUp(() {
    mockProfileRepo = MockProfileRepo();
    profileUseCase = ProfileUseCase(mockProfileRepo);

    provideDummy<ApiResult<ProfileResponseEntity>>(
      ApiSuccessResult(ProfileDummyData.dummyProfileResponseEntity),
    );
  });

  final profileEntity = ProfileDummyData.dummyProfileResponseEntity;

  test("should return ApiSuccessResult when repo returns success", () async {
    // Arrange
    when(mockProfileRepo.getProfileData())
        .thenAnswer((_) async => ApiSuccessResult(profileEntity));

    // Act
    final result = await profileUseCase();

    // Assert
    expect(result, isA<ApiSuccessResult<ProfileResponseEntity>>());
    expect((result as ApiSuccessResult).data.user?.firstName,
        profileEntity.user?.firstName);
    verify(mockProfileRepo.getProfileData()).called(1);
  });

  test("should return ApiErrorResult when repo returns error", () async {
    // Arrange
    final exception = Exception("Something went wrong");
    when(mockProfileRepo.getProfileData())
        .thenAnswer((_) async => ApiErrorResult(exception));

    // Act
    final result = await profileUseCase();

    // Assert
    expect(result, isA<ApiErrorResult<ProfileResponseEntity>>());
    expect((result as ApiErrorResult).error, exception);
    verify(mockProfileRepo.getProfileData()).called(1);
  });
}
