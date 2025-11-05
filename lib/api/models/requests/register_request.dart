import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'register_request.g.dart';

@JsonSerializable()
class RegisterRequest extends Equatable {
  @JsonKey(name: "firstName")
  final String? firstName;
  @JsonKey(name: "lastName")
  final String? lastName;
  @JsonKey(name: "email")
  final String? email;
  @JsonKey(name: "password")
  final String? password;
  @JsonKey(name: "rePassword")
  final String? rePassword;
  @JsonKey(name: "gender")
  final String? gender;
  @JsonKey(name: "height")
  final int? height;
  @JsonKey(name: "weight")
  final int? weight;
  @JsonKey(name: "age")
  final int? age;
  @JsonKey(name: "goal")
  final String? goal;
  @JsonKey(name: "activityLevel")
  final String? activityLevel;

  const RegisterRequest({
    this.firstName,
    this.lastName,
    this.email,
    this.password,
    this.rePassword,
    this.gender,
    this.height,
    this.weight,
    this.age,
    this.goal,
    this.activityLevel,
  });

  factory RegisterRequest.fromJson(Map<String, dynamic> json) {
    return _$RegisterRequestFromJson(json);
  }

  Map<String, dynamic> toJson() {
    return _$RegisterRequestToJson(this);
  }

  @override
  List<Object?> get props =>
      [
        firstName,
        lastName,
        email,
        password,
        rePassword,
        gender,
        height,
        weight,
        age,
        goal,
        activityLevel,
      ];
}


