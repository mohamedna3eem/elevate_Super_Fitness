import 'package:elevate_super_fitness/core/api_result/api_result.dart';
import 'package:elevate_super_fitness/core/api_result/base_state.dart';
import 'package:elevate_super_fitness/core/constants/app_images.dart';
import 'package:elevate_super_fitness/domain/entites/meals_categories_response_entity.dart';
import 'package:elevate_super_fitness/domain/entites/muscle_group_details_entity.dart';
import 'package:elevate_super_fitness/domain/entites/muscles_group_response_entity.dart';
import 'package:elevate_super_fitness/domain/entites/muscles_response_entity.dart';
import 'package:elevate_super_fitness/domain/use_cases/get_all_meals_categories_use_case.dart';
import 'package:elevate_super_fitness/domain/use_cases/get_all_muscles_by_muscle_group_id_use_case.dart';
import 'package:elevate_super_fitness/domain/use_cases/get_all_muscles_groups_use_case.dart';
import 'package:elevate_super_fitness/domain/use_cases/get_random_muscles_use_case.dart';
import 'package:elevate_super_fitness/domain/use_cases/get_user_logged_data_use_case.dart';
import 'package:elevate_super_fitness/generated/l10n.dart';
import 'package:elevate_super_fitness/presentation/explore_page/view_model/explore_event.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

part 'explore_view_model_state.dart';

@injectable
class ExploreViewModelCubit extends Cubit<ExploreViewModelState> {
  ExploreViewModelCubit(
    this._userLoggedDataUseCase,
    this._getRandomMusclesUseCase,
    this._allMusclesGroupsUseCase,
    this._getAllMusclesByMuscleGroupIdUseCase,
    this._getAllMealsCategoriesUseCase,
  ) : super(const ExploreViewModelState());
  final GetUserLoggedDataUseCase _userLoggedDataUseCase;
  final GetRandomMusclesUseCase _getRandomMusclesUseCase;
  final GetAllMusclesGroupsUseCase _allMusclesGroupsUseCase;
  final GetAllMusclesByMuscleGroupIdUseCase
  _getAllMusclesByMuscleGroupIdUseCase;
  final GetAllMealsCategoriesUseCase _getAllMealsCategoriesUseCase;
  String selectedId = "";
  ValueNotifier<int> selectedCategory = ValueNotifier<int>(0);
  final categories = [
    {'title': AppLocalizations().gym, 'image': AppImages.gymImage},
    {'title': AppLocalizations().fitness, 'image': AppImages.fitnessImage},
    {'title': AppLocalizations().yoga, 'image': AppImages.yogaImage},
    {'title': AppLocalizations().aerobics, 'image': AppImages.aerobicsImage},
    {'title': AppLocalizations().trainer, 'image': AppImages.trainerImage},
  ];
  void doIntent(ExploreEvent event) {
    switch (event) {
      case ExploreGetAllDataEvent():
        _getAllData();
      case ExploreGetMusclesByMuscleGroupIdEvent():
        selectedId = event.id;
        _getAllMusclesByMuscleGroupId(selectedId);
    }
  }

  Future<void> _getAllData() async {
    await Future.wait([
      _getRandomMuscles(),
      _getAllMealsCategories(),
      _getAllMusclesGroups(),
    ]);
    await _getAllMusclesByMuscleGroupId(selectedId);
  }

  Future<void> _getRandomMuscles() async {
    emit(state.copyWith(randomMuscles: BaseState.loading()));
    final result = await _getRandomMusclesUseCase.call();
    switch (result) {
      case ApiSuccessResult<MusclesResponseEntity>():
        emit(state.copyWith(randomMuscles: BaseState.success(result.data)));
      case ApiErrorResult<MusclesResponseEntity>():
        emit(
          state.copyWith(randomMuscles: BaseState.error(result.errorMessage)),
        );
    }
  }

  Future<void> _getAllMusclesGroups() async {
    emit(state.copyWith(musclesGroup: BaseState.loading()));
    final result = await _allMusclesGroupsUseCase.call();
    switch (result) {
      case ApiSuccessResult<MusclesGroupResponseEntity>():
        emit(state.copyWith(musclesGroup: BaseState.success(result.data)));
        selectedId = result.data.musclesGroup?.first.id ?? "";
      case ApiErrorResult<MusclesGroupResponseEntity>():
        emit(
          state.copyWith(musclesGroup: BaseState.error(result.errorMessage)),
        );
    }
  }

  Future<void> _getAllMusclesByMuscleGroupId(String selectedI) async {
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

  Future<void> _getAllMealsCategories() async {
    emit(state.copyWith(mealsCategory: BaseState.loading()));
    final result = await _getAllMealsCategoriesUseCase.call();
    switch (result) {
      case ApiSuccessResult<MealsCategoriesResponseEntity>():
        emit(state.copyWith(mealsCategory: BaseState.success(result.data)));
      case ApiErrorResult<MealsCategoriesResponseEntity>():
        emit(
          state.copyWith(mealsCategory: BaseState.error(result.errorMessage)),
        );
    }
  }
}
