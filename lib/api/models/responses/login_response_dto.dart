import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'login_response_dto.g.dart';

@JsonSerializable()
class LoginResponseDto extends Equatable {
  final String? message;
  final UserLoginDto? user;
  final String? token;

  const LoginResponseDto({this.message, this.user, this.token});

  factory LoginResponseDto.fromJson(Map<String, dynamic> json) =>
      _$LoginResponseDtoFromJson(json);

  Map<String, dynamic> toJson() => _$LoginResponseDtoToJson(this);

  @override
  List<Object?> get props => [message, user, token];
}

@JsonSerializable()
class UserLoginDto extends Equatable {
  @JsonKey(name: "_id")
  final String? id;
  final String? firstName;
  final String? lastName;
  final String? email;
  final String? gender;
  final int? age;
  final int? weight;
  final int? height;
  final String? activityLevel;
  final String? goal;
  final String? photo;
  final String? createdAt;

  const UserLoginDto({
    this.id,
    this.firstName,
    this.lastName,
    this.email,
    this.gender,
    this.age,
    this.weight,
    this.height,
    this.activityLevel,
    this.goal,
    this.photo,
    this.createdAt,
  });

  factory UserLoginDto.fromJson(Map<String, dynamic> json) =>
      _$UserLoginDtoFromJson(json);

  Map<String, dynamic> toJson() => _$UserLoginDtoToJson(this);

  @override
  List<Object?> get props => [
    id,
    firstName,
    lastName,
    email,
    gender,
    age,
    weight,
    height,
    activityLevel,
    goal,
    photo,
    createdAt,
  ];
}
