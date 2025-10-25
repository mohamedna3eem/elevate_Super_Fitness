import 'package:elevate_super_fitness/core/router/route_names.dart';
import 'package:elevate_super_fitness/presentation/auth/forget_password/view/forget_password_view.dart';
import 'package:flutter/material.dart';

abstract class AppRouter {
  static Route<dynamic> onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      case RouteNames.home:
        return MaterialPageRoute(builder: (_) => const SizedBox());
        case RouteNames.forgetPassword:
        return MaterialPageRoute(builder: (_) => const ForgetPassword());
      default:
        return MaterialPageRoute(builder: (_) => const SizedBox());
    }
  }
}
