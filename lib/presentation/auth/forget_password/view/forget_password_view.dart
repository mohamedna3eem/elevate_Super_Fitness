import 'package:elevate_super_fitness/core/constants/app_icons.dart';
import 'package:elevate_super_fitness/presentation/auth/forget_password/view/widgets/new_password.dart';
import 'package:elevate_super_fitness/presentation/auth/forget_password/view/widgets/otp_iput.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../generated/l10n.dart';
import '../../../../core/constants/app_images.dart';
import '../../../../core/custom_widget/custom_dialog.dart';
import '../../../../core/di/di.dart';
import '../../../../core/router/route_names.dart';
import '../view_model/foget_password_states.dart';
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
  bool isDialogShow = false;

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

  void _prevPage() {
    if (_currentPage > 0) {
      setState(() => _currentPage--);
      _pageController.animateToPage(
        _currentPage,
        duration: const Duration(milliseconds: 400),
        curve: Curves.easeInOut,
      );
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
          child: BlocConsumer<ForgetPasswordViewModel, ForgetPasswordStates>(
            bloc: _forgetPasswordViewModel,
            listenWhen: (previous, current) =>
                previous.status != current.status,
            listener: (context, state) {
              if (state.status == ForgetPasswordStatus.loading) {
                if (!isDialogShow) {
                  isDialogShow = true;
                  CustomDialog.loading(context: context);
                }
                return;
              }

              if (isDialogShow) {
                Navigator.of(context).pop();
                isDialogShow = false;
              }

              if (state.status == ForgetPasswordStatus.error) {
                CustomDialog.positiveButton(
                  context: context,
                  title: AppLocalizations.of(context).error,
                  message: state.errorMessage ?? "error",
                );
                return;
              }

              if (state.status == ForgetPasswordStatus.success) {
                if (_currentPage == 2) {
                  Navigator.of(context).pushReplacementNamed(RouteNames.login);
                } else {
                  _nextPage();
                }
              }
              if (state.status == ForgetPasswordStatus.resendSuccess) {
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(content: Text("OTP code resent successfully")),
                );
                return;
              }
            },
            builder: (context, state) {
              return Column(
                children: [
                  SizedBox(height: 0.02 * height),
                  Image.asset(AppIcons.logo, height: 100, width: 100),

                  // 🔹 PageView
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
                              _nextPage();
                              _forgetPasswordViewModel.doIntent(
                                ForgetPasswordEvent(),
                              );
                            }
                          },
                        ),

                        OtpInputContainer(
                          forgetPasswordViewModel: _forgetPasswordViewModel,
                          onConfirm: () {
                            _currentPage = 1;
                            _nextPage();
                          },
                        ),

                        CreateNewPasswordContainer(
                          forgetPasswordViewModel: _forgetPasswordViewModel,
                          onDone: () {
                          },
                        ),
                      ],
                    ),
                  ),

                  const SizedBox(height: 20),
                  if (_currentPage > 0)

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
