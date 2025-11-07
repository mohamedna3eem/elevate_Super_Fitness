import 'package:equatable/equatable.dart';
import 'meal_category_entity.dart';

class MealsCategoriesResponseEntity extends Equatable {
  final List<MealCategoryEntity>? categories;

  const MealsCategoriesResponseEntity({this.categories});

  @override
  List<Object?> get props => [categories];
}
