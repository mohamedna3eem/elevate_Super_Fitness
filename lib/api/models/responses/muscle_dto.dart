import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'muscle_dto.g.dart';

@JsonSerializable(explicitToJson: true)
class MuscleDto extends Equatable {
  final String? id;
  final String? name;
  final String? image;

  const MuscleDto({
    this.id,
    this.name,
    this.image,
  });

  factory MuscleDto.fromJson(Map<String, dynamic> json) =>
      _$MuscleDtoFromJson(json);

  Map<String, dynamic> toJson() => _$MuscleDtoToJson(this);

  @override
  List<Object?> get props => [id, name, image];
}
