import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'exercise_difficulty_level_dto.g.dart';

@JsonSerializable()
class ExerciseDifficultyLevelDto extends Equatable {
	final String? id;
	final String? name;

	const ExerciseDifficultyLevelDto({this.id, this.name});

	factory ExerciseDifficultyLevelDto.fromJson(Map<String, dynamic> json) {
		return _$ExerciseDifficultyLevelDtoFromJson(json);
	}

	Map<String, dynamic> toJson() => _$ExerciseDifficultyLevelDtoToJson(this);

	@override
	List<Object?> get props => [id, name];
}
