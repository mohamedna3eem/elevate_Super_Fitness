import 'package:elevate_super_fitness/core/router/route_names.dart';
import 'package:elevate_super_fitness/presentation/food/view/screen/food_screen.dart';
import 'package:elevate_super_fitness/presentation/food_details/view/screen/food_details_screen.dart';
import 'package:elevate_super_fitness/presentation/main_home/view/screen/main_home_screen.dart';
import 'package:elevate_super_fitness/presentation/on_boarding/screen/on_boarding_screen.dart';
import 'package:elevate_super_fitness/presentation/splash/screen/splash_screen.dart';
import 'package:flutter/material.dart';

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
        return MaterialPageRoute(builder: (_) => const SizedBox());

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
