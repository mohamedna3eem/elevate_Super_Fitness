import 'package:elevate_super_fitness/api/models/meal_category_dto.dart';
import 'package:json_annotation/json_annotation.dart';

part 'meals_categories_response.g.dart';

@JsonSerializable()
class MealsCategoriesResponse {
  @JsonKey(name: 'categories')
  final List<MealCategoryDto>? categories;

  MealsCategoriesResponse({required this.categories});

  factory MealsCategoriesResponse.fromJson(Map<String, dynamic> json) =>
      _$MealsCategoriesResponseFromJson(json);

  Map<String, dynamic> toJson() => _$MealsCategoriesResponseToJson(this);
}
