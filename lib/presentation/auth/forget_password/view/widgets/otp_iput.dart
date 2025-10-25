import 'package:flutter/material.dart';
import 'package:pin_code_fields/pin_code_fields.dart';
import '../../../../../core/constants/app_colors.dart';
import '../../../../../core/di/di.dart';
import '../../../../../generated/l10n.dart';
import '../../view_model/forget_password_view_model.dart';
import '../../view_model/forget_password_events.dart';

class OtpInputContainer extends StatefulWidget {
  final VoidCallback onConfirm;

  const OtpInputContainer({super.key, required this.onConfirm});

  @override
  State<OtpInputContainer> createState() => _OtpInputContainerState();
}

class _OtpInputContainerState extends State<OtpInputContainer> {
  late final ForgetPasswordViewModel _forgetPasswordViewModel;
  final _otpControllers = List.generate(6, (_) => TextEditingController());
  String otpCode = "";

  @override
  void initState() {
    super.initState();
    _forgetPasswordViewModel = getIt<ForgetPasswordViewModel>();
  }

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(height: 25),

          Text(
            "OTP CODE",
            style: Theme.of(context).textTheme.bodyMedium?.copyWith(
              color: AppColors.white,
              fontWeight: FontWeight.w800,
            ),
          ),
          const SizedBox(height: 6),
          Text(
            "Enter Your OTP Check Your Email",
            style: Theme.of(context).textTheme.bodyMedium?.copyWith(
              color: AppColors.white,
              fontWeight: FontWeight.w400,
            ),
          ),

          const SizedBox(height: 25),

          Container(
            width: width * 0.9,
            padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 30),
            decoration: BoxDecoration(
              color: Colors.black.withOpacity(0.3),
              borderRadius: BorderRadius.circular(25),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.2),
                  offset: const Offset(0, 6),
                  blurRadius: 12,
                ),
              ],
            ),
            child: Form(
              key: _forgetPasswordViewModel.verifyResetCodeFormKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  SizedBox(height: 0.05 * height),
                  Center(
                    child: Text(
                      AppLocalizations.of(context).emailVerification,
                      style: Theme.of(
                        context,
                      ).textTheme.bodyMedium?.copyWith(color: AppColors.black),
                    ),
                  ),

                  PinCodeTextField(
                    onTap: () {
                    },
                    controller: _forgetPasswordViewModel.resetCodeController,
                    backgroundColor: Colors.transparent,
                    appContext: context,
                    length: 6,
                    animationType: AnimationType.fade,
                    cursorColor: AppColors.mainColorL,
                    keyboardType: TextInputType.number,
                    enableActiveFill: false,
                    textStyle: const TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w500,
                    ),
                    pinTheme: PinTheme(
                      shape: PinCodeFieldShape.underline,
                      fieldHeight: 50,
                      fieldWidth: 40,
                      activeColor: AppColors.mainColorL,
                      inactiveColor: AppColors.mainColorL,
                      selectedColor: AppColors.mainColorL,
                      activeFillColor: AppColors.mainColorL,
                      selectedFillColor: AppColors.mainColorL,
                    ),
                    onChanged: (value) {
                      otpCode = value;
                    },
                    onCompleted: (value) {
                      otpCode = value;
                    },
                  ),

                  SizedBox(
                    width: double.infinity,
                    height: 48,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: AppColors.mainColorL,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(15),
                        ),
                      ),
                      onPressed: () {
                        _forgetPasswordViewModel.resetCodeController.text = otpCode.trim();

                        if (otpCode.length != 6) {
                          ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(content: Text("Please enter all 6 digits")),
                          );
                          return;
                        }

                        final form = _forgetPasswordViewModel.verifyResetCodeFormKey.currentState;
                        if (form != null && form.validate()) {
                          _forgetPasswordViewModel.doIntent(VerifyResetCodeEvent());

                          widget.onConfirm();
                        }
                      },
                      child: Text(
                        AppLocalizations.of(context).confirm,
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                  ),
                  // 🔁 Resend
                  InkWell(
                    onTap: () {
                      _forgetPasswordViewModel.doIntent(ForgetPasswordEvent());
                    },
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          AppLocalizations.of(context).didnotReceiveCode,
                          style: Theme.of(context).textTheme.bodyMedium!
                              .copyWith(color: AppColors.black),
                        ),
                        Text(
                          AppLocalizations.of(context).resend,
                          style: Theme.of(context).textTheme.bodyMedium!
                              .copyWith(
                                color: AppColors.mainColorL,
                                decoration: TextDecoration.underline,
                              ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

