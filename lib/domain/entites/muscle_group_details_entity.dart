import 'package:elevate_super_fitness/domain/entites/muscle_entity.dart';
import 'package:equatable/equatable.dart';

class MuscleGroupDetailsEntity extends Equatable {
  final String? message;
  final String? muscleGroupId;
  final String? muscleGroupName;
  final List<MuscleEntity>? musclesEntity;

  const MuscleGroupDetailsEntity({
    this.message,
    this.musclesEntity,
    this.muscleGroupId,
    this.muscleGroupName,
  });

  @override
  List<Object?> get props => [
    message,
    muscleGroupId,
    muscleGroupName,
    musclesEntity,
  ];
}
