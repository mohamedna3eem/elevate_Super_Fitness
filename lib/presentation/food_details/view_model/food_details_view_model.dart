import 'package:elevate_super_fitness/core/api_result/api_result.dart';
import 'package:elevate_super_fitness/domain/entites/meal_details_entity.dart';
import 'package:elevate_super_fitness/domain/entites/meal_entity.dart';
import 'package:elevate_super_fitness/domain/use_cases/get_meal_details_by_id_use_case.dart';
import 'package:elevate_super_fitness/domain/use_cases/get_meals_by_category_use_case.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

import 'food_details_events.dart';

part 'food_details_state.dart';

@injectable
class FoodDetailsViewModel extends Cubit<FoodDetailsState> {
  final GetMealsByCategoryUseCase _getMealsByCategoryUseCase;
  final GetMealDetailsByIdUseCase _getMealDetailsByIdUseCase;

  FoodDetailsViewModel(
    this._getMealsByCategoryUseCase,
    this._getMealDetailsByIdUseCase,
  ) : super(const FoodDetailsState());

  void doIntent(FoodDetailsEvents events) {
    switch (events) {
      case GetMealDetailsFoodDetailsEvent():
        _getMealDetailsById(events.mealId);
        break;
    }
  }

  Future<void> _getMealDetailsById(String id) async {
    emit(const FoodDetailsState(isLoading: true));
    final result = await _getMealDetailsByIdUseCase(id);
    switch (result) {
      case ApiSuccessResult<List<MealDetailsEntity>>():
        emit(state.copyWith(mealDetails: result.data.first, isLoading: false));
        _getMealsByCategory(result.data.first.strCategory ?? "");
        break;
      case ApiErrorResult<List<MealDetailsEntity>>():
        emit(
          state.copyWith(errorMessage: result.errorMessage, isLoading: false),
        );
        break;
    }
  }

  Future<void> _getMealsByCategory(String category) async {
    emit(state.copyWith(isMealsLoading: true));
    final result = await _getMealsByCategoryUseCase(category);
    switch (result) {
      case ApiSuccessResult<List<MealEntity>>():
        emit(state.copyWith(mealsList: result.data, isMealsLoading: false));
        break;
      case ApiErrorResult<List<MealEntity>>():
        emit(
          state.copyWith(
            errorMessage: result.errorMessage,
            isMealsLoading: false,
          ),
        );
        break;
    }
  }
}
