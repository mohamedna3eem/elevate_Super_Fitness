import 'package:elevate_super_fitness/api/models/help_response_dto.dart';
import 'package:elevate_super_fitness/api/models/privacy_policy_response_dto.dart';
import 'package:elevate_super_fitness/api/models/requests/change_password_request_dto.dart';
import 'package:elevate_super_fitness/api/models/responses/change_password_response_dto.dart';
import 'package:elevate_super_fitness/api/models/responses/logout_response_dto.dart';
import 'package:elevate_super_fitness/api/models/responses/user_info_dto.dart';
import 'package:elevate_super_fitness/api/models/security_roles_config_response_dto.dart';
import 'package:elevate_super_fitness/domain/entites/change_password_response_entity.dart';
import 'package:elevate_super_fitness/domain/entites/help_response_entity.dart';
import 'package:elevate_super_fitness/domain/entites/help_section_response_entity.dart';
import 'package:elevate_super_fitness/domain/entites/logout_response_entity.dart';
import 'package:elevate_super_fitness/domain/entites/privacy_policy_response_entity.dart';
import 'package:elevate_super_fitness/domain/entites/requests/change_password_request_entity.dart';
import 'package:elevate_super_fitness/domain/entites/security_roles_config_entity.dart';
import 'package:elevate_super_fitness/domain/entites/user_info_entity.dart';

extension UserInfoMapper on UserInfoDto {
  UserInfoEntity toEntity() {
    return UserInfoEntity(
      message: message,
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

extension ChangePasswordResponseMapper on ChangePasswordResponseDto {
  ChangePasswordResponseEntity toEntity() {
    return ChangePasswordResponseEntity(message: message, token: token);
  }
}

extension ChangePasswordRequestEntityMapper on ChangePasswordRequestEntity {
  ChangePasswordRequestDto toDto() {
    return ChangePasswordRequestDto(
      password: password,
      newPassword: newPassword,
    );
  }
}

extension LogoutResponseMapper on LogoutResponseDto {
  LogoutResponseEntity toEntity() {
    return LogoutResponseEntity(message: message);
  }
}

extension HelpResponseMapper on HelpResponseDto {
  HelpResponseEntity toEntity() {
    return HelpResponseEntity(
      helpScreenContent: helpScreenContent.map((e) => e.toEntity()).toList(),
    );
  }
}

extension HelpSectionMapper on HelpSectionDto {
  HelpSectionEntity toEntity() {
    return HelpSectionEntity(
      section: section,
      content: content,
      title: title,
      style: style,
    );
  }
}

extension PrivacyPolicyMapper on PrivacyPolicyResponseDto {
  PrivacyPolicyResponseEntity toEntity() {
    return PrivacyPolicyResponseEntity(
      privacyPolicy: privacyPolicy.map((e) => e.toEntity()).toList(),
    );
  }
}

extension PrivacySectionMapper on PrivacySectionDto {
  PrivacySectionEntity toEntity() {
    return PrivacySectionEntity(
      section: section,
      content: content,
      title: title,
      style: style,
      subSections: subSections?.map((e) => e.toEntity()).toList(),
    );
  }
}

extension PrivacySubSectionMapper on PrivacySubSectionDto {
  PrivacySubSectionEntity toEntity() {
    return PrivacySubSectionEntity(type: type, title: title, content: content);
  }
}

extension SecurityRolesConfigMapper on SecurityRolesConfigResponseDto {
  SecurityRolesConfigResponseEntity toEntity() {
    return SecurityRolesConfigResponseEntity(
      securityRolesConfig: securityRolesConfig
          .map((e) => e.toEntity())
          .toList(),
    );
  }
}

extension SecurityRoleSectionMapper on SecurityRoleSectionDto {
  SecurityRoleSectionEntity toEntity() {
    return SecurityRoleSectionEntity(
      section: section,
      roleId: roleId,
      name: name,
      title: title,
      content: content,
      description: description,
      style: style,
      permissions: permissions?.map((e) => e.toEntity()).toList(),
    );
  }
}

extension PermissionMapper on PermissionDto {
  PermissionEntity toEntity() {
    return PermissionEntity(key: key, name: name, description: description);
  }
}
