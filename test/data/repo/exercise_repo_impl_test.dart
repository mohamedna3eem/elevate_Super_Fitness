import 'package:elevate_super_fitness/core/api_result/api_result.dart';
import 'package:elevate_super_fitness/data/data_source/exercise_remote_data_source.dart';
import 'package:elevate_super_fitness/data/repo/exercise_repo_impl.dart';
import 'package:elevate_super_fitness/domain/entites/exercise_difficulty_level_entity.dart';
import 'package:elevate_super_fitness/domain/entites/get_selected_exercise_entity.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import '../../dummy/exercise_dummy.dart';
import 'exercise_repo_impl_test.mocks.dart';

@GenerateMocks([ExerciseRemoteDataSource])
void main() {
  group("test ExerciseRepoImpl", () {
    late MockExerciseRemoteDataSource mockExerciseRemoteDataSource;
    late ExerciseRepoImpl exerciseRepoImpl;

    setUp(() {
      mockExerciseRemoteDataSource = MockExerciseRemoteDataSource();
      exerciseRepoImpl = ExerciseRepoImpl(mockExerciseRemoteDataSource);
    });

    group("test getAllDifficultyLevelsByPrimeMoverMuscle", () {
      test("when call it should return List of ExerciseDifficultyLevelEntity from datasource with correct parameters", () async {
          //Arrange
        final expectedEntity = [
          ExerciseDummy.dummyExcerciseDifficultyLevelEntity,
        ];
        final expectedResult = ApiSuccessResult(expectedEntity);
        provideDummy<ApiResult<List<ExerciseDifficultyLevelEntity>>>(
          expectedResult,
        );
        when(
          mockExerciseRemoteDataSource.getAllDifficultyLevelsByPrimeMoverMuscle(
            primeMoverMuscleId: ExerciseDummy.dummyPrimeMoverMuscleId,
          ),
        ).thenAnswer((_) async => expectedResult);

        //Act
        final result = await exerciseRepoImpl.getAllDifficultyLevelsByPrimeMoverMuscle(primeMoverMuscleId: ExerciseDummy.dummyPrimeMoverMuscleId);

        //Assert
        verify(
          mockExerciseRemoteDataSource.getAllDifficultyLevelsByPrimeMoverMuscle(
            primeMoverMuscleId: ExerciseDummy.dummyPrimeMoverMuscleId,
          ),
        ).called(1);
        expect(result, isA<ApiSuccessResult<List<ExerciseDifficultyLevelEntity>>>());
        result as ApiSuccessResult<List<ExerciseDifficultyLevelEntity>>;
        expect(result.data.length, expectedEntity.length);
        expect(result.data[0], expectedEntity[0]);
      });
      test("when call failed it should return an error result", () async {
        //Arrange
        final expectedError = ExerciseDummy.expectedError;
        final expectedResult =
            ApiErrorResult<List<ExerciseDifficultyLevelEntity>>(expectedError);
        provideDummy<ApiResult<List<ExerciseDifficultyLevelEntity>>>(
          expectedResult,
        );
        when(
          mockExerciseRemoteDataSource.getAllDifficultyLevelsByPrimeMoverMuscle(
            primeMoverMuscleId: ExerciseDummy.dummyPrimeMoverMuscleId,
          ),
        ).thenAnswer((_) async => expectedResult);

        //Act
        final result = await exerciseRepoImpl.getAllDifficultyLevelsByPrimeMoverMuscle(primeMoverMuscleId: ExerciseDummy.dummyPrimeMoverMuscleId);

        //Assert
        verify(
          mockExerciseRemoteDataSource.getAllDifficultyLevelsByPrimeMoverMuscle(
            primeMoverMuscleId: ExerciseDummy.dummyPrimeMoverMuscleId,
          ),
        ).called(1);
        expect(
          result,
          isA<ApiErrorResult<List<ExerciseDifficultyLevelEntity>>>(),
        );
        result as ApiErrorResult<List<ExerciseDifficultyLevelEntity>>;
        expect(result.errorMessage, expectedError);
      });
    });


    group("test getExercisesByPrimeMoverMuscleandDifficultyLevel", () {
      test(
        "when call it should return List of GetSelectedExerciseEntity from datasource with correct parameters",
        () async {
          //Arrange
          final expectedEntity = [ExerciseDummy.dummyGetSelectedExerciseEntity];
          final expectedResult = ApiSuccessResult(expectedEntity);
          provideDummy<ApiResult<List<GetSelectedExerciseEntity>>>(
            expectedResult,
          );
          when(
            mockExerciseRemoteDataSource.getExercisesByPrimeMoverMuscleandDifficultyLevel(
              primeMoverMuscleId: ExerciseDummy.dummyPrimeMoverMuscleId,
              difficultyLevelId: ExerciseDummy.dummyDifficultyLevelId,
            ),
          ).thenAnswer((_) async => expectedResult);

          //Act
          final result =
              await exerciseRepoImpl.getExercisesByPrimeMoverMuscleandDifficultyLevel(primeMoverMuscleId: ExerciseDummy.dummyPrimeMoverMuscleId, difficultyLevelId: ExerciseDummy.dummyDifficultyLevelId);

          //Assert
          verify(
            mockExerciseRemoteDataSource.getExercisesByPrimeMoverMuscleandDifficultyLevel(
              primeMoverMuscleId: ExerciseDummy.dummyPrimeMoverMuscleId,
              difficultyLevelId: ExerciseDummy.dummyDifficultyLevelId,
            ),
          ).called(1);
          expect(
            result,
            isA<ApiSuccessResult<List<GetSelectedExerciseEntity>>>(),
          );
          result as ApiSuccessResult<List<GetSelectedExerciseEntity>>;
          expect(result.data.length, expectedEntity.length);
          expect(result.data[0], expectedEntity[0]);
        },
      );
      test("when call failed it should return an error result", () async {
        //Arrange
        final expectedError = ExerciseDummy.expectedError;
        final expectedResult = ApiErrorResult<List<GetSelectedExerciseEntity>>(
          expectedError,
        );
        provideDummy<ApiResult<List<GetSelectedExerciseEntity>>>(
          expectedResult,
        );
        when(
          exerciseRepoImpl.getExercisesByPrimeMoverMuscleandDifficultyLevel(
            primeMoverMuscleId: ExerciseDummy.dummyPrimeMoverMuscleId,
            difficultyLevelId: ExerciseDummy.dummyDifficultyLevelId,
          ),
        ).thenAnswer((_) async => expectedResult);

        //Act
        final result =
            await exerciseRepoImpl.getExercisesByPrimeMoverMuscleandDifficultyLevel(primeMoverMuscleId: ExerciseDummy.dummyPrimeMoverMuscleId, difficultyLevelId: ExerciseDummy.dummyDifficultyLevelId);

        //Assert
        verify(
          mockExerciseRemoteDataSource.getExercisesByPrimeMoverMuscleandDifficultyLevel(
            primeMoverMuscleId: ExerciseDummy.dummyPrimeMoverMuscleId,
            difficultyLevelId: ExerciseDummy.dummyDifficultyLevelId,
          ),
        ).called(1);
        expect(result, isA<ApiErrorResult<List<GetSelectedExerciseEntity>>>());
        result as ApiErrorResult<List<GetSelectedExerciseEntity>>;
        expect(result.errorMessage, expectedError);
      });
    });
  });
}
