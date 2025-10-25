import 'package:elevate_super_fitness/core/custom_widget/custom_dialog.dart';
import 'package:elevate_super_fitness/core/custom_widget/custom_glass_shape_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pin_code_fields/pin_code_fields.dart';

import '../../../../../core/constants/app_colors.dart';
import '../../../../../generated/l10n.dart';
import '../../view_model/forget_password_events.dart';
import '../../view_model/forget_password_view_model.dart';

class OtpInputContainer extends StatefulWidget {
  final ForgetPasswordViewModel forgetPasswordViewModel;
  final VoidCallback onConfirm;

  const OtpInputContainer({
    super.key,
    required this.onConfirm,
    required this.forgetPasswordViewModel,
  });

  @override
  State<OtpInputContainer> createState() => _OtpInputContainerState();
}

class _OtpInputContainerState extends State<OtpInputContainer> {
  final _otpControllers = List.generate(6, (_) => TextEditingController());
  String otpCode = "";

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.w),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
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
            ],
          ),
        ),

        CustomGlassShapeWidget(
          child: Form(
            key: widget.forgetPasswordViewModel.verifyResetCodeFormKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                PinCodeTextField(
                  hintStyle: TextStyle(color: AppColors.mainColorL),
                  onTap: () {},
                  controller:
                      widget.forgetPasswordViewModel.resetCodeController,
                  backgroundColor: Colors.transparent,
                  appContext: context,
                  length: 6,
                  animationType: AnimationType.fade,
                  cursorColor: AppColors.mainColorL,
                  keyboardType: TextInputType.number,
                  enableActiveFill: false,
                  textStyle: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w500,
                    color: AppColors.mainColorL,
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
                const SizedBox(height: 25),

                SizedBox(
                  width: double.infinity,
                  height: 38,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: AppColors.mainColorL,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30),
                      ),
                    ),
                    onPressed: () {
                      widget.forgetPasswordViewModel.resetCodeController.text =
                          otpCode.trim();

                      if (otpCode.length != 6) {
                        CustomDialog.fitnessPositiveButton(
                          context: context,
                          message: "Please enter all 6 digits",
                        );
                        return;
                      }

                      final form = widget
                          .forgetPasswordViewModel
                          .verifyResetCodeFormKey
                          .currentState;
                      if (form != null && form.validate()) {
                        widget.forgetPasswordViewModel.doIntent(
                          VerifyResetCodeEvent(),
                        );
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
                const SizedBox(height: 25),
                InkWell(
                  onTap: () {
                    if (widget
                        .forgetPasswordViewModel
                        .forgetPasswordFormKey
                        .currentState!
                        .validate()) {
                      widget.forgetPasswordViewModel.doIntent(ResendOtpEvent());
                    }
                  },
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        AppLocalizations.of(context).didnotReceiveCode,
                        style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                          color: AppColors.white,
                          fontWeight: FontWeight.w400,
                          fontSize: 16,
                        ),
                      ),
                      Text(
                        AppLocalizations.of(context).resend,
                        style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                          color: AppColors.mainColorL,
                          decoration: TextDecoration.underline,
                          fontWeight: FontWeight.w700,
                          fontSize: 16,
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
    );
  }
}
