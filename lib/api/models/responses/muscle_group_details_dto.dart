import 'package:elevate_super_fitness/api/models/responses/muscle_group_dto.dart';
import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';
import 'muscle_dto.dart';

part 'muscle_group_details_dto.g.dart';

@JsonSerializable(explicitToJson: true)
class MuscleGroupDetailsDto extends Equatable {
  final String? message;
  final MuscleGroupDto? muscleGroup;
  final List<MuscleDto>? muscles;

  const MuscleGroupDetailsDto({
    this.message,
    this.muscleGroup,
    this.muscles,
  });

  factory MuscleGroupDetailsDto.fromJson(Map<String, dynamic> json) =>
      _$MuscleGroupDetailsDtoFromJson(json);

  Map<String, dynamic> toJson() => _$MuscleGroupDetailsDtoToJson(this);

  @override
  List<Object?> get props => [message, muscleGroup, muscles];
}

