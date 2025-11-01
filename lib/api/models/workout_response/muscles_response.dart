import 'package:json_annotation/json_annotation.dart';
part 'muscles_response.g.dart';

@JsonSerializable()
class MusclesGroupDto {
  @JsonKey(name: "_id")
  final String? Id;
  @JsonKey(name: "name")
  final String? name;

  MusclesGroupDto ({
    this.Id,
    this.name,
  });

  factory MusclesGroupDto.fromJson(Map<String, dynamic> json) {
    return _$MusclesGroupDtoFromJson(json);
  }

  Map<String, dynamic> toJson() {
    return _$MusclesGroupDtoToJson(this);
  }
}