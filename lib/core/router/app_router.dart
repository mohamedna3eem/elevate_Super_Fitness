import 'package:elevate_super_fitness/core/router/route_names.dart';
import 'package:elevate_super_fitness/presentation/auth/register/view/screen/register_screen.dart';
import 'package:elevate_super_fitness/presentation/on_boarding/screen/on_boarding_screen.dart';
import 'package:elevate_super_fitness/presentation/splash/screen/splash_screen.dart';
import 'package:flutter/material.dart';

abstract class AppRouter {
  static Route<dynamic> onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      case RouteNames.mainHome:
        return MaterialPageRoute(builder: (_) => const SizedBox());

      case RouteNames.splash:
        return MaterialPageRoute(builder: (_) => const SplashScreen());

      case RouteNames.onBoarding:
        return MaterialPageRoute(builder: (_) => const OnBoardingScreen());

      case RouteNames.login:
        return MaterialPageRoute(builder: (_) => const SizedBox());

      case RouteNames.register:
        return MaterialPageRoute(builder: (_) => const RegisterScreen());

      default:
        return MaterialPageRoute(builder: (_) => const SizedBox());
    }
  }
}
