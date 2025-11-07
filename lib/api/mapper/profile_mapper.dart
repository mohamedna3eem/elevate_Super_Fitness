import '../../domain/entites/profile/profile_response_entity.dart';
import '../../domain/entites/profile/user_entity.dart';
import '../models/profile/profile_response.dart';
import '../models/profile/userDto.dart';

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
