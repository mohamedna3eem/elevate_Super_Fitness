import 'package:elevate_super_fitness/core/api_result/api_result.dart';
import 'package:elevate_super_fitness/domain/entites/meal_category_entity.dart';
import 'package:elevate_super_fitness/domain/use_cases/get_meals_categories_use_case.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

import '../../../domain/entites/meal_entity.dart';
import '../../../domain/use_cases/get_meals_by_category_use_case.dart';
import 'food_events.dart';

part 'food_state.dart';

@injectable
class FoodViewModel extends Cubit<FoodState> {
  final GetMealsCategoriesUseCase _getMealsCategoriesUseCase;
  final GetMealsByCategoryUseCase _getMealsByCategoryUseCase;

  FoodViewModel(
    this._getMealsCategoriesUseCase,
    this._getMealsByCategoryUseCase,
  ) : super(const FoodState());

  ValueNotifier<int> selectedTabIndex = ValueNotifier(0);

  void doIntent(FoodEvents events) {
    switch (events) {
      case GetMealsCategoriesFoodEvent():
        _getMealsCategories();
        break;
      case ChangeTabAndGetMealsFoodEvent():
        _getMealsByCategory(events.index);
        break;
    }
  }

  Future<void> _getMealsCategories() async {
    emit(const FoodState(isLoading: true));
    final result = await _getMealsCategoriesUseCase();
    switch (result) {
      case ApiSuccessResult<List<MealCategoryEntity>>():
        emit(state.copyWith(mealsCategoriesList: result.data, isLoading: false));
        _getMealsByCategory(0);
        break;
      case ApiErrorResult<List<MealCategoryEntity>>():
        emit(state.copyWith(errorMessage: result.errorMessage, isLoading: false));
        break;
    }
  }

  Future<void> _getMealsByCategory(int index) async {
    _changeTab(index);
    emit(state.copyWith(isMealsLoading: true));
    final category = state.mealsCategoriesList![index].strCategory ?? "";
    final result = await _getMealsByCategoryUseCase(category);
    switch (result) {
      case ApiSuccessResult<List<MealEntity>>():
        emit(state.copyWith(mealsList: result.data, isMealsLoading: false));
        break;
      case ApiErrorResult<List<MealEntity>>():
        emit(state.copyWith(errorMessage: result.errorMessage, isMealsLoading: false));
        break;
    }
  }

  void _changeTab(int index) {
    selectedTabIndex.value = index;
  }
}
