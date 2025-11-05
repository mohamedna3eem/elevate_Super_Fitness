import 'package:elevate_super_fitness/domain/entites/muscle_group_entity.dart';
import 'package:equatable/equatable.dart';

class MusclesGroupResponseEntity extends Equatable {
  final String? message;
  final List<MuscleGroupEntity>? musclesGroup;

  const MusclesGroupResponseEntity({this.message, this.musclesGroup});

  @override
  List<Object?> get props => [message, musclesGroup];
}
