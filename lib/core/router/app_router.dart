import 'package:elevate_super_fitness/api/models/exercise_widget_model.dart';
import 'package:elevate_super_fitness/core/router/route_names.dart';
import 'package:elevate_super_fitness/presentation/auth/change_password/view/screen/change_password_view.dart';
import 'package:elevate_super_fitness/presentation/auth/login/view/screen/login_view.dart';
import 'package:elevate_super_fitness/presentation/auth/register/view/screen/register_screen.dart';
import 'package:elevate_super_fitness/presentation/exercise/view/screen/exercise_screen.dart';
import 'package:elevate_super_fitness/presentation/main_home/view/screen/main_home_screen.dart';
import 'package:elevate_super_fitness/presentation/on_boarding/screen/on_boarding_screen.dart';
import 'package:elevate_super_fitness/presentation/splash/screen/splash_screen.dart';
import 'package:flutter/material.dart';

import '../../presentation/food/view/screen/food_screen.dart';
import '../../presentation/food_details/view/screen/food_details_screen.dart';

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
      case RouteNames.changePassword:
        return MaterialPageRoute(builder: (_) => const ChangePasswordView());

      case RouteNames.register:
        return MaterialPageRoute(builder: (_) => const RegisterScreen());

      case RouteNames.exercise:
        final ExerciseWidgetModel exerciseModel =
            settings.arguments as ExerciseWidgetModel;
        return MaterialPageRoute(
          builder: (_) => ExerciseScreen(exerciseModel: exerciseModel),
        );

      case RouteNames.food:
        final categoryIndex = settings.arguments as int?;
        return MaterialPageRoute(
          builder: (_) => FoodScreen(categoryIndex: categoryIndex),
        );

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
