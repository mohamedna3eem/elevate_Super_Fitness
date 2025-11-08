part of 'food_view_model.dart';

final class FoodState extends Equatable {
  final bool isLoading;
  final bool isMealsLoading;
  final String? errorMessage;
  final List<MealCategoryEntity>? mealsCategoriesList;
  final List<MealEntity>? mealsList;

  const FoodState({
    this.isLoading = true,
    this.isMealsLoading = true,
    this.errorMessage,
    this.mealsCategoriesList,
    this.mealsList,
  });

  FoodState copyWith({
    bool? isLoading,
    bool? isMealsLoading,
    String? errorMessage,
    List<MealCategoryEntity>? mealsCategoriesList,
    List<MealEntity>? mealsList,
  }) {
    return FoodState(
      isLoading: isLoading ?? this.isLoading,
      isMealsLoading: isMealsLoading ?? this.isMealsLoading,
      errorMessage: errorMessage ?? this.errorMessage,
      mealsCategoriesList: mealsCategoriesList ?? this.mealsCategoriesList,
      mealsList: mealsList ?? this.mealsList,
    );
  }

  @override
  List<Object?> get props => [
    isLoading,
    isMealsLoading,
    errorMessage,
    mealsCategoriesList,
    mealsList,
  ];
}
