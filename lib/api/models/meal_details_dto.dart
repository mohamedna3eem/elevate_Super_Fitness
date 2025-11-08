import 'package:auto_mappr_annotation/auto_mappr_annotation.dart';
import 'package:json_annotation/json_annotation.dart';

import '../../domain/entites/meal_details_entity.dart';
import 'meal_details_dto.auto_mappr.dart';

part 'meal_details_dto.g.dart';

@AutoMappr([
  MapType<MealDetailsDTO, MealDetailsEntity>(),
])
@JsonSerializable()
class MealDetailsDTO {
  @JsonKey(name: 'idMeal')
  final String? idMeal;
  @JsonKey(name: 'strMeal')
  final String? strMeal;
  @JsonKey(name: 'strMealAlternate')
  final dynamic strMealAlternate;
  @JsonKey(name: 'strCategory')
  final String? strCategory;
  @JsonKey(name: 'strArea')
  final String? strArea;
  @JsonKey(name: 'strInstructions')
  final String? strInstructions;
  @JsonKey(name: 'strMealThumb')
  final String? strMealThumb;
  @JsonKey(name: 'strTags')
  final String? strTags;
  @JsonKey(name: 'strYoutube')
  final String? strYoutube;
  @JsonKey(name: 'strIngredient1')
  final String? strIngredient1;
  @JsonKey(name: 'strIngredient2')
  final String? strIngredient2;
  @JsonKey(name: 'strIngredient3')
  final String? strIngredient3;
  @JsonKey(name: 'strIngredient4')
  final String? strIngredient4;
  @JsonKey(name: 'strIngredient5')
  final String? strIngredient5;
  @JsonKey(name: 'strIngredient6')
  final String? strIngredient6;
  @JsonKey(name: 'strIngredient7')
  final String? strIngredient7;
  @JsonKey(name: 'strIngredient8')
  final String? strIngredient8;
  @JsonKey(name: 'strIngredient9')
  final String? strIngredient9;
  @JsonKey(name: 'strIngredient10')
  final String? strIngredient10;
  @JsonKey(name: 'strIngredient11')
  final String? strIngredient11;
  @JsonKey(name: 'strIngredient12')
  final String? strIngredient12;
  @JsonKey(name: 'strIngredient13')
  final String? strIngredient13;
  @JsonKey(name: 'strIngredient14')
  final String? strIngredient14;
  @JsonKey(name: 'strIngredient15')
  final String? strIngredient15;
  @JsonKey(name: 'strIngredient16')
  final String? strIngredient16;
  @JsonKey(name: 'strIngredient17')
  final String? strIngredient17;
  @JsonKey(name: 'strIngredient18')
  final String? strIngredient18;
  @JsonKey(name: 'strIngredient19')
  final String? strIngredient19;
  @JsonKey(name: 'strIngredient20')
  final String? strIngredient20;
  @JsonKey(name: 'strMeasure1')
  final String? strMeasure1;
  @JsonKey(name: 'strMeasure2')
  final String? strMeasure2;
  @JsonKey(name: 'strMeasure3')
  final String? strMeasure3;
  @JsonKey(name: 'strMeasure4')
  final String? strMeasure4;
  @JsonKey(name: 'strMeasure5')
  final String? strMeasure5;
  @JsonKey(name: 'strMeasure6')
  final String? strMeasure6;
  @JsonKey(name: 'strMeasure7')
  final String? strMeasure7;
  @JsonKey(name: 'strMeasure8')
  final String? strMeasure8;
  @JsonKey(name: 'strMeasure9')
  final String? strMeasure9;
  @JsonKey(name: 'strMeasure10')
  final String? strMeasure10;
  @JsonKey(name: 'strMeasure11')
  final String? strMeasure11;
  @JsonKey(name: 'strMeasure12')
  final String? strMeasure12;
  @JsonKey(name: 'strMeasure13')
  final String? strMeasure13;
  @JsonKey(name: 'strMeasure14')
  final String? strMeasure14;
  @JsonKey(name: 'strMeasure15')
  final String? strMeasure15;
  @JsonKey(name: 'strMeasure16')
  final String? strMeasure16;
  @JsonKey(name: 'strMeasure17')
  final String? strMeasure17;
  @JsonKey(name: 'strMeasure18')
  final String? strMeasure18;
  @JsonKey(name: 'strMeasure19')
  final String? strMeasure19;
  @JsonKey(name: 'strMeasure20')
  final String? strMeasure20;
  @JsonKey(name: 'strSource')
  final String? strSource;
  @JsonKey(name: 'strImageSource')
  final dynamic strImageSource;
  @JsonKey(name: 'strCreativeCommonsConfirmed')
  final dynamic strCreativeCommonsConfirmed;
  @JsonKey(name: 'dateModified')
  final dynamic dateModified;

  MealDetailsDTO({
    required this.idMeal,
    required this.strMeal,
    required this.strMealAlternate,
    required this.strCategory,
    required this.strArea,
    required this.strInstructions,
    required this.strMealThumb,
    required this.strTags,
    required this.strYoutube,
    required this.strIngredient1,
    required this.strIngredient2,
    required this.strIngredient3,
    required this.strIngredient4,
    required this.strIngredient5,
    required this.strIngredient6,
    required this.strIngredient7,
    required this.strIngredient8,
    required this.strIngredient9,
    required this.strIngredient10,
    required this.strIngredient11,
    required this.strIngredient12,
    required this.strIngredient13,
    required this.strIngredient14,
    required this.strIngredient15,
    required this.strIngredient16,
    required this.strIngredient17,
    required this.strIngredient18,
    required this.strIngredient19,
    required this.strIngredient20,
    required this.strMeasure1,
    required this.strMeasure2,
    required this.strMeasure3,
    required this.strMeasure4,
    required this.strMeasure5,
    required this.strMeasure6,
    required this.strMeasure7,
    required this.strMeasure8,
    required this.strMeasure9,
    required this.strMeasure10,
    required this.strMeasure11,
    required this.strMeasure12,
    required this.strMeasure13,
    required this.strMeasure14,
    required this.strMeasure15,
    required this.strMeasure16,
    required this.strMeasure17,
    required this.strMeasure18,
    required this.strMeasure19,
    required this.strMeasure20,
    required this.strSource,
    required this.strImageSource,
    required this.strCreativeCommonsConfirmed,
    required this.dateModified,
  });

  factory MealDetailsDTO.fromJson(Map<String, dynamic> json) =>
      _$MealDetailsDTOFromJson(json);

  Map<String, dynamic> toJson() => _$MealDetailsDTOToJson(this);

  final mapper = const $MealDetailsDTO();
}