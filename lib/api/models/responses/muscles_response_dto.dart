import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';
import 'muscle_dto.dart';

part 'muscles_response_dto.g.dart';

@JsonSerializable(explicitToJson: true)
class MusclesResponseDto extends Equatable {
  final String? message;
  final int? totalMuscles;
  final List<MuscleDto>? muscles;

  const MusclesResponseDto({
    this.message,
    this.totalMuscles,
    this.muscles,
  });

  factory MusclesResponseDto.fromJson(Map<String, dynamic> json) =>
      _$MusclesResponseDtoFromJson(json);

  Map<String, dynamic> toJson() => _$MusclesResponseDtoToJson(this);

  @override
  List<Object?> get props => [message, totalMuscles, muscles];
}
