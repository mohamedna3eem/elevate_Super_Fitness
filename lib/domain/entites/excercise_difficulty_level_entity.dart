
import 'package:equatable/equatable.dart';

class ExcerciseDifficultyLevelEntity extends Equatable {
	final String? id;
	final String? name;

	const ExcerciseDifficultyLevelEntity({this.id, this.name});


	@override
	List<Object?> get props => [id, name];
}
