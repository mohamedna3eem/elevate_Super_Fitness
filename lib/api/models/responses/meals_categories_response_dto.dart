import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';
import 'meal_category_dto.dart';

part 'meals_categories_response_dto.g.dart';

@JsonSerializable(explicitToJson: true)
class MealsCategoriesResponseDto extends Equatable {
  @JsonKey(name: 'categories')
  final List<MealCategoryDto>? categories;

  const MealsCategoriesResponseDto({this.categories});

  factory MealsCategoriesResponseDto.fromJson(Map<String, dynamic> json) =>
      _$MealsCategoriesResponseDtoFromJson(json);

  Map<String, dynamic> toJson() => _$MealsCategoriesResponseDtoToJson(this);

  @override
  List<Object?> get props => [categories];
}
