import 'package:elevate_super_fitness/core/custom_widget/custom_auth_bg.dart';
import 'package:elevate_super_fitness/core/custom_widget/custom_glass_shape_widget.dart';
import 'package:elevate_super_fitness/core/router/route_names.dart';
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
        return MaterialPageRoute(builder: (_) => const CustomTextField());

      case RouteNames.login:
        return MaterialPageRoute(builder: (_) => const SizedBox());

      default:
        return MaterialPageRoute(builder: (_) => const SizedBox());
    }
  }
}

class CustomTextField extends StatelessWidget {
  const CustomTextField({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomAuthBg(
        child: Column(
          children: [
            CustomGlassShapeWidget(child: Column(children: [TextFormField()])),
          ],
        ),
      ),
    );
  }
}
