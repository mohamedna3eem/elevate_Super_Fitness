sealed class FoodEvents {}

class GetMealsCategoriesFoodEvent extends FoodEvents {}
class ChangeTabAndGetMealsFoodEvent extends FoodEvents {
  final int index;

  ChangeTabAndGetMealsFoodEvent(this.index);
}