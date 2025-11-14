import 'package:equatable/equatable.dart';

class SecurityRolesConfigResponseEntity extends Equatable {
  final List<SecurityRoleSectionEntity> securityRolesConfig;

  const SecurityRolesConfigResponseEntity({required this.securityRolesConfig});

  @override
  List<Object?> get props => [securityRolesConfig];
}

class SecurityRoleSectionEntity extends Equatable {
  final String section;
  final String? roleId;
  final Map<String, dynamic>? name;
  final Map<String, dynamic>? title;
  final Map<String, dynamic>? content;
  final Map<String, dynamic>? description;
  final Map<String, dynamic>? style;
  final List<PermissionEntity>? permissions;

  const SecurityRoleSectionEntity({
    required this.section,
    this.roleId,
    this.name,
    this.title,
    this.content,
    this.description,
    this.style,
    this.permissions,
  });

  @override
  List<Object?> get props =>
      [section, roleId, name, title, content, description, style, permissions];
}

class PermissionEntity extends Equatable {
  final String key;
  final Map<String, dynamic>? name;
  final Map<String, dynamic>? description;

  const PermissionEntity({
    required this.key,
    this.name,
    this.description,
  });

  @override
  List<Object?> get props => [key, name, description];
}
