import 'package:elevate_super_fitness/api/models/responses/meal_category_dto.dart';
import 'package:elevate_super_fitness/api/models/responses/meals_categories_response_dto.dart';
import 'package:elevate_super_fitness/api/models/responses/muscle_dto.dart';
import 'package:elevate_super_fitness/api/models/responses/muscle_group_details_dto.dart';

import 'package:elevate_super_fitness/api/models/responses/muscle_group_dto.dart';
import 'package:elevate_super_fitness/api/models/responses/muscles_group_response_dto.dart';
import 'package:elevate_super_fitness/api/models/responses/muscles_response_dto.dart';
import 'package:elevate_super_fitness/domain/entites/meal_category_entity.dart';
import 'package:elevate_super_fitness/domain/entites/meals_categories_response_entity.dart';
import 'package:elevate_super_fitness/domain/entites/muscle_entity.dart';
import 'package:elevate_super_fitness/domain/entites/muscle_group_details_entity.dart';
import 'package:elevate_super_fitness/domain/entites/muscle_group_entity.dart';
import 'package:elevate_super_fitness/domain/entites/muscles_group_response_entity.dart';
import 'package:elevate_super_fitness/domain/entites/muscles_response_entity.dart';

extension MuscleDtoMapper on MuscleDto {
  MuscleEntity toEntity() => MuscleEntity(id: id, name: name, image: image);
}

extension MusclesResponseDtoMapper on MusclesResponseDto {
  MusclesResponseEntity toEntity() => MusclesResponseEntity(
    message: message,
    totalMuscles: totalMuscles,
    muscles: muscles?.map((e) => e.toEntity()).toList(),
  );
}

extension MuscleGroupDtoMapper on MuscleGroupDto {
  MuscleGroupEntity toEntity() => MuscleGroupEntity(id: id, name: name);
}

extension MusclesGroupResponseDtoMapper on MusclesGroupResponseDto {
  MusclesGroupResponseEntity toEntity() => MusclesGroupResponseEntity(
    message: message,
    musclesGroup: musclesGroup?.map((e) => e.toEntity()).toList(),
  );
}

extension MuscleGroupDetailsDtoMapper on MuscleGroupDetailsDto {
  MuscleGroupDetailsEntity toEntity() => MuscleGroupDetailsEntity(
    message: message,
    muscleGroupName: muscleGroup?.name,
    muscleGroupId: muscleGroup?.id,
    musclesEntity: muscles?.map((e) => e.toEntity()).toList(),
  );
}
extension MealsCategoriesResponseMapper on MealsCategoriesResponseDto {
  MealsCategoriesResponseEntity toEntity() {
    return MealsCategoriesResponseEntity(
      categories: categories?.map((e) => e.toEntity()).toList(),
    );
  }
}

extension MealCategoryMapper on MealCategoryDto {
  MealCategoryEntity toEntity() {
    return MealCategoryEntity(
      idCategory: idCategory,
      strCategory: strCategory,
      strCategoryThumb: strCategoryThumb,
      strCategoryDescription: strCategoryDescription,
    );
  }
}