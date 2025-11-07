import 'package:elevate_super_fitness/api/models/requests/change_password_request_dto.dart';
import 'package:elevate_super_fitness/api/models/responses/change_password_response_dto.dart';
import 'package:elevate_super_fitness/api/models/responses/user_info_dto.dart';
import 'package:elevate_super_fitness/domain/entites/change_password_response_entity.dart';
import 'package:elevate_super_fitness/domain/entites/requests/change_password_request_entity.dart';
import 'package:elevate_super_fitness/domain/entites/user_info_entity.dart';

extension UserInfoMapper on UserInfoDto {
  UserInfoEntity toEntity() {
    return UserInfoEntity(
      message: message,
      id: user?.id,
      firstName: user?.firstName,
      lastName: user?.lastName,
      email: user?.email,
      gender: user?.gender,
      age: user?.age,
      weight: user?.weight,
      height: user?.height,
      activityLevel: user?.activityLevel,
      goal: user?.goal,
      photo: user?.photo,
      createdAt: user?.createdAt,
    );
  }
}
extension ChangePasswordResponseMapper on ChangePasswordResponseDto {
  ChangePasswordResponseEntity toEntity() {
    return ChangePasswordResponseEntity(
      message: message,
      token: token,
    );
  }
}
extension ChangePasswordRequestEntityMapper on ChangePasswordRequestEntity {
  ChangePasswordRequestDto toDto() {
    return ChangePasswordRequestDto(
      password: password,
      newPassword: newPassword,
    );
  }
}
