import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';
import 'user_dto.dart';

part 'user_info_dto.g.dart';

@JsonSerializable(explicitToJson: true)
class UserInfoDto extends Equatable {
  final String? message;
  final UserDto? user;

  const UserInfoDto({
    this.message,
    this.user,
  });

  factory UserInfoDto.fromJson(Map<String, dynamic> json) =>
      _$UserInfoDtoFromJson(json);

  Map<String, dynamic> toJson() => _$UserInfoDtoToJson(this);

  @override
  List<Object?> get props => [message, user];
}
