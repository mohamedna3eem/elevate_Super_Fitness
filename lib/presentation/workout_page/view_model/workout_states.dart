import 'package:elevate_super_fitness/core/api_result/base_state.dart';
import 'package:elevate_super_fitness/domain/entites/muscle_group_details_entity.dart';
import 'package:elevate_super_fitness/domain/entites/muscles_group_response_entity.dart';
import 'package:equatable/equatable.dart';

class WorkoutStates extends Equatable {
  const WorkoutStates({this.musclesGroup, this.musclesGroupDetailsById});
  final BaseState<MusclesGroupResponseEntity>? musclesGroup;
  final BaseState<MuscleGroupDetailsEntity>? musclesGroupDetailsById;
  WorkoutStates copyWith({
    BaseState<MusclesGroupResponseEntity>? musclesGroup,
    BaseState<MuscleGroupDetailsEntity>? musclesGroupDetailsById,
  }) {
    return WorkoutStates(
      musclesGroup: musclesGroup ?? this.musclesGroup,
      musclesGroupDetailsById:
          musclesGroupDetailsById ?? this.musclesGroupDetailsById,
    );
  }

  @override
  List<Object?> get props => [musclesGroup, musclesGroupDetailsById];
}
