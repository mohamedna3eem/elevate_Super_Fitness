import 'package:json_annotation/json_annotation.dart';

part 'common_response.g.dart';

@JsonSerializable()
class CommonResponse {
  @JsonKey(name: "message")
  final String? message;

  CommonResponse ({
    this.message,
  });

  factory CommonResponse.fromJson(Map<String, dynamic> json) {
    return _$CommonResponseFromJson(json);
  }

  Map<String, dynamic> toJson() {
    return _$CommonResponseToJson(this);
  }
}


