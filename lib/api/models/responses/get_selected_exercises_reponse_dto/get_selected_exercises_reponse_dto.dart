import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

import '../../get_selected_exercise_dto.dart';

part 'get_selected_exercises_reponse_dto.g.dart';

@JsonSerializable()
class GetSelectedExercisesReponseDto extends Equatable {
	final String? message;
	final int? totalExercises;
	final int? totalPages;
	final int? currentPage;
	final List<GetSelectedExerciseDto>? exercises;

	const GetSelectedExercisesReponseDto({
		this.message, 
		this.totalExercises, 
		this.totalPages, 
		this.currentPage, 
		this.exercises, 
	});

	factory GetSelectedExercisesReponseDto.fromJson(Map<String, dynamic> json) {
		return _$GetSelectedExercisesReponseDtoFromJson(json);
	}

	Map<String, dynamic> toJson() {
		return _$GetSelectedExercisesReponseDtoToJson(this);
	}

	@override
	List<Object?> get props {
		return [
				message,
				totalExercises,
				totalPages,
				currentPage,
				exercises,
		];
	}
}
