
import 'package:equatable/equatable.dart';

class ExerciseDifficultyLevelEntity extends Equatable {
	final String? id;
	final String? name;

	const ExerciseDifficultyLevelEntity({this.id, this.name});


	@override
	List<Object?> get props => [id, name];
}
