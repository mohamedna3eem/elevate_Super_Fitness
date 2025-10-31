abstract class Endpoints {
  static const String signUp = "api/v1/auth/signup";
  static const String signIn = "api/v1/auth/signin";
  static const String changePassword = "api/v1/auth/change-password";
  static const String getAllDifficultyLevelsByPrimeMoverMuscle =
      "api/v1/levels/difficulty-levels/by-prime-mover";
  static const String getExercisesByPrimeMoverMuscleandDifficultyLevel =
      "api/v1/exercises/by-muscle-difficulty";
  static const String randomPrimeMoverMuscles = "api/v1/muscles/random";
  static const String allMusclesGroups = "api/v1/muscles";
  static const String musclesByMuscleGroupId = "api/v1/musclesGroup";
  static const String mealsCategories = "api/json/v1/1/categories.php";
  static const String loggedUserData = "api/v1/auth/profile-data";
  static const String urlThemeAdb = "https://www.themealdb.com/";
  static const String mealsDio = 'MealsDio';
}
