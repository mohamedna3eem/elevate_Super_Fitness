import 'package:elevate_super_fitness/core/api_result/base_state.dart';
import 'package:elevate_super_fitness/domain/entites/muscle_group_details_entity.dart';
import 'package:elevate_super_fitness/domain/entites/muscles_group_response_entity.dart';
import 'package:elevate_super_fitness/domain/use_cases/get_all_muscles_by_muscle_group_id_use_case.dart';
import 'package:elevate_super_fitness/domain/use_cases/get_all_muscles_groups_use_case.dart';
import 'package:elevate_super_fitness/presentation/workout_page/view_model/workout_event.dart';
import 'package:elevate_super_fitness/presentation/workout_page/view_model/workout_states.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import '../../../core/api_result/api_result.dart';

@injectable
class WorkoutViewModel extends Cubit<WorkoutStates> {
  final GetAllMusclesGroupsUseCase _allMusclesGroupsUseCase;
  final GetAllMusclesByMuscleGroupIdUseCase
  _getAllMusclesByMuscleGroupIdUseCase;

  WorkoutViewModel(
    this._getAllMusclesByMuscleGroupIdUseCase,
    this._allMusclesGroupsUseCase,
  ) : super(const WorkoutStates());

  void doIntent(WorkoutEvents event) {
    if (event is WorkoutEvent) {
      _getAllMusclesGroups();
    } else if (event is MusclesEvent) {
      _getAllMusclesByMuscleGroupId(event.id);
    }
  }

  Future<void> _getAllMusclesGroups() async {
    emit(state.copyWith(musclesGroup: BaseState.loading()));
    final result = await _allMusclesGroupsUseCase.call();
    switch (result) {
      case ApiSuccessResult<MusclesGroupResponseEntity>():
        emit(state.copyWith(musclesGroup: BaseState.success(result.data)));
      case ApiErrorResult<MusclesGroupResponseEntity>():
        emit(
          state.copyWith(musclesGroup: BaseState.error(result.errorMessage)),
        );
    }
  }

  Future<void> _getAllMusclesByMuscleGroupId(String selectedId) async {
    emit(state.copyWith(musclesGroupDetailsById: BaseState.loading()));
    final result = await _getAllMusclesByMuscleGroupIdUseCase.call(selectedId);
    switch (result) {
      case ApiSuccessResult<MuscleGroupDetailsEntity>():
        emit(
          state.copyWith(
            musclesGroupDetailsById: BaseState.success(result.data),
          ),
        );
      case ApiErrorResult<MuscleGroupDetailsEntity>():
        emit(
          state.copyWith(
            musclesGroupDetailsById: BaseState.error(result.errorMessage),
          ),
        );
    }
  }
}
