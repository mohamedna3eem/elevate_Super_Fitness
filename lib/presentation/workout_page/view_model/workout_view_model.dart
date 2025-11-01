// import 'package:elevate_super_fitness/domain/entites/workout_response/muscles_by_id.dart';
// import 'package:elevate_super_fitness/domain/use_cases/get_all_muscles_use_case.dart';
// import 'package:elevate_super_fitness/domain/use_cases/workout_use_case.dart';
// import 'package:elevate_super_fitness/presentation/workout_page/view_model/workout_event.dart';
// import 'package:elevate_super_fitness/presentation/workout_page/view_model/workout_states.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:injectable/injectable.dart';
// import '../../../core/api_result/api_result.dart';
// import '../../../domain/entites/workout_response/workout_response.dart';
//
// @injectable
// class WorkoutViewModel extends Cubit<WorkoutStates> {
//   final WorkoutUseCase workoutUseCase;
//   final GetAllMusclesUseCase getAllMusclesUseCase;
//
//   WorkoutViewModel({required this.workoutUseCase,required this.getAllMusclesUseCase})
//     : super(const WorkoutStates());
//
//   void doIntent(WorkoutEvents event) {
//     switch (event) {
//       case WorkoutEvent():
//         _workout();
//       case MusclesEvent(:final id):
//         _getAllMuscles(id);
//     }
//   }
//
//   Future<void> _workout() async {
//     emit(state.copyWith(status: WorkoutStatus.loading));
//
//     final result = await workoutUseCase();
//
//     if (result is ApiSuccessResult<WorkoutResponseEntity>) {
//       emit(
//         state.copyWith(
//           status: WorkoutStatus.success,
//
//           workoutResponseEntity: result.data,
//           errorMessage: null,
//         ),
//       );
//     } else if (result is ApiErrorResult) {
//       emit(state.copyWith(status: WorkoutStatus.error, errorMessage: "error"));
//     }
//   }
//
//   Future<void> _getAllMuscles(String id) async {
//     emit(state.copyWith(musclesStatus: MusclesStatus.loading));
//
//     final result = await getAllMusclesUseCase(id);
//
//     if (result is ApiSuccessResult<MusclesByIdEntity>) {
//       emit(
//         state.copyWith(
//           musclesStatus: MusclesStatus.success,
//           musclesByIdEntity: result.data,
//           errorMessage: null,
//         ),
//       );
//     } else if (result is ApiErrorResult) {
//       emit(state.copyWith(musclesStatus: MusclesStatus.error, errorMessage: "error"));
//     }
//   }
// }
import 'package:elevate_super_fitness/domain/entites/workout_response/muscles_by_id.dart';
import 'package:elevate_super_fitness/domain/entites/workout_response/workout_response.dart';
import 'package:elevate_super_fitness/domain/use_cases/get_all_muscles_use_case.dart';
import 'package:elevate_super_fitness/domain/use_cases/workout_use_case.dart';
import 'package:elevate_super_fitness/presentation/workout_page/view_model/workout_event.dart';
import 'package:elevate_super_fitness/presentation/workout_page/view_model/workout_states.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import '../../../core/api_result/api_result.dart';

@injectable
class WorkoutViewModel extends Cubit<WorkoutStates> {
  final WorkoutUseCase getAllWorkoutUseCase;
  final GetAllMusclesUseCase getAllMusclesUseCase;

  WorkoutViewModel(this.getAllWorkoutUseCase, this.getAllMusclesUseCase)
      : super( const WorkoutStates());

  // ✅ استقبال الأحداث
  void doIntent(WorkoutEvents event) {
    if (event is WorkoutEvent) {
      _getAllWorkouts();
    } else if (event is MusclesEvent) {
      _getAllMuscles(event.id);
    }
  }

  Future<void> _getAllWorkouts() async {
    emit(state.copyWith(status: WorkoutStatus.loading));

    final result = await getAllWorkoutUseCase();

    if (result is ApiSuccessResult<WorkoutResponseEntity>) {
      emit(state.copyWith(
        status: WorkoutStatus.success,
        workoutResponseEntity: result.data,
        errorMessage: null,
      ));
    } else if (result is ApiErrorResult) {
      emit(state.copyWith(
        status: WorkoutStatus.error,
        errorMessage: "Error loading workouts",
      ));
    }
  }

  Future<void> _getAllMuscles(String id) async {
    emit(state.copyWith(musclesStatus: MusclesStatus.loading));

    final result = await getAllMusclesUseCase(id);
    switch (result) {
      case ApiSuccessResult<MusclesByIdEntity>():
        emit(state.copyWith(
          musclesStatus: MusclesStatus.success,
          musclesByIdEntity: result.data,
        ));
      case ApiErrorResult<MusclesByIdEntity>():
        emit(state.copyWith(
          musclesStatus: MusclesStatus.error,
          errorMessage: "Error loading muscles",
        ));
    }
  }
}

