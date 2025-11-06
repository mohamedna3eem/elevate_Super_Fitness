import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';
import 'muscle_group_dto.dart';

part 'muscles_group_response_dto.g.dart';

@JsonSerializable(explicitToJson: true)
class MusclesGroupResponseDto extends Equatable {
  final String? message;
  final List<MuscleGroupDto>? musclesGroup;

  const MusclesGroupResponseDto({
    this.message,
    this.musclesGroup,
  });

  factory MusclesGroupResponseDto.fromJson(Map<String, dynamic> json) =>
      _$MusclesGroupResponseDtoFromJson(json);

  Map<String, dynamic> toJson() => _$MusclesGroupResponseDtoToJson(this);

  @override
  List<Object?> get props => [message, musclesGroup];
}
