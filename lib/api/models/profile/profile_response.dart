import 'package:elevate_super_fitness/api/models/profile/userDto.dart';
import 'package:json_annotation/json_annotation.dart';

part 'profile_response.g.dart';

@JsonSerializable()
class ProfileResponseDto {
  @JsonKey(name: "message")
  final String? message;
  @JsonKey(name: "user")
  final UserDto? user;

  ProfileResponseDto ({
    this.message,
    this.user,
  });

  factory ProfileResponseDto.fromJson(Map<String, dynamic> json) {
    return _$ProfileResponseDtoFromJson(json);
  }

  Map<String, dynamic> toJson() {
    return _$ProfileResponseDtoToJson(this);
  }
}




