import 'package:elevate_super_fitness/core/custom_widget/custom_glass_shape_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../core/constants/app_colors.dart';
import '../../../../../core/utils/validations.dart';
import '../../../../../generated/l10n.dart';
import '../../view_model/forget_password_events.dart';
import '../../view_model/forget_password_view_model.dart';

class EmailInputContainer extends StatefulWidget {
  final ForgetPasswordViewModel forgetPasswordViewModel;
  final VoidCallback onNext;

  const EmailInputContainer({
    super.key,
    required this.onNext,
    required this.forgetPasswordViewModel,
  });

  @override
  State<EmailInputContainer> createState() => _EmailInputContainerState();
}

class _EmailInputContainerState extends State<EmailInputContainer> {
  @override
  Widget build(BuildContext context) {

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.w),
          child: Column(
            children: [
              const SizedBox(height: 25),
              Text(
                AppLocalizations.of(context).enterYouEmail,
                textAlign: TextAlign.center,
                style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                  color: AppColors.white,
                  fontWeight: FontWeight.w400,
                ),
              ),
              const SizedBox(height: 10),
              Text(
                AppLocalizations.of(context).forgetPassword,
                textAlign: TextAlign.center,
                style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                  color: AppColors.white,
                  fontWeight: FontWeight.w800,
                ),
              ),
            ],
          ),
        ),
        const SizedBox(height: 25),
        CustomGlassShapeWidget(
          child: Form(
            key: widget.forgetPasswordViewModel.forgetPasswordFormKey,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                TextFormField(
                  controller: widget.forgetPasswordViewModel.emailController,
                  validator: Validations.validateEmail,
                  keyboardType: TextInputType.emailAddress,
                  style: const TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.w400,
                  ),
                  decoration: InputDecoration(
                    prefixIcon: Icon(
                      Icons.email_outlined,
                      color: AppColors.white,
                    ),
                    labelStyle: TextStyle(color: AppColors.white),
                    labelText: AppLocalizations.of(context).email,
                    hintText: AppLocalizations.of(context).enterYouEmail,
                    filled: true,
                    fillColor: Colors.transparent,
                    contentPadding: const EdgeInsets.symmetric(
                      horizontal: 16,
                      vertical: 14,
                    ),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(30),
                      borderSide: const BorderSide(color: Colors.white),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(40),
                      borderSide: BorderSide(
                        color: AppColors.mainColorL,
                        width: 2,
                      ),
                    ),
                  ),
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
                      if (widget
                          .forgetPasswordViewModel
                          .forgetPasswordFormKey
                          .currentState!
                          .validate()) {
                        widget.forgetPasswordViewModel.doIntent(
                          ForgetPasswordEvent(),
                        );
                      }
                    },
                    child: const Text(
                      "Sent OTP",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 14,
                        fontWeight: FontWeight.w800,
                      ),
                    ),
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
