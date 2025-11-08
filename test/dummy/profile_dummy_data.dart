import 'package:dio/dio.dart';
import 'package:elevate_super_fitness/api/models/profile/profile_response.dart';
import 'package:elevate_super_fitness/api/models/profile/userDto.dart';
import 'package:elevate_super_fitness/api/models/requests/change_password_request_dto.dart';
import 'package:elevate_super_fitness/api/models/responses/change_password_response_dto.dart';
import 'package:elevate_super_fitness/api/models/responses/user_info_dto.dart';
import 'package:elevate_super_fitness/domain/entites/change_password_response_entity.dart';
import 'package:elevate_super_fitness/domain/entites/profile/profile_response_entity.dart';
import 'package:elevate_super_fitness/domain/entites/profile/user_entity.dart';
import 'package:elevate_super_fitness/domain/entites/requests/change_password_request_entity.dart';
import 'package:elevate_super_fitness/domain/entites/user_info_entity.dart';

abstract class ProfileDummyData {
  static final dummyUserDto = UserDto(
    Id: "user_123456",
    firstName: "Ahmed",
    lastName: "Mutt",
    email: "ahmedmutti22@gmail.com",
    gender: "male",
    age: 25,
    weight: 75,
    height: 180,
    activityLevel: "active",
    goal: "muscle gain",
    photo: "https://example.com/images/ahmed_profile.jpg",
    createdAt: "2025-10-29T12:00:00Z",
  );

  static final dummyUserInfoDto = UserInfoDto(
    message: "User fetched successfully",
    // user: dummyUserDto,
  );

  static const dummyUserInfoEntity = UserInfoEntity(
    message: "User fetched successfully",
    id: "user_123456",
    firstName: "Ahmed",
    lastName: "Mutt",
    email: "ahmedmutti22@gmail.com",
    gender: "male",
    age: 25,
    weight: 75.5,
    height: 180.2,
    activityLevel: "active",
    goal: "muscle gain",
    photo: "https://example.com/images/ahmed_profile.jpg",
    createdAt: "2025-10-29T12:00:00Z",
  );

  // 🧩 Dummy exception examples
  static final dummyDioException = DioException(
    requestOptions: RequestOptions(path: '/user'),
    // type: DioExceptionType.connectionTimeout,
    message: "dio_error",
  );

  static final dummyException = Exception("Generic exception");
  static const dummyUserInfoEntityEmpty = UserInfoEntity(
    message: "No user data found",
    id: null,
    firstName: null,
    lastName: null,
    email: null,
    gender: null,
    age: null,
    weight: null,
    height: null,
    activityLevel: null,
    goal: null,
    photo: null,
    createdAt: null,
  );
  // static final dummyUserInfoDtoMappedToEntity = dummyUserInfoDto.toEntity();
  static const dummyChangePasswordResponseDto = ChangePasswordResponseDto(
    message: "success",
    token:
        "eyJhbGciOiJIUzI1NiIsInR5cCI6Ikp.eyJ1c2VyIjoiNjkwYTAwOGU5NzYyZjQ1ZTJhOTkyNTNiIiwiaWF0IjoxNzYyMjYzMjM3fQ.e65f7-3ej7gXiapRiNZKtaDXOUSbgj07Siys6_LMuO4",
  );

  static const dummyChangePasswordResponseEntity = ChangePasswordResponseEntity(
    message: "success",
    token:
        "eyJhbGciOiJIUzI1NiIsInR5cCI6Ikp.eyJ1c2VyIjoiNjkwYTAwOGU5NzYyZjQ1ZTJhOTkyNTNiIiwiaWF0IjoxNzYyMjYzMjM3fQ.e65f7-3ej7gXiapRiNZKtaDXOUSbgj07Siys6_LMuO4",
  );

  static const dummyChangePasswordRequestEntity = ChangePasswordRequestEntity(
    password: "Ahmed@123",
    newPassword: "Ahmed@1234",
  );
  static const dummyChangePasswordRequestDto = ChangePasswordRequestDto(
    password: "Ahmed@123",
    newPassword: "Ahmed@1234",
  );

  static final dummyProfileResponseDto = ProfileResponseDto(
    message: "Profile loaded successfully",
    user: UserDto(
      Id: "ASD"
    ),
  );

  // ProfileResponseEntity (dummy)
  static final dummyProfileResponseEntity = ProfileResponseEntity(
    message: "Profile loaded successfully",
    user: DummyUserEntity(),
  );
}

class DummyUserDto extends UserDto {
  DummyUserDto()
    : super(
        Id: "1",
        firstName: "Mo",
        lastName: "Naeem",
        email: "mo@example.com",
        gender: "male",
        age: 25,
        weight: 75,
        height: 180,
        activityLevel: "active",
        goal: "fitness",
        photo: "https://example.com/mo.jpg",
        createdAt: "2025-11-01T00:00:00Z",
      );
}

class DummyUserEntity extends UserEntity {
  DummyUserEntity()
    : super(
        Id: "1",
        firstName: "Mo",
        lastName: "Naeem",
        email: "mo@example.com",
        gender: "male",
        age: 25,
        weight: 75,
        height: 180,
        activityLevel: "active",
        goal: "fitness",
        photo: "https://example.com/mo.jpg",
        createdAt: "2025-11-01T00:00:00Z",
      );
}
