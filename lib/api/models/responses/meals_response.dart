import 'package:json_annotation/json_annotation.dart';

import '../meal_dto.dart';

part 'meals_response.g.dart';

@JsonSerializable()
class MealsResponse {
  @JsonKey(name: 'meals')
  final List<MealDTO>? meals;

  MealsResponse({required this.meals});

  factory MealsResponse.fromJson(Map<String, dynamic> json) =>
      _$MealsResponseFromJson(json);

  Map<String, dynamic> toJson() => _$MealsResponseToJson(this);
}
