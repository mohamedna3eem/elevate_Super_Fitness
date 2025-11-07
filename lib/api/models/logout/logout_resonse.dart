import 'package:json_annotation/json_annotation.dart';

part 'logout_resonse.g.dart';

@JsonSerializable()
class LogOutResponseDto {
  @JsonKey(name: "message")
  final String? message;

  LogOutResponseDto ({
    this.message,
  });

  factory LogOutResponseDto.fromJson(Map<String, dynamic> json) {
    return _$LogOutResponseDtoFromJson(json);
  }

  Map<String, dynamic> toJson() {
    return _$LogOutResponseDtoToJson(this);
  }
}


