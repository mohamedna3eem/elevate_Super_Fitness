import 'package:equatable/equatable.dart';
import '../../../domain/entites/workout_response/muscles_by_id.dart';
import '../../../domain/entites/workout_response/workout_response.dart';

enum WorkoutStatus { initial, loading, success, error }
enum MusclesStatus { initial, loading, success, error }

class WorkoutStates extends Equatable {
  final WorkoutStatus status;
  final MusclesStatus musclesStatus;
  final WorkoutResponseEntity? workoutResponseEntity;
  final MusclesByIdEntity? musclesByIdEntity;

  final String? errorMessage;

  const WorkoutStates({
     this.musclesStatus=MusclesStatus.initial,
    this.musclesByIdEntity,
    this.workoutResponseEntity,
    this.status = WorkoutStatus.initial,
    this.errorMessage,
  });

  WorkoutStates copyWith({

    WorkoutStatus? status,
    MusclesStatus? musclesStatus,
    WorkoutResponseEntity? workoutResponseEntity,
    MusclesByIdEntity? musclesByIdEntity,
    String? errorMessage,
  }) {
    return WorkoutStates(
      status: status ?? this.status,
      workoutResponseEntity: workoutResponseEntity ?? this.workoutResponseEntity,
      musclesStatus: musclesStatus ?? this.musclesStatus,
      musclesByIdEntity: musclesByIdEntity ?? this.musclesByIdEntity,
      errorMessage: errorMessage ?? this.errorMessage,
    );
  }

  @override
  List<Object?> get props => [
    musclesStatus,
    musclesByIdEntity,
    workoutResponseEntity,
    status, errorMessage];
}
