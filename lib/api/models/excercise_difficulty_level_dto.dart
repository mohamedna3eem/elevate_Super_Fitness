import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'excercise_difficulty_level_dto.g.dart';

@JsonSerializable()
class ExcerciseDifficultyLevelDto extends Equatable {
	final String? id;
	final String? name;

	const ExcerciseDifficultyLevelDto({this.id, this.name});

	factory ExcerciseDifficultyLevelDto.fromJson(Map<String, dynamic> json) {
		return _$ExcerciseDifficultyLevelDtoFromJson(json);
	}

	Map<String, dynamic> toJson() => _$ExcerciseDifficultyLevelDtoToJson(this);

	@override
	List<Object?> get props => [id, name];
}
