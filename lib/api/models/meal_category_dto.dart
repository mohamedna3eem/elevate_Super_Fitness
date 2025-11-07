import 'package:auto_mappr_annotation/auto_mappr_annotation.dart';
import 'package:json_annotation/json_annotation.dart';

import '../../domain/entites/meal_category_entity.dart';
import 'meal_category_dto.auto_mappr.dart';

part 'meal_category_dto.g.dart';

@AutoMappr([
  MapType<MealCategoryDto, MealCategoryEntity>(),
])
@JsonSerializable()
class MealCategoryDto {
  @JsonKey(name: 'idCategory')
  final String? idCategory;
  @JsonKey(name: 'strCategory')
  final String? strCategory;
  @JsonKey(name: 'strCategoryThumb')
  final String? strCategoryThumb;
  @JsonKey(name: 'strCategoryDescription')
  final String? strCategoryDescription;

  MealCategoryDto({
    required this.idCategory,
    required this.strCategory,
    required this.strCategoryThumb,
    required this.strCategoryDescription,
  });

  factory MealCategoryDto.fromJson(Map<String, dynamic> json) =>
      _$MealCategoryDtoFromJson(json);

  Map<String, dynamic> toJson() => _$MealCategoryDtoToJson(this);

  final mapper = const $MealCategoryDto();
}
