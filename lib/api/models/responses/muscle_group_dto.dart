import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';
part 'muscle_group_dto.g.dart';
@JsonSerializable()
class MuscleGroupDto extends Equatable {
  final String? id;
  final String? name;

  const MuscleGroupDto({
    this.id,
    this.name,
  });

  factory MuscleGroupDto.fromJson(Map<String, dynamic> json) =>
      _$MuscleGroupDtoFromJson(json);

  Map<String, dynamic> toJson() => _$MuscleGroupDtoToJson(this);

  @override
  List<Object?> get props => [id, name];
}
