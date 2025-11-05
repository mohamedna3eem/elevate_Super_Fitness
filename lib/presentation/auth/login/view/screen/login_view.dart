import 'package:elevate_super_fitness/core/di/di.dart';
import 'package:elevate_super_fitness/presentation/auth/login/view/widgets/login_body.dart';
import 'package:elevate_super_fitness/presentation/auth/login/view_model/login_view_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LoginView extends StatelessWidget {
  const LoginView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocProvider(
        create: (context) => getIt.get<LoginViewModel>(),
        child: const LoginBody(),
      ),
    );
  }
}
