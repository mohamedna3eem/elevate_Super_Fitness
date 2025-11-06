import 'package:elevate_super_fitness/core/di/di.dart';
import 'package:elevate_super_fitness/presentation/auth/change_password/view/widgets/change_password_body.dart';
import 'package:elevate_super_fitness/presentation/auth/change_password/view_model/change_password_view_model_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ChangePasswordView extends StatelessWidget {
  const ChangePasswordView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocProvider(
        create: (context) => getIt.get<ChangePasswordViewModel>(),
        child: const ChangePasswordBody(),
      ),
    );
  }
}
