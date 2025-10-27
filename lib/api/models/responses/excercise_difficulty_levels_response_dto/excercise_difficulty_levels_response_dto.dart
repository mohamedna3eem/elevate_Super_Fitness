import 'package:elevate_super_fitness/api/models/excercise_difficulty_level_dto.dart';
import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';



part 'excercise_difficulty_levels_response_dto.g.dart';

@JsonSerializable()
class ExcerciseDifficultyLevelsResponseDto extends Equatable {
	final String? message;
	final int? totalLevels;
	@JsonKey(name: 'difficulty_levels') 
	final List<ExcerciseDifficultyLevelDto>? difficultyLevels;

	const ExcerciseDifficultyLevelsResponseDto({
		this.message, 
		this.totalLevels, 
		this.difficultyLevels, 
	});

	factory ExcerciseDifficultyLevelsResponseDto.fromJson(Map<String, dynamic> json) {
		return _$ExcerciseDifficultyLevelsResponseDtoFromJson(json);
	}

	Map<String, dynamic> toJson() {
		return _$ExcerciseDifficultyLevelsResponseDtoToJson(this);
	}

	@override
	List<Object?> get props => [message, totalLevels, difficultyLevels];
}
