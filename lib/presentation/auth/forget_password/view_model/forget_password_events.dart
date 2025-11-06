sealed class ForgetPasswordEvents {}

class ForgetPasswordEvent extends ForgetPasswordEvents {}

class VerifyResetCodeEvent extends ForgetPasswordEvents {
  final String otpCode;

  VerifyResetCodeEvent({required this.otpCode});
}

class ResetPasswordEvent extends ForgetPasswordEvents {}

class ResendOtpEvent extends ForgetPasswordEvents {}
