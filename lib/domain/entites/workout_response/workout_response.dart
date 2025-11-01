import 'package:elevate_super_fitness/domain/entites/workout_response/muscles_response.dart';

class WorkoutResponseEntity {
  final String? message;
  final List<MusclesGroupEntity>? musclesGroup;

  WorkoutResponseEntity({this.message, this.musclesGroup});
}
