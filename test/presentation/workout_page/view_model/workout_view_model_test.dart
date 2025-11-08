import 'package:bloc_test/bloc_test.dart';
import 'package:elevate_super_fitness/core/api_result/api_result.dart';
import 'package:elevate_super_fitness/domain/entites/workout_response/muscles_by_id.dart';
import 'package:elevate_super_fitness/domain/entites/workout_response/workout_response.dart';
import 'package:elevate_super_fitness/domain/use_cases/get_all_muscles_use_case.dart';
import 'package:elevate_super_fitness/domain/use_cases/workout_use_case.dart';
import 'package:elevate_super_fitness/presentation/workout_page/view_model/workout_event.dart';
import 'package:elevate_super_fitness/presentation/workout_page/view_model/workout_states.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:elevate_super_fitness/presentation/workout_page/view_model/workout_view_model.dart';

class MockWorkoutUseCase extends Mock implements WorkoutUseCase {}
class MockGetAllMusclesUseCase extends Mock implements GetAllMusclesUseCase {}

void main() {
  late WorkoutViewModel viewModel;
  late MockWorkoutUseCase mockWorkoutUseCase;
  late MockGetAllMusclesUseCase mockGetAllMusclesUseCase;

  setUp(() {
    mockWorkoutUseCase = MockWorkoutUseCase();
    mockGetAllMusclesUseCase = MockGetAllMusclesUseCase();
    viewModel = WorkoutViewModel(mockWorkoutUseCase, mockGetAllMusclesUseCase);
  });

  final workoutEntity = WorkoutResponseEntity(message: "success", musclesGroup: []);
  final musclesEntity = MusclesByIdEntity(message: "success", muscleGroup: null, muscles: []);

  group('WorkoutViewModel', () {
    blocTest<WorkoutViewModel, WorkoutStates>(
      'emits [loading, success] when WorkoutEvent is successful',
      build: () {
        when(() => mockWorkoutUseCase()).thenAnswer((_) async => ApiSuccessResult(workoutEntity));
        return viewModel;
      },
      act: (bloc) => bloc.doIntent(WorkoutEvent()),
      expect: () => [
        WorkoutStates(status: WorkoutStatus.loading),
        WorkoutStates(status: WorkoutStatus.success, workoutResponseEntity: workoutEntity),
      ],
    );

    blocTest<WorkoutViewModel, WorkoutStates>(
      'emits [loading, error] when WorkoutEvent fails',
      build: () {
        when(() => mockWorkoutUseCase()).thenAnswer((_) async => ApiErrorResult("error"));
        return viewModel;
      },
      act: (bloc) => bloc.doIntent(WorkoutEvent()),
      expect: () => [
        WorkoutStates(status: WorkoutStatus.loading),
        WorkoutStates(status: WorkoutStatus.error, errorMessage: "Error loading workouts"),
      ],
    );

    blocTest<WorkoutViewModel, WorkoutStates>(
      'emits [loading, success] when MusclesEvent is successful',
      build: () {
        when(() => mockGetAllMusclesUseCase("m1"))
            .thenAnswer((_) async => ApiSuccessResult(musclesEntity));
        return viewModel;
      },
      act: (bloc) => bloc.doIntent(MusclesEvent(id: "m1")),
      expect: () => [
        WorkoutStates(musclesStatus: MusclesStatus.loading),
        WorkoutStates(musclesStatus: MusclesStatus.success, musclesByIdEntity: musclesEntity),
      ],
    );

    blocTest<WorkoutViewModel, WorkoutStates>(
      'emits [loading, error] when MusclesEvent fails',
      build: () {
        when(() => mockGetAllMusclesUseCase("m1"))
            .thenAnswer((_) async => ApiErrorResult("error"));
        return viewModel;
      },
      act: (bloc) => bloc.doIntent(MusclesEvent( id: "m1",)),
      expect: () => [
        WorkoutStates(musclesStatus: MusclesStatus.loading),
        WorkoutStates(musclesStatus: MusclesStatus.error, errorMessage: "Error loading muscles"),
      ],
    );
  });
}
