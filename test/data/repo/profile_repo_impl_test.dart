import 'package:dio/dio.dart';
import 'package:elevate_super_fitness/core/api_result/api_result.dart';
import 'package:elevate_super_fitness/data/data_source/profile_remote_data_source.dart';
import 'package:elevate_super_fitness/data/repo/profile_repo_impl.dart';
import 'package:elevate_super_fitness/domain/entites/user_info_entity.dart';
import 'package:elevate_super_fitness/domain/repo/profile_repo.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import '../../dummy/profile_dummy_data.dart';
import 'profile_repo_impl_test.mocks.dart';

@GenerateMocks([ProfileRemoteDataSource])
void main() {
  group("test profile info repo implementation", () {
    late ProfileRemoteDataSource dataSource;
    late ProfileRepo profileRepo;
    final entityResponse = ProfileDummyData.dummyUserInfoEntity;
    final DioException dioException = ProfileDummyData.dummyDioException;
    final Exception exception = ProfileDummyData.dummyException;
    setUpAll(() {
      dataSource = MockProfileRemoteDataSource();
      profileRepo = ProfileRepoImpl(dataSource);
      provideDummy<ApiResult<UserInfoEntity>>(
        ApiSuccessResult<UserInfoEntity>(entityResponse),
      );
      provideDummy<ApiResult<UserInfoEntity>>(
        ApiErrorResult<UserInfoEntity>(dioException),
      );
    });
    test("test repo function getUserLoggedData() success data", () async {
      //Arrange
      final expectResult = ApiSuccessResult<UserInfoEntity>(entityResponse);
      when(
        dataSource.getUserLoggedData(),
      ).thenAnswer((_) async => expectResult);
      //Act
      final result = await profileRepo.getUserLoggedData();
      //Assert
      verify(dataSource.getUserLoggedData()).called(1);
      expect(result, isA<ApiSuccessResult<UserInfoEntity>>());
      expect(
        (result as ApiSuccessResult<UserInfoEntity>).data.message,
        entityResponse.message,
      );
      expect(result.data.age, equals(entityResponse.age));
      expect(result.data.firstName, equals(entityResponse.firstName));
    });
    test("test repo function getUserLoggedData() DioError", () async {
      //Arrange
      final expectResult = ApiErrorResult<UserInfoEntity>(dioException);
      when(
        dataSource.getUserLoggedData(),
      ).thenAnswer((_) async => expectResult);
      //Act
      final result = await profileRepo.getUserLoggedData();
      //Assert
      verify(dataSource.getUserLoggedData()).called(1);
      expect(result, isA<ApiErrorResult<UserInfoEntity>>());
      expect(
        (result as ApiErrorResult<UserInfoEntity>).errorMessage,
        equals(contains(dioException.message)),
      );
    });
    test("test repo function getUserLoggedData() Exception", () async {
      //Arrange
      final expectResult = ApiErrorResult<UserInfoEntity>(exception);
      when(
        dataSource.getUserLoggedData(),
      ).thenAnswer((_) async => expectResult);
      //Act
      final result = await profileRepo.getUserLoggedData();
      //Assert
      verify(dataSource.getUserLoggedData()).called(1);
      expect(result, isA<ApiErrorResult<UserInfoEntity>>());
      expect(
        (result as ApiErrorResult<UserInfoEntity>).error,
        equals(exception),
      );
    });
  });
}
