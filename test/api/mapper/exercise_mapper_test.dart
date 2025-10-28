import 'package:elevate_super_fitness/api/mapper/exercise_mapper.dart';
import 'package:elevate_super_fitness/api/models/exercise_difficulty_level_dto.dart';
import 'package:elevate_super_fitness/api/models/get_selected_exercise_dto.dart';
import 'package:flutter_test/flutter_test.dart';

import '../../dummy/exercise_dummy.dart';

void main() {
  group("test ExerciseMapper", () {
    group("test ExerciseDifficultyLevelMapper", () {
      test(
        "when call toEntity with right values should return ExerciseDifficultyLevelEntity with right values",
        () {
          //Arrange
          final ExerciseDifficultyLevelDto excerciseDifficultyLevelDto =
              ExerciseDummy.dummyExcerciseDifficultyLevelDto;

          //Act
          final result = excerciseDifficultyLevelDto.toEntity();

          //Assert
          expect(result.id, excerciseDifficultyLevelDto.id);
          expect(result.name, excerciseDifficultyLevelDto.name);
        },
      );
    });
    group("test GetSelectedExerciseMapper", () {
      test(
        "when call toEntity with right values should return GetSelectedExerciseEntity with right values",
        () {
          //Arrange
          final GetSelectedExerciseDto getSelectedExerciseDto =
              ExerciseDummy.dummyGetSelectedExerciseDto;

          //Act
          final result = getSelectedExerciseDto.toEntity();

          //Assert
          expect(result.id, getSelectedExerciseDto.id);
          expect(result.exercise, getSelectedExerciseDto.exercise);
          expect(result.shortYoutubeDemonstration,
              getSelectedExerciseDto.shortYoutubeDemonstration);
          expect(result.inDepthYoutubeExplanation,
              getSelectedExerciseDto.inDepthYoutubeExplanation);
          expect(result.difficultyLevel, getSelectedExerciseDto.difficultyLevel);
          expect(result.targetMuscleGroup,
              getSelectedExerciseDto.targetMuscleGroup);
          expect(result.primeMoverMuscle,
              getSelectedExerciseDto.primeMoverMuscle);   
          expect(result.secondaryMuscle,
              getSelectedExerciseDto.secondaryMuscle);  
          expect(result.tertiaryMuscle,
              getSelectedExerciseDto.tertiaryMuscle);
          expect(result.primaryEquipment,
              getSelectedExerciseDto.primaryEquipment);
          expect(result.primaryItems, getSelectedExerciseDto.primaryItems);
          expect(result.secondaryEquipment,
              getSelectedExerciseDto.secondaryEquipment);
          expect(result.secondaryItems, getSelectedExerciseDto.secondaryItems);
          expect(result.posture, getSelectedExerciseDto.posture);
          expect(result.singleOrDoubleArm, getSelectedExerciseDto.singleOrDoubleArm);
          expect(result.continuousOrAlternatingArms,
              getSelectedExerciseDto.continuousOrAlternatingArms);
          expect(result.grip, getSelectedExerciseDto.grip);
          expect(result.loadPositionEnding, getSelectedExerciseDto.loadPositionEnding);
          expect(result.continuousOrAlternatingLegs,
              getSelectedExerciseDto.continuousOrAlternatingLegs);
          expect(result.footElevation, getSelectedExerciseDto.footElevation);
          expect(result.combinationExercises,
              getSelectedExerciseDto.combinationExercises);
          expect(result.movementPattern1, getSelectedExerciseDto.movementPattern1);
          expect(result.movementPattern2, getSelectedExerciseDto.movementPattern2);
          expect(result.movementPattern3, getSelectedExerciseDto.movementPattern3);
          expect(result.planeOfMotion1, getSelectedExerciseDto.planeOfMotion1);
          expect(result.planeOfMotion2, getSelectedExerciseDto.planeOfMotion2);
          expect(result.planeOfMotion3, getSelectedExerciseDto.planeOfMotion3);
          expect(result.bodyRegion, getSelectedExerciseDto.bodyRegion);
          expect(result.forceType, getSelectedExerciseDto.forceType);
          expect(result.mechanics, getSelectedExerciseDto.mechanics);
          expect(result.laterality, getSelectedExerciseDto.laterality);
          expect(result.primaryExerciseClassification,
              getSelectedExerciseDto.primaryExerciseClassification);
          expect(result.shortYoutubeDemonstrationLink,
              getSelectedExerciseDto.shortYoutubeDemonstrationLink);
          expect(result.inDepthYoutubeExplanationLink,
              getSelectedExerciseDto.inDepthYoutubeExplanationLink);
        },
      );
    });
  });
}
