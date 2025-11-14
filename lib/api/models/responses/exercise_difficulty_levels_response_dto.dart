import 'package:elevate_super_fitness/api/models/exercise_difficulty_level_dto.dart';
import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';



part 'exercise_difficulty_levels_response_dto.g.dart';

@JsonSerializable()
class ExerciseDifficultyLevelsResponseDto extends Equatable {
	final String? message;
	final int? totalLevels;
	@JsonKey(name: 'difficulty_levels') 
	final List<ExerciseDifficultyLevelDto>? difficultyLevels;

	const ExerciseDifficultyLevelsResponseDto({
		this.message, 
		this.totalLevels, 
		this.difficultyLevels, 
	});

	factory ExerciseDifficultyLevelsResponseDto.fromJson(Map<String, dynamic> json) {
		return _$ExerciseDifficultyLevelsResponseDtoFromJson(json);
	}

	Map<String, dynamic> toJson() {
		return _$ExerciseDifficultyLevelsResponseDtoToJson(this);
	}

	@override
	List<Object?> get props => [message, totalLevels, difficultyLevels];
}
