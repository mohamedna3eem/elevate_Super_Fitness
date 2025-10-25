import 'package:flutter/material.dart';
import '../../../../../core/constants/app_colors.dart';
import '../../../../../core/di/di.dart';
import '../../../../../core/utils/validations.dart';
import '../../../../../generated/l10n.dart';
import '../../view_model/forget_password_events.dart';
import '../../view_model/forget_password_view_model.dart';

class EmailInputContainer extends StatefulWidget {
  final VoidCallback onNext;
  const EmailInputContainer({super.key, required this.onNext});

  @override
  State<EmailInputContainer> createState() => _EmailInputContainerState();
}

class _EmailInputContainerState extends State<EmailInputContainer> {
  late final ForgetPasswordViewModel _forgetPasswordViewModel;

  @override
  void initState() {
    super.initState();
    _forgetPasswordViewModel = getIt<ForgetPasswordViewModel>();
  }

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;

    return  Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24),
        child:
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              const SizedBox(height: 25),
          Text(
            AppLocalizations.of(context).enterYouEmail,
            textAlign: TextAlign.center,
            style: Theme.of(context)
                .textTheme
                .bodyMedium
                ?.copyWith(color: AppColors.white,fontWeight: FontWeight.w400),
          ),
              const SizedBox(height: 10),
          Text(
            AppLocalizations.of(context).forgetPassword,
            textAlign: TextAlign.center,
            style: Theme.of(context)
                .textTheme
                .bodyMedium
                ?.copyWith(color: AppColors.white,fontWeight: FontWeight.w800),
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
            key: _forgetPasswordViewModel.forgetPasswordFormKey,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                TextFormField(
                  controller: _forgetPasswordViewModel.emailController,
                  validator: Validations.validateEmail,
                  keyboardType: TextInputType.emailAddress,
                  decoration: InputDecoration(
                    prefixIcon:  Icon(Icons.email_outlined,color: AppColors.white,),
                    labelText: AppLocalizations.of(context).email,
                    hintText: AppLocalizations.of(context).enterYouEmail,
                    filled: true,
                    fillColor: Colors.transparent,
                    contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15),
                      borderSide: const BorderSide(color: Colors.white),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15),
                      borderSide: BorderSide(color: AppColors.mainColorL, width: 2),
                    ),
                  ),
                ),
                const SizedBox(height: 25),
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
                      if (_forgetPasswordViewModel
                          .forgetPasswordFormKey.currentState!
                          .validate()) {
                        _forgetPasswordViewModel
                            .doIntent(ForgetPasswordEvent());
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
              ],
            ),
          ),
        ),])
      );

  }
}
