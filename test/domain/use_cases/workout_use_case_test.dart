import 'package:elevate_super_fitness/core/api_result/api_result.dart';
import 'package:elevate_super_fitness/domain/repo/workout_repo.dart';
import 'package:elevate_super_fitness/domain/use_cases/workout_use_case.dart';
import 'package:elevate_super_fitness/domain/entites/workout_response/workout_response.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

class MockWorkoutRepo extends Mock implements WorkoutRepo {}

void main() {
  late WorkoutUseCase useCase;
  late MockWorkoutRepo mockRepo;

  setUp(() {
    mockRepo = MockWorkoutRepo();
    useCase = WorkoutUseCase(mockRepo);
  });

  final workoutEntity = WorkoutResponseEntity(
    message: 'Success',
    musclesGroup: [],
  );

  test('call returns data from repo on success', () async {
    when(() => mockRepo.workout()).thenAnswer((_) async => ApiSuccessResult(workoutEntity));

    final result = await useCase.call();

    expect(result, isA<ApiSuccessResult<WorkoutResponseEntity>>());
    expect((result as ApiSuccessResult).data, workoutEntity);
    verify(() => mockRepo.workout()).called(1);
  });

  test('call returns error from repo', () async {
    final errorResult = ApiErrorResult<WorkoutResponseEntity>('Error');
    when(() => mockRepo.workout()).thenAnswer((_) async => errorResult);

    final result = await useCase.call();

    expect(result, isA<ApiErrorResult<WorkoutResponseEntity>>());
    expect((result as ApiErrorResult).errorMessage, 'Error');
    verify(() => mockRepo.workout()).called(1);
  });
}
