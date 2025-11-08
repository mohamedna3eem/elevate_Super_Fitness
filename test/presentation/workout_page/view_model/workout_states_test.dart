import 'package:flutter_test/flutter_test.dart';
import 'package:elevate_super_fitness/presentation/workout_page/view_model/workout_states.dart';
import 'package:elevate_super_fitness/domain/entites/workout_response/workout_response.dart';
import 'package:elevate_super_fitness/domain/entites/workout_response/muscles_by_id.dart';

void main() {
  group('WorkoutStates', () {
    test('initial state values are correct', () {
      final state = WorkoutStates();

      expect(state.status, WorkoutStatus.initial);
      expect(state.musclesStatus, MusclesStatus.initial);
      expect(state.workoutResponseEntity, null);
      expect(state.musclesByIdEntity, null);
      expect(state.errorMessage, null);
    });

    test('copyWith updates fields correctly', () {
      final workoutEntity = WorkoutResponseEntity(message: 'msg', musclesGroup: []);
      final musclesEntity = MusclesByIdEntity(message: 'msg', muscleGroup: null, muscles: []);

      final state = WorkoutStates();

      final newState = state.copyWith(
        status: WorkoutStatus.success,
        musclesStatus: MusclesStatus.success,
        workoutResponseEntity: workoutEntity,
        musclesByIdEntity: musclesEntity,
        errorMessage: 'Error',
      );

      expect(newState.status, WorkoutStatus.success);
      expect(newState.musclesStatus, MusclesStatus.success);
      expect(newState.workoutResponseEntity, workoutEntity);
      expect(newState.musclesByIdEntity, musclesEntity);
      expect(newState.errorMessage, 'Error');
    });

    test('copyWith without parameters returns same values', () {
      final state = WorkoutStates();
      final newState = state.copyWith();

      expect(newState.status, state.status);
      expect(newState.musclesStatus, state.musclesStatus);
      expect(newState.workoutResponseEntity, state.workoutResponseEntity);
      expect(newState.musclesByIdEntity, state.musclesByIdEntity);
      expect(newState.errorMessage, state.errorMessage);
    });

    test('Equatable comparison works', () {
      final state1 = WorkoutStates();
      final state2 = WorkoutStates();

      expect(state1, state2);
    });
  });
}
