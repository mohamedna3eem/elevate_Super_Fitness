import 'package:dio/dio.dart';
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

abstract class ExploreDummyData {
  // 🧩 DTO dummy data equivalent to entities
  static const dummyMealCategoryDto1 = MealCategoryDto(
    idCategory: "1",
    strCategory: "Beef",
    strCategoryThumb: "https://www.themealdb.com/images/category/beef.png",
    strCategoryDescription:
        "Beef is the culinary name for meat from cattle, particularly skeletal muscle.",
  );

  static const dummyMealCategoryDto2 = MealCategoryDto(
    idCategory: "2",
    strCategory: "Chicken",
    strCategoryThumb: "https://www.themealdb.com/images/category/chicken.png",
    strCategoryDescription:
        "Chicken dishes are among the most popular meals worldwide.",
  );

  static const dummyMealCategoryDto3 = MealCategoryDto(
    idCategory: "3",
    strCategory: "Dessert",
    strCategoryThumb: "https://www.themealdb.com/images/category/dessert.png",
    strCategoryDescription:
        "Desserts are sweet foods typically eaten at the end of a meal.",
  );

  static const dummyMealsCategoriesResponseDto = MealsCategoriesResponseDto(
    categories: [
      dummyMealCategoryDto1,
      dummyMealCategoryDto2,
      dummyMealCategoryDto3,
    ],
  );
  // 🥗 Dummy data for MealCategoryEntity and MealsCategoriesResponseEntity

  static const dummyMealCategoryEntity1 = MealCategoryEntity(
    idCategory: "1",
    strCategory: "Beef",
    strCategoryThumb: "https://www.themealdb.com/images/category/beef.png",
    strCategoryDescription:
        "Beef is the culinary name for meat from cattle, particularly skeletal muscle.",
  );

  static const dummyMealCategoryEntity2 = MealCategoryEntity(
    idCategory: "2",
    strCategory: "Chicken",
    strCategoryThumb: "https://www.themealdb.com/images/category/chicken.png",
    strCategoryDescription:
        "Chicken dishes are among the most popular meals worldwide.",
  );

  static const dummyMealCategoryEntity3 = MealCategoryEntity(
    idCategory: "3",
    strCategory: "Dessert",
    strCategoryThumb: "https://www.themealdb.com/images/category/dessert.png",
    strCategoryDescription:
        "Desserts are sweet foods typically eaten at the end of a meal.",
  );

  static const dummyMealsCategoriesResponseEntity =
      MealsCategoriesResponseEntity(
        categories: [
          dummyMealCategoryEntity1,
          dummyMealCategoryEntity2,
          dummyMealCategoryEntity3,
        ],
      );

  // 🧠 Dummy Muscles Entities for Testing

  static const dummyMuscleEntity1 = MuscleEntity(
    id: "m1",
    name: "Biceps",
    image: "https://example.com/images/muscles/biceps.png",
  );

  static const dummyMuscleEntity2 = MuscleEntity(
    id: "m2",
    name: "Triceps",
    image: "https://example.com/images/muscles/triceps.png",
  );

  static const dummyMuscleEntity3 = MuscleEntity(
    id: "m3",
    name: "Quadriceps",
    image: "https://example.com/images/muscles/quadriceps.png",
  );

  static const dummyMuscleEntity4 = MuscleEntity(
    id: "m4",
    name: "Hamstrings",
    image: "https://example.com/images/muscles/hamstrings.png",
  );

  static const dummyMusclesResponseEntity = MusclesResponseEntity(
    message: "Muscles fetched successfully",
    totalMuscles: 4,
    muscles: [
      dummyMuscleEntity1,
      dummyMuscleEntity2,
      dummyMuscleEntity3,
      dummyMuscleEntity4,
    ],
  );
  // 🧩 DTO dummy data equivalent to entities

  static const dummyMuscleDto1 = MuscleDto(
    id: "m1",
    name: "Biceps",
    image: "https://example.com/images/muscles/biceps.png",
  );

  static const dummyMuscleDto2 = MuscleDto(
    id: "m2",
    name: "Triceps",
    image: "https://example.com/images/muscles/triceps.png",
  );

  static const dummyMuscleDto3 = MuscleDto(
    id: "m3",
    name: "Quadriceps",
    image: "https://example.com/images/muscles/quadriceps.png",
  );

  static const dummyMuscleDto4 = MuscleDto(
    id: "m4",
    name: "Hamstrings",
    image: "https://example.com/images/muscles/hamstrings.png",
  );

  static const dummyMusclesResponseDto = MusclesResponseDto(
    message: "Muscles fetched successfully",
    totalMuscles: 4,
    muscles: [
      dummyMuscleDto1,
      dummyMuscleDto2,
      dummyMuscleDto3,
      dummyMuscleDto4,
    ],
  );
  // 🧩 DTO dummy data equivalent to entities

  static const dummyMuscleGroupDto1 = MuscleGroupDto(
    id: "g1",
    name: "Upper Body",
  );

  static const dummyMuscleGroupDto2 = MuscleGroupDto(
    id: "g2",
    name: "Lower Body",
  );

  static const dummyMuscleGroupDto3 = MuscleGroupDto(id: "g3", name: "Core");

  static const dummyMuscleGroupDto4 = MuscleGroupDto(
    id: "g4",
    name: "Full Body",
  );

  static const dummyMusclesGroupResponseDto = MusclesGroupResponseDto(
    message: "Muscle groups fetched successfully",
    musclesGroup: [
      dummyMuscleGroupDto1,
      dummyMuscleGroupDto2,
      dummyMuscleGroupDto3,
      dummyMuscleGroupDto4,
    ],
  );
  // 💪 Dummy Muscles Group Entities for Testing

  static const dummyMuscleGroupEntity1 = MuscleGroupEntity(
    id: "g1",
    name: "Upper Body",
  );

  static const dummyMuscleGroupEntity2 = MuscleGroupEntity(
    id: "g2",
    name: "Lower Body",
  );

  static const dummyMuscleGroupEntity3 = MuscleGroupEntity(
    id: "g3",
    name: "Core",
  );

  static const dummyMuscleGroupEntity4 = MuscleGroupEntity(
    id: "g4",
    name: "Full Body",
  );

  static const dummyMusclesGroupResponseEntity = MusclesGroupResponseEntity(
    message: "Muscle groups fetched successfully",
    musclesGroup: [
      dummyMuscleGroupEntity1,
      dummyMuscleGroupEntity2,
      dummyMuscleGroupEntity3,
      dummyMuscleGroupEntity4,
    ],
  );
  // 💪 Dummy data for MuscleGroupDetailsEntity
  static const dummyMuscleGroupDetailsEntity = MuscleGroupDetailsEntity(
    message: "Muscle group details fetched successfully",
    muscleGroupId: "g1",
    muscleGroupName: "Upper Body",
    musclesEntity: [dummyMuscleEntity1, dummyMuscleEntity2, dummyMuscleEntity3],
  );
  // 🧩 DTO dummy data equivalent to entity
  static const dummyMuscleGroupDto = MuscleGroupDto(
    id: "g1",
    name: "Upper Body",
  );
  static const dummyMuscleGroupDetailsDto = MuscleGroupDetailsDto(
    message: "Muscle group details fetched successfully",
    muscleGroup: dummyMuscleGroupDto,
    muscles: [dummyMuscleDto1, dummyMuscleDto2, dummyMuscleDto3],
  );

  static final dummyDioException = DioException(
    requestOptions: RequestOptions(path: '/meals/categories'),
    type: DioExceptionType.receiveTimeout,
    message: "dio_error_timeout",
  );

  static final dummyException = Exception("Generic data exception");
}
