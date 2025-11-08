import 'package:json_annotation/json_annotation.dart';

import 'muscles_response.dart';

part 'workout_response.g.dart';

@JsonSerializable()
class WorkoutResponseDto {
  @JsonKey(name: "message")
  final String? message;
  @JsonKey(name: "musclesGroup")
  final List<MusclesGroupDto>? musclesGroup;

  WorkoutResponseDto ({
    this.message,
    this.musclesGroup,
  });

  factory WorkoutResponseDto.fromJson(Map<String, dynamic> json) {
    return _$WorkoutResponseDtoFromJson(json);
  }

  Map<String, dynamic> toJson() {
    return _$WorkoutResponseDtoToJson(this);
  }
}




