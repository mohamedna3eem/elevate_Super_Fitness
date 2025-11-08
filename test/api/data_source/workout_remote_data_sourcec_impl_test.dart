import 'package:elevate_super_fitness/api/data_source/workout_remote_data_sourcec_impl.dart';
import 'package:elevate_super_fitness/api/client/api_client.dart';
import 'package:elevate_super_fitness/api/mapper/workout_mapper.dart';
import 'package:elevate_super_fitness/api/models/workout_response/muscles_by_id.dart';
import 'package:elevate_super_fitness/api/models/workout_response/muscles_response.dart';
import 'package:elevate_super_fitness/api/models/workout_response/workout_response.dart';
import 'package:elevate_super_fitness/core/api_result/api_result.dart';
import 'package:elevate_super_fitness/domain/entites/workout_response/muscles_by_id.dart';
import 'package:elevate_super_fitness/domain/entites/workout_response/workout_response.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

class MockApiClient extends Mock implements ApiClient {}

void main() {
  late WorkoutRemoteDataSourceImpl remoteDataSource;
  late MockApiClient mockApiClient;

  setUp(() {
    mockApiClient = MockApiClient();
    remoteDataSource = WorkoutRemoteDataSourceImpl(mockApiClient);
  });

  group('WorkoutRemoteDataSourceImpl', () {
    final workoutDto = WorkoutResponseDto(musclesGroup: []);
    final workoutEntity = workoutDto.toEntity();

    final musclesDto = MusclesByIdDto(
      message: "EE",
      muscleGroup: MusclesGroupDto(Id: 'm1', name: 'Biceps'),
      muscles: [],
    );
    final musclesEntity = musclesDto.toEntity();

    test('workout returns WorkoutResponseEntity on success', () async {
      when(() => mockApiClient.workout()).thenAnswer((_) async => workoutDto);

      final result = await remoteDataSource.workout();

      expect(result, isA<ApiSuccessResult<WorkoutResponseEntity>>());
      final data = (result as ApiSuccessResult).data;

      // قارن الحقول بدل instance
      expect(data.musclesGroup.length, workoutEntity.musclesGroup?.length);
    });

    test('getAllMuscles returns MusclesByIdEntity on success', () async {
      when(() => mockApiClient.getAllMucsles('m1'))
          .thenAnswer((_) async => musclesDto);

      final result = await remoteDataSource.getAllMuscles('m1');

      expect(result, isA<ApiSuccessResult<MusclesByIdEntity>>());
      final data = (result as ApiSuccessResult).data;

      expect((result as ApiSuccessResult).data.muscleGroup.Id, musclesEntity.muscleGroup?.Id);
      expect(data.muscleGroup.name, musclesEntity.muscleGroup?.name);
      expect(data.muscles.length, musclesEntity.muscles?.length);
    });

    test('workout returns ApiError on failure', () async {
      when(() => mockApiClient.workout()).thenThrow(Exception('Network error'));

      final result = await remoteDataSource.workout();

      expect(result, isA<ApiErrorResult<WorkoutResponseEntity>>());
    });

    test('getAllMuscles returns ApiError on failure', () async {
      when(() => mockApiClient.getAllMucsles('m1'))
          .thenThrow(Exception('Network error'));

      final result = await remoteDataSource.getAllMuscles('m1');

      expect(result, isA<ApiErrorResult<MusclesByIdEntity>>());
    });
  });
}
