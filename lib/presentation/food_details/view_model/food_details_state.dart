part of 'food_details_view_model.dart';

final class FoodDetailsState extends Equatable {
  final bool isLoading;
  final bool isMealsLoading;
  final String? errorMessage;
  final MealDetailsEntity? mealDetails;
  final List<MealEntity>? mealsList;

  const FoodDetailsState({
    this.isLoading = true,
    this.isMealsLoading = true,
    this.errorMessage,
    this.mealDetails,
    this.mealsList,
  });

  FoodDetailsState copyWith({
    bool? isLoading,
    bool? isMealsLoading,
    String? errorMessage,
    MealDetailsEntity? mealDetails,
    List<MealEntity>? mealsList,
  }) {
    return FoodDetailsState(
      isLoading: isLoading ?? this.isLoading,
      isMealsLoading: isMealsLoading ?? this.isMealsLoading,
      errorMessage: errorMessage ?? this.errorMessage,
      mealDetails: mealDetails ?? this.mealDetails,
      mealsList: mealsList ?? this.mealsList,
    );
  }

  @override
  List<Object?> get props => [
    isLoading,
    errorMessage,
    mealDetails,
    isMealsLoading,
    mealsList,
  ];
}
