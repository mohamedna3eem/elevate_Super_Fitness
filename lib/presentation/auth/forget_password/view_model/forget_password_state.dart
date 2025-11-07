import 'package:elevate_super_fitness/core/api_result/base_state.dart';
import 'package:elevate_super_fitness/domain/entites/email_verification_entity.dart';
import 'package:elevate_super_fitness/domain/entites/forget_password_response_entity.dart';
import 'package:elevate_super_fitness/domain/entites/reset_password_response_entity.dart';
import 'package:equatable/equatable.dart';

class ForgetPasswordState extends Equatable {
  final BaseState<ForgetPasswordResponseEntity>? requestEmailState;
  final BaseState<EmailVerificationEntity>? verifyCodeState;
  final BaseState<ResetPasswordResponseEntity>? resetPasswordState;

  const ForgetPasswordState({
    this.requestEmailState,
    this.verifyCodeState,
    this.resetPasswordState,
  });

  ForgetPasswordState copyWith({
    BaseState<ForgetPasswordResponseEntity>? requestEmailState,
    BaseState<EmailVerificationEntity>? verifyCodeState,
    BaseState<ResetPasswordResponseEntity>? resetPasswordState,
  }) {
    return ForgetPasswordState(
      requestEmailState: requestEmailState ?? this.requestEmailState,
      verifyCodeState: verifyCodeState ?? this.verifyCodeState,
      resetPasswordState: resetPasswordState ?? this.resetPasswordState,
    );
  }

  @override
  List<Object?> get props => [
    requestEmailState,
    verifyCodeState,
    resetPasswordState,
  ];
}
