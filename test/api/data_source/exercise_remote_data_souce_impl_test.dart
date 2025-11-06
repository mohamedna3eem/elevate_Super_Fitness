import 'package:elevate_super_fitness/api/client/api_client.dart';
import 'package:elevate_super_fitness/api/data_source/exercise_remote_data_souce_impl.dart';
import 'package:elevate_super_fitness/api/mapper/exercise_mapper.dart';
import 'package:elevate_super_fitness/core/api_result/api_result.dart';
import 'package:elevate_super_fitness/domain/entites/exercise_difficulty_level_entity.dart';
import 'package:elevate_super_fitness/domain/entites/get_selected_exercise_entity.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import '../../dummy/exercise_dummy.dart';
import 'exercise_remote_data_souce_impl_test.mocks.dart';

@GenerateMocks([ApiClient])
void main() {
  group("test ExerciseRemoteDataSouceImpl", () {
    late MockApiClient mockApiClient;
    late ExerciseRemoteDataSouceImpl exerciseRemoteDataSouceImpl;
    setUp(() {
      mockApiClient = MockApiClient();
      exerciseRemoteDataSouceImpl = ExerciseRemoteDataSouceImpl(mockApiClient);
    });

    group("test getAllDifficultyLevelsByPrimeMoverMuscle", () {
      test(
        "when call it should return List of ExerciseDifficultyLevelEntity from api with correct parameters",
        () async {
          //Arrange
          final expectedResult =
              ExerciseDummy.dummyExcerciseDifficultyLevelsResponseDto;
          when(
            mockApiClient.getAllDifficultyLevelsByPrimeMoverMuscle(
              ExerciseDummy.dummyPrimeMoverMuscleId,
            ),
          ).thenAnswer((_) async => expectedResult);

          //Call
          final result = await exerciseRemoteDataSouceImpl
              .getAllDifficultyLevelsByPrimeMoverMuscle(
                primeMoverMuscleId: ExerciseDummy.dummyPrimeMoverMuscleId,
              );

          //Assert
          verify(
            mockApiClient.getAllDifficultyLevelsByPrimeMoverMuscle(
              ExerciseDummy.dummyPrimeMoverMuscleId,
            ),
          ).called(1);
          expect(
            result,
            isA<ApiSuccessResult<List<ExerciseDifficultyLevelEntity>>>(),
          );
          result as ApiSuccessResult<List<ExerciseDifficultyLevelEntity>>;
          expect(
            result.data,
            expectedResult.difficultyLevels!.map((e) => e.toEntity()).toList(),
          );
          expect(result.data.length, expectedResult.difficultyLevels!.length);
        },
      );
      test("when call failed it should return an error result", () async{
        when(
            mockApiClient.getAllDifficultyLevelsByPrimeMoverMuscle(
              ExerciseDummy.dummyPrimeMoverMuscleId,
            ),
          ).thenThrow(Exception(ExerciseDummy.expectedError));

          //Call
          final result = await exerciseRemoteDataSouceImpl
              .getAllDifficultyLevelsByPrimeMoverMuscle(
                primeMoverMuscleId: ExerciseDummy.dummyPrimeMoverMuscleId,
              );

          //Assert
          verify(
            mockApiClient.getAllDifficultyLevelsByPrimeMoverMuscle(
              ExerciseDummy.dummyPrimeMoverMuscleId,
            ),
          ).called(1);
          expect(
            result,
            isA<ApiErrorResult<List<ExerciseDifficultyLevelEntity>>>(),
          );
          result as ApiErrorResult<List<ExerciseDifficultyLevelEntity>>;
          expect(
            result.errorMessage,
            contains(ExerciseDummy.expectedError),
          );
      });
    });
    group("test getExercisesByPrimeMoverMuscleandDifficultyLevel", () {
      test(
        "when call it should return List of GetSelectedExerciseEntity from api with correct parameters",
        () async {
          //Arrange
          final expectedResult =
              ExerciseDummy.dummyGetSelectedExercisesReponseDto;
          when(
            mockApiClient.getExercisesByPrimeMoverMuscleandDifficultyLevel(ExerciseDummy.dummyPrimeMoverMuscleId, ExerciseDummy.dummyDifficultyLevelId),
          ).thenAnswer((_) async => expectedResult);

          //Call
          final result = await exerciseRemoteDataSouceImpl
              .getExercisesByPrimeMoverMuscleandDifficultyLevel(
                primeMoverMuscleId: ExerciseDummy.dummyPrimeMoverMuscleId,
                difficultyLevelId: ExerciseDummy.dummyDifficultyLevelId,
              );

          //Assert
          verify(
            mockApiClient.getExercisesByPrimeMoverMuscleandDifficultyLevel(
              ExerciseDummy.dummyPrimeMoverMuscleId,
              ExerciseDummy.dummyDifficultyLevelId,
            ),
          ).called(1);
          expect(
            result,
            isA<ApiSuccessResult<List<GetSelectedExerciseEntity>>>(),
          );
          result as ApiSuccessResult<List<GetSelectedExerciseEntity>>;
          expect(
            result.data,
            expectedResult.exercises!.map((e) => e.toEntity()).toList(),
          );
          expect(result.data.length, expectedResult.exercises!.length);
        },
      );
      test("when call failed it should return an error result", () async {
        when(
          mockApiClient.getExercisesByPrimeMoverMuscleandDifficultyLevel(ExerciseDummy.dummyPrimeMoverMuscleId, ExerciseDummy.dummyDifficultyLevelId),
        ).thenThrow(Exception(ExerciseDummy.expectedError));

        //Call
        final result = await exerciseRemoteDataSouceImpl
            .getExercisesByPrimeMoverMuscleandDifficultyLevel(
              primeMoverMuscleId: ExerciseDummy.dummyPrimeMoverMuscleId,
              difficultyLevelId: ExerciseDummy.dummyDifficultyLevelId,
            );

        //Assert
        verify(
          mockApiClient.getExercisesByPrimeMoverMuscleandDifficultyLevel(
            ExerciseDummy.dummyPrimeMoverMuscleId,
            ExerciseDummy.dummyDifficultyLevelId,
          ),
        ).called(1);
        expect(
          result,
          isA<ApiErrorResult<List<GetSelectedExerciseEntity>>>(),
        );
        result as ApiErrorResult<List<GetSelectedExerciseEntity>>;
        expect(result.errorMessage, contains(ExerciseDummy.expectedError));
      });
    });
  });
}
