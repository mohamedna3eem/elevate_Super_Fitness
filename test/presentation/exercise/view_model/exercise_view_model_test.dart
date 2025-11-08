import 'package:bloc_test/bloc_test.dart';
import 'package:elevate_super_fitness/core/api_result/api_result.dart';
import 'package:elevate_super_fitness/domain/entites/exercise_difficulty_level_entity.dart';
import 'package:elevate_super_fitness/domain/entites/get_selected_exercise_entity.dart';
import 'package:elevate_super_fitness/domain/use_cases/get_all_difficulty_levels_by_prime_mover_muscle_use_case.dart';
import 'package:elevate_super_fitness/domain/use_cases/get_exercises_by_prime_mover_muscle_and_difficulty_level_use_case.dart';
import 'package:elevate_super_fitness/presentation/exercise/view_model/exercise_events.dart';
import 'package:elevate_super_fitness/presentation/exercise/view_model/exercise_states.dart';
import 'package:elevate_super_fitness/presentation/exercise/view_model/exercise_view_model.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import '../../../dummy/exercise_dummy.dart';
import 'exercise_view_model_test.mocks.dart';

@GenerateMocks([
  GetAllDifficultyLevelsByPrimeMoverMuscleUseCase,
  GetExercisesByPrimeMoverMuscleAndDifficultyLevelUseCase,
])
void main() {
  group("test ExerciseViewModel", () {
    late MockGetAllDifficultyLevelsByPrimeMoverMuscleUseCase
    mockGetAllDifficultyLevelsByPrimeMoverMuscleUseCase;
    late MockGetExercisesByPrimeMoverMuscleAndDifficultyLevelUseCase
    mockGetExercisesByPrimeMoverMuscleAndDifficultyLevelUseCase;
    late ExerciseViewModel exerciseViewModel;
    late ExerciseStates state;
    final errorMsg = ExerciseDummy.expectedError;

    setUp(() {
      mockGetAllDifficultyLevelsByPrimeMoverMuscleUseCase =
          MockGetAllDifficultyLevelsByPrimeMoverMuscleUseCase();
      mockGetExercisesByPrimeMoverMuscleAndDifficultyLevelUseCase =
          MockGetExercisesByPrimeMoverMuscleAndDifficultyLevelUseCase();
      exerciseViewModel = ExerciseViewModel(
        mockGetAllDifficultyLevelsByPrimeMoverMuscleUseCase,
        mockGetExercisesByPrimeMoverMuscleAndDifficultyLevelUseCase,
      );
      state = const ExerciseStates();
    });

    final expectedDifficultyLevelsEntity = [
      ExerciseDummy.dummyExcerciseDifficultyLevelEntity,
    ];
    final expectedResult = ApiSuccessResult(expectedDifficultyLevelsEntity);
    provideDummy<ApiResult<List<ExerciseDifficultyLevelEntity>>>(
      expectedResult,
    );
    blocTest<ExerciseViewModel, ExerciseStates>(
      'call doIntent with OnLoadDifficultyLevelsEvent then load and successed',
      build: () => exerciseViewModel,
      act: (exerciseViewModel) async {
        when(
          mockGetAllDifficultyLevelsByPrimeMoverMuscleUseCase.call(
            primeMoverMuscleId: ExerciseDummy.dummyPrimeMoverMuscleId,
          ),
        ).thenAnswer((_) async => expectedResult);
        return exerciseViewModel.doIntent(
          OnLoadDifficultyLevelsEvent(
            primeMoverMuscleId: ExerciseDummy.dummyPrimeMoverMuscleId,
          ),
        );
      },
      expect: () => [
        state.copyWith(difficultyLevelsLoading: true),
        state.copyWith(
          difficultyLevelsLoading: false,
          difficultyLevelsSuccess: expectedDifficultyLevelsEntity,
        ),
      ],
      verify: (_) {
        verify(
          mockGetAllDifficultyLevelsByPrimeMoverMuscleUseCase.call(
            primeMoverMuscleId: ExerciseDummy.dummyPrimeMoverMuscleId,
          ),
        ).called(1);
      },
    );

    
    final expectedError = ApiErrorResult<List<ExerciseDifficultyLevelEntity>>(
      errorMsg,
    );
    provideDummy<ApiResult<List<ExerciseDifficultyLevelEntity>>>(expectedError);
    blocTest<ExerciseViewModel, ExerciseStates>(
      'call doIntent with OnLoadDifficultyLevelsEvent then load and failed',
      build: () => exerciseViewModel,
      act: (exerciseViewModel) async {
        when(
          mockGetAllDifficultyLevelsByPrimeMoverMuscleUseCase.call(
            primeMoverMuscleId: ExerciseDummy.dummyPrimeMoverMuscleId,
          ),
        ).thenAnswer((_) async => expectedError);
        return exerciseViewModel.doIntent(
          OnLoadDifficultyLevelsEvent(
            primeMoverMuscleId: ExerciseDummy.dummyPrimeMoverMuscleId,
          ),
        );
      },
      expect: () => [
        state.copyWith(difficultyLevelsLoading: true),
        state.copyWith(
          difficultyLevelsLoading: false,
          difficultyLevelsErrorMessage: errorMsg,
        ),
      ],
      verify: (_) {
        verify(
          mockGetAllDifficultyLevelsByPrimeMoverMuscleUseCase.call(
            primeMoverMuscleId: ExerciseDummy.dummyPrimeMoverMuscleId,
          ),
        ).called(1);
      },
    );

    final expectedExerciseEntity = [
      ExerciseDummy.dummyGetSelectedExerciseEntity,
    ];
    final expectedExercises = ApiSuccessResult(expectedExerciseEntity);
    provideDummy<ApiResult<List<GetSelectedExerciseEntity>>>(expectedExercises);
    blocTest<ExerciseViewModel, ExerciseStates>(
      'call doIntent with OnLoadExercisesEvent then load and successed',
      build: () => exerciseViewModel,
      act: (exerciseViewModel) async {
        when(
          mockGetExercisesByPrimeMoverMuscleAndDifficultyLevelUseCase.call(
            primeMoverMuscleId: ExerciseDummy.dummyPrimeMoverMuscleId,
            difficultyLevelId: ExerciseDummy.dummyDifficultyLevelId,
          ),
        ).thenAnswer((_) async => expectedExercises);
        return exerciseViewModel.doIntent(
          OnLoadExercisesEvent(
            primeMoverMuscleId: ExerciseDummy.dummyPrimeMoverMuscleId,
            difficultyLevelId: ExerciseDummy.dummyDifficultyLevelId,
          ),
        );
      },
      expect: () => [
        state.copyWith(exercisesListLoading: true),
        state.copyWith(
          exercisesListLoading: false,
          exercisesListSuccess: expectedExerciseEntity,
        ),
      ],
      verify: (_) {
        verify(
          mockGetExercisesByPrimeMoverMuscleAndDifficultyLevelUseCase.call(
            primeMoverMuscleId: ExerciseDummy.dummyPrimeMoverMuscleId,
            difficultyLevelId: ExerciseDummy.dummyDifficultyLevelId,
          ),
        ).called(1);
      },
    );


final expectedExerciseError = ApiErrorResult<List<GetSelectedExerciseEntity>>(
      errorMsg,
    );
    provideDummy<ApiResult<List<GetSelectedExerciseEntity>>>(expectedExerciseError);
    blocTest<ExerciseViewModel, ExerciseStates>(
      'call doIntent with OnLoadExercisesEvent then load and failed',
      build: () => exerciseViewModel,
      act: (exerciseViewModel) async {
        when(
          mockGetExercisesByPrimeMoverMuscleAndDifficultyLevelUseCase.call(
            primeMoverMuscleId: ExerciseDummy.dummyPrimeMoverMuscleId,
            difficultyLevelId: ExerciseDummy.dummyDifficultyLevelId,
          ),
        ).thenAnswer((_) async => expectedExerciseError);
        return exerciseViewModel.doIntent(
          OnLoadExercisesEvent(
            primeMoverMuscleId: ExerciseDummy.dummyPrimeMoverMuscleId,
            difficultyLevelId: ExerciseDummy.dummyDifficultyLevelId,
          ),
        );
      },
      expect: () => [
        state.copyWith(exercisesListLoading: true),
        state.copyWith(
          exercisesListLoading: false,
          exercisesListErrorMessage: errorMsg
        ),
      ],
      verify: (_) {
        verify(
          mockGetExercisesByPrimeMoverMuscleAndDifficultyLevelUseCase.call(
            primeMoverMuscleId: ExerciseDummy.dummyPrimeMoverMuscleId,
            difficultyLevelId: ExerciseDummy.dummyDifficultyLevelId,
          ),
        ).called(1);
      },
    );
  });
}
