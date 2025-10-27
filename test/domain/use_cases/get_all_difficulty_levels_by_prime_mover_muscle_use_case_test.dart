import 'package:elevate_super_fitness/core/api_result/api_result.dart';
import 'package:elevate_super_fitness/domain/entites/excercise_difficulty_level_entity.dart';
import 'package:elevate_super_fitness/domain/repo/exercise_repo.dart';
import 'package:elevate_super_fitness/domain/use_cases/get_all_difficulty_levels_by_prime_mover_muscle_use_case.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import '../../dummy/exercise_dummy.dart';
import 'get_all_difficulty_levels_by_prime_mover_muscle_use_case_test.mocks.dart';

@GenerateMocks([ExerciseRepo])
void main() {
  late MockExerciseRepo mockExerciseRepo;
  late GetAllDifficultyLevelsByPrimeMoverMuscleUseCase
  getAllDifficultyLevelsByPrimeMoverMuscleUseCase;

  setUp(() {
    mockExerciseRepo = MockExerciseRepo();
    getAllDifficultyLevelsByPrimeMoverMuscleUseCase =
        GetAllDifficultyLevelsByPrimeMoverMuscleUseCase(mockExerciseRepo);
  });

  group("test GetAllDifficultyLevelsByPrimeMoverMuscleUseCase", () {
    test(
      "when call it should return List of ExcerciseDifficultyLevelEntity from repo with correct parameters",
      () async {
        //Arrange
        final expectedEntity = [
          ExerciseDummy.dummyExcerciseDifficultyLevelEntity,
        ];
        final expectedResult = ApiSuccessResult(expectedEntity);
        provideDummy<ApiResult<List<ExcerciseDifficultyLevelEntity>>>(
          expectedResult,
        );
        when(
          mockExerciseRepo.getAllDifficultyLevelsByPrimeMoverMuscle(
            primeMoverMuscleId: ExerciseDummy.dummyPrimeMoverMuscleId,
          ),
        ).thenAnswer((_) async => expectedResult);

        //Act
        final result = await getAllDifficultyLevelsByPrimeMoverMuscleUseCase
            .call(primeMoverMuscleId: ExerciseDummy.dummyPrimeMoverMuscleId);

        //Assert
        verify(
          mockExerciseRepo.getAllDifficultyLevelsByPrimeMoverMuscle(
            primeMoverMuscleId: ExerciseDummy.dummyPrimeMoverMuscleId,
          ),
        ).called(1);
        expect(result, isA<ApiSuccessResult<List<ExcerciseDifficultyLevelEntity>>>());
        result as ApiSuccessResult<List<ExcerciseDifficultyLevelEntity>>;
        expect(result.data.length, expectedEntity.length);
        expect(result.data[0], expectedEntity[0]);
      },
    );
    test("when call failed it should return an error result", () async {
      //Arrange
      final expectedError = ExerciseDummy.expectedError;
      final expectedResult =
          ApiErrorResult<List<ExcerciseDifficultyLevelEntity>>(expectedError);
      provideDummy<ApiResult<List<ExcerciseDifficultyLevelEntity>>>(
        expectedResult,
      );
      when(
        mockExerciseRepo.getAllDifficultyLevelsByPrimeMoverMuscle(primeMoverMuscleId: ExerciseDummy.dummyPrimeMoverMuscleId),
      ).thenAnswer((_) async => expectedResult);

      //Act
      final result = await getAllDifficultyLevelsByPrimeMoverMuscleUseCase.call(primeMoverMuscleId: ExerciseDummy.dummyPrimeMoverMuscleId,
      );

      //Assert
      verify(mockExerciseRepo.getAllDifficultyLevelsByPrimeMoverMuscle(primeMoverMuscleId: ExerciseDummy.dummyPrimeMoverMuscleId)).called(1);
      expect(
        result,
        isA<ApiErrorResult<List<ExcerciseDifficultyLevelEntity>>>(),
      );
      result as ApiErrorResult<List<ExcerciseDifficultyLevelEntity>>;
      expect(result.errorMessage, expectedError);
    });
  });
}
