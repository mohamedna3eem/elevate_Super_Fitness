import 'package:elevate_super_fitness/api/models/responses/user_info_dto.dart';
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
