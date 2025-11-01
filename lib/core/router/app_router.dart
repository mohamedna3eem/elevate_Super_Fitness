import 'package:elevate_super_fitness/core/model/exercise.dart';
import 'package:elevate_super_fitness/core/router/route_names.dart';
import 'package:elevate_super_fitness/presentation/exercise/view/screen/exercise_screen.dart';
import 'package:elevate_super_fitness/presentation/auth/login/view/screen/login_view.dart';
import 'package:elevate_super_fitness/presentation/main_home/view/screen/main_home_screen.dart';
import 'package:elevate_super_fitness/presentation/on_boarding/screen/on_boarding_screen.dart';
import 'package:elevate_super_fitness/presentation/splash/screen/splash_screen.dart';
import 'package:elevate_super_fitness/presentation/auth/forget_password/view/forget_password_view.dart';
import 'package:flutter/material.dart';

import '../../presentation/auth/register/view/screen/register_screen.dart';

abstract class AppRouter {
  static Route<dynamic> onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      case RouteNames.mainHome:
        return MaterialPageRoute(builder: (_) => MainHomeScreen());

      case RouteNames.splash:
        return MaterialPageRoute(builder: (_) => const SplashScreen());

      case RouteNames.onBoarding:
        return MaterialPageRoute(builder: (_) => const OnBoardingScreen());

      case RouteNames.login:
        return MaterialPageRoute(builder: (_) => const LoginView());

      case RouteNames.register:
        return MaterialPageRoute(builder: (_) => const RegisterScreen());

      case RouteNames.forgetPassword:
        return MaterialPageRoute(builder: (_) => const ForgetPassword());

      case RouteNames.exercise:
        final ExerciseModel exerciseModel = settings.arguments as ExerciseModel;
        return MaterialPageRoute(
          builder: (_) => ExerciseScreen(
            primeMoverMuscleId: exerciseModel.primeMoverMuscleId,
            exciseName: exerciseModel.exciseName,
          ),
        );

      case RouteNames.food:
        return MaterialPageRoute(builder: (_) => const FoodScreen());

      case RouteNames.foodDetails:
        final mealId = settings.arguments as String? ?? "";
        return MaterialPageRoute(
          builder: (_) => FoodDetailsScreen(mealId: mealId),
        );

      default:
        return MaterialPageRoute(builder: (_) => const SizedBox());
    }
  }
}
