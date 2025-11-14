import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

import '../get_selected_exercise_dto.dart';

part 'get_selected_exercises_response_dto.g.dart';

@JsonSerializable()
class GetSelectedExercisesResponseDto extends Equatable {
  final String? message;
  final int? totalExercises;
  final int? totalPages;
  final int? currentPage;
  final List<GetSelectedExerciseDto>? exercises;

  const GetSelectedExercisesResponseDto({
    this.message,
    this.totalExercises,
    this.totalPages,
    this.currentPage,
    this.exercises,
  });

  factory GetSelectedExercisesResponseDto.fromJson(Map<String, dynamic> json) {
    return _$GetSelectedExercisesResponseDtoFromJson(json);
  }

  Map<String, dynamic> toJson() {
    return _$GetSelectedExercisesResponseDtoToJson(this);
  }

  @override
  List<Object?> get props {
    return [message, totalExercises, totalPages, currentPage, exercises];
  }
}
