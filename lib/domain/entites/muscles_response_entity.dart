import 'package:equatable/equatable.dart';
import 'muscle_entity.dart';

class MusclesResponseEntity extends Equatable {
  final String? message;
  final int? totalMuscles;
  final List<MuscleEntity>? muscles;

  const MusclesResponseEntity({this.message, this.totalMuscles, this.muscles});

  @override
  List<Object?> get props => [message, totalMuscles, muscles];
}
