import 'package:elevate_super_fitness/core/router/route_names.dart';
import 'package:elevate_super_fitness/presentation/auth/login/view/screen/login_view.dart';
import 'package:elevate_super_fitness/presentation/main_home/view/screen/main_home_screen.dart';
import 'package:elevate_super_fitness/presentation/on_boarding/screen/on_boarding_screen.dart';
import 'package:elevate_super_fitness/presentation/smart_coach_page/view/screen/chat_screen.dart';
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
        return MaterialPageRoute(builder: (_) => const LoginView());

      case RouteNames.chat:
        return MaterialPageRoute(builder: (_) => ChatScreen());

      default:
        return MaterialPageRoute(builder: (_) => const SizedBox());
    }
  }
}
