

import 'package:elevate_super_fitness/core/constants/app_colors.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../../core/di/di.dart';
import '../../../../core/utils/validations.dart';
import '../../../../generated/l10n.dart';
import '../view_model/forget_password_view_model.dart';

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


    return Center(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24),
        child: Container(
          padding: const EdgeInsets.all(20),
          constraints: const BoxConstraints(
            maxWidth: 350,
            maxHeight: 200,
          ),
          decoration: BoxDecoration(
            color: Colors.black.withOpacity(0.4),
            borderRadius: BorderRadius.circular(30),
            boxShadow: [
              BoxShadow(

                color: Colors.black.withOpacity(0.3),
                offset: const Offset(0, 4),
                blurRadius: 15,
              ),
            ],
          ),
          child: Column(
            // mainAxisSize: MainAxisSize.max ,
            children: [


              // Email TextField
            TextFormField(
            controller: _forgetPasswordViewModel.emailController,
            style: Theme.of(context).textTheme.bodySmall,
            validator: Validations.validateEmail,
            decoration: InputDecoration(
              labelText: AppLocalizations.of(context).email,
              hintText: AppLocalizations.of(context).enterYouEmail,
            )),



              // Send OTP Button

                 SizedBox(
                   width: double.infinity,
                   child: ElevatedButton(
                    onPressed: widget.onNext,
                    style: ElevatedButton.styleFrom(
                      backgroundColor: AppColors.mainColorD,
                      padding: const EdgeInsets.symmetric(vertical: 14),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(25),
                      ),
                      elevation: 6,
                    ),
                    child: const Text(
                      "Send OTP",
                      style: TextStyle(
                        fontSize: 16,
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                   ),
                 )
            ],
          ),
        ),
      ),
    );
  }
}
