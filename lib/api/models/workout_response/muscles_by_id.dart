import 'package:elevate_super_fitness/api/models/workout_response/muscles_response.dart';
import 'package:json_annotation/json_annotation.dart';

import 'muscles_data.dart';


part 'muscles_by_id.g.dart';

@JsonSerializable()
class MusclesByIdDto {
  @JsonKey(name: "message")
  final String? message;
  @JsonKey(name: "muscleGroup")
  final MusclesGroupDto? muscleGroup;
  @JsonKey(name: "muscles")
  final List<MusclesDto>? muscles;

  MusclesByIdDto ({
    this.message,
    this.muscleGroup,
    this.muscles,
  });

  factory MusclesByIdDto.fromJson(Map<String, dynamic> json) {
    return _$MusclesByIdDtoFromJson(json);
  }


  Map<String, dynamic> toJson() {
    return _$MusclesByIdDtoToJson(this);
  }
}






