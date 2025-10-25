// import 'package:elevate_super_fitness/domain/use_cases/email_verification_use_case.dart';
// import 'package:elevate_super_fitness/domain/use_cases/forget_password_use_case.dart';
// import 'package:elevate_super_fitness/presentation/auth/forget_password/view_model/foget_password_states.dart';
// import 'package:elevate_super_fitness/presentation/auth/forget_password/view_model/forget_password_events.dart';
// import 'package:flutter/cupertino.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:injectable/injectable.dart';
// import '../../../../core/api_result/api_result.dart';
// import '../../../../domain/entites/forget_password_request/email_verification_request_entity.dart';
// import '../../../../domain/entites/forget_password_request/forget_password_request_entity.dart';
// import '../../../../domain/entites/forget_password_request/reset_password_request_entity.dart';
// import '../../../../domain/entites/forget_password_response/email_verification_entity.dart';
// import '../../../../domain/entites/forget_password_response/forget_password_response_entity.dart';
// import '../../../../domain/entites/forget_password_response/reset_password_response_entity.dart';
//
//
// @injectable
// class ForgetPasswordViewModel extends Cubit<ForgetPasswordStates> {
//   final ResetPasswordUseCase _forgetPasswordUseCase;
//   final EmailVerificationUseCase _emailVerificationUseCase;
//   final ResetPasswordUseCase _resetPasswordUseCase;
//
//   ForgetPasswordViewModel(
//       this._forgetPasswordUseCase,
//       this._resetPasswordUseCase,
//       this._emailVerificationUseCase)
//       : super(const ForgetPasswordStates());
//
//   final GlobalKey<FormState> forgetPasswordFormKey = GlobalKey<FormState>();
//   final TextEditingController emailController = TextEditingController();
//   final TextEditingController confirmPasswordController = TextEditingController();
//   final GlobalKey<FormState> verifyResetCodeFormKey = GlobalKey<FormState>();
//   final TextEditingController resetCodeController = TextEditingController();
//   final TextEditingController newPasswordController = TextEditingController();
//   final GlobalKey<FormState> resetPasswordFormKey = GlobalKey<FormState>();
//
//   void doIntent(ForgetPasswordEvents events) {
//     switch (events) {
//       case ForgetPasswordEvent():
//         _forgetPassword();
//       case VerifyResetCodeEvent():
//         _verifyResetCode();
//       case ResetPasswordEvent():
//         _resetPassword();
//
//     }
//   }
//
//
//   Future<void> _forgetPassword() async {
//     emit(state.copyWith(status: ChangePasswordStatus.loading));
//     final result = await _forgetPasswordUseCase(
//       ForgetPasswordRequestEntity(
//
//         email:emailController.text,
//       ),
//     );
//     switch (result) {
//       case ApiSuccessResult<ForgetPasswordResponseEntity>():
//         emit(state.copyWith(
//           status: ChangePasswordStatus.success,
//          forgetPasswordResponse: result.data,
//         ),
//     );
//       case ApiErrorResult<ForgetPasswordResponseEntity>():
//         emit(state.copyWith(
//           status: ChangePasswordStatus.error,
//           errorMessage: result.errorMessage,
//         ));
//
//     }
//   }
//
//   Future<void> _verifyResetCode() async {
//     emit(state.copyWith(: true));
//     final result = await _emailVerificationUseCase(
//       EmailVerificationRequestEntity(resetCode: resetCodeController.text),
//     );
//     switch (result) {
//       case ApiSuccessResult< EmailVerificationEntity>():
//         emit(
//           state.copyWith(
//             isLoading: false,
//             emailVerificationEntity: result.data,
//
//           ),
//         );
//       case ApiErrorResult< EmailVerificationEntity>():
//         emit(state.copyWith(
//           errorMessage: result.errorMessage,
//           isLoading: false,
//           forgetPasswordResponse: null,
//         ));
//     }
//   }
//
//   Future<void> _resetPassword() async {
//     emit(state.copyWith(isLoading: true));
//     final result = await _resetPasswordUseCase(
//       ResetPasswordRequestEntity(
//         email: emailController.text,
//         newPassword: newPasswordController.text,
//       ),
//     );
//     switch (result) {
//       case ApiSuccessResult<ResetPasswordResponseEntity>():
//         emit(
//           state.copyWith(
//             isLoading: false,
//             resetPasswordResponse: result.data,
//             isSuccess: true,
//           ),
//         );
//       case ApiErrorResult<ResetPasswordResponseEntity>():
//         emit(
//           state.copyWith(isLoading: false, errorMessage: result.errorMessage),
//         );
//     }
//   }
//   //
//   // @override
//   // Future<void> close() {
//   //   currentPasswordController.dispose();
//   //   newPasswordController.dispose();
//   //   return super.close();
//   // }
// }
import 'package:elevate_super_fitness/domain/entites/forget_password_request/email_verification_request_entity.dart';
import 'package:elevate_super_fitness/domain/entites/forget_password_request/reset_password_request_entity.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

import '../../../../core/api_result/api_result.dart';
import '../../../../domain/entites/forget_password_request/forget_password_request_entity.dart';
import '../../../../domain/entites/forget_password_response/email_verification_entity.dart';
import '../../../../domain/entites/forget_password_response/forget_password_response_entity.dart';
import '../../../../domain/entites/forget_password_response/reset_password_response_entity.dart';
import '../../../../domain/use_cases/email_verification_use_case.dart';
import '../../../../domain/use_cases/forget_password_use_case.dart';
import '../../../../domain/use_cases/reset_password_use_case.dart';
import 'foget_password_states.dart';
import 'forget_password_events.dart';

@injectable
class ForgetPasswordViewModel extends Cubit<ForgetPasswordStates> {
  final ForgetPasswordUseCase forgetPasswordUseCase;
  final EmailVerificationUseCase emailVerificationUseCase;
  final ResetPasswordUseCase resetPasswordUseCase;

  ForgetPasswordViewModel({
    required this.forgetPasswordUseCase,
    required this.emailVerificationUseCase,
    required this.resetPasswordUseCase,
  }) : super(const ForgetPasswordStates());

  final GlobalKey<FormState> forgetPasswordFormKey = GlobalKey<FormState>();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController confirmPasswordController =
      TextEditingController();
  final GlobalKey<FormState> verifyResetCodeFormKey = GlobalKey<FormState>();
  final TextEditingController resetCodeController = TextEditingController();
  final TextEditingController newPasswordController = TextEditingController();
  final GlobalKey<FormState> resetPasswordFormKey = GlobalKey<FormState>();

  void doIntent(ForgetPasswordEvents event) {
    switch (event) {
      case ForgetPasswordEvent():
        _forgetPassword(emailController.text);
      case VerifyResetCodeEvent():
        _verifyResetCode(emailController.text);
      case ResetPasswordEvent():
        _resetPassword(newPasswordController.text);
      case ResendOtpEvent():
        resenCode(emailController.text);
    }
  }
  Future<void> resenCode(String email) async {
    if (email.isEmpty) return;

    emit(state.copyWith(status: ForgetPasswordStatus.loading));

    final result = await forgetPasswordUseCase(
      ForgetPasswordRequestEntity(email: emailController.text),
    );

    if (result is ApiSuccessResult<ForgetPasswordResponseEntity>) {
      emit(
        state.copyWith(
          status: ForgetPasswordStatus.resendSuccess,
          currentStep: ForgetPasswordStep.verifyCode,
          forgetPasswordResponse: result.data,
          errorMessage: null,
          email: email,
        ),
      );
    } else if (result is ApiErrorResult) {
      emit(
        state.copyWith(
          status: ForgetPasswordStatus.error,
          errorMessage: "error",
        ),
      );
    }
  }

  Future<void> _forgetPassword(String email) async {
    if (email.isEmpty) return;

    emit(state.copyWith(status: ForgetPasswordStatus.loading));

    final result = await forgetPasswordUseCase(
      ForgetPasswordRequestEntity(email: emailController.text),
    );

    if (result is ApiSuccessResult<ForgetPasswordResponseEntity>) {
      emit(
        state.copyWith(
          status: ForgetPasswordStatus.success,
          currentStep: ForgetPasswordStep.verifyCode,
          forgetPasswordResponse: result.data,
          errorMessage: null,
          email: email,
        ),
      );
    } else if (result is ApiErrorResult) {
      emit(
        state.copyWith(
          status: ForgetPasswordStatus.error,
          errorMessage: "error",
        ),
      );
    }
  }

  Future<void> _verifyResetCode(String email) async {
    emit(state.copyWith(status: ForgetPasswordStatus.loading));

    final result = await emailVerificationUseCase(
      EmailVerificationRequestEntity(resetCode: resetCodeController.text),
    );

    if (result is ApiSuccessResult<EmailVerificationEntity>) {
      emit(
        state.copyWith(
          status: ForgetPasswordStatus.success,
          currentStep: ForgetPasswordStep.resetPassword,
          emailVerificationEntity: result.data,
          errorMessage: null,
        ),
      );
    } else if (result is ApiErrorResult) {
      emit(
        state.copyWith(
          status: ForgetPasswordStatus.error,
          errorMessage: "error",
        ),
      );
    }
  }

  Future<void> _resetPassword(String newPassword) async {
    if (newPassword.isEmpty) return;

    emit(state.copyWith(status: ForgetPasswordStatus.loading));
    final email = state.email ?? emailController.text.trim();
    final result = await resetPasswordUseCase(
      ResetPasswordRequestEntity(
        email: email,
        newPassword: newPasswordController.text,
      ),
    );

    if (result is ApiSuccessResult<ResetPasswordResponseEntity>) {
      emit(
        state.copyWith(
          email: email,
          status: ForgetPasswordStatus.success,
          resetPasswordResponse: result.data,
          currentStep: ForgetPasswordStep.enterEmail,
          errorMessage: null,
        ),
      );
    } else if (result is ApiErrorResult) {
      emit(
        state.copyWith(
          status: ForgetPasswordStatus.error,
          errorMessage: "eror",
        ),
      );
    }
  }
}
