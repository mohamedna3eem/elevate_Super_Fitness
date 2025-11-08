import 'package:elevate_super_fitness/core/api_result/api_result.dart';
import 'package:elevate_super_fitness/data/data_source/workout_remote_data_source.dart';
import 'package:elevate_super_fitness/data/repo/workout_repo_impl.dart';
import 'package:elevate_super_fitness/domain/entites/workout_response/muscles_by_id.dart';
import 'package:elevate_super_fitness/domain/entites/workout_response/workout_response.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

class MockWorkoutRemoteDataSource extends Mock implements WorkoutRemoteDataSource {}

void main() {
  late WorkoutRepoImpl workoutRepo;
  late MockWorkoutRemoteDataSource mockRemoteDataSource;

  setUp(() {
    mockRemoteDataSource = MockWorkoutRemoteDataSource();
    workoutRepo = WorkoutRepoImpl(mockRemoteDataSource);
  });

  group('WorkoutRepoImpl Tests', () {
    final workoutEntity = WorkoutResponseEntity(
      message: 'Success',
      musclesGroup: [],
    );

    final musclesByIdEntity = MusclesByIdEntity(
      message: 'OK',
      muscleGroup: null,
      muscles: [],
    );

    test('workout returns data from remote data source', () async {
      when(() => mockRemoteDataSource.workout())
          .thenAnswer((_) async => ApiSuccessResult(workoutEntity));

      final result = await workoutRepo.workout();

      expect(result, isA<ApiSuccessResult<WorkoutResponseEntity>>());
      expect((result as ApiSuccessResult).data, workoutEntity);
      verify(() => mockRemoteDataSource.workout()).called(1);
    });

    test('getAllMuscles returns data from remote data source', () async {
      when(() => mockRemoteDataSource.getAllMuscles('m1'))
          .thenAnswer((_) async => ApiSuccessResult(musclesByIdEntity));

      final result = await workoutRepo.getAllMuscles('m1');

      expect(result, isA<ApiSuccessResult<MusclesByIdEntity>>());
      expect((result as ApiSuccessResult).data, musclesByIdEntity);
      verify(() => mockRemoteDataSource.getAllMuscles('m1')).called(1);
    });

    test('workout returns error from remote data source', () async {
      final errorResult = ApiErrorResult<WorkoutResponseEntity>('Error');
      when(() => mockRemoteDataSource.workout()).thenAnswer((_) async => errorResult);

      final result = await workoutRepo.workout();

      expect(result, isA<ApiErrorResult<WorkoutResponseEntity>>());
      expect((result as ApiErrorResult).errorMessage, 'Error');
    });

    test('getAllMuscles returns error from remote data source', () async {
      final errorResult = ApiErrorResult<MusclesByIdEntity>('Error');
      when(() => mockRemoteDataSource.getAllMuscles('m1')).thenAnswer((_) async => errorResult);

      final result = await workoutRepo.getAllMuscles('m1');

      expect(result, isA<ApiErrorResult<MusclesByIdEntity>>());
      expect((result as ApiErrorResult).errorMessage, 'Error');
    });
  });
}
