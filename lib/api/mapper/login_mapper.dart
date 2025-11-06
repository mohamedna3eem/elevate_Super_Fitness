// Extension to convert Entity → DTO
import 'package:elevate_super_fitness/api/models/requests/login_request_dto.dart';
import 'package:elevate_super_fitness/api/models/responses/login_response_dto.dart';
import 'package:elevate_super_fitness/domain/entites/login_entity.dart';
import 'package:elevate_super_fitness/domain/entites/requests/login_request_entity.dart';

extension SignInRequestMapper on LoginRequestEntity {
  LoginRequestDto toDto() {
    return LoginRequestDto(email: email, password: password);
  }
}

extension SignInResponseMapper on LoginResponseDto {
  LoginResponseEntity toEntity() {
    return LoginResponseEntity(
      message: message,
      token: token,
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
