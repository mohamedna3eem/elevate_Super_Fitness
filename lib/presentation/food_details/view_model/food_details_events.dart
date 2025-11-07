sealed class FoodDetailsEvents {}

class GetMealDetailsFoodDetailsEvent extends FoodDetailsEvents {
  String mealId;

  GetMealDetailsFoodDetailsEvent(this.mealId);
}
