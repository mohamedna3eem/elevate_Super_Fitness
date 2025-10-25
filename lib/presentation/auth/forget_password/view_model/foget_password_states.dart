// import 'package:equatable/equatable.dart';
//
// import '../../../../domain/entites/forget_password_response/email_verification_entity.dart';
// import '../../../../domain/entites/forget_password_response/forget_password_response_entity.dart';
// import '../../../../domain/entites/forget_password_response/reset_password_response_entity.dart';
//
// enum ChangePasswordStatus { initial, loading, success, error }
// enum ForgetPasswordStep { enterEmail, verifyCode, resetPassword }
//
// class ForgetPasswordStates extends Equatable {
//   final ChangePasswordStatus status;
//   final ForgetPasswordResponseEntity? forgetPasswordResponse;
//   final EmailVerificationEntity? emailVerificationEntity;
//   final ResetPasswordResponseEntity? resetPasswordResponse;
//   final String? errorMessage;
//   final bool isButtonEnabled;
//
//   const ForgetPasswordStates({
//     this.status = ChangePasswordStatus.initial,
//     this.forgetPasswordResponse,
//     this.emailVerificationEntity,
//     this.resetPasswordResponse,
//     this.errorMessage,
//     this.isButtonEnabled = false,
//   });
//
//   ForgetPasswordStates copyWith({
//     ChangePasswordStatus? status,
//     ForgetPasswordResponseEntity? forgetPasswordResponse,
//     EmailVerificationEntity? emailVerificationEntity,
//     ResetPasswordResponseEntity? resetPasswordResponse,
//     String? errorMessage,
//     bool? isButtonEnabled,
//   }) {
//     return ForgetPasswordStates(
//       status: status ?? this.status,
//       forgetPasswordResponse: forgetPasswordResponse ?? this.forgetPasswordResponse,
//       emailVerificationEntity: emailVerificationEntity ?? this.emailVerificationEntity,
//       resetPasswordResponse: resetPasswordResponse ?? this.resetPasswordResponse,
//       errorMessage: errorMessage ?? this.errorMessage,
//       isButtonEnabled: isButtonEnabled ?? this.isButtonEnabled,
//     );
//   }
//
//  a @override
//   List<Object?> get props => [
//     status,
//     forgetPasswordResponse,
//     emailVerificationEntity,
//     resetPasswordResponse,
//     errorMessage,
//     isButtonEnabled,
//   ];
//
//
// }
import 'package:equatable/equatable.dart';
import '../../../../domain/entites/forget_password_response/email_verification_entity.dart';
import '../../../../domain/entites/forget_password_response/forget_password_response_entity.dart';
import '../../../../domain/entites/forget_password_response/reset_password_response_entity.dart';

enum ForgetPasswordStatus { initial, loading, success, error }
enum ForgetPasswordStep { enterEmail, verifyCode, resetPassword }

class ForgetPasswordStates extends Equatable {
  final ForgetPasswordStatus status;
  final ForgetPasswordStep currentStep;
  final ForgetPasswordResponseEntity? forgetPasswordResponse;
  final EmailVerificationEntity? emailVerificationEntity;
  final ResetPasswordResponseEntity? resetPasswordResponse;
  final String? errorMessage;
  final bool isButtonEnabled;
  final String? email;


  const ForgetPasswordStates({
    this.status = ForgetPasswordStatus.initial,
    this.currentStep = ForgetPasswordStep.enterEmail,
    this.forgetPasswordResponse,
    this.emailVerificationEntity,
    this.resetPasswordResponse,
    this.errorMessage,
    this.isButtonEnabled = false,
    this.email,
  });

  ForgetPasswordStates copyWith({
    ForgetPasswordStatus? status,
    ForgetPasswordStep? currentStep,
    ForgetPasswordResponseEntity? forgetPasswordResponse,
    EmailVerificationEntity? emailVerificationEntity,
    ResetPasswordResponseEntity? resetPasswordResponse,
    String? errorMessage,
    bool? isButtonEnabled,
    String? email,
  }) {
    return ForgetPasswordStates(
      status: status ?? this.status,
      currentStep: currentStep ?? this.currentStep,
      forgetPasswordResponse: forgetPasswordResponse ?? this.forgetPasswordResponse,
      emailVerificationEntity: emailVerificationEntity ?? this.emailVerificationEntity,
      resetPasswordResponse: resetPasswordResponse ?? this.resetPasswordResponse,
      errorMessage: errorMessage ?? this.errorMessage,
      isButtonEnabled: isButtonEnabled ?? this.isButtonEnabled,
      email: email ?? this.email,
    );
  }

  @override
  List<Object?> get props => [
    status,
    currentStep,
    forgetPasswordResponse,
    emailVerificationEntity,
    resetPasswordResponse,
    errorMessage,
    isButtonEnabled,
    email
  ];
}
