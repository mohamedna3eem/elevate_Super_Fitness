import '../models/requests/email_verification_request_dto.dart';
import '../models/requests/forget_password_request_dto.dart';
import '../models/requests/reset_password_request_dto.dart';
import '../models/responses/email_verification_dto.dart';
import '../models/responses/forget_password_dto.dart';
import '../models/responses/reset_password_response_dto.dart';
import '../../domain/entites/requests/email_verification_request_entity.dart';
import '../../domain/entites/requests/forget_password_request_entity.dart';
import '../../domain/entites/requests/reset_password_request_entity.dart';
import '../../domain/entites/email_verification_entity.dart';
import '../../domain/entites/forget_password_response_entity.dart';
import '../../domain/entites/reset_password_response_entity.dart';

extension ForgetPasswordResponseMapper on ForgetPasswordResponseDto{
  ForgetPasswordResponseEntity toEntity(){
    return  ForgetPasswordResponseEntity(
        message:  message,
        info: info
    );
  }
}


extension ForgetPasswordRequestMapper on ForgetPasswordRequestEntity{
  ForgetPasswordRequestDto fromDomain(){
    return ForgetPasswordRequestDto(
        email: email
    );
  }
}

extension EmailVerificationMapper on EmailVerificationDto{
  EmailVerificationEntity toEntity() {
    return EmailVerificationEntity(
        status: status
    );
  }
}

extension EmailVerificationRequestMapper on EmailVerificationRequestEntity{

  EmailVerificationRequestDto fromDomain(){
    return EmailVerificationRequestDto(
        resetCode: resetCode
    );
  }
}

extension ResetPasswordMapper on ResetPasswordResponseDto{
  ResetPasswordResponseEntity toEntity() {
    return ResetPasswordResponseEntity(
        message: message,
        token: token
    );
  }
}

extension ResetPasswordRequestMapper on ResetPasswordRequestEntity{

  ResetPasswordRequestDto fromDomain(){
    return ResetPasswordRequestDto(
        newPassword: newPassword,
        email: email
    );
  }}