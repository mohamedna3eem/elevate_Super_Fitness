import 'package:elevate_super_fitness/core/api_result/api_result.dart';
import 'package:elevate_super_fitness/domain/entites/get_selected_exercise_entity.dart';
import 'package:elevate_super_fitness/domain/repo/exercise_repo.dart';
import 'package:elevate_super_fitness/domain/use_cases/get_exercises_by_prime_mover_muscle_and_difficulty_level_use_case.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import '../../dummy/exercise_dummy.dart';
import 'get_exercises_by_prime_mover_muscle_and_difficulty_level_use_case_test.mocks.dart';

@GenerateMocks([ExerciseRepo])
void main() {
  late MockExerciseRepo mockExerciseRepo;
  late GetExercisesByPrimeMoverMuscleAndDifficultyLevelUseCase
      getExercisesByPrimeMoverMuscleAndDifficultyLevelUseCase;
  setUp(() {
    mockExerciseRepo = MockExerciseRepo();
    getExercisesByPrimeMoverMuscleAndDifficultyLevelUseCase =
        GetExercisesByPrimeMoverMuscleAndDifficultyLevelUseCase(
            mockExerciseRepo);
  });

  group("test GetExercisesByPrimeMoverMuscleAndDifficultyLevelUseCase", () {
    test(
      "when call it should return List of GetSelectedExerciseEntity from repo with correct parameters",
      () async {
        //Arrange
        final expectedEntity = [
          ExerciseDummy.dummyGetSelectedExerciseEntity,
        ];
        final expectedResult = ApiSuccessResult(expectedEntity);
        provideDummy<ApiResult<List<GetSelectedExerciseEntity>>>(
          expectedResult,
        );
        when(
          mockExerciseRepo.getExercisesByPrimeMoverMuscleandDifficultyLevel(
            primeMoverMuscleId: ExerciseDummy.dummyPrimeMoverMuscleId,
            difficultyLevelId: ExerciseDummy.dummyDifficultyLevelId,
          ),
        ).thenAnswer((_) async => expectedResult);

        //Act
        final result = await getExercisesByPrimeMoverMuscleAndDifficultyLevelUseCase
            .call(
          primeMoverMuscleId: ExerciseDummy.dummyPrimeMoverMuscleId,
          difficultyLevelId: ExerciseDummy.dummyDifficultyLevelId,
        );

        //Assert
        verify(
          mockExerciseRepo..getExercisesByPrimeMoverMuscleandDifficultyLevel(
            primeMoverMuscleId: ExerciseDummy.dummyPrimeMoverMuscleId,
            difficultyLevelId: ExerciseDummy.dummyDifficultyLevelId,
          ),
        ).called(1);
        expect(result, isA<ApiSuccessResult<List<GetSelectedExerciseEntity>>>());
        result as ApiSuccessResult<List<GetSelectedExerciseEntity>>;
        expect(result.data.length, expectedEntity.length);
        expect(result.data[0], expectedEntity[0]);
      },
    );
    test("when call failed it should return an error result", () async {
      //Arrange
      final expectedError = ExerciseDummy.expectedError;
      final expectedResult =
          ApiErrorResult<List<GetSelectedExerciseEntity>>(expectedError);
      provideDummy<ApiResult<List<GetSelectedExerciseEntity>>>(
        expectedResult,
      );
      when(
        mockExerciseRepo.getExercisesByPrimeMoverMuscleandDifficultyLevel(
          primeMoverMuscleId: ExerciseDummy.dummyPrimeMoverMuscleId,
          difficultyLevelId: ExerciseDummy.dummyDifficultyLevelId,
        ),
      ).thenAnswer((_) async => expectedResult);

      //Act
      final result = await getExercisesByPrimeMoverMuscleAndDifficultyLevelUseCase
          .call(
        primeMoverMuscleId: ExerciseDummy.dummyPrimeMoverMuscleId,
        difficultyLevelId: ExerciseDummy.dummyDifficultyLevelId,
      );

      //Assert
      verify(mockExerciseRepo.getExercisesByPrimeMoverMuscleandDifficultyLevel(
        primeMoverMuscleId: ExerciseDummy.dummyPrimeMoverMuscleId,
        difficultyLevelId: ExerciseDummy.dummyDifficultyLevelId,
      )).called(1);
      expect(
        result,
        isA<ApiErrorResult<List<GetSelectedExerciseEntity>>>(),
      );
      result as ApiErrorResult<List<GetSelectedExerciseEntity>>;
      expect(result.errorMessage, expectedError);
    });
    });
}
