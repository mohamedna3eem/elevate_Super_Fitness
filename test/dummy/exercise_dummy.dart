import 'package:elevate_super_fitness/api/models/exercise_difficulty_level_dto.dart';
import 'package:elevate_super_fitness/api/models/get_selected_exercise_dto.dart';
import 'package:elevate_super_fitness/api/models/responses/exercise_difficulty_levels_response_dto.dart';
import 'package:elevate_super_fitness/api/models/responses/get_selected_exercises_response_dto.dart';
import 'package:elevate_super_fitness/domain/entites/exercise_difficulty_level_entity.dart';
import 'package:elevate_super_fitness/domain/entites/get_selected_exercise_entity.dart';

class ExerciseDummy {
  static ExerciseDifficultyLevelDto dummyExcerciseDifficultyLevelDto =
      const ExerciseDifficultyLevelDto(id: "difficulty_001", name: "Beginner");

  static ExerciseDifficultyLevelEntity dummyExcerciseDifficultyLevelEntity =
      const ExerciseDifficultyLevelEntity(
        id: "difficulty_001",
        name: "Beginner",
      );

  static ExerciseDifficultyLevelsResponseDto
  dummyExcerciseDifficultyLevelsResponseDto =
      const ExerciseDifficultyLevelsResponseDto(
        message: "Difficulty levels fetched successfully",
        totalLevels: 3,
        difficultyLevels: [
          ExerciseDifficultyLevelDto(id: "difficulty_001", name: "Beginner"),
          ExerciseDifficultyLevelDto(
            id: "difficulty_002",
            name: "Intermediate",
          ),
          ExerciseDifficultyLevelDto(id: "difficulty_003", name: "Advanced"),
        ],
      );

  static GetSelectedExerciseEntity dummyGetSelectedExerciseEntity =
      const GetSelectedExerciseEntity(
        id: "exercise_001",
        exercise: "Barbell Bench Press",
        shortYoutubeDemonstration: "bench_press_demo",
        inDepthYoutubeExplanation: "bench_press_full_tutorial",
        difficultyLevel: "Intermediate",
        targetMuscleGroup: "Chest",
        primeMoverMuscle: "Pectoralis Major",
        secondaryMuscle: "Triceps Brachii",
        tertiaryMuscle: "Anterior Deltoid",
        primaryEquipment: "Barbell",
        primaryItems: 1,
        secondaryEquipment: "Bench",
        secondaryItems: 1,
        posture: "Lying",
        singleOrDoubleArm: "Double Arm",
        continuousOrAlternatingArms: "Continuous",
        grip: "Pronated (Overhand)",
        loadPositionEnding: "Front of Chest",
        continuousOrAlternatingLegs: "None",
        footElevation: "Flat on Floor",
        combinationExercises: "None",
        movementPattern1: "Horizontal Push",
        movementPattern2: null,
        movementPattern3: null,
        planeOfMotion1: "Transverse",
        planeOfMotion2: null,
        planeOfMotion3: null,
        bodyRegion: "Upper Body",
        forceType: "Push",
        mechanics: "Compound",
        laterality: "Bilateral",
        primaryExerciseClassification: "Strength",
        shortYoutubeDemonstrationLink:
            "https://youtube.com/shorts/demo_bench_press",
        inDepthYoutubeExplanationLink:
            "https://youtube.com/watch?v=bench_press_tutorial",
      );

  static GetSelectedExerciseDto dummyGetSelectedExerciseDto =
      const GetSelectedExerciseDto(
        id: "exercise_001",
        exercise: "Barbell Bench Press",
        shortYoutubeDemonstration: "bench_press_demo",
        inDepthYoutubeExplanation: "bench_press_full_tutorial",
        difficultyLevel: "Intermediate",
        targetMuscleGroup: "Chest",
        primeMoverMuscle: "Pectoralis Major",
        secondaryMuscle: "Triceps Brachii",
        tertiaryMuscle: "Anterior Deltoid",
        primaryEquipment: "Barbell",
        primaryItems: 1,
        secondaryEquipment: "Bench",
        secondaryItems: 1,
        posture: "Lying",
        singleOrDoubleArm: "Double Arm",
        continuousOrAlternatingArms: "Continuous",
        grip: "Pronated (Overhand)",
        loadPositionEnding: "Front of Chest",
        continuousOrAlternatingLegs: "None",
        footElevation: "Flat on Floor",
        combinationExercises: "None",
        movementPattern1: "Horizontal Push",
        movementPattern2: null,
        movementPattern3: null,
        planeOfMotion1: "Transverse",
        planeOfMotion2: null,
        planeOfMotion3: null,
        bodyRegion: "Upper Body",
        forceType: "Push",
        mechanics: "Compound",
        laterality: "Bilateral",
        primaryExerciseClassification: "Strength",
        shortYoutubeDemonstrationLink:
            "https://youtube.com/shorts/demo_bench_press",
        inDepthYoutubeExplanationLink:
            "https://youtube.com/watch?v=bench_press_tutorial",
      );

  static GetSelectedExercisesResponseDto dummyGetSelectedExercisesReponseDto =
      const GetSelectedExercisesResponseDto(
        message: "Exercises fetched successfully",
        totalExercises: 3,
        totalPages: 1,
        currentPage: 1,
        exercises: [
          GetSelectedExerciseDto(
            id: "exercise_001",
            exercise: "Barbell Bench Press",
            shortYoutubeDemonstration: "bench_press_demo",
            inDepthYoutubeExplanation: "bench_press_full_tutorial",
            difficultyLevel: "Intermediate",
            targetMuscleGroup: "Chest",
            primeMoverMuscle: "Pectoralis Major",
            secondaryMuscle: "Triceps Brachii",
            tertiaryMuscle: "Anterior Deltoid",
            primaryEquipment: "Barbell",
            primaryItems: 1,
            secondaryEquipment: "Bench",
            secondaryItems: 1,
            posture: "Lying",
            singleOrDoubleArm: "Double Arm",
            continuousOrAlternatingArms: "Continuous",
            grip: "Pronated (Overhand)",
            loadPositionEnding: "Front of Chest",
            continuousOrAlternatingLegs: "None",
            footElevation: "Flat on Floor",
            combinationExercises: "None",
            movementPattern1: "Horizontal Push",
            movementPattern2: null,
            movementPattern3: null,
            planeOfMotion1: "Transverse",
            planeOfMotion2: null,
            planeOfMotion3: null,
            bodyRegion: "Upper Body",
            forceType: "Push",
            mechanics: "Compound",
            laterality: "Bilateral",
            primaryExerciseClassification: "Strength",
            shortYoutubeDemonstrationLink:
                "https://youtube.com/shorts/demo_bench_press",
            inDepthYoutubeExplanationLink:
                "https://youtube.com/watch?v=bench_press_tutorial",
          ),
          GetSelectedExerciseDto(
            id: "exercise_002",
            exercise: "Dumbbell Shoulder Press",
            shortYoutubeDemonstration: "shoulder_press_demo",
            inDepthYoutubeExplanation: "shoulder_press_tutorial",
            difficultyLevel: "Intermediate",
            targetMuscleGroup: "Shoulders",
            primeMoverMuscle: "Deltoid",
            secondaryMuscle: "Triceps Brachii",
            tertiaryMuscle: null,
            primaryEquipment: "Dumbbell",
            primaryItems: 2,
            secondaryEquipment: "Bench",
            secondaryItems: 1,
            posture: "Seated",
            singleOrDoubleArm: "Double Arm",
            continuousOrAlternatingArms: "Continuous",
            grip: "Neutral",
            loadPositionEnding: "Overhead",
            continuousOrAlternatingLegs: "None",
            footElevation: "Flat on Floor",
            combinationExercises: "None",
            movementPattern1: "Vertical Push",
            planeOfMotion1: "Frontal",
            bodyRegion: "Upper Body",
            forceType: "Push",
            mechanics: "Compound",
            laterality: "Bilateral",
            primaryExerciseClassification: "Strength",
            shortYoutubeDemonstrationLink:
                "https://youtube.com/shorts/demo_shoulder_press",
            inDepthYoutubeExplanationLink:
                "https://youtube.com/watch?v=shoulder_press_tutorial",
          ),
          GetSelectedExerciseDto(
            id: "exercise_003",
            exercise: "Bodyweight Squat",
            shortYoutubeDemonstration: "squat_demo",
            inDepthYoutubeExplanation: "squat_tutorial",
            difficultyLevel: "Beginner",
            targetMuscleGroup: "Legs",
            primeMoverMuscle: "Quadriceps",
            secondaryMuscle: "Gluteus Maximus",
            tertiaryMuscle: "Hamstrings",
            primaryEquipment: "Bodyweight",
            primaryItems: 0,
            secondaryEquipment: null,
            secondaryItems: 0,
            posture: "Standing",
            singleOrDoubleArm: "None",
            continuousOrAlternatingArms: "None",
            grip: "None",
            loadPositionEnding: "Bodyweight",
            continuousOrAlternatingLegs: "Alternating",
            footElevation: "Flat on Floor",
            combinationExercises: "None",
            movementPattern1: "Squat",
            planeOfMotion1: "Sagittal",
            bodyRegion: "Lower Body",
            forceType: "Push",
            mechanics: "Compound",
            laterality: "Bilateral",
            primaryExerciseClassification: "Strength",
            shortYoutubeDemonstrationLink:
                "https://youtube.com/shorts/demo_squat",
            inDepthYoutubeExplanationLink:
                "https://youtube.com/watch?v=squat_tutorial",
          ),
        ],
      );

  static final dummyPrimeMoverMuscleId = "muscle_001";
  static final dummyDifficultyLevelId = "difficulty_001";
  static final expectedError = "Server-Error";
}
