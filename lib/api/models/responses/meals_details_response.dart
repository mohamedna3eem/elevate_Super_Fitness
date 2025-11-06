import 'package:elevate_super_fitness/api/models/meal_details_dto.dart';
import 'package:json_annotation/json_annotation.dart';

part 'meals_details_response.g.dart';

@JsonSerializable()
class MealsDetailsResponse {
  @JsonKey(name: 'meals')
  final List<MealDetailsDTO>? meals;

  MealsDetailsResponse({required this.meals});

  factory MealsDetailsResponse.fromJson(Map<String, dynamic> json) =>
      _$MealsDetailsResponseFromJson(json);

  Map<String, dynamic> toJson() => _$MealsDetailsResponseToJson(this);
}
