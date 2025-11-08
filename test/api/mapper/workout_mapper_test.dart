import 'package:elevate_super_fitness/api/mapper/workout_mapper.dart';
import 'package:elevate_super_fitness/api/models/workout_response/muscles_by_id.dart';
import 'package:elevate_super_fitness/api/models/workout_response/muscles_data.dart';
import 'package:elevate_super_fitness/api/models/workout_response/muscles_response.dart';
import 'package:elevate_super_fitness/api/models/workout_response/workout_response.dart';

import 'package:flutter_test/flutter_test.dart';

void main() {
  group('WorkoutMapper Tests', () {
    test('WorkoutResponseDto toEntity', () {
      final dto = WorkoutResponseDto(
        message: 'Success',
        musclesGroup: [
          MusclesGroupDto(Id: 'm1', name: 'Biceps'),
          MusclesGroupDto(Id: 'm2', name: 'Triceps'),
        ],
      );

      final entity = dto.toEntity();

      expect(entity.message, 'Success');
      expect(entity.musclesGroup?.length, 2);
      expect(entity.musclesGroup?[0].Id, 'm1');
      expect(entity.musclesGroup?[0].name, 'Biceps');
      expect(entity.musclesGroup?[1].Id, 'm2');
      expect(entity.musclesGroup?[1].name, 'Triceps');
    });

    test('MusclesByIdDto toEntity', () {
      final dto = MusclesByIdDto(
        message: 'OK',
        muscleGroup: MusclesGroupDto(Id: 'm1', name: 'Biceps'),
        muscles: [
          MusclesDto(Id: 'mu1', name: 'Bicep Short Head', image: 'img1.png'),
        ],
      );

      final entity = dto.toEntity();

      expect(entity.message, 'OK');
      expect(entity.muscleGroup!.Id, 'm1');
      expect(entity.muscleGroup!.name, 'Biceps');
      expect(entity.muscles?.length, 1);
      expect(entity.muscles?[0].Id, 'mu1');
      expect(entity.muscles?[0].name, 'Bicep Short Head');
      expect(entity.muscles?[0].image, 'img1.png');
    });

    test('MusclesGroupDto toEntity', () {
      final dto = MusclesGroupDto(Id: 'g1', name: 'Chest');
      final entity = dto.toEntity();

      expect(entity.Id, 'g1');
      expect(entity.name, 'Chest');
    });

    test('MusclesDto toEntity', () {
      final dto = MusclesDto(Id: 'm1', name: 'Triceps Long Head', image: 'triceps.png');
      final entity = dto.toEntity();

      expect(entity.Id, 'm1');
      expect(entity.name, 'Triceps Long Head');
      expect(entity.image, 'triceps.png');
    });
  });
}
