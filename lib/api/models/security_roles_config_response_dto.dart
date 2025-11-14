import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'security_roles_config_response_dto.g.dart';

@JsonSerializable(explicitToJson: true)
class SecurityRolesConfigResponseDto extends Equatable {
  @JsonKey(name: "security_roles_config")
  final List<SecurityRoleSectionDto> securityRolesConfig;

  const SecurityRolesConfigResponseDto({required this.securityRolesConfig});

  factory SecurityRolesConfigResponseDto.fromJson(Map<String, dynamic> json) =>
      _$SecurityRolesConfigResponseDtoFromJson(json);

  Map<String, dynamic> toJson() =>
      _$SecurityRolesConfigResponseDtoToJson(this);

  @override
  List<Object?> get props => [securityRolesConfig];
}

@JsonSerializable(explicitToJson: true)
class SecurityRoleSectionDto extends Equatable {
  final String section;
  @JsonKey(name: "role_id")
  final String? roleId;
  final Map<String, dynamic>? name;
  final Map<String, dynamic>? title;
  final Map<String, dynamic>? content;
  final Map<String, dynamic>? description;
  final Map<String, dynamic>? style;
  final List<PermissionDto>? permissions;

  const SecurityRoleSectionDto({
    required this.section,
    this.roleId,
    this.name,
    this.title,
    this.content,
    this.description,
    this.style,
    this.permissions,
  });

  factory SecurityRoleSectionDto.fromJson(Map<String, dynamic> json) =>
      _$SecurityRoleSectionDtoFromJson(json);

  Map<String, dynamic> toJson() => _$SecurityRoleSectionDtoToJson(this);

  @override
  List<Object?> get props => [
        section,
        roleId,
        name,
        title,
        content,
        description,
        style,
        permissions,
      ];
}

@JsonSerializable()
class PermissionDto extends Equatable {
  final String key;
  final Map<String, dynamic>? name;
  final Map<String, dynamic>? description;

  const PermissionDto({
    required this.key,
    this.name,
    this.description,
  });

  factory PermissionDto.fromJson(Map<String, dynamic> json) =>
      _$PermissionDtoFromJson(json);

  Map<String, dynamic> toJson() => _$PermissionDtoToJson(this);

  @override
  List<Object?> get props => [key, name, description];
}
