import 'package:auto_mappr_annotation/auto_mappr_annotation.dart';
import 'package:json_annotation/json_annotation.dart';

import '../../domain/entites/meal_entity.dart';
import 'meal_dto.auto_mappr.dart';

part 'meal_dto.g.dart';

@AutoMappr([MapType<MealDTO, MealEntity>()])
@JsonSerializable()
class MealDTO {
  @JsonKey(name: 'strMeal')
  final String? strMeal;
  @JsonKey(name: 'strMealThumb')
  final String? strMealThumb;
  @JsonKey(name: 'idMeal')
  final String? idMeal;

  MealDTO({
    required this.strMeal,
    required this.strMealThumb,
    required this.idMeal,
  });

  factory MealDTO.fromJson(Map<String, dynamic> json) =>
      _$MealDTOFromJson(json);

  Map<String, dynamic> toJson() => _$MealDTOToJson(this);

  final mapper = const $MealDTO();
}
