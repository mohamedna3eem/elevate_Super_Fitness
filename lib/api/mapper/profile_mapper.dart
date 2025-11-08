import '../../domain/entites/profile/profile_response_entity.dart';
import '../../domain/entites/profile/user_entity.dart';
import '../models/profile/profile_response.dart';
import '../models/profile/userDto.dart';
import 'package:elevate_super_fitness/api/models/requests/change_password_request_dto.dart';
import 'package:elevate_super_fitness/api/models/responses/change_password_response_dto.dart';
import 'package:elevate_super_fitness/domain/entites/change_password_response_entity.dart';
import 'package:elevate_super_fitness/domain/entites/requests/change_password_request_entity.dart';
extension UserMapper on UserDto {
  UserEntity toEntity() {
    return UserEntity(
      Id: Id,
      firstName: firstName,
      lastName: lastName,
      email: email,
      gender: gender,
      age: age,
      weight: weight,
      height: height,
      activityLevel: activityLevel,
      goal:goal,
      photo: photo,
      createdAt:createdAt,
    );
  }
}

extension ProfileMapper on ProfileResponseDto {
  ProfileResponseEntity toEntity() {
    return ProfileResponseEntity(
      message: message,
      user: user?.toEntity(),
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
