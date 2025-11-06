import 'package:elevate_super_fitness/core/constants/app_icons.dart';
import 'package:elevate_super_fitness/presentation/auth/forget_password/view/widgets/new_password.dart';
import 'package:elevate_super_fitness/presentation/auth/forget_password/view/widgets/custom_otp_input_page.dart';
import 'package:elevate_super_fitness/presentation/auth/forget_password/view_model/forget_password_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../generated/l10n.dart';
import '../../../../core/constants/app_images.dart';
import '../../../../core/custom_widget/custom_dialog.dart';
import '../../../../core/di/di.dart';
import '../../../../core/router/route_names.dart';
import '../view_model/forget_password_events.dart';
import '../view_model/forget_password_view_model.dart';
import 'widgets/email_input.dart';

class ForgetPassword extends StatefulWidget {
  const ForgetPassword({super.key});

  @override
  State<ForgetPassword> createState() => _ForgetPasswordState();
}

class _ForgetPasswordState extends State<ForgetPassword> {
  final PageController _pageController = PageController();
  int _currentPage = 0;
  bool _isDialogShown = false;

  late final ForgetPasswordViewModel _forgetPasswordViewModel;

  @override
  void initState() {
    super.initState();
    _forgetPasswordViewModel = getIt<ForgetPasswordViewModel>();
  }

  void _nextPage() {
    if (_currentPage < 2) {
      setState(() => _currentPage++);
      _pageController.animateToPage(
        _currentPage,
        duration: const Duration(milliseconds: 400),
        curve: Curves.easeInOut,
      );
    }
  }

  void _hideDialogIfShown(BuildContext context) {
    if (_isDialogShown) {
      Navigator.of(context, rootNavigator: true).pop();
      _isDialogShown = false;
    }
  }

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;

    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage(AppImages.forgetPasswordPG),
            fit: BoxFit.cover,
          ),
        ),
        child: SafeArea(
          child: BlocConsumer<ForgetPasswordViewModel, ForgetPasswordState>(
            bloc: _forgetPasswordViewModel,
            listenWhen: (previous, current) =>
                previous.requestEmailState != current.requestEmailState ||
                previous.verifyCodeState != current.verifyCodeState ||
                previous.resetPasswordState != current.resetPasswordState,
            listener: (context, state) async {
              final isLoading =
                  state.requestEmailState?.isLoading == true ||
                  state.verifyCodeState?.isLoading == true ||
                  state.resetPasswordState?.isLoading == true;
              if (isLoading && !_isDialogShown) {
                _isDialogShown = true;
                CustomDialog.fitnessLoading(context: context);
                return;
              }
              if (!isLoading) {
                _hideDialogIfShown(context);
              }
              final error =
                  state.requestEmailState?.errorMessage ??
                  state.verifyCodeState?.errorMessage ??
                  state.resetPasswordState?.errorMessage;

              if (error != null) {
                CustomDialog.fitnessPositiveButton(
                  context: context,
                  title: AppLocalizations.of(context).error,
                  message: error,
                );
                return;
              }

              if (state.requestEmailState?.data != null && _currentPage == 0) {
                _nextPage();
              }
              if (state.verifyCodeState?.data != null && _currentPage == 1) {
                _nextPage();
              }

              if (state.resetPasswordState?.data != null && _currentPage == 2) {
                CustomDialog.fitnessPositiveButton(
                  context: context,
                  title: AppLocalizations.of(context).passwordResetSuccessfully,
                  message: AppLocalizations.of(
                    context,
                  ).passwordResetSuccessfully,
                  positiveOnClick: () => Navigator.of(
                    context,
                  ).pushReplacementNamed(RouteNames.login),
                );
              }
            },
            builder: (context, state) {
              return Column(
                children: [
                  SizedBox(height: 0.02 * height),
                  Image.asset(AppIcons.logo, height: 100, width: 100),
                  Expanded(
                    child: PageView(
                      controller: _pageController,
                      physics: const NeverScrollableScrollPhysics(),
                      children: [
                        EmailInputContainer(
                          forgetPasswordViewModel: _forgetPasswordViewModel,
                          onNext: () {
                            if (_forgetPasswordViewModel
                                .forgetPasswordFormKey
                                .currentState!
                                .validate()) {
                              _forgetPasswordViewModel.doIntent(
                                ForgetPasswordEvent(),
                              );
                            }
                          },
                        ),
                        CustomOtpInputPage(viewModel: _forgetPasswordViewModel),
                        CreateNewPasswordContainer(
                          forgetPasswordViewModel: _forgetPasswordViewModel,
                          onDone: () {
                            _forgetPasswordViewModel.doIntent(
                              ResetPasswordEvent(),
                            );
                          },
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 20),
                ],
              );
            },
          ),
        ),
      ),
    );
  }
}
