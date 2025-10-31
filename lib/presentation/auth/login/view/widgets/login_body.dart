import 'package:elevate_super_fitness/core/custom_widget/custom_dialog.dart';
import 'package:elevate_super_fitness/core/router/route_names.dart';
import 'package:elevate_super_fitness/presentation/auth/login/view/widgets/login_body_builder.dart';
import 'package:elevate_super_fitness/presentation/auth/login/view_model/login_view_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LoginBody extends StatefulWidget {
  const LoginBody({super.key});

  @override
  State<LoginBody> createState() => _LoginBodyState();
}

class _LoginBodyState extends State<LoginBody> {
  final GlobalKey<FormState> _globalKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return BlocListener<LoginViewModel, LoginViewModelState>(
      listener: (context, state) {
        if (state.loginState?.isLoading == true) {
          CustomDialog.fitnessLoading(context: context);
        } else if (state.loginState?.errorMessage != null) {
          Navigator.of(context, rootNavigator: true).pop();
          CustomDialog.fitnessPositiveButton(
            context: context,
            message: state.loginState?.errorMessage,
          );
        } else if (state.loginState?.data != null) {
          Navigator.restorablePushNamedAndRemoveUntil(
            context,
            RouteNames.mainHome,
            (route) => false,
          );
        }
      },
      child: LoginBodyBuilder(globalKey: _globalKey),
    );
  }
}
