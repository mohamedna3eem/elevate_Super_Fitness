import 'package:elevate_super_fitness/domain/entites/workout_response/muscles_data.dart';
import 'package:elevate_super_fitness/domain/entites/workout_response/muscles_response.dart';


class MusclesByIdEntity {
  final String? message;
  final MusclesGroupEntity? muscleGroup;
  final List<MusclesEntity>? muscles;

  MusclesByIdEntity ({
    this.message,
    this.muscleGroup,
    this.muscles,
  });


}






